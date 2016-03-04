// CodeGear C++Builder
// Copyright (c) 1995, 2011 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'frxCrypt.pas' rev: 23.00 (Win32)

#ifndef FrxcryptHPP
#define FrxcryptHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <frxClass.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Frxcrypt
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfrxCrypt;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TfrxCrypt : public Frxclass::TfrxCustomCrypter
{
	typedef Frxclass::TfrxCustomCrypter inherited;
	
private:
	System::AnsiString __fastcall AskKey(const System::AnsiString Key);
	
public:
	virtual void __fastcall Crypt(System::Classes::TStream* Dest, const System::AnsiString Key);
	virtual bool __fastcall Decrypt(System::Classes::TStream* Source, const System::AnsiString Key);
public:
	/* TfrxCustomCrypter.Create */ inline __fastcall virtual TfrxCrypt(System::Classes::TComponent* AOwner) : Frxclass::TfrxCustomCrypter(AOwner) { }
	/* TfrxCustomCrypter.Destroy */ inline __fastcall virtual ~TfrxCrypt(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall frxCryptStream(System::Classes::TStream* Source, System::Classes::TStream* Dest, const System::AnsiString Key);
extern PACKAGE void __fastcall frxDecryptStream(System::Classes::TStream* Source, System::Classes::TStream* Dest, const System::AnsiString Key);

}	/* namespace Frxcrypt */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_FRXCRYPT)
using namespace Frxcrypt;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// FrxcryptHPP
