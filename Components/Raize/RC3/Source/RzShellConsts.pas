{=======================================================================================================================
  RzShellConsts Unit

  Raize Components - Component Source Unit

  This unit declares the resource strings used for internationalisation of Shell Controls.

  To build your project with a single language's translations in the executable itself, declare one of the following
  conditional defines in your Project|Options.

  Language    $DEFINE    2-character locale id
  ----------- ---------- ---------------------
  Czech       LANG_CS    cs
  Danish      LANG_DA    da
  Dutch       LANG_NL    nl
  English     LANG_EN    en
  Finnish     LANG_FI    fi
  French      LANG_FR    fr
  German      LANG_DE    de
  Hungarian   LANG_HU    hu
  Italian     LANG_IT    it
  Japanese    LANG_JP    jp
  Norwegian   LANG_NO    no
  Polish      LANG_PL    pl
  Portuguese  LANG_PT    pt
  Russian     LANG_RU    ru
  Spanish     LANG_ES    es
  Swedish     LANG_SV    sv


  Modification History
  ----------------------------------------------------------------------------------------------------------------------
  3.0    (20 Dec 2002)  * Initial inclusion in Raize Components.

  1.6b   (07 Mar 2002)  * C++Builder 6 release, no changes.
  1.6a   (11 Jan 2002)  * No changes.
  1.6    (02 Jul 2001)  * Delphi 6 release, no changes.
  1.5c   (30 Mar 2001)  * No changes.
  1.5b   (12 Dec 2000)  * No changes.
  1.5a   (14 May 2000)  * No changes.
  1.5    (03 Mar 2000)  * C++Builder 5 release, no changes.
  1.4a   (15 Dec 1999)  * No changes.
  1.4    (14 Sep 1999)  * No changes.
  1.3h   (29 Mar 1999)  * No changes.
  1.3g   (01 Dec 1998)  * No changes.
  1.3f   (12 Jul 1998)  * Delphi 4 release, no changes.
  1.3e   (22 Apr 1998)  * No changes.
  1.3d   (18 Apr 1998)  * No changes.
  1.3c   (16 Mar 1998)  * C++Builder 3 support.
  1.3b   (07 Feb 1998)  * Added Czech, Hungarian, Polish and Russian.
  1.3a   (07 Jan 1998)  * No changes.
  1.3    (28 Nov 1997)  * This unit was added to the pack for this version.


  Copyright © 1995-2003 by Raize Software, Inc.  All Rights Reserved.
  Copyright © 1996-2003 by Plasmatech Software Design. All Rights Reserved.
=======================================================================================================================}

{$I RzComps.inc}

unit RzShellConsts;

interface

{$IFDEF LANG_CS} {$I Lang\Czech\RzShellStrings.inc}             {$DEFINE APPLIED_LANG} {$ENDIF}
{$IFDEF LANG_DA} {$I Lang\Danish\RzShellStrings.inc}            {$DEFINE APPLIED_LANG} {$ENDIF}
{$IFDEF LANG_DE} {$I Lang\German\RzShellStrings.inc}            {$DEFINE APPLIED_LANG} {$ENDIF}
{$IFDEF LANG_ES} {$I Lang\Spanish\RzShellStrings.inc}           {$DEFINE APPLIED_LANG} {$ENDIF}
{$IFDEF LANG_EN} {$I Lang\English\RzShellStrings.inc}           {$DEFINE APPLIED_LANG} {$ENDIF}
{$IFDEF LANG_FI} {$I Lang\Finnish\RzShellStrings.inc}           {$DEFINE APPLIED_LANG} {$ENDIF}
{$IFDEF LANG_FR} {$I Lang\French\RzShellStrings.inc}            {$DEFINE APPLIED_LANG} {$ENDIF}
{$IFDEF LANG_HU} {$I Lang\Hungarian\RzShellStrings.inc}         {$DEFINE APPLIED_LANG} {$ENDIF}
{$IFDEF LANG_IT} {$I Lang\Italian\RzShellStrings.inc}           {$DEFINE APPLIED_LANG} {$ENDIF}
{$IFDEF LANG_JP} {$I Lang\Japanese\RzShellStrings.inc}          {$DEFINE APPLIED_LANG} {$ENDIF}
{$IFDEF LANG_NL} {$I Lang\Dutch\RzShellStrings.inc}             {$DEFINE APPLIED_LANG} {$ENDIF}
{$IFDEF LANG_NO} {$I Lang\Norwegian\RzShellStrings.inc}         {$DEFINE APPLIED_LANG} {$ENDIF}
{$IFDEF LANG_PL} {$I Lang\Polish\RzShellStrings.inc}            {$DEFINE APPLIED_LANG} {$ENDIF}
{$IFDEF LANG_PT} {$I Lang\Portuguese_Brazil\RzShellStrings.inc} {$DEFINE APPLIED_LANG} {$ENDIF}
{$IFDEF LANG_RU} {$I Lang\Russian\RzShellStrings.inc}           {$DEFINE APPLIED_LANG} {$ENDIF}
{$IFDEF LANG_SV} {$I Lang\Swedish\RzShellStrings.inc}           {$DEFINE APPLIED_LANG} {$ENDIF}

{$IFNDEF APPLIED_LANG}
  {$I Lang\English\RzShellStrings.inc}    // Default to English
{$ENDIF}

implementation

end.

