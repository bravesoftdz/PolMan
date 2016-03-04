{=======================================================================================================================
  RzCommon Unit

  Raize Components - Component Source Unit


  Components            Description
  ----------------------------------------------------------------------------------------------------------------------
  TRzDialogComponent    Base component that implements extra features for dialog-based components.
  TRzFrameController    Allows a single component to control the framing of many other components.
  TRzRegIniFile         Nonvisual component that can read/write values to/from an Ini File or the Registry.
  TRzCustomColors       Nonvisual component that manages a list of custom colors values for use in a Color Dialog.  Used
                          by the TRzColorPicker and TRzColorEdit components.


  This unit also implements several general-purpose procedures and functions.


  Modification History
  ----------------------------------------------------------------------------------------------------------------------
  3.0.8  (29 Aug 2003)  * Added RunningUnder function that can be used to easily determine which version of Windows is
                          currently in use.
                        * DrawSides function only draws sides with Color <> clNone.
                        * Added DrawInnerOuterBorders function, which handles drawing inner and outer borders of all
                          controls supporting inner and outer borders (e.g. TRzPanel, TRzBorder, TRzLabel, etc. )
                        * Added DrawGroupBarBackground procedure, which handles drawing the interior of a TRzGroupBar
                          when GroupStyle is gbsCategoryView. This method is also used to display the new splitter
                          bar of a TRzSplitter and a size bar of a TRzSizePanel when using the new ssGroupBar splitter
                          style.
                        * Fixed problem with TRzRegIniFile.ReadSectionValues where non-string values in a Registry
                          section (i.e. key) would raise an exception.

  3.0.6  (11 Apr 2003)  * Removed ThemeServices global variable. ThemeServices function now included in RzThemeSrv.pas.

  3.0.4  (04 Mar 2003)  * Fixed problem where TRzRegIniFile would raise an exception when trying to write to any
                          Registry key not in the HKEY_CURRENT_USER branch.

  3.0.3  (21 Jan 2003)  * Added FullColorSupport function.
                        * Added IsColorStored and IsFocusColorStored methods so that if control is disabled at design-time
                          the Color and FocusColor properties are not streamed with the disabled color value.

  3.0    (20 Dec 2002)  * A new frame style has been added to Raize Components: fsFlatBold.

                        << TRzFrameController >>
                        * TRzFrameController can be linked to a TRzRegIniFile to save Custom Framing settings to the
                          Registry or an INI file.
                        * Added FocusColor and DisabledColor.
                        * Added FramingPreference property.
                        * Renamed FrameFlat property to FrameHotTrack.
                        * Renamed FrameFocusStyle property to FrameHotStyle.
                        * Removed FrameFlatStyle property.
                        * The TRzFrameController can now be linked to a TRzRegIniFile component, which allows the custom
                          framing settings to be stored persistently to the Registry or to an INI file.  The settings
                          are saved using the Save method, and loaded using the Load method.
                        * Added Assign method.

                        << TRzRegIniFile >>
                        * Initial release.

                        << TRzCustomColors >>
                        * Initial release.


  Copyright � 1995-2003 by Raize Software, Inc.  All Rights Reserved.
=======================================================================================================================}

{$I RzComps.inc}

unit RzCommon;

interface

uses
  {$IFDEF USE_CS}
  CSIntf,
  {$ENDIF}
  Windows,
  Classes,
  Forms,
  Graphics,
  Controls,
  StdCtrls,
  ExtCtrls,
  SysUtils,
  ImgList,
  {$IFDEF VCL70_OR_HIGHER}
  Themes,
  {$ELSE}
  RzThemeSrv,
  {$ENDIF}
  Registry,
  IniFiles;

const
  cm_GetBlinking                = cm_Base + 1000;
  cm_Blink                      = cm_Base + 1001;
  cm_ToolbarShowCaptionChanged  = cm_Base + 1002;
  cm_ToolbarButtonLayoutChanged = cm_Base + 1003;
  cm_ToolbarButtonSizeChanged   = cm_Base + 1004;
  cm_HidePreviewPanel           = cm_Base + 1005;
  cm_GroupItemSelected          = cm_Base + 1006;


type
  TAlignmentVertical = ( avTop, avCenter, avBottom );

  TBlinkState = ( bsOn, bsOff );

  TTextStyle = ( tsNormal, tsRaised, tsRecessed, tsShadow );
  TOrientation = ( orHorizontal, orVertical );
  TBarStyle = ( bsTraditional, bsLED );
  TLineStyle = ( lsNone, lsFlat, lsGroove, lsBump );
  TFrameStyleEx = ( fsNone, fsFlat, fsGroove, fsBump, fsLowered, fsButtonDown, fsRaised, fsButtonUp, fsStatus, fsPopup, fsFlatBold, fsFlatRounded );
  TFrameStyle = fsNone..fsFlatBold;
  TFramingPreference = ( fpCustomFraming, fpXPThemes );

  TRzGroupBarGradientPath = ( gpTopToBottom, gpBottomToTop );

  TDirection = ( dirUp, dirDown, dirLeft, dirRight );
  TRzScrollStyle = ( scsNone, scsLeft, scsUp, scsRight, scsDown );

  TSide = ( sdLeft, sdTop, sdRight, sdBottom );
  TSides = set of TSide;

  TPositionChangingEvent = procedure( Sender: TObject; NewPos: Integer; var AllowChange: Boolean ) of object;

  TExpandOnType = ( etMouseButton2Click, etFocus, etNone );

  TPositiveByte = 1..255;
  TPositiveSmallint = 1..32767;
  TPositiveInteger = 1..MaxInt;
  TUnsignedSmallint = 0..32767;

  EInvalidFieldType = class( Exception );

  TRzScrollType = ( stNone, stRightToLeft, stLeftToRight );

  TRzHotTrackColorType = ( htctComplement, htctActual );

  // Common Event Signatures
  TStateChangingEvent = procedure( Sender: TObject; Index: Integer; NewState: TCheckBoxState;
                                   var AllowChange: Boolean ) of object;

  TStateChangeEvent = procedure( Sender: TObject; Index: Integer; NewState: TCheckBoxState ) of object;

const
  sdAllSides = [ sdLeft, sdTop, sdRight, sdBottom ];

const                                                           { Color Arrays }
  { Frame Style Color constant arrays }

  ULFrameColor: array[ TFrameStyle ] of TColor = ( clWindow,             // fsNone
                                                   cl3DDkShadow,         // fsFlat
                                                   clBtnShadow,          // fsGroove
                                                   clBtnHighlight,       // fsBump
                                                   clBtnShadow,          // fsLowered
                                                   clNone,               // fsButtonDown
                                                   cl3DDkShadow,         // fsRaised
                                                   clNone,               // fsButtonUp
                                                   clBtnShadow,          // fsStatus
                                                   clBtnHighlight,       // fsPopup
                                                   clBtnShadow );        // fsFlatBold

  LRFrameColor: array[ TFrameStyle ] of TColor = ( clWindow,             // fsNone
                                                   cl3DDkShadow,         // fsFlat
                                                   clBtnHighlight,       // fsGroove
                                                   clBtnShadow,          // fsBump
                                                   clBtnHighlight,       // fsLowered
                                                   clNone,               // fsButtonDown
                                                   clBtnFace,            // fsRaised
                                                   clNone,               // fsButtonUp
                                                   clBtnHighlight,       // fsStatus
                                                   clBtnShadow,          // fsPopup
                                                   clBtnShadow );        // fsFlatBold

  DrawTextAlignments: array[ TAlignment ] of Word = ( dt_Left,
                                                      dt_Right,
                                                      dt_Center );

  SetTextAlignments: array[ TAlignment ] of Word = ( ta_Left, ta_Right, ta_Center );


{$IFDEF VCL50}
const
  {$EXTERNALSYM COLOR_MENUHILIGHT}
  COLOR_MENUHILIGHT = 29;
  {$EXTERNALSYM COLOR_MENUBAR}
  COLOR_MENUBAR = 30;

  clHotLight                = TColor( COLOR_HOTLIGHT or $80000000 );

  clGradientActiveCaption   = TColor( COLOR_GRADIENTACTIVECAPTION or $80000000 );
  clGradientInactiveCaption = TColor( COLOR_GRADIENTINACTIVECAPTION or $80000000 );

  clMenuHighlight           = TColor( COLOR_MENUHILIGHT or $80000000 );
  clMenuBar                 = TColor( COLOR_MENUBAR or $80000000 );
{$ENDIF}

const
  RzCompsHelpFile: string[ 12 ] = 'RC3Help.hlp';

type
  TRzAboutInfo = ( aiRaizeComponents );

{===============================================================================
  TRzBlinkingControlsList Class

  Implementation specific class designed to wrap a timer component and
  maintain a list of Blinking controls.  When the internal timer fires,
  the cm_Blink message is sent to each control in the list.
===============================================================================}

type
  TRzBlinkingControlsList = class
  private
    FBlinkState: TBlinkState;
    FControls: TList;
    FTimer: TTimer;
    FIntervalOff: Word;
    FIntervalOn: Word;
  protected
    function GetCount: Integer; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add( Control: TControl );
    procedure Remove( Control: TControl );
    procedure TimerFired( Sender: TObject );

    property Count: Integer
      read GetCount;

    property IntervalOff: Word
      read FIntervalOff
      write FIntervalOff;

    property IntervalOn: Word
      read FIntervalOn
      write FIntervalOn;
  end;

var
  BlinkingControls: TRzBlinkingControlsList = nil;

procedure FreeBlinkingControlsListIfEmpty;


{== Special Drawing Procedures ==}

function CenterRect( R: TRect; Width, Height: Integer ): TRect;

procedure ColorToHSL( C: TColor; var H, S, L: Byte );
function ColorHue( C: TColor ): Byte;
function ColorSaturation( C: TColor ): Byte;
function ColorLuminance( C: TColor ): Byte;
function HSLtoColor( H, S, L: Byte ): TColor;
function DarkerColor( C: TColor; Adjustment: Byte ): TColor;
function LighterColor( C: TColor; Adjustment: Byte ): TColor;
function AdjustColor( C: TColor; Adjustment: Integer ): TColor;
function BlendColors( ForeColor, BackColor: TColor; Alpha: Byte ): TColor;
function ColorsTooClose( ForeColor, BackColor: TColor ): Boolean;

function FullColorSupport: Boolean;

procedure DrawDropShadow( Canvas: TCanvas; Bounds: TRect; Depth: Integer; ShadowColor: TColor = clBlack );

function DrawSides( Canvas: TCanvas; Bounds: TRect; ULColor, LRColor: TColor; Sides: TSides ): TRect;

function DrawBevel( Canvas: TCanvas; Bounds: TRect; ULColor, LRColor: TColor; Width: Integer; Sides: TSides ): TRect;

function DrawCtl3DBorder( Canvas: TCanvas; Bounds: TRect; Lowered: Boolean ): TRect;

function DrawCtl3DBorderSides( Canvas: TCanvas; Bounds: TRect; Lowered: Boolean; Sides: TSides ): TRect;

function DrawButtonBorder( Canvas: TCanvas; Bounds: TRect; Lowered: Boolean ): TRect;

function DrawButtonBorderSides( Canvas: TCanvas; Bounds: TRect; Lowered: Boolean; Sides: TSides ): TRect;

function DrawColorButtonBorder( Canvas: TCanvas; Bounds: TRect; FaceColor: TColor; Lowered: Boolean ): TRect;

function DrawColorButtonBorderSides( Canvas: TCanvas; Bounds: TRect; FaceColor: TColor; Lowered: Boolean; Sides: TSides ): TRect;

function DrawBorder( Canvas: TCanvas; Bounds: TRect; Style: TFrameStyle ): TRect;

function DrawBorderSides( Canvas: TCanvas; Bounds: TRect; Style: TFrameStyle; Sides: TSides ): TRect;

function DrawColorBorder( Canvas: TCanvas; Bounds: TRect; FaceColor: TColor; Style: TFrameStyle ): TRect;

function DrawColorBorderSides( Canvas: TCanvas; Bounds: TRect; FaceColor: TColor; Style: TFrameStyle; Sides: TSides ): TRect;

function DrawFocusBorder( Canvas: TCanvas; Bounds: TRect ): TRect;

function DrawRoundedFlatBorder( Canvas: TCanvas; Bounds: TRect; Color: TColor; Sides: TSides ): TRect;

function DrawInnerOuterBorders( Canvas: TCanvas; Bounds: TRect;
                                BorderOuter, BorderInner: TFrameStyleEx;
                                BorderWidth: Integer; BorderSides: TSides; BevelWidth: Integer;
                                BorderColor, BorderHighlight, BorderShadow: TColor;
                                FlatColor: TColor; FlatColorAdjustment: Integer; Color, ParentColor: TColor;
                                Transparent: Boolean; SoftInnerFlatBorder: Boolean = False ): TRect;

procedure DrawGroupBarBackground( Canvas: TCanvas; Bounds: TRect; ThemeAware: Boolean;
                                  GradientPath: TRzGroupBarGradientPath; Color: TColor; ColorAdjustment: Integer );


procedure DrawLEDBar( Canvas: TCanvas; Bounds: TRect; Orientation: TOrientation; BarColor, BackColor: TColor;
                      NumSegments: Integer; Percent: Integer; ThemeAware: Boolean = True );

procedure DrawPercentBar( Canvas: TCanvas; Bounds: TRect; Orientation: TOrientation; BarColor, BackColor: TColor;
                          Percent: Word; ShowPercent: Boolean );


procedure DrawFrame( Canvas: TCanvas; Width, Height: Integer; FrameStyle: TFrameStyle; EraseColor, FrameColor: TColor;
                     FrameSides: TSides; Transparent: Boolean = False );

type
  TRzUIStyle = ( uiWindows95, uiWindowsXP );

procedure DrawDropDownArrow( Canvas: TCanvas; Bounds: TRect; UIStyle: TRzUIStyle; Down: Boolean;
                             Enabled: Boolean = True );

procedure DrawSpinArrow( Canvas: TCanvas; Bounds: TRect; UIStyle: TRzUIStyle; Direction: TDirection; Down: Boolean;
                         Enabled: Boolean = True );

procedure AddImageToImageList( ImageList: TCustomImageList; Glyph: TBitmap; AddDisabled: Boolean;
                               var ImageIndex, DisabledIndex: Integer );


{ Function to get a valid new component name.  Used by Component Editors }

function GetNewComponentName( AOwner: TComponent; const BaseName: string; TryNoIndex: Boolean = True ): string;
function CreateValidIdent( const Ident, DefaultName: string ): string;

function IsTrueTypeFont( Font: TFont ): Boolean;
function RotateFont( Font: TFont; Angle: Integer ): HFont;
function GetMinFontHeight( Font: TFont ): Integer;
function GetAvgCharWidth( Font: TFont ): Integer;

function LastChar( const S: string ): Char;
function CountChar( C: Char; const S: string ): Integer;
function CopyEx( const S: string; Start: Integer; C: Char; Count: Integer ): string;
function RemoveChar( var S: string; C: Char ): Boolean;

function Min( A, B: Integer ): Integer;
function Max( A, B: Integer ): Integer;

procedure Swap( var A, B: Integer ); overload;
procedure Swap( var A, B: Word ); overload;

procedure UpdateObjectInspector( AControl: TControl );

type
  TRzWindowsVersion = ( Win95, WinNT, Win98, WinMe, Win2000, WinXP, WinServer2003 );

function RunningUnder( Ver: TRzWindowsVersion ): Boolean;

type
  TRzOldPropReader = class
    class procedure ReadOldBooleanProp( Reader: TReader );
    class procedure ReadOldEnumProp( Reader: TReader );
    class procedure ReadOldIdentProp( Reader: TReader );
    class procedure ReadOldIntegerProp( Reader: TReader );
    class procedure ReadOldSetProp( Reader: TReader );
    class procedure ReadOldStringProp( Reader: TReader );
    class procedure WriteOldProp( Writer: TWriter );
  end;


{== Base Dialog Component Helper Functions and Class ==}

function GetDesktopClientRect: TRect;
function GetActiveWorkArea( Window: TWinControl ): TRect;
function GetActiveWorkAreaWidth( Window: TWinControl ): Integer;
function GetActiveWorkAreaHeight( Window: TWinControl ): Integer;
function GetMonitorWorkArea( Monitor: TMonitor ): TRect;
function GetMonitorBoundsRect( Monitor: TMonitor ): TRect;
procedure CenterToWindow( ChildWin, Window: TWinControl; var Left, Top: Integer );
procedure CenterToForm( ChildWin: TWinControl; AForm: TCustomForm; var Left, Top: Integer );
procedure CenterToMDIChild( ChildWin: TWinControl; AForm: TForm; var Left, Top: Integer );

