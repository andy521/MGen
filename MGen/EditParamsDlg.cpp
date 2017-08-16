// This is an independent project of an individual developer. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
// EditParamsDlg.cpp : implementation file
//

#include "stdafx.h"
#include "MGen.h"
#include "EditParamsDlg.h"
#include "afxdialogex.h"
//#include "brainchild.h"
#include "MainFrm.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

// CEditParamsDlg dialog

IMPLEMENT_DYNAMIC(CEditParamsDlg, CDialog)

CEditParamsDlg::CEditParamsDlg(CWnd* pParent /*=NULL*/)
	: CDialog(IDD_DIALOG_EDITPARAMS, pParent)
{

}

CEditParamsDlg::~CEditParamsDlg()
{
}

void CEditParamsDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_EDIT_ALGO, m_algo);
	DDX_Control(pDX, IDC_COMBO_CONFIG, m_config);
	DDX_Control(pDX, IDC_RICHEDIT_PARAMS, m_params);
}


BEGIN_MESSAGE_MAP(CEditParamsDlg, CDialog)
END_MESSAGE_MAP()


// CEditParamsDlg message handlers


BOOL CEditParamsDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	CMainFrame* mf = (CMainFrame *)AfxGetMainWnd();
	m_algo.SetWindowTextA(mf->AlgName[mf->m_algo]);

	return TRUE;  // return TRUE unless you set the focus to a control
								// EXCEPTION: OCX Property Pages should return FALSE
}
