// CodeGear C++Builder
// Copyright (c) 1995, 2011 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'frxImageConverter.pas' rev: 23.00 (Win32)

#ifndef FrximageconverterHPP
#define FrximageconverterHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Frximageconverter
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TfrxPictureType : unsigned char { gpPNG, gpBMP, gpEMF, gpWMF, gpJPG, gpGIF };
#pragma option pop

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE System::UnicodeString __fastcall GetPicFileExtension(TfrxPictureType PicType);
extern PACKAGE void __fastcall SaveGraphicAs(Vcl::Graphics::TGraphic* Graphic, System::UnicodeString Path, TfrxPictureType PicType)/* overload */;
extern PACKAGE void __fastcall SaveGraphicAs(Vcl::Graphics::TGraphic* Graphic, System::Classes::TStream* Stream, TfrxPictureType PicType)/* overload */;

}	/* namespace Frximageconverter */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_FRXIMAGECONVERTER)
using namespace Frximageconverter;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// FrximageconverterHPP
