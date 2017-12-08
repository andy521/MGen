// This is an independent project of an individual developer. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
#include "Db.h"
#include "../MGen/GLibrary/GLib.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

CDb::CDb() {
}

CDb::~CDb() {
}

int CDb::Connect(CString driver, CString server, CString port, CString dbname, CString login, CString pass) {
	m_driver = driver;
	m_server = server;
	m_dbname = dbname;
	m_port = port;
	m_login = login;
	m_pass = pass;

	CString connSt =
		"Driver=" + m_driver + ";"
		"Server=" + m_server + ";"
		"Database=" + m_dbname + ";"
		"Uid=" + m_login + ";"
		"Pwd=" + m_pass + ";";

	try {
		if (!db.OpenEx(connSt)) {
			WriteLog("Cannot open database: " + connSt);
			return 1;
		}
	}
	catch (CDBException* pEX) {
		WriteLog("Cannot open database: " + connSt + ": " + pEX->m_strError);
		pEX->Delete();
		return 1;
	}
	rs.m_pDatabase = &db;
	return 0;
}

int CDb::Query(CString q) {
	TRY	{
		db.ExecuteSQL(q);
	}
	CATCH_ALL(e) {
		TCHAR szCause[255];
		e->GetErrorMessage(szCause, 255);
		WriteLog(szCause);
		return 1;
	} 
	END_CATCH_ALL;
	return 0;
}

int CDb::Fetch(CString q) {
	TRY {
		if (rs.IsOpen()) rs.Close();
		rs.Open(CRecordset::forwardOnly, q, CRecordset::readOnly);
	}
	CATCH(CDBException, e) {
		WriteLog("Error executing query '" + q + "': " + e->m_strError);
		return 1;
	}
	END_CATCH; 
	return 0;
}

CString CDb::GetSt(CString fname) {
	if (rs.IsEOF()) return "";
	CString st;
	TRY {
		rs.GetFieldValue(fname, st);
	}
	CATCH(CDBException, e) {
		WriteLog("Error parsing field '" + fname + "': " + e->m_strError);
		return "";
	}
	END_CATCH;
	return st;
}

int CDb::GetInt(CString fname) {
	return atoi(GetSt(fname));
}

float CDb::GetFloat(CString fname) {
	return atof(GetSt(fname));
}

void CDb::WriteLog(CString st) {
	cout << st << "\n";
	CGLib::AppendLineToFile("log\\server.log",
		CTime::GetCurrentTime().Format("%Y-%m-%d %H:%M:%S") + " " + st + "\n");
}

void CDb::GetFields() {
	field.clear();
	int nFields = rs.GetODBCFieldCount();
	for (short x = 0; x < nFields; x++) {
		CODBCFieldInfo fieldinfo;
		short pos = x;
		rs.GetODBCFieldInfo(pos, fieldinfo);
		field.push_back(fieldinfo.m_strName);
	}
}

CString CDb::Escape(CString st) {
	st.Replace("\"", "\\\"");
	st.Replace("'", "\\'");
	st.Replace("\\", "\\\\");
	return st;
}