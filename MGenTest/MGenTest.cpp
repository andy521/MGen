// This is an independent project of an individual developer. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
// MGenTest.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "MGenTest.h"
#include "../MGen/GLibrary/GLib.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

// The one and only application object

CWinApp theApp;

using namespace std;

CString current_dir;
ofstream logfile;
int continuous_integration = 0;
int nRetCode = 0;
vector<CString> errorMessages;
CString pname;

// Default time to start aborting generation
int wait_sec = 60;
// Default time to consider generation timeout
int wait_sec2 = 120;

void InitErrorMessages() {
	errorMessages.resize(1000);
	errorMessages[0] = "OK";
	errorMessages[10] = "MGen detected critical errors during run";
	errorMessages[11] = "MGen generator freeze on exit - possible error in generator";
	errorMessages[100] = "GetExitCodeProcess error in MGenTest (for MGen.exe)";
	errorMessages[101] = "MGen process did not exit correctly - possible crash";
	errorMessages[102] = "GetExitCodeProcess error in MGenTest";
}

CString GetErrorMessage(int e) {
	if (e < errorMessages.size()) return errorMessages[e];
	else return "";
}

void Run(CString fname, CString par, int delay) {
	DWORD ecode;
	SHELLEXECUTEINFO sei = { 0 };
	sei.cbSize = sizeof(SHELLEXECUTEINFO);
	sei.fMask = SEE_MASK_NOCLOSEPROCESS | SEE_MASK_FLAG_NO_UI;
	sei.hwnd = NULL;
	sei.lpVerb = NULL;
	sei.lpFile = fname;
	sei.lpParameters = par;
	sei.lpDirectory = NULL;
	sei.nShow = SW_SHOWNORMAL;
	sei.hInstApp = NULL;
	ShellExecuteEx(&sei);
	WaitForSingleObject(sei.hProcess, delay);
	if (!GetExitCodeProcess(sei.hProcess, &ecode)) ecode = 102;
	if (ecode != 0 && ecode != 259) {
		nRetCode = 3;
		cout << "Exit code " << ecode << ": " << fname << " " << par << "\n";
	}
}

void Log(CString st, int level = 0) {
	cout << st;
	logfile << st;
	if (continuous_integration && level > 0) {
		CString cat;
		if (level == 1) cat = "Information";
		if (level == 2) cat = "Warning";
		if (level == 3) cat = "Error";
		CString par = "AddMessage \"" + st + "\" -Category " + cat + " >> autotest\\run.log 2>&1";
		Run("appveyor", par, 1000);
	}
}

CString file(CString fname) {
	CString st, st2;
	ifstream fs;
	// Check file exists
	if (!CGLib::fileExists(fname)) {
		cout << "Not found file " << fname << "\n";
	}
	fs.open(fname);
	char pch[2550];
	while (fs.good()) {
		// Get line
		fs.getline(pch, 2550);
		st2 = pch;
		if (!st2.IsEmpty()) {
			st += "> " + st2 + "\n";
		}
	}
	fs.close();
	return st;
}

void ClearBuffer() {
	fstream fs;
	fs.open("autotest\\buffer.log", ios::out);
	fs.close();
	remove("autotest\\exit.log");
}

void PublishTest(CString tname, int result, int tpassed, CString params) {
	CString emes = GetErrorMessage(result);
	CString st;
	CString st2;
	st2.Format("%s: code %d (%s) in %d ms\n", tname, result, emes, tpassed);
	if (result) {
		nRetCode = 2;
		Log(st2, 3);
	}
	else {
		Log(st2, 1);
	}

	// Show errors
	CString errors = file("autotest/buffer.log");
	cout << errors;

	if (continuous_integration) {
		CString cat = "Passed";
		if (result) cat = "Failed";
		st.Format("UpdateTest \"%s\" -Framework MSTest -FileName MGen.exe -Duration %d -Outcome %s -ErrorMessage \"%d: %s\" >> autotest\\run.log 2>&1", tname, tpassed, cat, result, emes);
		Run("appveyor", st, 1000);
		// Send errors separately in case of command line overflow
		st.Format("UpdateTest \"%s\" -Framework MSTest -FileName MGen.exe -Duration %d -Outcome %s -ErrorMessage \"%d: %s\" -StdOut \"MGen.exe %s\" -ErrorStackTrace \"%s\" >> autotest\\run.log 2>&1", tname, tpassed, cat, result, emes, params, errors);
		Run("appveyor", st, 1000);
	}
}