type
  TRzDialogComponent = class( TComponent )
  private
    FBorderStyle: TFormBorderStyle;
    FCaption: string;
    FCaptionOk: string;
    FCaptionCancel: string;
    FCaptionHelp: string;
    FCenterToParent: Boolean;
    FFont: TFont;
    FFrameColor: TColor;
    FFrameStyle: TFrameStyle;
    FFrameVisible: Boolean;
    FFramingPreference: TFramingPreference;
    FHeight: Integer;
    FHelpContext: THelpContext;
    FOriginLeft: Integer;
    FOriginTop: Integer;
    FWidth: Integer;
    FPosition: TPosition;
  protected
    FAboutInfo: TRzAboutInfo;
    procedure CenterForm( Dlg: TForm );

    { Property Access Methods }
    procedure SetFont( Value: TFont ); virtual;
    procedure SetCenterToParent( Value: Boolean ); virtual;

    { Property Declarations }
    property BorderStyle: TFormBorderStyle
      read FBorderStyle
      write FBorderStyle
      default bsSizeable;

    property Caption: string
      read FCaption
      write FCaption;

    property CaptionOK: string
      read FCaptionOK
      write FCaptionOK;

    property CaptionCancel: string
      read FCaptionCancel
      write FCaptionCancel;

    property CaptionHelp: string
      read FCaptionHelp
      write FCaptionHelp;

    property Font: TFont
      read FFont
      write SetFont;

    property FrameColor: TColor
      read FFrameColor
      write FFrameColor
      default clBtnShadow;

    property FrameStyle: TFrameStyle
      read FFrameStyle
      write FFrameStyle
      default fsFlat;

    property FrameVisible: Boolean
      read FFrameVisible
      write FFrameVisible
      default False;

    property FramingPreference: TFramingPreference
      read FFramingPreference
      write FFramingPreference
      default fpXPThemes;

    property Height: Integer
      read FHeight
      write FHeight
      default 300;

    property HelpContext: THelpContext
      read FHelpContext
      write FHelpContext
      default 0;

    property Width: Integer
      read FWidth
      write FWidth
      default 350;
  public
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;
  published
    property CenterToParent: Boolean
      read FCenterToParent
      write SetCenterToParent
      default False;

    property OriginLeft: Integer
      read FOriginLeft
      write FOriginLeft
      default 100;

    property Position: TPosition
      read FPosition
      write FPosition
      default poScreenCenter;

    property OriginTop: Integer
      read FOriginTop
      write FOriginTop
      default 100;
  end;


type
  TRzRegIniFile = class;

  IRzCustomFramingNotification = interface
    ['{64B1C9EA-C954-428A-95C4-4EA2EB0F1E16}']
    procedure CustomFramingChanged;
  end;

  TRzFrameProperty = ( fpAll, fpColor, fpFocusColor, fpDisabledColor, fpParentColor, fpFlatButtonColor, fpFlatButtons,
                       fpFrameColor, fpHotColor, fpHotTrack, fpHotStyle, fpSides, fpStyle, fpVisible, fpPreference );

  TRzFrameController = class( TComponent )
  private
    FAboutInfo: TRzAboutInfo;
    FColor: TColor;
    FParentColor: Boolean;
    FFrameList: TList;
    FFlatButtonColor: TColor;
    FFlatButtons: Boolean;
    FDisabledColor: TColor;
    FFocusColor: TColor;
    FFrameColor: TColor;
    FFrameHotColor: TColor;
    FFrameHotTrack: Boolean;
    FFrameHotStyle: TFrameStyle;
    FFrameSides: TSides;
    FFrameStyle: TFrameStyle;
    FFrameVisible: Boolean;
    FFramingPreference: TFramingPreference;
    FUpdateCount: Integer;
    FRegIniFile: TRzRegIniFile;

    procedure ReadOldFrameFlatProp( Reader: TReader );
    procedure ReadOldFrameFocusStyleProp( Reader: TReader );

    function IsColorStored: Boolean;
  protected
    procedure DefineProperties( Filer: TFiler ); override;
    procedure Loaded; override;
    procedure Notification( AComponent: TComponent; Operation: TOperation ); override;

    procedure UpdateControlFrame( C: TComponent; FrameProperty: TRzFrameProperty ); virtual;
    procedure UpdateFrames( FrameProperty: TRzFrameProperty ); virtual;

    { Property Access Methods }
    procedure SetColor( Value: TColor ); virtual;
    procedure SetParentColor( Value: Boolean ); virtual;
    procedure SetFlatButtonColor( Value: TColor ); virtual;
    procedure SetFlatButtons( Value: Boolean ); virtual;
    procedure SetDisabledColor( Value: TColor ); virtual;
    procedure SetFocusColor( Value: TColor ); virtual;
    procedure SetFrameColor( Value: TColor ); virtual;
    procedure SetFrameHotColor( Value: TColor ); virtual;
    procedure SetFrameHotTrack( Value: Boolean ); virtual;
    procedure SetFrameHotStyle( Value: TFrameStyle ); virtual;
    procedure SetFrameSides( Value: TSides ); virtual;
    procedure SetFrameStyle( Value: TFrameStyle ); virtual;
    procedure SetFrameVisible( Value: Boolean ); virtual;
    procedure SetFramingPreference( Value: TFramingPreference ); virtual;

    procedure SetRegIniFile( Value: TRzRegIniFile ); virtual;
  public
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;

    procedure Assign( Source: TPersistent ); override;

    procedure BeginUpdate;
    procedure EndUpdate;
    procedure UpdateControls;

    procedure AddControl( C: TComponent );
    procedure RemoveControl( C: TComponent );

    procedure Load( const Section: string );
    procedure Save( const Section: string );
  published
    property About: TRzAboutInfo
      read FAboutInfo
      write FAboutInfo
      stored False;

    property Color: TColor
      read FColor
      write SetColor
      stored IsColorStored
      default clWindow;

    property DisabledColor: TColor
      read FDisabledColor
      write SetDisabledColor
      default clBtnFace;

    property FlatButtonColor: TColor
      read FFlatButtonColor
      write SetFlatButtonColor
      default clBtnFace;

    property FlatButtons: Boolean
      read FFlatButtons
      write SetFlatButtons
      default True;

    property FocusColor: TColor
      read FFocusColor
      write SetFocusColor
      default clWindow;

    property FrameColor: TColor
      read FFrameColor
      write SetFrameColor
      default clBtnShadow;

    property FrameHotColor: TColor
      read FFrameHotColor
      write SetFrameHotColor
      default clBtnShadow;

    property FrameHotStyle: TFrameStyle
      read FFrameHotStyle
      write SetFrameHotStyle
      default fsFlatBold;

    property FrameHotTrack: Boolean
      read FFrameHotTrack
      write SetFrameHotTrack
      default False;

    property FrameSides: TSides
      read FFrameSides
      write SetFrameSides
      default sdAllSides;

    property FrameStyle: TFrameStyle
      read FFrameStyle
      write SetFrameStyle
      default fsFlat;

    property FrameVisible: Boolean
      read FFrameVisible
      write SetFrameVisible
      default False;

    property FramingPreference: TFramingPreference
      read FFramingPreference
      write SetFramingPreference
      default fpXPThemes;

    property ParentColor: Boolean
      read FParentColor
      write SetParentColor
      default False;

    property RegIniFile: TRzRegIniFile
      read FRegIniFile
      write SetRegIniFile;
  end;


  ENoRegIniFile = Exception;

  TRzPathType = ( ptIniFile, ptRegistry );

  TRzRegKey = ( hkeyClassesRoot, hkeyCurrentUser, hkeyLocalMachine, hkeyUsers, hkeyPerformanceData, hkeyCurrentConfig,
                hkeyDynData );


  TRzRegAccessKey = ( keyQueryValue, keySetValue, keyCreateSubKey, keyEnumerateSubKeys, keyNotify, keyCreateLink,
                      keyRead, keyWrite, keyExecute, keyAllAccess );
  TRzRegAccess = set of TRzRegAccessKey;


  TRzRegIniFile = class( TComponent )
  private
    FAboutInfo: TRzAboutInfo;
    FPath: string;
    FPathType: TRzPathType;
    FRegKey: TRzRegKey;
    FRegAccess: TRzRegAccess;

    FRefreshStorage: Boolean;

    FIni: TIniFile;
    FReg: TRegistryIniFile;
  protected
    procedure CheckAccess;

    procedure SetPath( const Value: string ); virtual;
    procedure SetPathType( Value: TRzPathType ); virtual;
    procedure SetRegKey( Value: TRzRegKey ); virtual;
    procedure SetRegAccess( Value: TRzRegAccess ); virtual;
  public
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;

    function SectionExists( const Section: string ): Boolean;
    function ValueExists( const Section, Name: string ): Boolean;

    function ReadBool( const Section, Name: string; Default: Boolean ): Boolean;
    procedure WriteBool( const Section, Name: string; Value: Boolean );

    function ReadDate( const Section, Name: string; Default: TDateTime ): TDateTime;
    procedure WriteDate( const Section, Name: string; Value: TDateTime );

    function ReadDateTime( const Section, Name: string; Default: TDateTime ): TDateTime;
    procedure WriteDateTime( const Section, Name: string; Value: TDateTime );

    function ReadFloat( const Section, Name: string; Default: Double ): Double;
    procedure WriteFloat( const Section, Name: string; Value: Double );

    function ReadInteger( const Section, Name: string; Default: Longint ): Longint;
    procedure WriteInteger( const Section, Name: string; Value: Longint );

    function ReadString( const Section, Name, Default: string ): string;
    procedure WriteString( const Section, Name, Value: string );

    function ReadTime( const Section, Name: string; Default: TDateTime ): TDateTime;
    procedure WriteTime( const Section, Name: string; Value: TDateTime );

    {$IFDEF VCL60_OR_HIGHER}
    function ReadBinaryStream( const Section, Name: string; Value: TStream ): Integer;
    procedure WriteBinaryStream( const Section, Name: string; Value: TStream );
    {$ENDIF}

    procedure ReadSection( const Section: string; Strings: TStrings );
    procedure ReadSections( Strings: TStrings );
    procedure ReadSectionValues( const Section: string; Strings: TStrings );

    procedure EraseSection( const Section: string );
    procedure DeleteKey( const Section, Name: string );

  published
    property About: TRzAboutInfo
      read FAboutInfo
      write FAboutInfo
      stored False;

    property Path: string
      read FPath
      write SetPath;

    property PathType: TRzPathType
      read FPathType
      write SetPathType
      default ptIniFile;

    property RegKey: TRzRegKey
      read FRegKey
      write SetRegKey
      default hkeyCurrentUser;

    property RegAccess: TRzRegAccess
      read FRegAccess
      write SetRegAccess
      default [ keyAllAccess ];
  end;


  TRzCustomColors = class( TComponent )
  private
    FAboutInfo: TRzAboutInfo;
    FColors: TStrings;
    FRegIniFile: TRzRegIniFile;
  protected
    procedure Notification( AComponent: TComponent; Operation: TOperation ); override;

    procedure InitColors; virtual;
    function GetColorName( Index: Integer ): string;
    procedure FixupColors;

    { Property Access Methods }
    procedure SetColors( Value: TStrings ); virtual;
    procedure SetRegIniFile( Value: TRzRegIniFile ); virtual;
  public
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;

    procedure Load( const Section: string );
    procedure Save( const Section: string );
  published
    property About: TRzAboutInfo
      read FAboutInfo
      write FAboutInfo
      stored False;

    property Colors: TStrings
      read FColors
      write SetColors;

    property RegIniFile: TRzRegIniFile
      read FRegIniFile
      write SetRegIniFile;
  end;


{$IFNDEF VCL60_OR_HIGHER}

// Date Utils

function WeekOf( const AValue: TDateTime ): Word;

function IncYear( const AValue: TDateTime; const ANumberOfYears: Integer = 1 ): TDateTime;
function IncDay( const AValue: TDateTime; const ANumberOfDays: Integer = 1 ): TDateTime;
function IncHour( const AValue: TDateTime; const ANumberOfHours: Int64 = 1 ): TDateTime;
function IncMinute( const AValue: TDateTime; const ANumberOfMinutes: Int64 = 1 ): TDateTime;

{$ENDIF}


resourcestring
  sRzNoRegIniFile = 'No TRzRegIniFile component specified';
  sRzCannotLoadCustomFraming = 'Cannot load Custom Framing settings--No TRzRegIniFile component specified';
  sRzCannotSaveCustomFraming = 'Cannot save Custom Framing settings--No TRzRegIniFile component specified';
  sRzCannotLoadCustomColors = 'Cannot load Custom Colors--No TRzRegIniFile component specified';
  sRzCannotSaveCustomColors = 'Cannot save Custom Colors--No TRzRegIniFile component specified';
  sRzCannotRestoreFormState = 'Cannot restore Form State--No TRzRegIniFile component specified';
  sRzCannotSaveFormState = 'Cannot save Form State--No TRzRegIniFile component specified';

{&RG}

implementation

uses
  MultiMon,
  Messages,
  Consts,
  TypInfo,
  RzGrafx;


procedure FreeBlinkingControlsListIfEmpty;
begin
  if BlinkingControls.Count = 0 then
  begin
    { If no more Blinking controls are left, destroy BlinkingControls }
    BlinkingControls.Free;
    BlinkingControls := nil;
  end;
end;


{=====================================}
{== TRzBlinkingControlsList Methods ==}
{=====================================}

constructor TRzBlinkingControlsList.Create;
begin
  inherited;

  FBlinkState := bsOff;
  FIntervalOff := 500;
  FIntervalOn := 500;

  FTimer := TTimer.Create( nil );
  FTimer.OnTimer := TimerFired;
  FTimer.Interval := FIntervalOff;
  FTimer.Enabled := True;

  FControls := TList.Create;
end;


destructor TRzBlinkingControlsList.Destroy;
begin
  FTimer.Free;
  FControls.Free;
  inherited;
end;


procedure TRzBlinkingControlsList.Add( Control: TControl );
begin
  FControls.Add( Control );
end;


procedure TRzBlinkingControlsList.Remove( Control: TControl );
begin
  with FControls do
    Delete( IndexOf( Control ) );
end;

procedure TRzBlinkingControlsList.TimerFired( Sender: TObject );
var
  I: Integer;
begin
  if FBlinkState = bsOn then
  begin
    FBlinkState := bsOff;
    FTimer.Interval := FIntervalOn;
  end
  else
  begin
    FBlinkState := bsOn;
    FTimer.Interval := FIntervalOff;
  end;

  for I := 0 to FControls.Count - 1 do
  begin
    if TControl( FControls.Items[ I ] ).Perform( cm_GetBlinking, 0, 0 ) = 1 then
    begin
      TControl( FControls.Items[ I ] ).Perform( cm_Blink, Integer( FBlinkState ), 0 );
    end;
  end;
end;

function TRzBlinkingControlsList.GetCount: Integer;
begin
  Result := FControls.Count;
end;


{=======================}
{== Drawing functions ==}
{=======================}

function CenterRect( R: TRect; Width, Height: Integer ): TRect;
begin
  Result := Bounds( ( R.Right + R.Left - Width ) div 2, ( R.Bottom + R.Top - Height ) div 2, Width, Height );
end;


procedure ColorToHSL( C: TColor; var H, S, L: Byte );
var
  Dif, CCmax, CCmin, RC, GC, BC, TempH, TempS, TempL: Double;
begin
  { Convert RGB color to Hue, Saturation and Luminance }

  { Convert Color to RGB color value. This is necessary if Color specifies
    a system color such as clHighlight }
  C := ColorToRGB( C );

  { Determine a percent (as a decimal) for each colorant }
  RC := GetRValue( C ) / 255;
  GC := GetGValue( C ) / 255;
  BC := GetBValue( C ) / 255;

  if RC > GC then
    CCmax := RC
  else
    CCmax := GC;
  if BC > CCmax then
    CCmax := BC;

  if RC < GC then
    CCmin := RC
  else
    CCmin := GC;

  if BC < CCmin then
    CCmin := BC;

  { Calculate Luminance }
  TempL := (CCmax + CCmin) / 2.0;

  if CCmax = CCmin then
  begin
    TempS := 0;
    TempH := 0;
  end
  else
  begin
    Dif := CCmax - CCmin;

    { Calculate Saturation }
    if TempL < 0.5 then
      TempS := Dif / (CCmax + CCmin)
    else
      TempS := Dif / ( 2.0 - CCmax - CCmin );

    { Calculate Hue }
    if RC = CCmax then
      TempH := (GC - BC) / Dif
    else if GC = CCmax then
      TempH := 2.0 + (BC - RC) / Dif
    else
      TempH := 4.0 + (RC - GC) / Dif;

    TempH := TempH / 6;
    if TempH < 0 then
      TempH := TempH + 1;
  end;

  H := Round( 240 * TempH );
  S := Round( 240 * TempS );
  L := Round( 240 * TempL );
end; {= ColorToHSL =}


function ColorHue( C: TColor ): Byte;
var
  S, L: Byte;
begin
  ColorToHSL( C, Result, S, L );
end;


function ColorSaturation( C: TColor ): Byte;
var
  H, L: Byte;
begin
  ColorToHSL( C, H, Result, L );
end;


function ColorLuminance( C: TColor ): Byte;
var
  H, S: Byte;
begin
  ColorToHSL( C, H, S, Result );
end;


function HSLtoColor( H, S, L: Byte ): TColor;
var
  HN, SN, LN, RD, GD, BD, V, M, SV, Fract, VSF, Mid1, Mid2: Double;
  R, G, B: Byte;
  Sextant: Integer;
