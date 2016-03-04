// CodeGear C++Builder
// Copyright (c) 1995, 2011 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'frxEditHighlight.pas' rev: 23.00 (Win32)

#ifndef FrxedithighlightHPP
#define FrxedithighlightHPP

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
#include <frxClass.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <Vcl.Buttons.hpp>	// Pascal unit
#include <frxCtrls.hpp>	// Pascal unit
#include <System.Variants.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Frxedithighlight
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfrxHighlightEditorForm;
class PASCALIMPLEMENTATION TfrxHighlightEditorForm : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Stdctrls::TButton* OKB;
	Vcl::Stdctrls::TButton* CancelB;
	Vcl::Stdctrls::TGroupBox* ConditionL;
	Frxctrls::TfrxComboEdit* ConditionE;
	Vcl::Stdctrls::TGroupBox* FontL;
	Vcl::Buttons::TSpeedButton* FontColorB;
	Vcl::Stdctrls::TCheckBox* BoldCB;
	Vcl::Stdctrls::TCheckBox* ItalicCB;
	Vcl::Stdctrls::TCheckBox* UnderlineCB;
	Vcl::Dialogs::TColorDialog* ColorDialog1;
	Vcl::Stdctrls::TGroupBox* BackgroundL;
	Vcl::Buttons::TSpeedButton* BackColorB;
	Vcl::Stdctrls::TRadioButton* TransparentRB;
	Vcl::Stdctrls::TRadioButton* OtherRB;
	void __fastcall FontColorBClick(System::TObject* Sender);
	void __fastcall BackColorBClick(System::TObject* Sender);
	void __fastcall TransparentRBClick(System::TObject* Sender);
	void __fastcall ConditionEButtonClick(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall FormHide(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall FormKeyDown(System::TObject* Sender, System::Word &Key, System::Classes::TShiftState Shift);
	
private:
	System::Uitypes::TColor FBackColor;
	System::Uitypes::TColor FFontColor;
	Frxclass::TfrxHighlight* FHighlight;
	Frxclass::TfrxCustomMemoView* FMemoView;
	void __fastcall SetGlyph(Vcl::Buttons::TSpeedButton* Button, System::Uitypes::TColor Color);
	
public:
	__property Frxclass::TfrxCustomMemoView* MemoView = {read=FMemoView, write=FMemoView};
	void __fastcall HostControls(Vcl::Controls::TWinControl* Host);
	void __fastcall UnhostControls(System::Uitypes::TModalResult AModalResult);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TfrxHighlightEditorForm(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrxHighlightEditorForm(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrxHighlightEditorForm(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TfrxHighlightEditorForm(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Frxedithighlight */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_FRXEDITHIGHLIGHT)
using namespace Frxedithighlight;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// FrxedithighlightHPP
