// CodeGear C++Builder
// Copyright (c) 1995, 2011 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'frxExportDBF.pas' rev: 23.00 (Win32)

#ifndef FrxexportdbfHPP
#define FrxexportdbfHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Dialogs.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <frxClass.hpp>	// Pascal unit
#include <frxExportMatrix.hpp>	// Pascal unit
#include <Winapi.ShellAPI.hpp>	// Pascal unit
#include <System.Variants.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Frxexportdbf
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfrxDBFExportDialog;
class PASCALIMPLEMENTATION TfrxDBFExportDialog : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Stdctrls::TButton* OkB;
	Vcl::Stdctrls::TButton* CancelB;
	Vcl::Dialogs::TSaveDialog* sd;
	Vcl::Stdctrls::TGroupBox* GroupPageRange;
	Vcl::Stdctrls::TLabel* DescrL;
	Vcl::Stdctrls::TRadioButton* AllRB;
	Vcl::Stdctrls::TRadioButton* CurPageRB;
	Vcl::Stdctrls::TRadioButton* PageNumbersRB;
	Vcl::Stdctrls::TEdit* PageNumbersE;
	Vcl::Stdctrls::TGroupBox* GroupQuality;
	Vcl::Stdctrls::TCheckBox* OpenCB;
	Vcl::Stdctrls::TCheckBox* OEMCB;
	Vcl::Stdctrls::TGroupBox* gbFNames;
	Vcl::Stdctrls::TRadioButton* rbFNAuto;
	Vcl::Stdctrls::TRadioButton* rbFNManual;
	Vcl::Stdctrls::TButton* btFNLoad;
	Vcl::Dialogs::TOpenDialog* odFN;
	Vcl::Stdctrls::TMemo* mmFN;
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall PageNumbersEChange(System::TObject* Sender);
	void __fastcall PageNumbersEKeyPress(System::TObject* Sender, System::WideChar &Key);
	void __fastcall FormKeyDown(System::TObject* Sender, System::Word &Key, System::Classes::TShiftState Shift);
	void __fastcall btFNLoadClick(System::TObject* Sender);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TfrxDBFExportDialog(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrxDBFExportDialog(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrxDBFExportDialog(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TfrxDBFExportDialog(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


class DELPHICLASS TfrxDBFExport;
class PASCALIMPLEMENTATION TfrxDBFExport : public Frxclass::TfrxCustomExportFilter
{
	typedef Frxclass::TfrxCustomExportFilter inherited;
	
private:
	bool FOpenAfterExport;
	Frxexportmatrix::TfrxIEMatrix* FMatrix;
	System::Classes::TStream* Exp;
	bool FOEM;
	System::Classes::TStrings* FFieldNames;
	System::AnsiString FFieldPrefix;
	void __fastcall SetFieldNames(System::Classes::TStrings* Value);
	void __fastcall ExportMatrix(System::Classes::TStream* Stream, Frxexportmatrix::TfrxIEMatrix* mx);
	void __fastcall SetFieldPrefix(const System::AnsiString Value);
	
public:
	__fastcall virtual TfrxDBFExport(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TfrxDBFExport(void);
	__classmethod virtual System::UnicodeString __fastcall GetDescription();
	virtual System::Uitypes::TModalResult __fastcall ShowModal(void);
	virtual bool __fastcall Start(void);
	virtual void __fastcall Finish(void);
	virtual void __fastcall FinishPage(Frxclass::TfrxReportPage* Page, int Index);
	virtual void __fastcall StartPage(Frxclass::TfrxReportPage* Page, int Index);
	virtual void __fastcall ExportObject(Frxclass::TfrxComponent* Obj);
	
__published:
	__property bool OEMCodepage = {read=FOEM, write=FOEM, nodefault};
	__property bool OpenAfterExport = {read=FOpenAfterExport, write=FOpenAfterExport, default=0};
	__property OverwritePrompt;
	__property System::AnsiString FieldPrefix = {read=FFieldPrefix, write=SetFieldPrefix};
	__property System::Classes::TStrings* FieldNames = {read=FFieldNames, write=SetFieldNames};
public:
	/* TfrxCustomExportFilter.CreateNoRegister */ inline __fastcall TfrxDBFExport(void) : Frxclass::TfrxCustomExportFilter() { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Frxexportdbf */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_FRXEXPORTDBF)
using namespace Frxexportdbf;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// FrxexportdbfHPP