begin
  { Hue, Saturation, and Luminance must be normalized to 0..1 }

  HN := H / 239;
  SN := S / 240;
  LN := L / 240;

  if LN < 0.5 then
    V := LN * ( 1.0 + SN )
  else
    V := LN + SN - LN * SN;
  if V <= 0 then
  begin
    RD := 0.0;
    GD := 0.0;
    BD := 0.0;
  end
  else
  begin
    M := LN + LN - V;
    SV := (V - M ) / V;
    HN := HN * 6.0;
    Sextant := Trunc( HN );
    Fract := HN - Sextant;
    VSF := V * SV * Fract;
    Mid1 := M + VSF;
    Mid2 := V - VSF;

    case Sextant of
      0:
      begin
        RD := V;
        GD := Mid1;
        BD := M;
      end;

      1:
      begin
        RD := Mid2;
        GD := V;
        BD := M;
      end;

      2:
      begin
        RD := M;
        GD := V;
        BD := Mid1;
      end;

      3:
      begin
        RD := M;
        GD := Mid2;
        BD := V;
      end;

      4:
      begin
        RD := Mid1;
        GD := M;
        BD := V;
      end;

      5:
      begin
        RD := V;
        GD := M;
        BD := Mid2;
      end;

      else
      begin
        RD := V;
        GD := Mid1;
        BD := M;
      end;
    end;
  end;

  if RD > 1.0 then
    RD := 1.0;
  if GD > 1.0 then
    GD := 1.0;
  if BD > 1.0 then
    BD := 1.0;
  R := Round( RD * 255 );
  G := Round( GD * 255 );
  B := Round( BD * 255 );
  Result := RGB( R, G, B );
end; {= HSLtoColor =}


function DarkerColor( C: TColor; Adjustment: Byte ): TColor;
var
  H, S, L: Byte;
begin
  ColorToHSL( C, H, S, L );
  Result := HSLtoColor( H, S, Max( L - Adjustment, 0 ) );
end;


function LighterColor( C: TColor; Adjustment: Byte ): TColor;
var
  H, S, L: Byte;
begin
  ColorToHSL( C, H, S, L );
  Result := HSLtoColor( H, S, Min( L + Adjustment, 255 ) );
end;


function AdjustColor( C: TColor; Adjustment: Integer ): TColor;
begin
  Result := C;
  if Adjustment < 0 then
    Result := DarkerColor( C, -Adjustment )
  else if Adjustment > 0 then
    Result := LighterColor( C, Adjustment );
end;


function BlendColors( ForeColor, BackColor: TColor; Alpha: Byte ): TColor;
var
  ForeRed, ForeGreen, ForeBlue: Byte;
  BackRed, BackGreen, BackBlue: Byte;
  BlendRed, BlendGreen, BlendBlue: Byte;
  AlphaValue: Single;
begin
  AlphaValue := Alpha / 255;

  ForeColor := ColorToRGB( ForeColor );
  ForeRed   := GetRValue( ForeColor );
  ForeGreen := GetGValue( ForeColor );
  ForeBlue  := GetBValue( ForeColor );

  BackColor := ColorToRGB( BackColor );
  BackRed   := GetRValue( BackColor );
  BackGreen := GetGValue( BackColor );
  BackBlue  := GetBValue( BackColor );

  BlendRed := Round( AlphaValue * ForeRed + ( 1 - AlphaValue ) * BackRed );
  BlendGreen := Round( AlphaValue * ForeGreen + ( 1 - AlphaValue ) * BackGreen );
  BlendBlue := Round( AlphaValue * ForeBlue + ( 1 - AlphaValue ) * BackBlue );

  Result := RGB( BlendRed, BlendGreen, BlendBlue );
end;


function ColorsTooClose( ForeColor, BackColor: TColor ): Boolean;
var
  ForeH, ForeS, ForeL: Byte;
  BackH, BackS, BackL: Byte;
begin
  ColorToHSL( ForeColor, ForeH, ForeS, ForeL );
  ColorToHSL( BackColor, BackH, BackS, BackL );

  Result := ( Abs( ForeH - BackH ) < 20 ) and
            ( Abs( ForeL - BackL ) < 60 );
end;


function FullColorSupport: Boolean;
var
  DC: HDC;
begin
  DC := GetDC( 0 );
  try
    Result := GetDeviceCaps( DC, NUMCOLORS ) = -1;
  finally
    ReleaseDC( 0, DC );
  end;
end;


procedure DrawDropShadow( Canvas: TCanvas; Bounds: TRect; Depth: Integer; ShadowColor: TColor = clBlack );
var
  A, D, I: Integer;

  procedure DrawShadow( Offset, Alpha: Integer );
  var
    X, Y: Integer;
  begin
    //                       4 ***
    //                           *
    //                           *
    //                         3 *
    //     *                     *
    //   1 *          2          *
    //     ***********************

    // Step 1
    X := Bounds.Left + 2*Depth - Offset;
    for Y := Bounds.Bottom - 1 to Bounds.Bottom - 1 + Offset - 1 do
      Canvas.Pixels[ X, Y ] := BlendColors( ShadowColor, Canvas.Pixels[ X, Y ], Alpha );
    Inc( X );
    Y := Bounds.Bottom - 1 + Offset - 1;
    Canvas.Pixels[ X, Y ] := BlendColors( ShadowColor, Canvas.Pixels[ X, Y ], Alpha );

    // Step 2
    Y := Bounds.Bottom - 1 + Offset;
    for X := Bounds.Left + 2*Depth - Offset + 1 to Bounds.Right + Offset - 2 do
      Canvas.Pixels[ X, Y ] := BlendColors( ShadowColor, Canvas.Pixels[ X, Y ], Alpha );
    Dec( Y );
    X := Bounds.Right + Offset - 2;
    Canvas.Pixels[ X, Y ] := BlendColors( ShadowColor, Canvas.Pixels[ X, Y ], Alpha );

    // Step 3
    Y := Bounds.Top + 2*Depth - Offset;
    for X := Bounds.Right - 1 to Bounds.Right - 1 + Offset - 1 do
      Canvas.Pixels[ X, Y ] := BlendColors( ShadowColor, Canvas.Pixels[ X, Y ], Alpha );
    Inc( Y );
    X := Bounds.Right - 1 + Offset - 1;
    Canvas.Pixels[ X, Y ] := BlendColors( ShadowColor, Canvas.Pixels[ X, Y ], Alpha );

    // Step 4
    X := Bounds.Right - 1 + Offset;
    for Y := Bounds.Top + 2 * Depth - Offset + 1 to Bounds.Bottom + Offset - 2 do
      Canvas.Pixels[ X, Y ] := BlendColors( ShadowColor, Canvas.Pixels[ X, Y ], Alpha );
  end;

begin
  if Depth <= 0 then
    Exit;
  D := 128 div Depth;
  A := 128;
  for I := 1 to Depth do
  begin
    DrawShadow( I, A );
    Dec( A, D );
  end;
end;


{======================}
{== Border Functions ==}
{======================}

function DrawSides( Canvas: TCanvas; Bounds: TRect; ULColor, LRColor: TColor; Sides: TSides ): TRect;
begin
  if ULColor <> clNone then
  begin
    Canvas.Pen.Color := ULColor;
    if sdLeft in Sides then
    begin
      Canvas.MoveTo( Bounds.Left, Bounds.Top );
      Canvas.LineTo( Bounds.Left, Bounds.Bottom );
    end;

    if sdTop in Sides then
    begin
      Canvas.MoveTo( Bounds.Left, Bounds.Top );
      Canvas.LineTo( Bounds.Right, Bounds.Top );
    end;
  end;

  if LRColor <> clNone then
  begin
    Canvas.Pen.Color := LRColor;
    if sdRight in Sides then
    begin
      Canvas.MoveTo( Bounds.Right - 1, Bounds.Top );
      Canvas.LineTo( Bounds.Right - 1, Bounds.Bottom );
    end;

    if sdBottom in Sides then
    begin
      Canvas.MoveTo( Bounds.Left, Bounds.Bottom - 1 );
      Canvas.LineTo( Bounds.Right, Bounds.Bottom - 1 );
    end;
  end;

  if sdLeft in Sides then
    Inc( Bounds.Left );
  if sdTop in Sides then
    Inc( Bounds.Top );
  if sdRight in Sides then
    Dec( Bounds.Right );
  if sdBottom in Sides then
    Dec( Bounds.Bottom );

  Result := Bounds;
end; {= DrawSides =}



function DrawBevel( Canvas: TCanvas; Bounds: TRect; ULColor, LRColor: TColor; Width: Integer; Sides: TSides ): TRect;
var
  I: Integer;
begin
  Canvas.Pen.Width := 1;
  for I := 1 to Width do                         { Loop through width of bevel }
  begin
    Bounds := DrawSides( Canvas, Bounds, ULColor, LRColor, Sides );
  end;
  Result := Bounds;
end;


{=======================================}
{== Generic DrawCtl3DBorder Procedure ==}
{=======================================}

function DrawCtl3DBorder( Canvas: TCanvas; Bounds: TRect; Lowered: Boolean ): TRect;
begin
  Result := DrawCtl3DBorderSides( Canvas, Bounds, Lowered, sdAllSides );
end;


function DrawCtl3DBorderSides( Canvas: TCanvas; Bounds: TRect; Lowered: Boolean; Sides: TSides ): TRect;
const
  Colors: array[ 1..4, Boolean ] of TColor = ( ( cl3DLight, clBtnShadow ),
                                                ( cl3DDkShadow, clBtnHighlight ),
                                                ( clBtnHighlight, cl3DDkShadow ),
                                                ( clBtnShadow, cl3DLight ) );
begin
  Bounds := DrawBevel( Canvas, Bounds, Colors[ 1, Lowered ], Colors[ 2, Lowered ], 1, Sides );
  Result := DrawBevel( Canvas, Bounds, Colors[ 3, Lowered ], Colors[ 4, Lowered ], 1, Sides );
end;


{========================================}
{== Generic DrawButtonBorder Procedure ==}
{========================================}

function DrawButtonBorder( Canvas: TCanvas; Bounds: TRect; Lowered: Boolean ): TRect;
begin
  Result := DrawButtonBorderSides( Canvas, Bounds, Lowered, sdAllSides );
end;


function DrawButtonBorderSides( Canvas: TCanvas; Bounds: TRect; Lowered: Boolean; Sides: TSides ): TRect;
const
  Colors: array[ 1..4, Boolean ] of TColor = ( ( clBtnHighlight, clBtnText ),
                                                ( cl3DDkShadow, clBtnText ),
                                                ( cl3DLight, clBtnShadow ),
                                                ( clBtnShadow, clBtnShadow ) );
begin
  Bounds := DrawBevel( Canvas, Bounds, Colors[ 1, Lowered ], Colors[ 2, Lowered ], 1, Sides );
  Result := DrawBevel( Canvas, Bounds, Colors[ 3, Lowered ], Colors[ 4, Lowered ], 1, Sides );
end;



function DrawColorButtonBorder( Canvas: TCanvas; Bounds: TRect; FaceColor: TColor; Lowered: Boolean ): TRect;
begin
  Result := DrawColorButtonBorderSides( Canvas, Bounds, FaceColor, Lowered, sdAllSides );
end;


function DrawColorButtonBorderSides( Canvas: TCanvas; Bounds: TRect; FaceColor: TColor; Lowered: Boolean; Sides: TSides ): TRect;
var
  ULColor, LRColor: TColor;
begin
  if Lowered then
  begin
    ULColor := DarkerColor( FaceColor, 100 );
    LRColor := ULColor;
  end
  else
  begin
    ULColor := LighterColor( FaceColor, 100 );
    LRColor := DarkerColor( FaceColor, 100 );
  end;

  Bounds := DrawSides( Canvas, Bounds, ULColor, LRColor, Sides );

  if Lowered then
  begin
    ULColor := DarkerColor( FaceColor, 50 );
    LRColor := ULColor;
  end
  else
  begin
    ULColor := LighterColor( FaceColor, 40 );
    LRColor := DarkerColor( FaceColor, 50 );
  end;

  Result := DrawSides( Canvas, Bounds, ULColor, LRColor, Sides );
end;



{==================================}
{== Generic DrawBorder Procedure ==}
{==================================}

function DrawBorder( Canvas: TCanvas; Bounds: TRect; Style: TFrameStyle ): TRect;
begin
  Result := DrawBorderSides( Canvas, Bounds, Style, sdAllSides );
end;


function DrawBorderSides( Canvas: TCanvas; Bounds: TRect; Style: TFrameStyle; Sides: TSides ): TRect;
var
  ULColor, LRColor: TColor;
  R: TRect;
begin
  ULColor := ULFrameColor[ Style ];
  LRColor := LRFrameColor[ Style ];

  { Draw the Frame }
  if Style <> fsNone then
  begin
    if Style in [ fsFlat, fsStatus, fsPopup ] then
      Bounds := DrawSides( Canvas, Bounds, ULColor, LRColor, Sides )
    else if Style in [ fsFlatBold ] then
      Bounds := DrawBevel( Canvas, Bounds, ULColor, LRColor, 2, Sides )
    else if Style in [ fsLowered, fsRaised ] then
      Bounds := DrawCtl3DBorderSides( Canvas, Bounds, Style = fsLowered, Sides )
    else if Style in [ fsButtonDown, fsButtonUp ] then
      Bounds := DrawButtonBorderSides( Canvas, Bounds, Style = fsButtonDown, Sides )
    else
    begin
      { Style must be fsGroove or fsBump }
      R := Bounds;
      { Fill in the gaps created by offsetting the rectangle }
      { Upper Right Gap }
      if sdRight in Sides then
        Canvas.Pixels[ R.Right - 1, R.Top ] := LRColor;
      if ( sdTop in Sides ) and not ( sdRight in Sides ) then
        Canvas.Pixels[ R.Right - 1, R.Top ] := ULColor;

      { Lower Left Gap }
      if sdBottom in Sides then
        Canvas.Pixels[ R.Left, R.Bottom - 1 ] := LRColor;
      if ( sdLeft in Sides ) and not ( sdBottom in Sides ) then
        Canvas.Pixels[ R.Left, R.Bottom - 1 ] := ULColor;

      { Upper Left Gaps }
      if ( sdTop in Sides ) and not ( sdLeft in Sides ) then
        Canvas.Pixels[ R.Left, R.Top + 1 ] := LRColor;
      if not ( sdTop in Sides ) and ( sdLeft in Sides ) then
        Canvas.Pixels[ R.Left + 1, R.Top ] := LRColor;

      { Lower Right Gaps }
      if ( sdBottom in Sides ) and not ( sdRight in Sides ) then
        Canvas.Pixels[ R.Right - 1, R.Bottom - 2 ] := ULColor;
      if not ( sdBottom in Sides ) and ( sdRight in Sides ) then
        Canvas.Pixels[ R.Right - 2, R.Bottom - 1 ] := ULColor;

      Inc( R.Left );
      Inc( R.Top );
      DrawSides( Canvas, R, LRColor, LRColor, Sides );
      OffsetRect( R, -1, -1 );
      DrawSides( Canvas, R, ULColor, ULColor, Sides );
      if sdLeft in Sides then
        Inc( Bounds.Left, 2 );
      if sdTop in Sides then
        Inc( Bounds.Top, 2 );
      if sdRight in Sides then
        Dec( Bounds.Right, 2 );
      if sdBottom in Sides then
        Dec( Bounds.Bottom, 2 );
    end;
  end;
  Result := Bounds;
end; {= DrawBorderSides =}




function DrawColorBorder( Canvas: TCanvas; Bounds: TRect; FaceColor: TColor; Style: TFrameStyle ): TRect;
begin
  Result := DrawColorBorderSides( Canvas, Bounds, FaceColor, Style, sdAllSides );
end;


function DrawColorBorderSides( Canvas: TCanvas; Bounds: TRect; FaceColor: TColor; Style: TFrameStyle; Sides: TSides ): TRect;
var
  ULColor, LRColor, C1, C2, C3, C4: TColor;
  R: TRect;