void LoadConfig() {
	long long time_start, time_stop;
	vector<CString> ast;
	CString fname = "autotest\\test.csv";
	// Check file exists
	if (!CGLib::fileExists(fname)) {
		cout << "Not found file " << fname << "\n";
	}
	// Clear expect.log
	remove("autotest\\expect.log");
	remove("autotest\\sas-emu.log");
	remove("autotest\\cor-ack.log");
	// Clear run.log
	fstream fs;
	fs.open("autotest\\run.log", ios::out);
	fs.close();
	// Open file
	fs.open(fname);
	DWORD ecode;
	CString st, st2;
	char pch[2550];
	int pos = 0;
	int passed;
	while (fs.good()) {
		fs.getline(pch, 2550);
		st = pch;
		pos = st.Find("#");
		if (pos != -1) st = st.Left(pos);
		st.Trim();
		if (st.GetLength()) {
			CGLib::Tokenize(st, ast, ";");
			pname = ast[0];
			if (ast.size() > 1 && atoi(ast[1]) > 0) wait_sec = atoi(ast[1]);
			if (ast.size() > 2 && atoi(ast[2]) > 0) wait_sec2 = atoi(ast[2]);
			ClearBuffer();
			if (continuous_integration) Run("appveyor", "AddTest \"" + pname + "\" -Framework MSTest -FileName MGen.exe -Outcome Running >> autotest\\run.log 2>&1", 1000);
			// MGen.exe -test=5 configs\GenCA2\good-cp5.pl
			st2.Format("-test=%d %s", wait_sec, pname);
			Log("Starting test config: " + st2 + "\n");
			SHELLEXECUTEINFO sei = { 0 };
			sei.cbSize = sizeof(SHELLEXECUTEINFO);
			sei.fMask = SEE_MASK_NOCLOSEPROCESS;
			sei.hwnd = NULL;
			sei.lpVerb = NULL;
			sei.lpFile = "MGen.exe";
			sei.lpParameters = st2;
			sei.lpDirectory = NULL;
			sei.nShow = SW_SHOW;
			sei.hInstApp = NULL;
			time_start = CGLib::time();
			ShellExecuteEx(&sei);
			if (WaitForSingleObject(sei.hProcess, wait_sec2 * 1000) == WAIT_TIMEOUT) {
				Log(pname + ": Timeout waiting for process\n", 3);
				exit(1);
			}

			time_stop = CGLib::time();
			passed = time_stop - time_start;
			if (!GetExitCodeProcess(sei.hProcess, &ecode)) ecode = 100;
			if (!CGLib::fileExists("autotest\\exit.log")) ecode = 101;

			PublishTest(pname, ecode, passed, st2);
		}
	}
	Run("appveyor", "PushArtifact autotest\\expect.log -Verbosity Normal -Type Auto -FileName expect.log >> run.log 2>&1", 1000);
	Run("appveyor", "PushArtifact autotest\\sas-emu.log -Verbosity Normal -Type Auto -FileName sas-emu.log >> run.log 2>&1", 1000);
	Run("appveyor", "PushArtifact autotest\\cor-ack.log -Verbosity Normal -Type Auto -FileName cor-ack.log >> run.log 2>&1", 1000);
	// Show run output
	//Run("cmd.exe", "/c echo Test >> autotest\\run.log", 1000);
	CString outs = file("autotest\\run.log");
	cout << "Run log:\n";
	cout << outs;
	// Show expect output
	outs = file("autotest\\expect.log");
	cout << "Expect log:\n";
	cout << outs;
	outs = file("autotest\\sas-emu.log");
	cout << "SAS emulator log:\n";
	cout << outs;
	outs = file("autotest\\cor-ack.log");
	cout << "Correction acknowledge log:\n";
	cout << outs;

	fs.close();
}

int test() {
	if (getenv("APPVEYOR_PROJECT_NAME") != NULL) {
		continuous_integration = 1;
	}
	logfile.open("autotest\\test.log", ios_base::app);

	TCHAR buffer[MAX_PATH];
	GetCurrentDirectory(MAX_PATH, buffer);
	current_dir = string(buffer).c_str();
	Log("Current dir: " + current_dir + "\n");

	LoadConfig();
	logfile.close();
	// Do not pause if continuous integration
	if (!continuous_integration) {
		cout << "Press any key to continue... ";
		_getch();
	}
	return 0;
}

int main()
{
	InitErrorMessages();
	HMODULE hModule = ::GetModuleHandle(nullptr);

    if (hModule != nullptr)
    {
        // initialize MFC and print and error on failure
        if (!AfxWinInit(hModule, nullptr, ::GetCommandLine(), 0))
        {
            wprintf(L"Fatal Error: MFC initialization failed\n");
            nRetCode = 4;
        }
        else
        {
					test();
				}
    }
    else
    {
        wprintf(L"Fatal Error: GetModuleHandle failed\n");
        nRetCode = 1;
    }

    return nRetCode;
}
