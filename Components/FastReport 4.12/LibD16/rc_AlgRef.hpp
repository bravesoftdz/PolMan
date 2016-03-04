// CodeGear C++Builder
// Copyright (c) 1995, 2011 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'rc_AlgRef.pas' rev: 23.00 (Win32)

#ifndef Rc_algrefHPP
#define Rc_algrefHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rc_algref
{
//-- type declarations -------------------------------------------------------
typedef System::Byte word8;

typedef System::Word word16;

typedef unsigned word32;

typedef System::StaticArray<System::StaticArray<System::Byte, 8>, 4> TArrayK;

typedef TArrayK *PArrayK;

typedef System::StaticArray<System::StaticArray<System::StaticArray<System::Byte, 8>, 4>, 15> TArrayRK;

typedef System::StaticArray<System::Byte, 256> TArrayBox;

//-- var, const, procedure ---------------------------------------------------
static const System::Int8 MAXBC = System::Int8(0x8);
static const System::Int8 MAXKC = System::Int8(0x8);
static const System::Int8 MAXROUNDS = System::Int8(0xe);
extern PACKAGE int __fastcall rijndaelKeySched(System::StaticArray<System::Byte, 8> *k, int keyBits, int blockBits, System::StaticArray<System::StaticArray<System::Byte, 8>, 4> *W);
extern PACKAGE int __fastcall rijndaelEncrypt(System::StaticArray<System::Byte, 8> *a, int keyBits, int blockBits, System::StaticArray<System::StaticArray<System::Byte, 8>, 4> *rk);
extern PACKAGE int __fastcall rijndaelEncryptRound(System::StaticArray<System::Byte, 8> *a, int keyBits, int blockBits, System::StaticArray<System::StaticArray<System::Byte, 8>, 4> *rk, int &irounds);
extern PACKAGE int __fastcall rijndaelDecrypt(System::StaticArray<System::Byte, 8> *a, int keyBits, int blockBits, System::StaticArray<System::StaticArray<System::Byte, 8>, 4> *rk);
extern PACKAGE int __fastcall rijndaelDecryptRound(System::StaticArray<System::Byte, 8> *a, int keyBits, int blockBits, System::StaticArray<System::StaticArray<System::Byte, 8>, 4> *rk, int &irounds);

}	/* namespace Rc_algref */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_RC_ALGREF)
using namespace Rc_algref;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Rc_algrefHPP
