// CodeGear C++Builder
// Copyright (c) 1995, 2011 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'frxEditFrame.pas' rev: 23.00 (Win32)

#ifndef FrxeditframeHPP
#define FrxeditframeHPP

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
#include <Vcl.ImgList.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <frxCtrls.hpp>	// Pascal unit
#include <frxDock.hpp>	// Pascal unit
#include <Vcl.ComCtrls.hpp>	// Pascal unit
#include <Vcl.ToolWin.hpp>	// Pascal unit
#include <frxClass.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Frxeditframe
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfrxFrameEditorForm;
class PASCALIMPLEMENTATION TfrxFrameEditorForm : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Stdctrls::TLabel* FrameL;
	Vcl::Stdctrls::TLabel* LineL;
	Vcl::Stdctrls::TLabel* ShadowL;
	Vcl::Stdctrls::TButton* OkB;
	Vcl::Stdctrls::TButton* CancelB;
	Vcl::Comctrls::TToolBar* ToolBar1;
	Vcl::Comctrls::TToolButton* FrameTopB;
	Vcl::Comctrls::TToolButton* FrameBottomB;
	Vcl::Comctrls::TToolButton* FrameLeftB;
	Vcl::Comctrls::TToolButton* FrameRightB;
	Vcl::Comctrls::TToolButton* Sep1;
	Vcl::Comctrls::TToolButton* FrameAllB;
	Vcl::Comctrls::TToolButton* FrameNoB;
	Vcl::Comctrls::TToolBar* ToolBar2;
	Vcl::Comctrls::TToolButton* FrameColorB;
	Vcl::Comctrls::TToolButton* FrameStyleB;
	Frxdock::TfrxTBPanel* Sep2;
	Frxctrls::TfrxComboBox* FrameWidthCB;
	Vcl::Comctrls::TToolBar* ToolBar3;
	Vcl::Comctrls::TToolButton* ShadowB;
	Vcl::Comctrls::TToolButton* ShadowColorB;
	Frxdock::TfrxTBPanel* Sep3;
	Frxctrls::TfrxComboBox* ShadowWidthCB;
	Vcl::Extctrls::TBevel* Bevel1;
	Frxctrls::TfrxComboBox* FrameLineCB;
	Vcl::Stdctrls::TLabel* FLineL;
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall BClick(System::TObject* Sender);
	void __fastcall FormDestroy(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall FormKeyDown(System::TObject* Sender, System::Word &Key, System::Classes::TShiftState Shift);
	
private:
	Frxclass::TfrxFrame* FFrame;
	Vcl::Controls::TImageList* FImageList;
	void __fastcall UpdateControls(void);
	Frxclass::TfrxFrameLine* __fastcall GetFrameLine(void);
	
public:
	__property Frxclass::TfrxFrame* Frame = {read=FFrame};
public:
	/* TCustomForm.Create */ inline __fastcall virtual TfrxFrameEditorForm(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrxFrameEditorForm(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrxFrameEditorForm(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TfrxFrameEditorForm(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Frxeditframe */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_FRXEDITFRAME)
using namespace Frxeditframe;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// FrxeditframeHPP