begin
  if Style <> fsNone then
  begin
    if Style in [ fsFlat, fsStatus, fsPopup ] then
    begin
      case Style of
        fsStatus:
        begin
          ULColor := DarkerColor( FaceColor, 50 );
          LRColor := LighterColor( FaceColor, 100 );
        end;

        fsPopup:
        begin
          ULColor := LighterColor( FaceColor, 100 );
          LRColor := DarkerColor( FaceColor, 50 );
        end;

        else { Style = fsFlat }
        begin
          ULColor := DarkerColor( FaceColor, 50 );
          LRColor := ULColor;
        end;
      end;
      Bounds := DrawSides( Canvas, Bounds, ULColor, LRColor, Sides )
    end
    else if Style in [ fsFlatBold ] then
    begin
      ULColor := DarkerColor( FaceColor, 50 );
      LRColor := ULColor;
      Bounds := DrawSides( Canvas, Bounds, ULColor, LRColor, Sides );
      Bounds := DrawSides( Canvas, Bounds, ULColor, LRColor, Sides );
    end
    else if Style in [ fsLowered, fsRaised ] then
    begin
      C1 := DarkerColor( FaceColor, 50 );             // Gray
      C2 := DarkerColor( FaceColor, 100 );            // Black
      C3 := LighterColor( FaceColor, 50 );            // Silver
      C4 := LighterColor( FaceColor, 100 );           // White
      if Style = fsLowered then
      begin
        Bounds := DrawSides( Canvas, Bounds, C1, C4, Sides );
        Bounds := DrawSides( Canvas, Bounds, C2, C3, Sides );
      end
      else
      begin
        Bounds := DrawSides( Canvas, Bounds, C3, C2, Sides );
        Bounds := DrawSides( Canvas, Bounds, C4, C1, Sides );
      end;
    end
    else if Style in [ fsButtonDown, fsButtonUp ] then
    begin
      Bounds := DrawColorButtonBorderSides( Canvas, Bounds, FaceColor, ( Style = fsButtonDown ), Sides );
    end
    else
    begin
      { Style must be fsGroove or fsBump }
      if Style = fsGroove then
      begin
        ULColor := DarkerColor( FaceColor, 50 );
        LRColor := LighterColor( FaceColor, 100 );
      end
      else
      begin
        ULColor := LighterColor( FaceColor, 100 );
        LRColor := DarkerColor( FaceColor, 50 );
      end;
      R := Bounds;
      { Fill in the gaps created by offsetting the rectangle }
      { Upper Right Gap }
      if sdRight in Sides then
        Canvas.Pixels[ R.Right - 1, R.Top ] := LRColor;
      if ( sdTop in Sides ) and not ( sdRight in Sides ) then
        Canvas.Pixels[ R.Right - 1, R.Top ] := ULColor;

      { Lower Left Gap }
      if sdBottom in Sides then
        Canvas.Pixels[ R.Left, R.Bottom - 1 ] := LRColor;
      if ( sdLeft in Sides ) and not ( sdBottom in Sides ) then
        Canvas.Pixels[ R.Left, R.Bottom - 1 ] := ULColor;

      { Upper Left Gaps }
      if ( sdTop in Sides ) and not ( sdLeft in Sides ) then
        Canvas.Pixels[ R.Left, R.Top + 1 ] := LRColor;
      if not ( sdTop in Sides ) and ( sdLeft in Sides ) then
        Canvas.Pixels[ R.Left + 1, R.Top ] := LRColor;

      { Lower Right Gaps }
      if ( sdBottom in Sides ) and not ( sdRight in Sides ) then
        Canvas.Pixels[ R.Right - 1, R.Bottom - 2 ] := ULColor;
      if not ( sdBottom in Sides ) and ( sdRight in Sides ) then
        Canvas.Pixels[ R.Right - 2, R.Bottom - 1 ] := ULColor;

      Inc( R.Left );
      Inc( R.Top );
      DrawSides( Canvas, R, LRColor, LRColor, Sides );
      OffsetRect( R, -1, -1 );
      DrawSides( Canvas, R, ULColor, ULColor, Sides );
      if sdLeft in Sides then
        Inc( Bounds.Left, 2 );
      if sdTop in Sides then
        Inc( Bounds.Top, 2 );
      if sdRight in Sides then
        Dec( Bounds.Right, 2 );
      if sdBottom in Sides then
        Dec( Bounds.Bottom, 2 );
    end;
  end;
  Result := Bounds;
end;


function DrawFocusBorder( Canvas: TCanvas; Bounds: TRect ): TRect;

  procedure DrawHorzLine( X1, X2, Y: Integer );
  var
    X: Integer;
  begin
    X := X1 + 1;
    Canvas.MoveTo( X, Y );
    while X < X2 do
    begin
      Canvas.Pixels[ X, Y ] := Canvas.Pixels[ X, Y ] xor Canvas.Pixels[ X, Y ];
      Inc( X, 2 );
    end;
  end;

  procedure DrawVertLine( X, Y1, Y2: Integer );
  var
    Y: Integer;
  begin
    Y := Y1 + 1;
    Canvas.MoveTo( X, Y );
    while Y < Y2 do
    begin
      Canvas.Pixels[ X, Y ] := Canvas.Pixels[ X, Y ] xor Canvas.Pixels[ X, Y ];;
      Inc( Y, 2 );
    end;
  end;

begin
  DrawVertLine( Bounds.Left, Bounds.Top, Bounds.Bottom );
  DrawVertLine( Bounds.Right - 1, Bounds.Top, Bounds.Bottom );
  DrawHorzLine( Bounds.Left, Bounds.Right, Bounds.Top );
  DrawHorzLine( Bounds.Left, Bounds.Right, Bounds.Bottom - 1 );
  Result := Bounds;
  InflateRect( Result, -1, -1 );
end;


function DrawRoundedFlatBorder( Canvas: TCanvas; Bounds: TRect; Color: TColor; Sides: TSides ): TRect;
var
  X1, X2, Y1, Y2: Integer;
begin
  Canvas.Pen.Color := Color;

  if sdLeft in Sides then
  begin
    if sdTop in Sides then
      Y1 := 2
    else
      Y1 := 0;
    if sdBottom in Sides then
      Y2 := 2
    else
      Y2 := 0;
    Canvas.MoveTo( Bounds.Left, Bounds.Top + Y1 );
    Canvas.LineTo( Bounds.Left, Bounds.Bottom - Y2 );
  end;

  if sdTop in Sides then
  begin
    if sdLeft in Sides then
      X1 := 2
    else
      X1 := 0;
    if sdRight in Sides then
      X2 := 2
    else
      X2 := 0;
    Canvas.MoveTo( Bounds.Left + X1, Bounds.Top );
    Canvas.LineTo( Bounds.Right - X2, Bounds.Top );
  end;

  if sdRight in Sides then
  begin
    if sdTop in Sides then
      Y1 := 2
    else
      Y1 := 0;
    if sdBottom in Sides then
      Y2 := 2
    else
      Y2 := 0;
    Canvas.MoveTo( Bounds.Right - 1, Bounds.Top + Y1 );
    Canvas.LineTo( Bounds.Right - 1, Bounds.Bottom - Y2 );
  end;

  if sdBottom in Sides then
  begin
    if sdLeft in Sides then
      X1 := 2
    else
      X1 := 0;
    if sdRight in Sides then
      X2 := 2
    else
      X2 := 0;
    Canvas.MoveTo( Bounds.Left + X1, Bounds.Bottom - 1 );
    Canvas.LineTo( Bounds.Right - X2, Bounds.Bottom - 1 );
  end;

  if ( sdLeft in Sides ) and ( sdTop in Sides ) then
    Canvas.Pixels[ Bounds.Left + 1, Bounds.Top + 1 ] := Color;
  if ( sdTop in Sides ) and ( sdRight in Sides ) then
    Canvas.Pixels[ Bounds.Right - 2, Bounds.Top + 1 ] := Color;
  if ( sdRight in Sides ) and ( sdBottom in Sides ) then
    Canvas.Pixels[ Bounds.Right - 2, Bounds.Bottom - 2 ] := Color;
  if ( sdLeft in Sides ) and ( sdBottom in Sides ) then
    Canvas.Pixels[ Bounds.Left + 1, Bounds.Bottom - 2 ] := Color;


  if sdLeft in Sides then
    Inc( Bounds.Left, 2 );
  if sdTop in Sides then
    Inc( Bounds.Top, 2 );
  if sdRight in Sides then
    Dec( Bounds.Right, 2 );
  if sdBottom in Sides then
    Dec( Bounds.Bottom, 2 );

  Result := Bounds;
end; {= DrawRoundedFlatBorder =}


function DrawInnerOuterBorders( Canvas: TCanvas; Bounds: TRect;
                                BorderOuter, BorderInner: TFrameStyleEx;
                                BorderWidth: Integer; BorderSides: TSides; BevelWidth: Integer;
                                BorderColor, BorderHighlight, BorderShadow: TColor;
                                FlatColor: TColor; FlatColorAdjustment: Integer; Color, ParentColor: TColor;
                                Transparent: Boolean; SoftInnerFlatBorder: Boolean = False ): TRect;
var
  TempR: TRect;
  C: TColor;
begin
  Result := Bounds;

  { Outer Border }
  if BorderOuter in [ fsFlat, fsFlatBold, fsFlatRounded ] then
  begin
    C := AdjustColor( FlatColor, FlatColorAdjustment );
    if BorderOuter = fsFlat then
      Result := DrawBevel( Canvas, Result, C, C, 1, BorderSides )
    else if BorderOuter = fsFlatBold then
      Result := DrawBevel( Canvas, Result, C, C, 2, BorderSides )
    else
    begin
      if not Transparent then
      begin
        TempR := DrawBevel( Canvas, Result, ParentColor, ParentColor, 1, BorderSides );
        if ( BorderWidth > 0 ) or ( BorderInner <> fsNone ) then
          DrawBevel( Canvas, TempR, BorderColor, BorderColor, 1, BorderSides )
        else
          DrawBevel( Canvas, TempR, Color, Color, 1, BorderSides );
      end
      else // Transparent
      begin
        if ( BorderWidth > 0 ) or ( BorderInner <> fsNone ) then
        begin
          TempR := Result;
          InflateRect( TempR, -1, -1 );
          DrawBevel( Canvas, TempR, BorderColor, BorderColor, 1, BorderSides );
        end;
      end;
      Result := DrawRoundedFlatBorder( Canvas, Result, C, BorderSides );
    end;
  end
  else if BorderOuter = fsPopup then
    Result := DrawBevel( Canvas, Result, BorderHighlight, BorderShadow, BevelWidth, BorderSides )
  else if BorderOuter = fsStatus then
    Result := DrawBevel( Canvas, Result, BorderShadow, BorderHighlight, BevelWidth, BorderSides )
  else
    Result := DrawBorderSides( Canvas, Result, BorderOuter, BorderSides );

  { Space between borders }
  if BorderWidth > 0 then
    Result := DrawBevel( Canvas, Result, BorderColor, BorderColor, BorderWidth, BorderSides );

  { Inner Border }
  if BorderInner in [ fsFlat, fsFlatBold, fsFlatRounded ] then
  begin
    C := AdjustColor( FlatColor, FlatColorAdjustment );
    if BorderInner = fsFlat then
    begin
      if not SoftInnerFlatBorder then
        Result := DrawBevel( Canvas, Result, C, C, 1, BorderSides )
      else
      begin
        Canvas.Pen.Color := C;
        // Left side
        Canvas.MoveTo( Result.Left, Result.Top + 1 );
        Canvas.LineTo( Result.Left, Result.Bottom - 1 );
        // Top side
        Canvas.MoveTo( Result.Left + 1, Result.Top );
        Canvas.LineTo( Result.Right - 1, Result.Top );
        // Right side
        Canvas.MoveTo( Result.Right - 1, Result.Top + 1 );
        Canvas.LineTo( Result.Right - 1, Result.Bottom - 1 );
        // Bottom side
        Canvas.MoveTo( Result.Left + 1, Result.Bottom - 1 );
        Canvas.LineTo( Result.Right - 1, Result.Bottom - 1 );

        InflateRect( Result, -1, -1 );
      end;
    end
    else if BorderInner = fsFlatBold then
      Result := DrawBevel( Canvas, Result, C, C, 2, BorderSides )
    else
    begin
      if not Transparent then
      begin
        TempR := DrawBevel( Canvas, Result, BorderColor, BorderColor, 1, BorderSides );
        DrawBevel( Canvas, TempR, Color, Color, 1, BorderSides );
      end
      else // Transparent
        DrawBevel( Canvas, Result, BorderColor, BorderColor, 1, BorderSides );
      Result := DrawRoundedFlatBorder( Canvas, Result, C, BorderSides );
    end;
  end
  else if BorderInner = fsPopup then
    Result := DrawBevel( Canvas, Result, BorderHighlight, BorderShadow, BevelWidth, BorderSides )
  else if BorderInner = fsStatus then
    Result := DrawBevel( Canvas, Result, BorderShadow, BorderHighlight, BevelWidth, BorderSides )
  else
    Result := DrawBorderSides( Canvas, Result, BorderInner, BorderSides );

end; {= DrawInnerOuterBorders =}


procedure DrawGroupBarBackground( Canvas: TCanvas; Bounds: TRect; ThemeAware: Boolean;
                                  GradientPath: TRzGroupBarGradientPath; Color: TColor; ColorAdjustment: Integer );
var
  ElementDetails: TThemedElementDetails;
begin
  if ThemeAware and ThemeServices.ThemesEnabled then
  begin
    ElementDetails := ThemeServices.GetElementDetails( tebExplorerBarRoot );
    ThemeServices.DrawElement( Canvas.Handle, ElementDetails, Bounds );
  end
  else if FullColorSupport then // No Themes
  begin
    if GradientPath = gpTopToBottom then
    begin
      if ColorAdjustment > 0 then
      begin
        Dec( Bounds.Bottom, ( Bounds.Bottom - Bounds.Top ) div 3 ); // Start Gradient a 1/3 up from bottom
        PaintGradient( Canvas, Bounds, gdHorizontalEnd, LighterColor( Color, ColorAdjustment ), Color );
      end
      else if ColorAdjustment < 0 then
      begin
        Inc( Bounds.Top, ( Bounds.Bottom - Bounds.Top ) div 3 ); // Start Gradient a 1/3 down from top
        PaintGradient( Canvas, Bounds, gdHorizontalEnd, Color, DarkerColor( Color, -ColorAdjustment ) );
      end;
    end
    else if GradientPath = gpBottomToTop then
    begin
      if ColorAdjustment > 0 then
      begin
        Inc( Bounds.Top, ( Bounds.Bottom - Bounds.Top ) div 3 ); // Start Gradient a 1/3 down from top
        PaintGradient( Canvas, Bounds, gdHorizontalEnd, Color, LighterColor( Color, ColorAdjustment ) );
      end
      else if ColorAdjustment < 0 then
      begin
        Dec( Bounds.Bottom, ( Bounds.Bottom - Bounds.Top ) div 3 ); // Start Gradient a 1/3 up from bottom
        PaintGradient( Canvas, Bounds, gdHorizontalEnd, DarkerColor( Color, -ColorAdjustment ), Color );
      end;
    end;
  end;

end; {= FillGroupBar =}


{==================================}
{== Generic DrawLEDBar Procedure ==}
{==================================}

procedure DrawLEDBar( Canvas: TCanvas; Bounds: TRect; Orientation: TOrientation; BarColor, BackColor: TColor;
                      NumSegments: Integer; Percent: Integer; ThemeAware: Boolean = True );
var
  X, I, W, D, M, BoxWidth: Integer;
  BoxRct, ThemeRect, VertRect: TRect;
  Offset: Integer;
  SegmentsOn: Integer;
  ElementDetails: TThemedElementDetails;
  Bmp: TBitmap;
begin
  if ThemeAware and ThemeServices.ThemesEnabled then
  begin
    if Orientation = orHorizontal then
      ElementDetails := ThemeServices.GetElementDetails( tpChunk )
    else
      ElementDetails := ThemeServices.GetElementDetails( tpChunkVert );

    ThemeRect := Bounds;
    InflateRect( ThemeRect, -1, -1 );

    { Calculate the Size of the Left/Bottom portion of the Percentage Bar }

    if Orientation = orHorizontal then
    begin
      ThemeRect.Right := ThemeRect.Left + Round( ( Longint( ThemeRect.Right - ThemeRect.Left ) * Percent ) / 100 );
      ThemeServices.DrawElement( Canvas.Handle, ElementDetails, ThemeRect );
    end
    else
    begin
      ThemeRect.Top := ThemeRect.Bottom - Round( ( Longint( ThemeRect.Bottom - ThemeRect.Top ) * Percent ) / 100 );
      VertRect := ThemeRect;

      OffsetRect( ThemeRect, -ThemeRect.Left + Bounds.Left, -ThemeRect.Top + Bounds.Top  );
      if ThemeRect.Top = ThemeRect.Bottom then
        Inc( ThemeRect.Bottom );

      Bmp := TBitmap.Create;
      try
        Bmp.Width := ThemeRect.Right - ThemeRect.Left;
        Bmp.Height := ThemeRect.Bottom - ThemeRect.Top;

        ThemeServices.DrawElement( Bmp.Canvas.Handle, ElementDetails, ThemeRect );
        FlipBitmap( Bmp );
        Canvas.Draw( ThemeRect.Left, VertRect.Top, Bmp );
      finally
        Bmp.Free;
      end;
    end;
  end
  else // No Themes
  begin
    if Orientation = orHorizontal then
      W := Bounds.Right - Bounds.Left
    else
      W := Bounds.Bottom - Bounds.Top;

    BoxWidth := W div NumSegments;

    if ( W <= 80 ) and ( NumSegments > 10 ) then
    begin
      NumSegments := 10;
      BoxWidth := W div NumSegments;
    end;

    D := W - ( NumSegments * BoxWidth );
    if BoxWidth <> 0 then
      M := D div BoxWidth
    else
      M := 0;
    if M > 0 then
      Inc( NumSegments, M );

    Offset := ( W - ( NumSegments * BoxWidth ) ) div 2;

    { Erase Sides of LED }
    Canvas.Pen.Style := psClear;
    Canvas.Brush.Color := BackColor;
    if Orientation = orHorizontal then
    begin
      Canvas.Rectangle( Bounds.Left - 1, Bounds.Top, Bounds.Left + Offset + 1, Bounds.Bottom + 1 );
      Canvas.Rectangle( Bounds.Right - Offset - 1, Bounds.Top, Bounds.Right + 1, Bounds.Bottom + 1 );
    end
    else
    begin
      Canvas.Rectangle( Bounds.Left, Bounds.Top, Bounds.Right + 1, Bounds.Top + Offset + 1 );
      Canvas.Rectangle( Bounds.Left, Bounds.Bottom - Offset - 1, Bounds.Right + 1, Bounds.Bottom + 1 );
    end;

    Canvas.Pen.Color := BackColor;
    Canvas.Pen.Style := psSolid;
    Canvas.Brush.Color := BarColor;

    SegmentsOn := Trunc( Percent * NumSegments / 100 );
    for I := 1 to SegmentsOn do
    begin
      if Orientation = orHorizontal then
      begin
        X := ( I - 1 ) * BoxWidth + Offset;
        BoxRct := Rect( Bounds.Left + X, Bounds.Top,
                        Bounds.Left + X + BoxWidth, Bounds.Bottom );
      end
      else
      begin
        X := ( NumSegments - I  ) * BoxWidth + Offset;
        BoxRct := Rect( Bounds.Left, Bounds.Top + X,
                        Bounds.Right, Bounds.Top + X + BoxWidth );
      end;

      Canvas.Rectangle( BoxRct );
    end;

    Canvas.Brush.Color := BackColor;

    for I := SegmentsOn + 1 to NumSegments do
    begin
      if Orientation = orHorizontal then
      begin
        X := ( I - 1 ) * BoxWidth + Offset;
        BoxRct := Rect( Bounds.Left + X, Bounds.Top,
                        Bounds.Left + X + BoxWidth, Bounds.Bottom );
      end
      else
      begin
        X := ( NumSegments - I  ) * BoxWidth + Offset;
        BoxRct := Rect( Bounds.Left, Bounds.Top + X,
                        Bounds.Right, Bounds.Top + X + BoxWidth );
      end;

      Canvas.Rectangle( BoxRct );
    end;
  end;
