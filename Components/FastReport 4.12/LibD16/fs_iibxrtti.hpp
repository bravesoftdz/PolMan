// CodeGear C++Builder
// Copyright (c) 1995, 2011 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'fs_iibxrtti.pas' rev: 23.00 (Win32)

#ifndef Fs_iibxrttiHPP
#define Fs_iibxrttiHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <fs_iinterpreter.hpp>	// Pascal unit
#include <fs_itools.hpp>	// Pascal unit
#include <fs_idbrtti.hpp>	// Pascal unit
#include <Data.DB.hpp>	// Pascal unit
#include <IBDatabase.hpp>	// Pascal unit
#include <IBCustomDataSet.hpp>	// Pascal unit
#include <IBQuery.hpp>	// Pascal unit
#include <IBTable.hpp>	// Pascal unit
#include <IBStoredProc.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Fs_iibxrtti
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfsIBXRTTI;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TfsIBXRTTI : public System::Classes::TComponent
{
	typedef System::Classes::TComponent inherited;
	
public:
	/* TComponent.Create */ inline __fastcall virtual TfsIBXRTTI(System::Classes::TComponent* AOwner) : System::Classes::TComponent(AOwner) { }
	/* TComponent.Destroy */ inline __fastcall virtual ~TfsIBXRTTI(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------

}	/* namespace Fs_iibxrtti */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_FS_IIBXRTTI)
using namespace Fs_iibxrtti;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Fs_iibxrttiHPP
