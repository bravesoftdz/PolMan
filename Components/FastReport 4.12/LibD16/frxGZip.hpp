// CodeGear C++Builder
// Copyright (c) 1995, 2011 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'frxGZip.pas' rev: 23.00 (Win32)

#ifndef FrxgzipHPP
#define FrxgzipHPP

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
#include <frxZLib.hpp>	// Pascal unit
#include <frxClass.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Frxgzip
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TfrxCompressionLevel : unsigned char { gzNone, gzFastest, gzDefault, gzMax };
#pragma option pop

class DELPHICLASS TfrxGZipCompressor;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TfrxGZipCompressor : public Frxclass::TfrxCustomCompressor
{
	typedef Frxclass::TfrxCustomCompressor inherited;
	
public:
	virtual void __fastcall Compress(System::Classes::TStream* Dest);
	virtual bool __fastcall Decompress(System::Classes::TStream* Source);
public:
	/* TfrxCustomCompressor.Create */ inline __fastcall virtual TfrxGZipCompressor(System::Classes::TComponent* AOwner) : Frxclass::TfrxCustomCompressor(AOwner) { }
	/* TfrxCustomCompressor.Destroy */ inline __fastcall virtual ~TfrxGZipCompressor(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall frxCompressStream(System::Classes::TStream* Source, System::Classes::TStream* Dest, TfrxCompressionLevel Compression = (TfrxCompressionLevel)(0x2), System::UnicodeString FileNameW = System::UnicodeString());
extern PACKAGE System::AnsiString __fastcall frxDecompressStream(System::Classes::TStream* Source, System::Classes::TStream* Dest);
extern PACKAGE void __fastcall frxDeflateStream(System::Classes::TStream* Source, System::Classes::TStream* Dest, TfrxCompressionLevel Compression = (TfrxCompressionLevel)(0x2));
extern PACKAGE void __fastcall frxInflateStream(System::Classes::TStream* Source, System::Classes::TStream* Dest);

}	/* namespace Frxgzip */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_FRXGZIP)
using namespace Frxgzip;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// FrxgzipHPP