end; {= DrawLEDBar =}


{======================================}
{== Generic DrawPercentBar Procedure ==}
{======================================}

procedure DrawPercentBar( Canvas: TCanvas; Bounds: TRect; Orientation: TOrientation; BarColor, BackColor: TColor;
                          Percent: Word; ShowPercent: Boolean );
var
  PercentStr: string;
  PctRct: TRect;
  TopOffset: Integer;
begin
  if ShowPercent then
    PercentStr := Format( '%u%%', [ Percent ] )
  else
    PercentStr := '';

  Canvas.Font.Color := BackColor;
  Canvas.Brush.Color := BarColor;

  { Calculate the Size of the Left/Bottom portion of the Percentage Bar }

  if Percent >= 100 then
    PctRct := Rect( Bounds.Left, Bounds.Top, Bounds.Right, Bounds.Bottom )
  else if Orientation = orVertical then
  begin
    PctRct := Rect( Bounds.Left, Bounds.Bottom - Round( ( Longint( Bounds.Bottom - Bounds.Top ) * Percent ) / 100 ),
                    Bounds.Right, Bounds.Bottom );
  end
  else
  begin
    PctRct := Rect( Bounds.Left, Bounds.Top,
                    Bounds.Left + Round( ( Longint( Bounds.Right - Bounds.Left ) * Percent ) / 100 ), Bounds.Bottom );
  end;

  { Display the Left/Bottom portion of the Percentage Bar }

  SetTextAlign( Canvas.Handle, ta_Center or ta_Top );
  TopOffset := ( Bounds.Bottom - Bounds.Top - Canvas.TextHeight( 'X' ) ) div 2;
  Canvas.TextRect( PctRct,  Bounds.Right div 2, Bounds.Top + TopOffset, PercentStr );

  { Calculate the Size of the Right/Top portion of the Percentage Bar }

  if Orientation = orVertical then
  begin
    PctRct.Bottom := PctRct.Top;
    PctRct.Top := Bounds.Top;
  end
  else
  begin
    PctRct.Left := PctRct.Right;
    PctRct.Right := Bounds.Right;
  end;

  { Display the Right/Top portion of the Percentage Bar }
  Canvas.Font.Color := BarColor;
  Canvas.Brush.Color := BackColor;
  Canvas.TextRect( PctRct,  Bounds.Right div 2, Bounds.Top + TopOffset, PercentStr );
end; {= DrawPercentBar =}


procedure DrawFrame( Canvas: TCanvas; Width, Height: Integer; FrameStyle: TFrameStyle; EraseColor, FrameColor: TColor;
                     FrameSides: TSides; Transparent: Boolean = False );
var
  R: TRect;
begin
  R := Rect( 0, 0, Width, Height );
  if not Transparent then
    DrawBevel( Canvas, R, EraseColor, EraseColor, 2, sdAllSides );

  if FrameStyle = fsFlat then
    DrawSides( Canvas, R, FrameColor, FrameColor, FrameSides )
  else if FrameStyle = fsFlatBold then
    DrawBevel( Canvas, R, FrameColor, FrameColor, 2, FrameSides )
  else
  begin
    if EraseColor = clWindow then
      DrawBorderSides( Canvas, R, FrameStyle, FrameSides )
    else
      DrawColorBorderSides( Canvas, R, EraseColor, FrameStyle, FrameSides );
  end;
end;


procedure DrawDropDownArrow( Canvas: TCanvas; Bounds: TRect; UIStyle: TRzUIStyle; Down: Boolean;
                             Enabled: Boolean = True );
var
  X, Y: Integer;
  C, OldBrushColor: TColor;
  ElementDetails: TThemedElementDetails;
  R: TRect;
  TempBmp: TBitmap;
begin
  OldBrushColor := Canvas.Brush.Color;
  if Enabled then
  begin
    if UIStyle = uiWindowsXP then
    begin
      ElementDetails := ThemeServices.GetElementDetails( tcDropDownButtonNormal );
      TempBmp := TBitmap.Create;
      try
        R := Rect( 0, 0, 16, 20 );
        TempBmp.Width := 17;
        TempBmp.Height := 21;
        ThemeServices.DrawElement( TempBmp.Canvas.Handle, ElementDetails, R );
        C := TempBmp.Canvas.Pixels[ 8, 10 ];
        if ColorsTooClose( C, clWindow ) then
          C := cl3DDkShadow; // This is needed for Olive Windows XP color scheme
      finally
        TempBmp.Free;
      end;
      Canvas.Brush.Color := C;
    end
    else
      Canvas.Brush.Color := clBlack;
  end
  else
    Canvas.Brush.Color := clBtnShadow;
  Canvas.Pen.Style := psClear;
  X := Bounds.Left + ( Bounds.Right - Bounds.Left ) div 2;
  Y := Bounds.Top + ( Bounds.Bottom - Bounds.Top ) div 2;
  if ( Bounds.Bottom - Bounds.Top ) mod 2 = 0 then
    Dec( Y );
  if UIStyle = uiWindowsXP then
    Inc( Y, 4 )
  else
    Inc( Y, 2 );
  if Down then
  begin
    Inc( X );
    Inc( Y );
  end;
  if UIStyle = uiWindowsXP then
    Canvas.Polygon( [ Point( X, Y ), Point( X - 4, Y - 5 ), Point( X - 3, Y - 7 ), Point( X, Y - 3 ), Point( X + 3, Y - 7 ), Point( X + 5, Y - 5 ) ] )
  else
    Canvas.Polygon( [ Point( X, Y ), Point( X - 3, Y - 4 ), Point( X + 4, Y - 4 ) ] );
  Canvas.Pen.Style := psSolid;
  Canvas.Brush.Color := OldBrushColor;
end; {= DrawDropDownArrow =}


procedure DrawSpinArrow( Canvas: TCanvas; Bounds: TRect; UIStyle: TRzUIStyle; Direction: TDirection; Down: Boolean;
                         Enabled: Boolean = True );
var
  X, Y: Integer;
  C, OldBrushColor: TColor;
  ElementDetails: TThemedElementDetails;
  R: TRect;
  TempBmp: TBitmap;
begin
  OldBrushColor := Canvas.Brush.Color;
  if Enabled then
  begin
    if UIStyle = uiWindowsXP then
    begin
      ElementDetails := ThemeServices.GetElementDetails( tcDropDownButtonNormal );
      TempBmp := TBitmap.Create;
      try
        R := Rect( 0, 0, 16, 20 );
        TempBmp.Width := 17;
        TempBmp.Height := 21;
        ThemeServices.DrawElement( TempBmp.Canvas.Handle, ElementDetails, R );
        C := TempBmp.Canvas.Pixels[ 8, 10 ];
        if ColorsTooClose( C, clWindow ) then
          C := cl3DDkShadow; // This is needed for Olive Windows XP color scheme
      finally
        TempBmp.Free;
      end;
      Canvas.Brush.Color := C;
    end
    else
      Canvas.Brush.Color := clBlack;
  end
  else
    Canvas.Brush.Color := clBtnShadow;
  Canvas.Pen.Style := psClear;
  X := Bounds.Left + ( Bounds.Right - Bounds.Left ) div 2;
  Y := Bounds.Top + ( Bounds.Bottom - Bounds.Top ) div 2;
  if ( Bounds.Bottom - Bounds.Top ) mod 2 = 0 then
    Dec( Y );

  if UIStyle = uiWindowsXP then
  begin
    case Direction of
      dirLeft:   Dec( X, 1 );
      dirUp:     Inc( Y, 4 );
      dirRight:  Dec( X, 3 );
      dirDown:   Inc( Y, 2 );
    end;
  end
  else
  begin
    case Direction of
      dirLeft, dirRight:
        Dec( X, 2 );
      dirUp, dirDown:
        Inc( Y, 2 );
    end;
  end;
  if Down and Enabled then
  begin
    Inc( X );
    Inc( Y );
  end;

  if UIStyle = uiWindowsXP then
  begin
    case Direction of
      dirLeft:
        Canvas.Polygon( [ Point( X, Y ), Point( X + 4, Y - 4 ), Point( X + 4, Y - 1 ), Point( X + 3, Y ),
                          Point( X + 4, Y + 1 ), Point( X + 4, Y + 4 ) ] );
      dirUp:
        Canvas.Polygon( [ Point( X, Y - 5 ), Point( X + 4, Y ), Point( X + 1, Y ), Point( X, Y - 2 ), Point( X - 1, Y ),
                          Point( X - 4, Y ) ] );
      dirRight:
        Canvas.Polygon( [ Point( X + 4, Y ), Point( X, Y + 4 ), Point( X, Y + 1 ), Point( X + 1, Y ), Point( X, Y - 1 ),
                          Point( X, Y - 4 ) ] );
      dirDown:
        Canvas.Polygon( [ Point( X, Y ), Point( X - 3, Y - 4 ), Point( X, Y - 4 ), Point( X, Y - 3 ),
                          Point( X + 1, Y - 4 ), Point( X + 4, Y - 4 ) ] );
    end;
  end
  else
  begin
    case Direction of
      dirLeft:
        Canvas.Polygon( [ Point( X, Y ), Point( X + 4, Y - 4 ), Point( X + 4, Y + 4 ) ] );
      dirUp:
        Canvas.Polygon( [ Point( X, Y - 5 ), Point( X + 4, Y ), Point( X - 4, Y ) ] );
      dirRight:
        Canvas.Polygon( [ Point( X + 4, Y ), Point( X, Y + 4 ), Point( X, Y - 4 ) ] );
      dirDown:
        Canvas.Polygon( [ Point( X, Y + 1 ), Point( X - 3, Y - 3 ), Point( X + 4, Y - 3 ) ] );
    end;
  end;

  Canvas.Pen.Style := psSolid;
  Canvas.Brush.Color := OldBrushColor;
end; {= DrawSpinArrow =}


procedure AddImageToImageList( ImageList: TCustomImageList; Glyph: TBitmap; AddDisabled: Boolean;
                               var ImageIndex, DisabledIndex: Integer );
var
  B: TBitmap;
  R: TRect;
begin
  ImageIndex := -1;
  DisabledIndex := -1;
  
  if ( ImageList <> nil ) and ( Glyph <> nil ) then
  begin
    if Glyph.Width = Glyph.Height then
    begin
      // Easy case -- Only one glyph in bitmap (i.e. no disabled glyph)
      ImageList.AddMasked( Glyph, Glyph.Canvas.Pixels[ 0, 15 ] );
      ImageIndex := ImageList.Count - 1;
    end
    else
    begin
      // Assume Glyph has both a normal image and a disabled image
      if AddDisabled then
      begin
        ImageList.AddMasked( Glyph, Glyph.Canvas.Pixels[ 0, 15 ] );
        DisabledIndex := ImageList.Count - 1;
        ImageIndex := ImageList.Count - 2;
      end
      else
      begin
        // Extract out the normal image from Glyph
        B := TBitmap.Create;
        try
          B.Width := ImageList.Width;
          B.Height := ImageList.Height;
          R := Rect( 0, 0, B.Width, B.Height );
          B.Canvas.CopyRect( R, Glyph.Canvas, R );
          ImageList.AddMasked( B, B.Canvas.Pixels[ 0, 15 ] );
          ImageIndex := ImageList.Count - 1;
        finally
          B.Free;
        end;
      end;
    end;
  end;
end;


{===============================================================================
  GetNewComponentName

  Description
    This function scans generates a new component name based on the BaseName
    and an index. If the component name is already used, the index is
    incremented until a unique name is generated.
===============================================================================}

function GetNewComponentName( AOwner: TComponent; const BaseName: string; TryNoIndex: Boolean = True ): string;
var
  I: Integer;
begin
  Result := BaseName;
  if TryNoIndex then
  begin
    if AOwner.FindComponent( Result ) = nil then
      Exit;
  end;

  I := 0;
  repeat
    Inc( I );
    Result := BaseName + IntToStr( I );
  until AOwner.FindComponent( Result ) = nil;
end; {= GetNewComponentName =}


function CreateValidIdent( const Ident, DefaultName: string ): string;
const
  Alpha = [ 'A'..'Z', 'a'..'z', '_' ];
  AlphaNumeric = Alpha + [ '0'..'9' ];
var
  I: Integer;
begin
  Result := '';
  if IsValidIdent( Ident ) then
    Result := Ident
  else if Ident = '' then
    Result := DefaultName
  else
  begin
    if Ident[ 1 ] in Alpha then
      Result := Result + Ident[ 1 ];

    for I := 2 to Length( Ident ) do
    begin
      if Ident[ I ] in AlphaNumeric then
        Result := Result + Ident[ I ];
    end;
    if Result = '' then
      Result := DefaultName;
  end;
end;


function RotateFont( Font: TFont; Angle: Integer ): HFont;
var
  LogFont: TLogFont;
