#pragma once

#include "stdafx.h"

class CDb
{
public:
	CDb();
	~CDb();

	int Connect(CString driver, CString server, CString port, CString dbname, CString login, CString pass);
	int Query(CString q);
	int Fetch(CString q);
	CString GetSt(CString fname);
	int GetInt(CString fname);
	float GetFloat(CString fname);
	void GetFields();
	CString Escape(CString st);
	void WriteLog(CString st);

	CString m_driver;
	CString m_server;
	CString m_port;
	CString m_dbname;
	CString m_login;
	CString m_pass;

	CDatabase db;
	CRecordset rs;
	vector <CString> field;

	static int server_id;
	static long j_id;
};