begin
  FillChar( LogFont, SizeOf( LogFont ), #0 );
  with LogFont do
  begin
    lfHeight := Font.Height;
    lfWidth := 0;
    lfEscapement := Angle * 10;        { Escapement must be in 10th of degrees }
    lfOrientation := 0;
    if fsBold in Font.Style then
      lfWeight := fw_Bold
    else
      lfWeight := fw_Normal;
    lfItalic := Byte( fsItalic in Font.Style );
    lfUnderline := Byte( fsUnderline in Font.Style );
    lfStrikeOut := Byte( fsStrikeOut in Font.Style );
    lfCharSet := Default_CharSet;
    lfOutPrecision := Out_Default_Precis;
    lfClipPrecision := Clip_Default_Precis;
    lfQuality := Default_Quality;
    case Font.Pitch of
      fpVariable:
        lfPitchAndFamily := Variable_Pitch;

      fpFixed:
        lfPitchAndFamily := Fixed_Pitch;

      else
        lfPitchAndFamily := Default_Pitch;
    end;
    StrPCopy( lfFaceName, Font.Name );
  end; { with }
  Result := CreateFontIndirect( LogFont );
end; {= RotateFont =}


function IsTrueTypeFont( Font: TFont ): Boolean;
var
  DC: HDC;
  SaveFont: HFont;
  SysMetrics, Metrics: TTextMetric;
begin
  DC := GetDC( 0 );
  try
    GetTextMetrics( DC, SysMetrics );
    SaveFont := SelectObject( DC, Font.Handle );
    GetTextMetrics( DC, Metrics );
    SelectObject( DC, SaveFont );
  finally
    ReleaseDC( 0, DC );
  end;

  Result := ( Metrics.tmPitchAndFamily and tmpf_TrueType ) = tmpf_TrueType;
end;


function GetMinFontHeight( Font: TFont ): Integer;
var
  DC: HDC;
  SaveFont: HFont;
  SysMetrics, Metrics: TTextMetric;
begin
  DC := GetDC( 0 );
  try
    GetTextMetrics( DC, SysMetrics );
    SaveFont := SelectObject( DC, Font.Handle );
    GetTextMetrics( DC, Metrics );
    SelectObject( DC, SaveFont );
  finally
    ReleaseDC( 0, DC );
  end;

  Result := Metrics.tmHeight + 2;
end;


function GetAvgCharWidth( Font: TFont ): Integer;
var
  DC: HDC;
  SaveFont: HFont;
  Metrics: TTextMetric;
  S: TSize;
begin
  DC := GetDC( 0 );
  try
    SaveFont := SelectObject( DC, Font.Handle );

    GetTextMetrics( DC, Metrics );
    GetTextExtentPoint32( DC,'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz', 52, S );
    Result := Round( S.cx / 52 );

    SelectObject( DC, SaveFont );
  finally
    ReleaseDC( 0, DC );
  end;
end;


function LastChar( const S: string ): Char;
begin
  Result := S[ Length( S ) ];
end;


function CountChar( C: Char; const S: string ): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 1 to Length( S ) do
  begin
    if S[ I ] = C then
      Inc( Result );
  end;
end;


{===============================================================================
  function CopyEx

  This function is an enhanced version of the Copy function. Instead of
  specifying the number of characters to copy, the last character copied is
  determined by the Count instance of the C character in the string.

  For example,
    S := CopyEx( 'C:\Windows\System, 1, '\', 2 );

    S will be 'C:\Windows\'
===============================================================================}

function CopyEx( const S: string; Start: Integer; C: Char; Count: Integer ): string;
var
  I, J: Integer;
begin
  Result := S;
  J := 0;
  for I := Start to Length( S ) do
  begin
    if S[ I ] = C then
      Inc( J );

    if J = Count then
    begin
      Result := Copy( S, Start, I );
      Break;
    end;
  end;
end;


function RemoveChar( var S: string; C: Char ): Boolean;
var
  I: Integer;
begin
  I := Pos( C, S );
  Result := I > 0;
  if Result then
    Delete( S, I, 1 );
end;


function Min( A, B: Integer ): Integer;
begin
  if A < B then
    Result := A
  else
    Result := B;
end;


function Max( A, B: Integer ): Integer;
begin
  if A > B then
    Result := A
  else
    Result := B;
end;


procedure Swap( var A, B: Integer );
var
  T: Integer;
begin
  T := A;
  A := B;
  B := T;
end;

procedure Swap( var A, B: Word );
var
  T: Word;
begin
  T := A;
  A := B;
  B := T;
end;


procedure UpdateObjectInspector( AControl: TControl );
begin
  if ( csDesigning in AControl.ComponentState ) and
     not ( csLoading in AControl.ComponentState ) and
     not ( csReading in AControl.ComponentState ) and
     not ( csUpdating in AControl.ComponentState ) and
     not ( csFixups in AControl.ComponentState ) and
     not ( csWriting in AControl.ComponentState ) and
     not ( csDestroying in AControl.ComponentState ) and
     ( GetParentForm( AControl ) <> nil ) and
     ( GetParentForm( AControl ).Designer <> nil ) then
  begin
    GetParentForm( AControl ).Designer.Modified;
  end;
end;


function RunningUnder( Ver: TRzWindowsVersion ): Boolean;
begin
  Result := False;
  case Ver of
    Win95:
      Result := ( Win32Platform = VER_PLATFORM_WIN32_WINDOWS ) and
                ( Win32MajorVersion <= 4 ) and ( Win32MinorVersion = 0 );

    WinNT:
      Result := ( Win32Platform = VER_PLATFORM_WIN32_NT ) and
                ( Win32MajorVersion <= 4 );

    Win98:
      Result := ( Win32Platform = VER_PLATFORM_WIN32_WINDOWS ) and
                ( Win32MajorVersion <= 4 ) and ( Win32MinorVersion = 10 );

    WinMe:
      Result := ( Win32Platform = VER_PLATFORM_WIN32_WINDOWS ) and
                ( Win32MajorVersion <= 4 ) and ( Win32MinorVersion = 90 );

    Win2000:
      Result := ( Win32Platform = VER_PLATFORM_WIN32_NT ) and
                ( Win32MajorVersion = 5 ) and ( Win32MinorVersion = 0 );

    WinXP:
      Result := ( Win32Platform = VER_PLATFORM_WIN32_NT ) and
                ( Win32MajorVersion = 5 ) and ( Win32MinorVersion = 1 );

    WinServer2003:
      Result := ( Win32Platform = VER_PLATFORM_WIN32_NT ) and
                ( Win32MajorVersion = 5 ) and ( Win32MinorVersion = 2 );
  end;

end;



{==============================}
{== TRzOldPropReader Methods ==}
{==============================}


class procedure TRzOldPropReader.ReadOldBooleanProp( Reader: TReader );
begin
  Reader.ReadBoolean;
end;


class procedure TRzOldPropReader.ReadOldEnumProp( Reader: TReader );
begin
  Reader.ReadIdent;
end;


class procedure TRzOldPropReader.ReadOldIdentProp( Reader: TReader );
begin
  Reader.ReadIdent;
end;


class procedure TRzOldPropReader.ReadOldIntegerProp( Reader: TReader );
begin
  Reader.ReadInteger;
end;


class procedure TRzOldPropReader.ReadOldSetProp( Reader: TReader );
begin
  Reader.ReadValue;
  while True do
  begin
    if Reader.ReadStr = '' then
      Break;
  end;
end;


class procedure TRzOldPropReader.ReadOldStringProp( Reader: TReader );
begin
  Reader.ReadString;
end;


class procedure TRzOldPropReader.WriteOldProp( Writer: TWriter );
begin
end;



function GetDesktopClientRect: TRect;
var
  TW, TH: Integer;
  TaskBarWnd: HWnd;
  TaskBarRect: TRect;
begin
  GetWindowRect( GetDesktopWindow, Result );

  TaskBarRect := Rect( 0, 0, 0, 0 );
  TaskBarWnd := FindWindow( 'Shell_TrayWnd', '' );
  if TaskBarWnd <> 0 then
  begin
    GetWindowRect( TaskBarWnd, TaskBarRect );
    IntersectRect( TaskBarRect, TaskBarRect, Result );

    TW := TaskBarRect.Right - TaskBarRect.Left;
    TH := TaskBarRect.Bottom - TaskBarRect.Top;
    if ( Result.Left = TaskBarRect.Left ) and ( Result.Top = TaskBarRect.Top ) then
    begin
      if Result.Right = TaskBarRect.Right then
        Inc( Result.Top, TH )
      else
        Inc( Result.Left, TW );
    end
    else if Result.Left = TaskBarRect.Left then
      Dec( Result.Bottom, TH )
    else
      Dec( Result.Right, TW );
  end;
end;


function GetActiveWorkArea( Window: TWinControl ): TRect;
var
  HM: HMonitor;
  MonInfo: TMonitorInfo;
begin
  HM := MonitorFromWindow( Window.Handle, MONITOR_DEFAULTTONEAREST );

  MonInfo.cbSize := SizeOf( MonInfo );
  GetMonitorInfo( HM, @MonInfo );
  Result := MonInfo.rcWork;
end;


function GetActiveWorkAreaWidth( Window: TWinControl ): Integer;
var
  R: TRect;
begin
  R := GetActiveWorkArea( Window );
  Result := R.Right - R.Left;
end;


function GetActiveWorkAreaHeight( Window: TWinControl ): Integer;
var
  R: TRect;
begin
  R := GetActiveWorkArea( Window );
  Result := R.Bottom - R.Top;
end;


function GetMonitorWorkArea( Monitor: TMonitor ): TRect;
var
  MonInfo: TMonitorInfo;
begin
  MonInfo.cbSize := SizeOf( MonInfo );
  GetMonitorInfo( Monitor.Handle, @MonInfo );
  Result := MonInfo.rcWork;
end;


function GetMonitorBoundsRect( Monitor: TMonitor ): TRect;
var
  MonInfo: TMonitorInfo;
begin
  MonInfo.cbSize := SizeOf( MonInfo );
  GetMonitorInfo( Monitor.Handle, @MonInfo );
  Result := MonInfo.rcMonitor;
end;


procedure CenterToWindow( ChildWin, Window: TWinControl; var Left, Top: Integer );
var
  R: TRect;
  WorkArea: TRect;
begin
  R.TopLeft := Window.ClientToScreen( Window.BoundsRect.TopLeft );
  R.BottomRight := Window.ClientToScreen( Window.BoundsRect.BottomRight );

  WorkArea := GetActiveWorkArea( Window );

  Left := R.Left + ( R.Right - R.Left - ChildWin.Width ) div 2;
  if Left < 0 then
    Left := 0;
  if Left + ChildWin.Width > WorkArea.Right then
    Left := WorkArea.Right - ChildWin.Width;

  Top := R.Top + ( R.Bottom - R.Top - ChildWin.Height ) div 2;
  if Top < 0 then
    Top := 0;
  if Top + ChildWin.Height > WorkArea.Bottom then
    Top := WorkArea.Bottom - ChildWin.Height;
end;



procedure CenterToForm( ChildWin: TWinControl; AForm: TCustomForm; var Left, Top: Integer );
var
  WorkArea: TRect;
  R: TRect;
begin
  R := AForm.BoundsRect;

  WorkArea := GetActiveWorkArea( AForm );
  Left := R.Left + ( R.Right - R.Left - ChildWin.Width ) div 2;
  if Left < 0 then
    Left := 0;
  if Left + ChildWin.Width > WorkArea.Right then
    Left := WorkArea.Right - ChildWin.Width;

  Top := R.Top + ( R.Bottom - R.Top - ChildWin.Height ) div 2;
  if Top < 0 then
    Top := 0;
  if Top + ChildWin.Height > WorkArea.Bottom then
    Top := WorkArea.Bottom - ChildWin.Height;
end;


procedure CenterToMDIChild( ChildWin: TWinControl; AForm: TForm; var Left, Top: Integer );
var
  DeskRect: TRect;
  R: TRect;
  P: TPoint;
begin
  P := AForm.BoundsRect.TopLeft;
  ClientToScreen( Application.MainForm.ClientHandle, P );
  R.TopLeft := P;

  P := AForm.BoundsRect.BottomRight;
  ClientToScreen( Application.MainForm.ClientHandle, P );
  R.BottomRight := P;

  DeskRect := GetDesktopClientRect;
  Left := R.Left + ( R.Right - R.Left - ChildWin.Width ) div 2;
  if Left < 0 then
    Left := 0;
  if Left + ChildWin.Width > DeskRect.Right then
    Left := DeskRect.Right - ChildWin.Width;

  Top := R.Top + ( R.Bottom - R.Top - ChildWin.Height ) div 2;
  if Top < 0 then
    Top := 0;
  if Top + ChildWin.Height > DeskRect.Bottom then
    Top := DeskRect.Bottom - ChildWin.Height;
end;

{================================}
{== TRzDialogComponent Methods ==}
{================================}

constructor TRzDialogComponent.Create( AOwner: TComponent );
begin
  inherited;

  FFont := TFont.Create;
  if Owner is TForm then                               { If Owner is a form... }
    FFont.Assign( TForm( Owner ).Font )       { Use the form's font by default }
  else
  begin
    FFont := TFont.Create;
    FFont.Name := 'MS Sans Serif';
    FFont.Size := 8;
    FFont.Style := [];
  end;
  FOriginLeft := 100;
  FOriginTop := 100;
  FHeight := 300;
  FWidth := 350;
  FBorderStyle := bsSizeable;
  FHelpContext := 0;

  FCenterToParent := False;
  FPosition := poScreenCenter;

  FFrameColor := clBtnShadow;
  FFrameStyle := fsFlat;
  FFrameVisible := False;
  FFramingPreference := fpXPThemes;

  FCaptionOK := SOKButton;
  FCaptionCancel := SCancelButton;
  FCaptionHelp := SHelpButton;
end;


destructor TRzDialogComponent.Destroy;
begin
  FFont.Free;
  inherited;
end;


procedure TRzDialogComponent.SetFont( Value: TFont );
begin
  FFont.Assign( Value );
end;


procedure TRzDialogComponent.SetCenterToParent( Value: Boolean );
begin
  if FCenterToParent <> Value then
  begin
    FCenterToParent := Value;
    if FCenterToParent then
      FPosition := poOwnerFormCenter
    else
      FPosition := poScreenCenter;
  end;
end;


procedure TRzDialogComponent.CenterForm( Dlg: TForm );
begin
  Dlg.Position := FPosition;
end;


{================================}
{== TRzFrameController Methods ==}
{================================}

constructor TRzFrameController.Create( AOwner: TComponent );
begin
  inherited;

  FUpdateCount := 0;

  FColor := clWindow;
  FParentColor := False;
  FFlatButtonColor := clBtnFace;
  FFlatButtons := True;
  FDisabledColor := clBtnFace;
  FFocusColor := clWindow;
  FFrameColor := clBtnShadow;
  FFrameHotColor := clBtnShadow;
  FFrameHotTrack := False;
  FFrameHotStyle := fsFlatBold;
  FFrameSides := sdAllSides;
  FFrameStyle := fsFlat;
  FFrameVisible := False;
  FFramingPreference := fpXPThemes;
end;


procedure TRzFrameController.DefineProperties( Filer: TFiler );
begin
  inherited;
  // Handle the fact that the FrameFlat and FrameFocusStyle properties were renamed to
  // FrameHotStyle and FrameHotStyle respectively in version 3.
  Filer.DefineProperty( 'FrameFlat', ReadOldFrameFlatProp, nil, False );
  Filer.DefineProperty( 'FrameFocusStyle', ReadOldFrameFocusStyleProp, nil, False );

  // Handle the fact that the FrameFlatStyle was published in version 2.x
  Filer.DefineProperty( 'FrameFlatStyle', TRzOldPropReader.ReadOldEnumProp, nil, False );
end;


procedure TRzFrameController.ReadOldFrameFlatProp( Reader: TReader );
begin
  FFrameHotTrack := Reader.ReadBoolean;
  if FFrameHotTrack then
  begin
    // If the FrameFlat property is stored, then init the FrameHotStyle property and the FrameStyle property.
    // These may be overridden when the rest of the stream is read in. However, we need to re-init them here
    // because the default values of fsStatus and fsLowered have changed in RC3.
    FFrameStyle := fsStatus;
    FFrameHotStyle := fsLowered;
  end;
end;


procedure TRzFrameController.ReadOldFrameFocusStyleProp( Reader: TReader );
begin
  FFrameHotStyle := TFrameStyle( GetEnumValue( TypeInfo( TFrameStyle ), Reader.ReadIdent ) );
end;


procedure TRzFrameController.Loaded;
begin
  inherited;
  UpdateControls;
end;


destructor TRzFrameController.Destroy;
begin
  if FFrameList <> nil then
  begin
    FFrameList.Free;
    FFrameList := nil;
  end;

  inherited;
end;


procedure TRzFrameController.Assign( Source: TPersistent );
begin
  if Source is TRzFrameController then
  begin
    BeginUpdate;
    try
      FColor := TRzFrameController( Source ).Color;
      FDisabledColor := TRzFrameController( Source ).DisabledColor;
      FFlatButtonColor := TRzFrameController( Source ).FlatButtonColor;
      FFlatButtons := TRzFrameController( Source ).FlatButtons;
      FFocusColor := TRzFrameController( Source ).FocusColor;
      FFrameColor := TRzFrameController( Source ).FrameColor;
      FFrameHotColor := TRzFrameController( Source ).FrameHotColor;
      FFrameHotStyle := TRzFrameController( Source ).FrameHotStyle;
      FFrameHotTrack := TRzFrameController( Source ).FrameHotTrack;
      FFrameSides := TRzFrameController( Source ).FrameSides;
      FFrameStyle := TRzFrameController( Source ).FrameStyle;
      FFrameVisible := TRzFrameController( Source ).FrameVisible;
      FFramingPreference := TRzFrameController( Source ).FramingPreference;
      FParentColor := TRzFrameController( Source ).ParentColor;
    finally
      EndUpdate;
    end;
  end
  else
    inherited;
end;


procedure TRzFrameController.Notification( AComponent: TComponent; Operation: TOperation );
begin
  inherited;

  if ( Operation = opRemove ) and ( AComponent = FRegIniFile ) then
    FRegIniFile := nil;
end;


procedure TRzFrameController.AddControl( C: TComponent );
begin
  if not Assigned( FFrameList ) then
    FFrameList := TList.Create;

  if FFrameList.IndexOf( C ) < 0 then
  begin
    FFrameList.Add( C );
    UpdateControlFrame( C, fpAll );
  end;
end;


procedure TRzFrameController.RemoveControl( C: TComponent );
begin
  if FFrameList <> nil then
  begin
    FFrameList.Remove( C );
    if FFrameList.Count = 0 then
    begin
      FFrameList.Free;
      FFrameList := nil;
    end;
  end;
end;


procedure TRzFrameController.BeginUpdate;
begin
  Inc( FUpdateCount );
end;


procedure TRzFrameController.EndUpdate;
begin
  Dec( FUpdateCount );
  if FUpdateCount <= 0 then
  begin
    FUpdateCount := 0;
    UpdateFrames( fpAll );
  end;
end;


procedure TRzFrameController.UpdateControls;
begin
  UpdateFrames( fpAll );
end;


procedure TRzFrameController.UpdateControlFrame( C: TComponent; FrameProperty: TRzFrameProperty );
var
  Ref: IRzCustomFramingNotification;


  procedure SetBooleanProp( C: TComponent; const PropName: string; Value: Boolean );
  begin
    if C <> nil then
    begin
      if IsPublishedProp( C, PropName ) then
        SetOrdProp( C, PropName, Ord( Value ) );
    end;
  end;

  procedure SetStyleProp( C: TComponent; const PropName: string; Value: TFrameStyle );
  begin
    if C <> nil then
    begin
      if IsPublishedProp( C, PropName ) then
        SetOrdProp( C, PropName, Ord( Value ) );
    end;
  end;

  procedure SetPreferenceProp( C: TComponent; const PropName: string; Value: TFramingPreference );
  begin
    if C <> nil then
    begin
      if IsPublishedProp( C, PropName ) then
        SetOrdProp( C, PropName, Ord( Value ) );
    end;
  end;

  procedure SetColorProp( C: TComponent; const PropName: string; Value: TColor );
  begin
    if C <> nil then
    begin
      if IsPublishedProp( C, PropName ) then
        SetOrdProp( C, PropName, Value );
    end;
  end;

  procedure SetFrameSidesProp( C: TComponent );
  {$IFNDEF VCL60_OR_HIGHER}
  var
    Side: TSide;
    SidesSet: Cardinal;
    PropInfo: PPropInfo;
  {$ENDIF}
  begin
    if C <> nil then
    begin
      {$IFDEF VCL60_OR_HIGHER}

      if IsPublishedProp( C, 'FrameSides' ) then
        SetSetProp( C, 'FrameSides', GetSetProp( Self, 'FrameSides' ) );

      {$ELSE}

      PropInfo := GetPropInfo( PTypeInfo( C.ClassInfo), 'FrameSides' );
      if PropInfo <> nil then
      begin
        if GetTypeData( PropInfo^.PropType^ )^.CompType^.Kind <> tkEnumeration then
          Exit;

        SidesSet := 0;
        for Side := sdLeft to sdBottom do
        begin
          if Side in FFrameSides then
            SidesSet := SidesSet or ( 1 shl Ord( Side ) );
        end;

        SetOrdProp( C, PropInfo, SidesSet );
      end;

      {$ENDIF}
    end;
  end;

begin {= UpdateControlFrame =}
  if not ( C is TControl ) then
    Exit;

  {$IFDEF VCL60_OR_HIGHER}
  if Supports( C, IRzCustomFramingNotification ) then
  begin
    Ref := C as IRzCustomFramingNotification;
    Ref.CustomFramingChanged;
  end
  {$ELSE}
  if Supports( C, IRzCustomFramingNotification, Ref ) then
  begin
    Ref.CustomFramingChanged;
  end
  {$ENDIF}
  else // Use RTTI to update Custom Framing properties
  begin
    case FrameProperty of
      fpAll:
      begin
        SetBooleanProp( C, 'ParentColor', FParentColor );

        if not FParentColor then
          SetColorProp( C, 'Color', FColor );

        SetColorProp( C, 'DisabledColor', FDisabledColor );
        SetColorProp( C, 'FocusColor', FFocusColor );

        SetColorProp( C, 'FlatButtonColor', FFlatButtonColor );
        SetBooleanProp( C, 'FlatButtons', FFlatButtons );
        SetColorProp( C, 'FrameColor', FFrameColor );
        SetColorProp( C, 'FrameHotColor', FFrameHotColor );
        SetBooleanProp( C, 'FrameHotTrack', FFrameHotTrack );
        SetStyleProp( C, 'FrameHotStyle', FFrameHotStyle );
        SetFrameSidesProp( C );
        SetStyleProp( C, 'FrameStyle', FFrameStyle );
        SetBooleanProp( C, 'FrameVisible', FFrameVisible );
        SetPreferenceProp( C, 'FramingPreference', FFramingPreference );
      end;

      fpColor:
        SetColorProp( C, 'Color', FColor );

      fpFocusColor:
        SetColorProp( C, 'FocusColor', FFocusColor );

      fpDisabledColor:
        SetColorProp( C, 'DisabledColor', FDisabledColor );

      fpParentColor:
        SetBooleanProp( C, 'ParentColor', FParentColor );

      fpFlatButtonColor:
        SetColorProp( C, 'FlatButtonColor', FFlatButtonColor );

      fpFlatButtons:
        SetBooleanProp( C, 'FlatButtons', FFlatButtons );

      fpFrameColor:
        SetColorProp( C, 'FrameColor', FFrameColor );

      fpHotColor:
        SetColorProp( C, 'FrameHotColor', FFrameHotColor );

      fpHotTrack:
        SetBooleanProp( C, 'FrameHotTrack', FFrameHotTrack );

      fpHotStyle:
        SetStyleProp( C, 'FrameHotStyle', FFrameHotStyle );

      fpSides:
        SetFrameSidesProp( C );

      fpStyle:
        SetStyleProp( C, 'FrameStyle', FFrameStyle );

      fpVisible:
        SetBooleanProp( C, 'FrameVisible', FFrameVisible );

      fpPreference:
        SetPreferenceProp( C, 'FramingPreference', FFramingPreference );
    end;
  end;
end; {= TRzFrameController.UpdateControlFrame =}


procedure TRzFrameController.UpdateFrames( FrameProperty: TRzFrameProperty );
var
  I: Integer;
begin
  if FUpdateCount > 0 then
    Exit;

  if FFrameList <> nil then
  begin
    { For each component on the FFrameList ... }
    for I := 0 to FFrameList.Count - 1 do
    begin
      UpdateControlFrame( FFrameList[ I ], FrameProperty );
    end;
  end;
end;


procedure TRzFrameController.SetColor( Value: TColor );
begin
  if FColor <> Value then
  begin
    if FFocusColor = FColor then
      FFocusColor := Value;
    FColor := Value;
    FParentColor := False;
    UpdateFrames( fpColor );
  end;
end;


function TRzFrameController.IsColorStored: Boolean;
begin
  Result := not ParentColor;
end;


procedure TRzFrameController.SetParentColor( Value: Boolean );
begin
  if FParentColor <> Value then
  begin
    FParentColor := Value;
    UpdateFrames( fpParentColor );
    if not FParentColor then
      UpdateFrames( fpColor );
  end;
end;


procedure TRzFrameController.SetFlatButtonColor( Value: TColor );
begin
  if FFlatButtonColor <> Value then
  begin
    FFlatButtonColor := Value;
    UpdateFrames( fpFlatButtonColor );
  end;
end;


procedure TRzFrameController.SetFlatButtons( Value: Boolean );
begin
  if FFlatButtons <> Value then
  begin
    FFlatButtons := Value;
    UpdateFrames( fpFlatButtons );
  end;
end;


procedure TRzFrameController.SetDisabledColor( Value: TColor );
begin
  if FDisabledColor <> Value then
  begin
    FDisabledColor := Value;
    UpdateFrames( fpDisabledColor );
  end;
end;


procedure TRzFrameController.SetFocusColor( Value: TColor );
begin
  if FFocusColor <> Value then
  begin
    FFocusColor := Value;
    UpdateFrames( fpFocusColor );
  end;
end;


procedure TRzFrameController.SetFrameColor( Value: TColor );
begin
  if FFrameColor <> Value then
  begin
    FFrameColor := Value;
    UpdateFrames( fpFrameColor );
  end;
end;


procedure TRzFrameController.SetFrameHotColor( Value: TColor );
begin
  if FFrameHotColor <> Value then
  begin
    FFrameHotColor := Value;
    UpdateFrames( fpHotColor );
  end;
end;


procedure TRzFrameController.SetFrameHotTrack( Value: Boolean );
begin
  if FFrameHotTrack <> Value then
  begin
    FFrameHotTrack := Value;
    if FFrameHotTrack then
    begin
      FrameVisible := True;
      if not ( csLoading in ComponentState ) then
        FFrameSides := sdAllSides;
    end;
    UpdateFrames( fpHotTrack );
  end;
end;


procedure TRzFrameController.SetFrameHotStyle( Value: TFrameStyle );
begin
  if FFrameHotStyle <> Value then
  begin
    FFrameHotStyle := Value;
    UpdateFrames( fpHotStyle );
  end;
end;


procedure TRzFrameController.SetFrameSides( Value: TSides );
begin
  if FFrameSides <> Value then
  begin
    FFrameSides := Value;
    UpdateFrames( fpSides );
  end;
end;


procedure TRzFrameController.SetFrameStyle( Value: TFrameStyle );
begin
  if FFrameStyle <> Value then
  begin
    FFrameStyle := Value;
    UpdateFrames( fpStyle );
  end;
end;


procedure TRzFrameController.SetFrameVisible( Value: Boolean );
begin
  if FFrameVisible <> Value then
  begin
    FFrameVisible := Value;
    UpdateFrames( fpVisible );
  end;
end;


procedure TRzFrameController.SetFramingPreference( Value: TFramingPreference );
begin
  if FFramingPreference <> Value then
  begin
    FFramingPreference := Value;
    UpdateFrames( fpPreference );
  end;
end;


procedure TRzFrameController.Load( const Section: string );
begin
  if FRegIniFile = nil then
    raise ENoRegIniFile.Create( sRzCannotLoadCustomFraming );


  BeginUpdate;
  try
    FColor := FRegIniFile.ReadInteger( Section, 'Color', clWindow );
    FFlatButtonColor := FRegIniFile.ReadInteger( Section, 'FlatButtonColor', clBtnFace );
    FFlatButtons := FRegIniFile.ReadBool( Section, 'FlatButtons', True );
    FDisabledColor := FRegIniFile.ReadInteger( Section, 'DisabledColor', clWindow );
    FFocusColor := FRegIniFile.ReadInteger( Section, 'FocusColor', clWindow );
    FFrameColor := FRegIniFile.ReadInteger( Section, 'FrameColor', clBtnShadow );
    FFrameHotColor := FRegIniFile.ReadInteger( Section, 'FrameHotColor', clBtnShadow );
    FFrameHotStyle := TFrameStyle( FRegIniFile.ReadInteger( Section, 'FrameHotStyle', Ord( fsFlatBold ) ) );
    FFrameHotTrack := FRegIniFile.ReadBool( Section, 'FrameHotTrack', False );

    FFrameSides := [];
    if FRegIniFile.ReadBool( Section, 'FrameSides_Left', True ) then
      FFrameSides := FFrameSides + [ sdLeft ];
    if FRegIniFile.ReadBool( Section, 'FrameSides_Top', True ) then
      FFrameSides := FFrameSides + [ sdTop ];
    if FRegIniFile.ReadBool( Section, 'FrameSides_Right', True ) then
      FFrameSides := FFrameSides + [ sdRight ];
    if FRegIniFile.ReadBool( Section, 'FrameSides_Bottom', True ) then
      FFrameSides := FFrameSides + [ sdBottom ];

    FFrameStyle := TFrameStyle( FRegIniFile.ReadInteger( Section, 'FrameStyle', Ord( fsFlat ) ) );
    FFrameVisible := FRegIniFile.ReadBool( Section, 'FrameVisible', False );
    FFramingPreference := TFramingPreference( FRegIniFile.ReadInteger( Section, 'FramingPreference', Ord( fpXPThemes ) ) );

  finally
    EndUpdate;
  end;
end;


procedure TRzFrameController.Save( const Section: string );
begin
  if FRegIniFile = nil then
    raise ENoRegIniFile.Create( sRzCannotSaveCustomFraming );

  FRegIniFile.WriteInteger( Section, 'Color', FColor );
  FRegIniFile.WriteInteger( Section, 'FlatButtonColor', FFlatButtonColor );
  FRegIniFile.WriteBool( Section, 'FlatButtons', FFlatButtons );
  FRegIniFile.WriteInteger( Section, 'DisabledColor', FDisabledColor );
  FRegIniFile.WriteInteger( Section, 'FocusColor', FFocusColor );
  FRegIniFile.WriteInteger( Section, 'FrameColor', FFrameColor );
  FRegIniFile.WriteInteger( Section, 'FrameHotColor', FFrameHotColor );
  FRegIniFile.WriteInteger( Section, 'FrameHotStyle', Ord( FFrameHotStyle ) );
  FRegIniFile.WriteBool( Section, 'FrameHotTrack', FFrameHotTrack );

  FRegIniFile.WriteBool( Section, 'FrameSides_Left', sdLeft in FFrameSides );
  FRegIniFile.WriteBool( Section, 'FrameSides_Top', sdTop in FFrameSides );
  FRegIniFile.WriteBool( Section, 'FrameSides_Right', sdRight in FFrameSides );
  FRegIniFile.WriteBool( Section, 'FrameSides_Bottom', sdBottom in FFrameSides );

  FRegIniFile.WriteInteger( Section, 'FrameStyle', Ord( FFrameStyle ) );
  FRegIniFile.WriteBool( Section, 'FrameVisible', FFrameVisible );
  FRegIniFile.WriteInteger( Section, 'FramingPreference', Ord( FFramingPreference ) );
end;


procedure TRzFrameController.SetRegIniFile( Value: TRzRegIniFile );
begin
  if FRegIniFile <> Value then
  begin
    FRegIniFile := Value;
    if Value <> nil then
      Value.FreeNotification( Self );
  end;
end;



{===========================}
{== TRzRegIniFile Methods ==}
{===========================}

const
  HKEYS: array[ TRzRegKey ] of HKEY = ( HKEY_CLASSES_ROOT,
                                        HKEY_CURRENT_USER,
                                        HKEY_LOCAL_MACHINE,
                                        HKEY_USERS,
                                        HKEY_PERFORMANCE_DATA,
                                        HKEY_CURRENT_CONFIG,
                                        HKEY_DYN_DATA );

  KeyAccess: array[ TRzRegAccessKey ] of LongWord = ( KEY_QUERY_VALUE,
                                                      KEY_SET_VALUE,
                                                      KEY_CREATE_SUB_KEY,
                                                      KEY_ENUMERATE_SUB_KEYS,
                                                      KEY_NOTIFY,
                                                      KEY_CREATE_LINK,
                                                      KEY_READ,
                                                      KEY_WRITE,
                                                      KEY_EXECUTE,
                                                      KEY_ALL_ACCESS );

constructor TRzRegIniFile.Create( AOwner: TComponent );
begin
  inherited;

  FPathType := ptIniFile;
  FRegAccess := [ keyAllAccess ];
  FRegKey := hkeyCurrentUser;

  FRefreshStorage := True;
end;


destructor TRzRegIniFile.Destroy;
begin
  if FIni <> nil then
    FreeAndNil( FIni );
  if FReg <> nil then
    FreeAndNil( FReg );
  inherited;
end;


procedure TRzRegIniFile.CheckAccess;
var
  S: string;
  Access: LongWord;
  K: TRzRegAccessKey;
begin
  if FRefreshStorage then
  begin
    if FIni <> nil then
      FreeAndNil( FIni );
    if FReg <> nil then
      FreeAndNil( FReg );

    S := FPath;
    if FPathType = ptIniFile then
    begin
      if S = '' then
        S := ChangeFileExt( Application.ExeName, '.ini' );
      FIni := TIniFile.Create( S );
    end
    else // FPathType = ptRegistry
    begin
      if S = '' then
      begin
        if Application.Title <> '' then
          S := '\Software\Temp\' + Application.Title
        else
          S := '\Software\Temp\' + ChangeFileExt( ExtractFileName( Application.ExeName ), '' );
      end;

      Access := 0;
      for K := keyQueryValue to keyAllAccess do
      begin
        if K in FRegAccess then
          Access := Access or KeyAccess[ K ];
      end;
      FReg := TRegistryIniFile.Create( '', Access );
      FReg.RegIniFile.RootKey := HKEYS[ FRegKey ];
      FReg.RegIniFile.OpenKey( S, True );
    end;
  end;
  FRefreshStorage := False;
end;


function TRzRegIniFile.SectionExists( const Section: string ): Boolean;
begin
  CheckAccess;
  if FPathType = ptIniFile then
    Result := FIni.SectionExists( Section )
  else
    Result := FReg.SectionExists( Section );
end;


function TRzRegIniFile.ValueExists( const Section, Name: string ): Boolean;
begin
  CheckAccess;
  if FPathType = ptIniFile then
    Result := FIni.ValueExists( Section, Name )
  else
    Result := FReg.ValueExists( Section, Name );
end;


function TRzRegIniFile.ReadBool( const Section, Name: string; Default: Boolean ): Boolean;
begin
  CheckAccess;
  if FPathType = ptIniFile then
    Result := FIni.ReadBool( Section, Name, Default )
  else
    Result := FReg.ReadBool( Section, Name, Default );
end;


procedure TRzRegIniFile.WriteBool( const Section, Name: string; Value: Boolean );
begin
  CheckAccess;
  if FPathType = ptIniFile then
    FIni.WriteBool( Section, Name, Value )
  else
    FReg.WriteBool( Section, Name, Value );
end;


function TRzRegIniFile.ReadDate( const Section, Name: string; Default: TDateTime ): TDateTime;
begin
  CheckAccess;
  if FPathType = ptIniFile then
    Result := FIni.ReadDate( Section, Name, Default )
  else
    Result := FReg.ReadDate( Section, Name, Default );
end;


procedure TRzRegIniFile.WriteDate( const Section, Name: string; Value: TDateTime );
begin
  CheckAccess;
  if FPathType = ptIniFile then
    FIni.WriteDate( Section, Name, Value )
  else
    FReg.WriteDate( Section, Name, Value );
end;


function TRzRegIniFile.ReadDateTime( const Section, Name: string; Default: TDateTime ): TDateTime;
begin
  CheckAccess;
  if FPathType = ptIniFile then
    Result := FIni.ReadDateTime( Section, Name, Default )
  else
    Result := FReg.ReadDateTime( Section, Name, Default );
end;


procedure TRzRegIniFile.WriteDateTime( const Section, Name: string; Value: TDateTime );
begin
  CheckAccess;
  if FPathType = ptIniFile then
    FIni.WriteDateTime( Section, Name, Value )
  else
    FReg.WriteDateTime( Section, Name, Value );
end;


function TRzRegIniFile.ReadFloat( const Section, Name: string; Default: Double ): Double;
begin
  CheckAccess;
  if FPathType = ptIniFile then
    Result := FIni.ReadFloat( Section, Name, Default )
  else
    Result := FReg.ReadFloat( Section, Name, Default );
end;


procedure TRzRegIniFile.WriteFloat( const Section, Name: string; Value: Double );
begin
  CheckAccess;
  if FPathType = ptIniFile then
    FIni.WriteFloat( Section, Name, Value )
  else
    FReg.WriteFloat( Section, Name, Value );
end;


function TRzRegIniFile.ReadInteger( const Section, Name: string; Default: Longint ): Longint;
begin
  CheckAccess;
  if FPathType = ptIniFile then
    Result := FIni.ReadInteger( Section, Name, Default )
  else
    Result := FReg.ReadInteger( Section, Name, Default );
end;


procedure TRzRegIniFile.WriteInteger( const Section, Name: string; Value: Longint );
begin
  CheckAccess;
  if FPathType = ptIniFile then
    FIni.WriteInteger( Section, Name, Value )
  else
    FReg.WriteInteger( Section, Name, Value );
end;


function TRzRegIniFile.ReadString( const Section, Name, Default: string ): string;
begin
  CheckAccess;
  if FPathType = ptIniFile then
    Result := FIni.ReadString( Section, Name, Default )
  else
    Result := FReg.ReadString( Section, Name, Default );
end;


procedure TRzRegIniFile.WriteString( const Section, Name, Value: string );
begin
  CheckAccess;
  if FPathType = ptIniFile then
    FIni.WriteString( Section, Name, Value )
  else
    FReg.WriteString( Section, Name, Value );
end;


function TRzRegIniFile.ReadTime( const Section, Name: string; Default: TDateTime ): TDateTime;
begin
  CheckAccess;
  if FPathType = ptIniFile then
    Result := FIni.ReadTime( Section, Name, Default )
  else
    Result := FReg.ReadTime( Section, Name, Default );
end;


procedure TRzRegIniFile.WriteTime( const Section, Name: string; Value: TDateTime );
begin
  CheckAccess;
  if FPathType = ptIniFile then
    FIni.WriteTime( Section, Name, Value )
  else
    FReg.WriteTime( Section, Name, Value );
end;


{$IFDEF VCL60_OR_HIGHER}

function TRzRegIniFile.ReadBinaryStream( const Section, Name: string; Value: TStream ): Integer;
begin
  CheckAccess;
  if FPathType = ptIniFile then
    Result := FIni.ReadBinaryStream( Section, Name, Value )
  else
    Result := FReg.ReadBinaryStream( Section, Name, Value );
end;


procedure TRzRegIniFile.WriteBinaryStream( const Section, Name: string; Value: TStream );
begin
  CheckAccess;
  if FPathType = ptIniFile then
    FIni.WriteBinaryStream( Section, Name, Value )
  else
    FReg.WriteBinaryStream( Section, Name, Value );
end;

{$ENDIF}

procedure TRzRegIniFile.ReadSection( const Section: string; Strings: TStrings );
begin
  CheckAccess;
  if FPathType = ptIniFile then
    FIni.ReadSection( Section, Strings )
  else
    FReg.ReadSection( Section, Strings );
end;


procedure TRzRegIniFile.ReadSections( Strings: TStrings );
begin
  CheckAccess;
  if FPathType = ptIniFile then
    FIni.ReadSections( Strings )
  else
    FReg.ReadSections( Strings );
end;


procedure TRzRegIniFile.ReadSectionValues( const Section: string; Strings: TStrings );
var
  Reg: TRegistry;
  FullKey: string;

  procedure ProcessValueName( const ValueName: string );
  var
    I, N, BinSize: Integer;
    S, HexStr, FmtStr: string;
    BinData, HexData: Pointer;
    P: PChar;
  begin
    FmtStr := '%s=%s';
    if ValueName = '' then
      S := Format( FmtStr, [ 'Default', Reg.ReadString( ValueName ) ] )
    else
    begin
      case Reg.GetDataType( ValueName ) of
        rdUnknown:
          S := Format( FmtStr, [ ValueName, 'Unknown Data Type' ] );

        rdString, rdExpandString:
        begin
          S := Format( FmtStr, [ ValueName, Reg.ReadString( ValueName ) ] );
        end;

        rdInteger:
        begin
          N := Reg.ReadInteger( ValueName );
          FmtStr := '%s=%d';
          S := Format( FmtStr, [ ValueName, N ] );
        end;

        rdBinary:
        begin
          BinSize := Reg.GetDataSize( ValueName );
          GetMem( BinData, BinSize );
          GetMem( HexData, BinSize * 2 );
          try
            Reg.ReadBinaryData( ValueName, BinData^, BinSize  );
            BinToHex( BinData, PChar( HexData ), BinSize );
            P := HexData;
            HexStr := '';
            I := 0;
            while I < BinSize do
            begin
              HexStr := HexStr + P[ I * 2 ] + P[ I * 2 + 1 ] + ' ';
              Inc( I );
            end;

            S := Format( FmtStr, [ ValueName, HexStr ] );
          finally
            FreeMem( BinData, BinSize );
            FreeMem( HexData, BinSize * 2 );
          end;
        end;
      end;
    end;
    Strings.Add( S );
  end; {= ProcessValueName =}


  procedure ProcessKey( const Key: string );
  var
    I: Integer;
    ValueNames: TStringList;
    RegKeyInfo: TRegKeyInfo;
  begin
    if Reg.OpenKey( Key, False ) then
    begin
      ValueNames := TStringList.Create;
      ValueNames.Sorted := True;
      try
        Reg.GetKeyInfo( RegKeyInfo );

        Reg.GetValueNames( ValueNames );
        for I := 0 to ValueNames.Count - 1 do
          ProcessValueName( ValueNames[ I ] );
      finally
        ValueNames.Free;
      end;
    end;
    Reg.CloseKey;
  end; {= ProcessKey =}


begin {= TRzRegIniFile.ReadSectionValues =}
  CheckAccess;
  if FPathType = ptIniFile then
    FIni.ReadSectionValues( Section, Strings )
  else
  begin
    // Cannot use FReg.ReadSectionValues( Section, Strings ) b/c TRegistryIniFile.ReadSectionValues simply uses
    // ReadString to read each value. This is fine for an INI file, but for the Registry, if a value is not a string
    // value (e.g. a DWORD), then an exception is raised.

    Reg := TRegistry.Create;
    Strings.BeginUpdate;
    try
      Reg.RootKey := HKEYS[ FRegKey ];

      if LastChar( FPath ) = '\' then
        FullKey := FPath + Section
      else
        FullKey := FPath + '\' + Section;
      if Reg.OpenKey( FullKey, False ) then
      begin
        Reg.CloseKey;
        ProcessKey( FullKey );
      end;
    finally
      Strings.EndUpdate;
      Reg.Free;
    end;
  end;
end; {= TRzRegIniFile.ReadSectionValues =}


procedure TRzRegIniFile.EraseSection( const Section: string );
begin
  CheckAccess;
  if FPathType = ptIniFile then
    FIni.EraseSection( Section )
  else
    FReg.EraseSection( Section );
end;


procedure TRzRegIniFile.DeleteKey( const Section, Name: string );
begin
  CheckAccess;
  if FPathType = ptIniFile then
    FIni.DeleteKey( Section, Name )
  else
    FReg.DeleteKey( Section, Name );
end;


procedure TRzRegIniFile.SetPath( const Value: string );
begin
  if FPath <> Value then
  begin
    FPath := Value;
    FRefreshStorage := True;
  end;
end;


procedure TRzRegIniFile.SetPathType( Value: TRzPathType );
begin
  if FPathType <> Value then
  begin
    FPathType := Value;
    FRefreshStorage := True;
  end;
end;


procedure TRzRegIniFile.SetRegKey( Value: TRzRegKey );
begin
  if FRegKey <> Value then
  begin
    FRegKey := Value;
    FRefreshStorage := True;
  end;
end;


procedure TRzRegIniFile.SetRegAccess( Value: TRzRegAccess );
begin
  if FRegAccess <> Value then
  begin
    FRegAccess := Value;
    FRefreshStorage := True;
  end;
end;


{=============================}
{== TRzCustomColors Methods ==}
{=============================}

constructor TRzCustomColors.Create( AOwner: TComponent );
begin
  inherited;
  FColors := TStringList.Create;
  InitColors;
end;


destructor TRzCustomColors.Destroy;
begin
  FColors.Free;
  inherited;
end;


procedure TRzCustomColors.Notification( AComponent: TComponent; Operation: TOperation );
begin
  inherited;

  if ( Operation = opRemove ) and ( AComponent = FRegIniFile ) then
    FRegIniFile := nil;
end;


procedure TRzCustomColors.InitColors;
begin
  FColors.Add( 'ColorA=FFFFFF' );
  FColors.Add( 'ColorB=FFFFFF' );
  FColors.Add( 'ColorC=FFFFFF' );
  FColors.Add( 'ColorD=FFFFFF' );
  FColors.Add( 'ColorE=FFFFFF' );
  FColors.Add( 'ColorF=FFFFFF' );
  FColors.Add( 'ColorG=FFFFFF' );
  FColors.Add( 'ColorH=FFFFFF' );
  FColors.Add( 'ColorI=FFFFFF' );
  FColors.Add( 'ColorJ=FFFFFF' );
  FColors.Add( 'ColorK=FFFFFF' );
  FColors.Add( 'ColorL=FFFFFF' );
  FColors.Add( 'ColorM=FFFFFF' );
  FColors.Add( 'ColorN=FFFFFF' );
  FColors.Add( 'ColorO=FFFFFF' );
  FColors.Add( 'ColorP=FFFFFF' );
end;


function TRzCustomColors.GetColorName( Index: Integer ): string;
begin
  Result := FColors.Names[ Index ];
end;


procedure TRzCustomColors.FixupColors;
var
  I: Integer;
  L: Longint;
  S, Ident: string;
begin
  for I := 0 to FColors.Count - 1 do
  begin
    Ident := GetColorName( I );

    L := StrToInt( '$' + FColors.Values[ Ident ] ) and $00FFFFFF;
    S := Format( '%.6x', [ L ] );
    FColors.Values[ Ident ] := S;
  end;
end;


procedure TRzCustomColors.Load( const Section: string );
begin
  if FRegIniFile = nil then
    raise ENoRegIniFile.Create( sRzCannotLoadCustomColors );

  FRegIniFile.ReadSectionValues( Section, FColors );
  FixupColors;
end;


procedure TRzCustomColors.Save( const Section: string );
var
  I: Integer;
  Ident: string;
begin
  if FRegIniFile = nil then
    raise ENoRegIniFile.Create( sRzCannotSaveCustomColors );

  for I := 0 to FColors.Count - 1 do
  begin
    Ident := GetColorName( I );
    FRegIniFile.WriteString( Section, Ident, FColors.Values[ Ident ] );
  end;
end;


procedure TRzCustomColors.SetColors( Value: TStrings );
begin
  FColors.Assign( Value );
  FixupColors;
end;


procedure TRzCustomColors.SetRegIniFile( Value: TRzRegIniFile );
begin
  if FRegIniFile <> Value then
  begin
    FRegIniFile := Value;
    if Value <> nil then
      Value.FreeNotification( Self );
  end;
end;


{================}
{== Date Utils ==}
{================}

{$IFNDEF VCL60_OR_HIGHER}

procedure DivMod( Dividend: Integer; Divisor: Word; var Result, Remainder: Word );
asm
        PUSH    EBX
        MOV     EBX,EDX
        MOV     EDX,EAX
        SHR     EDX,16
        DIV     BX
        MOV     EBX,Remainder
        MOV     [ECX],AX
        MOV     [EBX],DX
        POP     EBX
end;

function DecodeDateFully(const DateTime: TDateTime; var Year, Month, Day, DOW: Word): Boolean;
const
  D1 = 365;
  D4 = D1 * 4 + 1;
  D100 = D4 * 25 - 1;
  D400 = D100 * 4 + 1;
var
  Y, M, D, I: Word;
  T: Integer;
  DayTable: PDayTable;
begin
  T := DateTimeToTimeStamp(DateTime).Date;
  if T <= 0 then
  begin
    Year := 0;
    Month := 0;
    Day := 0;
    DOW := 0;
    Result := False;
  end else
  begin
    DOW := T mod 7 + 1;
    Dec(T);
    Y := 1;
    while T >= D400 do
    begin
      Dec(T, D400);
      Inc(Y, 400);
    end;
    DivMod(T, D100, I, D);
    if I = 4 then
    begin
      Dec(I);
      Inc(D, D100);
    end;
    Inc(Y, I * 100);
    DivMod(D, D4, I, D);
    Inc(Y, I * 4);
    DivMod(D, D1, I, D);
    if I = 4 then
    begin
      Dec(I);
      Inc(D, D1);
    end;
    Inc(Y, I);
    Result := IsLeapYear(Y);
    DayTable := @MonthDays[Result];
    M := 1;
    while True do
    begin
      I := DayTable^[M];
      if D < I then Break;
      Dec(D, I);
      Inc(M);
    end;
    Year := Y;
    Month := M;
    Day := D + 1;
  end;
end;

function DayOfTheWeek(const AValue: TDateTime): Word;
begin
  Result := (DateTimeToTimeStamp(AValue).Date - 1) mod 7 + 1;
end;

const
  DayMonday = 1;
  DayTuesday = 2;
  DayWednesday = 3;
  DayThursday = 4;
  DayFriday = 5;
  DaySaturday = 6;
  DaySunday = 7;
  CDayMap: array [1..7] of Word = (7, 1, 2, 3, 4, 5, 6);

  MonthsPerYear = 12;
  HoursPerDay   = 24;
  MinsPerDay    = HoursPerDay * 60;
  SecsPerDay    = MinsPerDay * 60;
  MSecsPerDay   = SecsPerDay * 1000;


procedure DecodeDateWeek( const AValue: TDateTime; out AYear, AWeekOfYear, ADayOfWeek: Word );
var
  LDayOfYear: Integer;
  LMonth, LDay: Word;
  LStart: TDateTime;
  LStartDayOfWeek, LEndDayOfWeek: Word;
  LLeap: Boolean;
begin
  LLeap := DecodeDateFully(AValue, AYear, LMonth, LDay, ADayOfWeek);
  ADayOfWeek := CDayMap[ADayOfWeek];
  LStart := EncodeDate(AYear, 1, 1);
  LDayOfYear := Trunc(AValue - LStart + 1);
  LStartDayOfWeek := DayOfTheWeek(LStart);
  if LStartDayOfWeek in [DayFriday, DaySaturday, DaySunday] then
    Dec(LDayOfYear, 8 - LStartDayOfWeek)
  else
    Inc(LDayOfYear, LStartDayOfWeek - 1);
  if LDayOfYear <= 0 then
    DecodeDateWeek(LStart - 1, AYear, AWeekOfYear, LDay)
  else
  begin
    AWeekOfYear := LDayOfYear div 7;
    if LDayOfYear mod 7 <> 0 then
      Inc(AWeekOfYear);
    if AWeekOfYear > 52 then
    begin
      LEndDayOfWeek := LStartDayOfWeek;
      if LLeap then
      begin
        if LEndDayOfWeek = DaySunday then
          LEndDayOfWeek := DayMonday
        else
          Inc(LEndDayOfWeek);
      end;
      if LEndDayOfWeek in [DayMonday, DayTuesday, DayWednesday] then
      begin
        Inc(AYear);
        AWeekOfYear := 1;
      end;
    end;
  end;
end;


function WeekOfTheYear( const AValue: TDateTime ): Word;
var
  LYear, LDOW: Word;
begin
  DecodeDateWeek( AValue, LYear, Result, LDOW );
end;


function WeekOf( const AValue: TDateTime ): Word;
begin
  Result := WeekOfTheYear( AValue );
end;


function IncYear( const AValue: TDateTime; const ANumberOfYears: Integer = 1 ): TDateTime;
begin
  Result := IncMonth( AValue, ANumberOfYears * MonthsPerYear );
end;


function IncDay( const AValue: TDateTime; const ANumberOfDays: Integer = 1 ): TDateTime;
begin
  Result := AValue + ANumberOfDays;
end;


function IncHour( const AValue: TDateTime; const ANumberOfHours: Int64 = 1 ): TDateTime;
begin
  Result := ( ( AValue * HoursPerDay ) + ANumberOfHours ) / HoursPerDay;
end;


function IncMinute( const AValue: TDateTime; const ANumberOfMinutes: Int64 = 1 ): TDateTime;
begin
  Result := ( ( AValue * MinsPerDay ) + ANumberOfMinutes ) / MinsPerDay;
end;


{$ENDIF}


{&RCMS}
initialization
  {&RCMI}

finalization
  {&RCMF}

end.

