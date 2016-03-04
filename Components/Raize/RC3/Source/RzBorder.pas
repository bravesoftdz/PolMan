{=======================================================================================================================
  RzBorder Unit

  Raize Components - Component Source Unit


  Components            Description
  ----------------------------------------------------------------------------------------------------------------------
  TRzBorder             Graphic control to display borders - no interior
  TRzLEDDisplay         Graphic control to display a Caption in LED style display
  TRzMeter              Graphic control to display progress info as 3-segmented colors (or bitmap)
  TRzColorPicker        User selects colors from a grid of colors (Office-style)


  Modification History
  ----------------------------------------------------------------------------------------------------------------------
  3.0.8  (29 Aug 2003)  * Added fsFlatRounded to inner and outer border styles for TRzBorder.
                        * Gap between dots in TRzLEDDisplay are now drawn in BackColor value.
                        * Fixed problem with calculation of ClientRect for TRzBorder and descendants.
                        * Fixed problem in TRzLEDDisplay where dot dimensions were not recalculated if border style or
                          border width of the control changed.
                        * Fixed problem where fsFlatBold borders were not drawn with FlatColor value.
                        * Refactored inner and outer border painting to common DrawInnerOuterBorders function.

  3.0.6  (11 Apr 2003)  * Added OnScrollComplete event to TRzLEDDisplay. This event is fired when Scrolling is True and
                          the Caption has been completely scrolled across the display.

  3.0    (20 Dec 2002)  << TRzBorder >>
                        * Fixed problem where bevel edge of fsPopup and fsStatus borders were not showing up correctly
                          when BevelWidth > 1.
                        * Added FlatColorAdjustment property.

                        << TRzLEDDisplay >>
                        * The TRzLEDDisplay has been completely redesigned. Instead of displaying characters in a
                          segmented LED fashion, the new version uses a (5 X 7) grid of LED lights to display each
                          character.  The effect is that the characters are much easier to read and identify.
                        * Added Scrolling capability to this component. That is, when Scrolling is set to True, the
                          Caption is scrolled across the display area 1 LED column at a time.  Scrolling direction can
                          be controlled by the ScrollType property.  The speed at which the scrolling occurs is
                          controlled by the ScrollDelay property.

                        << TRzColorPicker >>
                        * Initial release.
                        

  Copyright � 1995-2003 by Raize Software, Inc.  All Rights Reserved.
=======================================================================================================================}

{$I RzComps.inc}

unit RzBorder;

interface

uses
  {$IFDEF USE_CS}
  CSIntf,
  {$ENDIF}
  Controls,
  Messages,
  Windows,
  Forms,
  Classes,
  Graphics,
  StdCtrls,
  ExtCtrls,
  Dialogs,
  Menus,
  RzGrafx,
  RzCommon;

type
  {=================================}
  {== TRzBorder Class Declaration ==}
  {=================================}

  TRzBorder = class( TGraphicControl )
  private
    FAboutInfo: TRzAboutInfo;
    FBevelWidth: TBevelWidth;
    FBorderInner: TFrameStyleEx;
    FBorderOuter: TFrameStyleEx;
    FBorderWidth: TBorderWidth;
    FBorderColor: TColor;
    FBorderHighlight: TColor;
    FBorderShadow: TColor;
    FBorderSides: TSides;
    FFlatColor: TColor;
    FFlatColorAdjustment: Integer;
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;

    { Message Handling Methods }
    procedure CMMouseEnter( var Msg: TMessage ); message cm_MouseEnter;
    procedure CMMouseLeave( var Msg: TMessage ); message cm_MouseLeave;
  protected
    function GetClientRect: TRect; override;
    procedure AdjustClientRect( var Rect: TRect ); virtual;

    function InteriorColor: TColor; virtual;
    procedure Paint; override;
    procedure MouseEnter; dynamic;
    procedure MouseLeave; dynamic;

    { Property Access Methods }
    procedure SetBevelWidth( Value: TBevelWidth ); virtual;
    procedure SetBorderColor( Value: TColor ); virtual;
    procedure SetBorderHighlight( Value: TColor ); virtual;
    procedure SetBorderInner( Value: TFrameStyleEx ); virtual;
    procedure SetBorderOuter( Value: TFrameStyleEx ); virtual;
    procedure SetBorderShadow( Value: TColor ); virtual;
    procedure SetBorderSides( Value: TSides ); virtual;
    procedure SetBorderWidth( Value: TBorderWidth ); virtual;
    procedure SetFlatColor( Value: TColor ); virtual;
    procedure SetFlatColorAdjustment( Value: Integer ); virtual;
  public
    constructor Create( AOwner: TComponent ); override;
  published
    property About: TRzAboutInfo
      read FAboutInfo
      write FAboutInfo
      stored False;

    property BevelWidth: TBevelWidth
      read FBevelWidth
      write SetBevelWidth
      default 1;

    property BorderWidth: TBorderWidth
      read FBorderWidth
      write SetBorderWidth
      default 0;

    property BorderColor: TColor
      read FBorderColor
      write SetBorderColor
      default clBtnFace;

    property BorderHighlight: TColor
      read FBorderHighlight
      write SetBorderHighlight
      default clBtnHighlight;

    property BorderShadow: TColor
      read FBorderShadow
      write SetBorderShadow
      default clBtnShadow;

    property BorderInner: TFrameStyleEx
      read FBorderInner
      write SetBorderInner
      default fsNone;

    property BorderOuter: TFrameStyleEx
      read FBorderOuter
      write SetBorderOuter
      default fsGroove;

    property BorderSides: TSides
      read FBorderSides
      write SetBorderSides
      default [ sdLeft, sdTop, sdRight, sdBottom ];

    property FlatColor: TColor
      read FFlatColor
      write SetFlatColor
      default clBtnShadow;

    property FlatColorAdjustment: Integer
      read FFlatColorAdjustment
      write SetFlatColorAdjustment
      default 30;

    property OnMouseEnter: TNotifyEvent
      read FOnMouseEnter
      write FOnMouseEnter;

    property OnMouseLeave: TNotifyEvent
      read FOnMouseLeave
      write FOnMouseLeave;

    { Inherited Properties & Events }
    property Align;
    property Anchors;
    property Constraints;
    property DragKind;
    property DragCursor;
    property DragMode;
    property Enabled;
    property ParentShowHint;
    property ShowHint;
    property Visible;

    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;



  {=====================================}
  {== TRzLEDDisplay Class Declaration ==}
  {=====================================}

  TRzLEDDisplay = class( TRzBorder )
  private
    FCaption: TCaption;

    FDotSize: Integer;
    FDotGap: Integer;

    FBackColor: TColor;
    FSegOnColor: TColor;
    FSegOffColor: TColor;

    FScrollType: TRzScrollType;
    FScrolling: Boolean;
    FSteps: Integer;
    FScrollDelay: Word;
    FTimer: TTimer;
    FCurrentStep: Integer;
    FOnScrollComplete: TNotifyEvent;

    { Internal Event Handlers }
    procedure TimerEventHandler( Sender: TObject );

    { Message Handling Methods }
    procedure CMTextChanged( var Msg: TMessage ); message cm_TextChanged;
  protected
    procedure Loaded; override;
    procedure DefineProperties( Filer: TFiler ); override;

    procedure UpdateDotDimensions;
    procedure UpdateSteps;

    function InteriorColor: TColor; override;
    procedure Paint; override;
    procedure DrawCell( Canvas: TCanvas; Bounds: TRect; Symbol: Char ); virtual;
    function DotColor( Symbol: Char; Col, Row: Integer ): TColor;

    { Event Dispatch Methods }
    procedure ScrollComplete; dynamic;

    { Property Access Methods }
    procedure SetBevelWidth( Value: TBevelWidth ); override;
    procedure SetBorderInner( Value: TFrameStyleEx ); override;
    procedure SetBorderOuter( Value: TFrameStyleEx ); override;
    procedure SetBorderSides( Value: TSides ); override;
    procedure SetBorderWidth( Value: TBorderWidth ); override;
    procedure SetBackColor( Value: TColor ); virtual;
    procedure SetSegOnColor( Value: TColor ); virtual;
    procedure SetSegOffColor( Value: TColor ); virtual;
    procedure SetCaption( const Value: TCaption ); virtual;
    procedure SetScrollType( Value: TRzScrollType );
    procedure SetScrolling( Value: Boolean ); virtual;
    procedure SetScrollDelay( Value: Word );
  public
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;

    procedure SetBounds( ALeft, ATop, AWidth, AHeight: Integer ); override;
  published
    property Caption: TCaption
      read FCaption
      write SetCaption;

    property BackColor: TColor
      read FBackColor
      write SetBackColor
      default clBlack;

    property SegOnColor: TColor
      read FSegOnColor
      write SetSegOnColor
      default clLime;

    property SegOffColor: TColor
      read FSegOffColor
      write SetSegOffColor
      default $00003300;  // RGB( 0, 51, 0 )

    property ScrollType: TRzScrollType
      read FScrollType
      write SetScrollType
      default stRightToLeft;

    property Scrolling: Boolean
      read FScrolling
      write SetScrolling
      default False;

    property ScrollDelay: Word
      read FScrollDelay
      write SetScrollDelay
      default 100;

    property OnScrollComplete: TNotifyEvent
      read FOnScrollComplete
      write FOnScrollComplete;

    { Inherited Properties & Events }
    property Align;
    property BorderOuter default fsStatus;
    property Enabled;
    property Height default 30;
    property ShowHint;
    property ParentShowHint;
    property PopupMenu;
    property Visible;
    property Width default 100;

    property OnClick;
    property OnDblClick;
  end;



  {================================}
  {== TRzMeter Class Declaration ==}
  {================================}

  TRzMeterType = ( mtNormal, mtBar3D, mtLED );
  TRzMeterShape = ( msRectangular, msTrapezoidal );

  TRzMeter = class( TRzBorder )
  private
    FMin: Integer;
    FMax: Integer;
    FValue: Integer;

    FBWidth: Byte;                                 { Window Frame border width }
    FBarColor: TColor;
    FBackColor: TColor;

    FMeterType: TRzMeterType;
    FMeterShape: TRzMeterShape;
    FTrapDirect: TTrapDirect;                   { Direction of Trapezoidal bar }
    FTrapShape: TTrapShape;
    FTrapMin: Integer;                                 { Min size of Trapezoid }

    FDirection: TDirection;                      { Direction of Meter Progress }

    { Variables needed for standard % bar }
    FBitmap: TBitmap;                                   { Bitmap to fill % bar }
    FBrushStyle: TBrushStyle;                            { Brush to fill % bar }
    FShowPercent: Boolean;

    { Variables needed for segmented display (LED) }
    FSegSpacing: Byte;                     { Spacing between segments (pixels) }
    FSegOffColor: TColor;                          { Color of segment when off }

    { Segment color info (limit to 3 colors) }
    FSegCount: array[ 0..2 ] of TPositiveByte;
    FSegColor: array[ 0..2 ] of TColor;

    { Internal Event Handlers }
    procedure BitmapChangedHandler( Sender: TObject );
  protected
    function InteriorColor: TColor; override;
    procedure Paint; override;
    procedure DrawStandardBar( Canvas: TCanvas; Bounds: TRect );
    procedure DrawLEDBar( Canvas: TCanvas; Bounds: TRect );

    { Property Access Methods }
    procedure SetMin( Value: Integer ); virtual;
    procedure SetMax( Value: Integer ); virtual;
    procedure SetValue( Value: Integer ); virtual;

    procedure SetBarColor( Value: TColor ); virtual;
    procedure SetBackColor( Value: TColor ); virtual;

    procedure SetMeterType( Value: TRzMeterType ); virtual;
    procedure SetMeterShape( Value: TRzMeterShape ); virtual;

    procedure SetTrapDirect( Value: TTrapDirect ); virtual;
    procedure SetTrapShape( Value: TTrapShape ); virtual;
    procedure SetTrapMin( Value: Integer ); virtual;

    procedure SetDirection( Value: TDirection ); virtual;

    procedure SetBitmap( Value: TBitmap ); virtual;
    procedure SetBrush( Value: TBrushStyle ); virtual;
    procedure SetShowPercent( Value: Boolean ); virtual;
    function GetPercent: Integer; virtual;

    procedure SetSegSpacing( Value: Byte ); virtual;
    procedure SetSegOffColor( Value: TColor ); virtual;
    function GetSegCount( Index: Integer ): TPositiveByte; virtual;
    procedure SetSegCount( Index: Integer; Value: TPositiveByte ); virtual;
    function GetSegColor( Index: Integer ): TColor; virtual;
    procedure SetSegColor( Index: Integer; Value: TColor ); virtual;
  public
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;

    procedure AddValue( Number: Longint );

    { Property Declarations }
    property Percent: Integer
      read GetPercent;
  published
    property Direction: TDirection
      read FDirection
      write SetDirection
      default dirRight;

    property Bitmap: TBitmap
      read FBitmap
      write SetBitmap;

    property BrushStyle: TBrushStyle
      read FBrushStyle
      write SetBrush;

    property Min: Integer
      read FMin
      write SetMin
      default 0;

    property Max: Integer
      read FMax
      write SetMax
      default 100;

    property Value: Integer
      read FValue
      write SetValue
      default 0;

    property BackColor: TColor
      read FBackColor
      write SetBackColor
      default clBlack;

    property BarColor: TColor
      read FBarColor
      write SetBarColor
      default clRed;

    property MeterType: TRzMeterType
      read FMeterType
      write SetMeterType
      default mtLED;

    property MeterShape: TRzMeterShape
      read FMeterShape
      write SetMeterShape
      default msRectangular;

    property ShowPercent: Boolean
      read FShowPercent
      write SetShowPercent
      default True;

    property SegSpacing: Byte
      read FSegSpacing
      write SetSegSpacing
      default 2;

    property SegOffColor: TColor
      read FSegOffColor
      write SetSegOffColor
      default clBlack;

    property Seg1Count: TPositiveByte
      index 0
      read GetSegCount
      write SetSegCount
      default 5;

    property Seg1Color: TColor
      index 0
      read GetSegColor
      write SetSegColor
      default clGreen;

    property Seg2Count: TPositiveByte
      index 1
      read GetSegCount
      write SetSegCount
      default 3;

    property Seg2Color: TColor
      index 1
      read GetSegColor
      write SetSegColor
      default clYellow;

    property Seg3Count: TPositiveByte
      index 2
      read GetSegCount
      write SetSegCount
      default 2;

    property Seg3Color: TColor
      index 2
      read GetSegColor
      write SetSegColor
      default clRed;

    property TrapezoidDir: TTrapDirect
      read FTrapDirect
      write SetTrapDirect
      default tdLargeToSmall;

    property TrapezoidMin: Integer
      read FTrapMin
      write SetTrapMin
      default 6;

    property TrapezoidShape: TTrapShape
      read FTrapShape
      write SetTrapShape
      default TSCenter;

    { Inherited Properties & Events }
    property Align;
    property BorderOuter default fsStatus;
    property Color;
    property Font;
    property Height default 30;
    property ParentColor;
    property ParentFont;
    property ShowHint;
    property ParentShowHint;
    property Width default 150;

    property OnClick;
    property OnDblClick;
  end;



  {======================================}
  {== TRzColorPicker Class Declaration ==}
  {======================================}

  TRzColorPicker = class( TRzBorder )
  private
    FCustomColor: TColor;
    FDefaultColor: TColor;
    FColorDlgOptions: TColorDialogOptions;
    FCustomColors: TRzCustomColors;
    FCustomColorCaption: string;
    FNoColorCaption: string;
    FDefaultColorCaption: string;
    FShowCustomColor: Boolean;
    FShowNoColor: Boolean;
    FShowDefaultColor: Boolean;
    FShowSystemColors: Boolean;
    FSelColorIndex: Integer;
    FHighlightColorIndex: Integer;
    FThemeBorderColor: TColor;
    FOnChange: TNotifyEvent;
    FShowColorHints: Boolean;
    FHintWnd: THintWindow;

    function Margin: Integer;
    procedure UpdateBounds;
    procedure CMFontChanged( var Msg: TMessage ); message cm_FontChanged;
  protected
    procedure Loaded; override;
    procedure Notification( AComponent: TComponent; Operation: TOperation ); override;

    function InteriorColor: TColor; override;
    procedure Paint; override;
    function CanAutoSize( var NewWidth, NewHeight: Integer ): Boolean; override;
    function HitTest( X, Y: Integer ): Integer;
    function GetCellRect( Index: Integer ): TRect;

    function CalcHintRect( MaxWidth: Integer; const HintStr: string; HintWnd: THintWindow ): TRect;
    procedure DoHint( X, Y: Integer );
    procedure ReleaseHintWindow;

    procedure PickCustomColor; virtual;

    { Event Dispatch Methods }
    procedure ColorChanged; dynamic;
    procedure MouseDown( Button: TMouseButton; Shift: TShiftState; X, Y: Integer ); override;
    procedure MouseMove( Shift: TShiftState; X, Y: Integer ); override;
    procedure MouseEnter; override;
    procedure MouseLeave; override;

    { Property Access Methods }
    procedure SetCustomColorCaption( const Value: string ); virtual;
    procedure SetCustomColor( Value: TColor ); virtual;
    procedure SetCustomColors( Value: TRzCustomColors ); virtual;
    procedure SetDefaultColor( Value: TColor ); virtual;
    procedure SetNoColorCaption( const Value: string ); virtual;
    procedure SetDefaultColorCaption( const Value: string ); virtual;
    procedure SetShowCustomColor( Value: Boolean ); virtual;
    procedure SetShowNoColor( Value: Boolean ); virtual;
    procedure SetShowDefaultColor( Value: Boolean ); virtual;
    procedure SetShowSystemColors( Value: Boolean ); virtual;
    procedure SetSelColorIndex( Value: Integer ); virtual;
    procedure SetHighlightColorIndex( Value: Integer ); virtual;
    function GetSelectedColor: TColor; virtual;
    procedure SetSelectedColor( Value: TColor ); virtual;
  public
    constructor Create( AOwner: TComponent ); override;

    property SelColorIndex: Integer
      read FSelColorIndex
      write SetSelColorIndex;
  published
    property CustomColorCaption: string
      read FCustomColorCaption
      write SetCustomColorCaption;

    property CustomColor: TColor
      read FCustomColor
      write SetCustomColor
      default clWhite;

    property CustomColors: TRzCustomColors
      read FCustomColors
      write SetCustomColors;

    property ColorDlgOptions: TColorDialogOptions
      read FColorDlgOptions
      write FColorDlgOptions
      default [ cdFullOpen ];

    property DefaultColor: TColor
      read FDefaultColor
      write SetDefaultColor
      default clHighlight;

    property DefaultColorCaption: string
      read FDefaultColorCaption
      write SetDefaultColorCaption;

    property ShowColorHints: Boolean
      read FShowColorHints
      write FShowColorHints
      default True;

    property NoColorCaption: string
      read FNoColorCaption
      write SetNoColorCaption;

    property SelectedColor: TColor
      read GetSelectedColor
      write SetSelectedColor
      default clNone;

    property ShowNoColor: Boolean
      read FShowNoColor
      write SetShowNoColor
      default False;

    property ShowCustomColor: Boolean
      read FShowCustomColor
      write SetShowCustomColor
      default False;

    property ShowDefaultColor: Boolean
      read FShowDefaultColor
      write SetShowDefaultColor
      default False;

    property ShowSystemColors: Boolean
      read FShowSystemColors
      write SetShowSystemColors
      default False;

    property OnChange: TNotifyEvent
      read FOnChange
      write FOnChange;

    { Inherited Properties & Events }
    property Align;
    property AutoSize default True;
    property BorderWidth default 2;
    property BorderColor default clWindow;
    property Color default clWindow;
    property FlatColorAdjustment default 0;
    property Font;
    property Hint;
    property ParentFont;
    property ParentShowHint;
    property ParentColor;
    property ShowHint;

    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnClick;
    property OnDblClick;
  end;



resourcestring
  sRzColorBlack                          = 'Black';
  sRzColorBrown                          = 'Brown';
  sRzColorOliveGreen                     = 'Olive Green';
  sRzColorDarkGreen                      = 'Dark Green';
  sRzColorDarkTeal                       = 'Dark Teal';
  sRzColorDarkBlue                       = 'Dark Blue';
  sRzColorIndigo                         = 'Indigo';
  sRzColorGray80                         = 'Gray 80%';

  sRzColorDarkRed                        = 'Dark Red';
  sRzColorOrange                         = 'Orange';
  sRzColorDarkYellow                     = 'Dark Yellow';
  sRzColorGreen                          = 'Green';
  sRzColorTeal                           = 'Teal';
  sRzColorBlue                           = 'Blue';
  sRzColorBlueGray                       = 'Blue Gray';
  sRzColorGray50                         = 'Gray 50%';

  sRzColorRed                            = 'Red';
  sRzColorLightOrange                    = 'Light Orange';
  sRzColorLime                           = 'Lime';
  sRzColorSeaGreen                       = 'Sea Green';
  sRzColorAqua                           = 'Aqua';
  sRzColorLightBlue                      = 'Light Blue';
  sRzColorViolet                         = 'Violet';
  sRzColorGray40                         = 'Gray 40%';

  sRzColorPink                           = 'Pink';
  sRzColorGold                           = 'Gold';
  sRzColorYellow                         = 'Yellow';
  sRzColorBrightGreen                    = 'Bright Green';
  sRzColorTurquoise                      = 'Turquoise';
  sRzColorSkyBlue                        = 'Sky Blue';
  sRzColorPlum                           = 'Plum';
  sRzColorGray25                         = 'Gray 25%';

  sRzColorRose                           = 'Rose';
  sRzColorTan                            = 'Tan';
  sRzColorLightYellow                    = 'Light Yellow';
  sRzColorLightGreen                     = 'Light Green';
  sRzColorLightTurquoise                 = 'Light Turquoise';
  sRzColorPaleBlue                       = 'Pale Blue';
  sRzColorLavender                       = 'Lavender';
  sRzColorWhite                          = 'White';

  sRzColorScrollBar                      = 'Scroll Bar';
  sRzColorBackground                     = 'Background';
  sRzColorActiveCaption                  = 'Active Caption';
  sRzColorInactiveCaption                = 'Inactive Caption';
  sRzColorMenu                           = 'Menu';
  sRzColorWindow                         = 'Window';
  sRzColorWindowFrame                    = 'Window Frame';
  sRzColorMenuText                       = 'Menu Text';
  sRzColorWindowText                     = 'Window Text';
  sRzColorCaptionText                    = 'Caption Text';
  sRzColorActiveBorder                   = 'Active Border';
  sRzColorInactiveBorder                 = 'Inactive Border';
  sRzColorAppWorkSpace                   = 'App WorkSpace';
  sRzColorHighlight                      = 'Highlight';
  sRzColorHighlightText                  = 'Highlight Text';
  sRzColorBtnFace                        = 'Button Face';
  sRzColorBtnShadow                      = 'Button Shadow';
  sRzColorGrayText                       = 'Gray Text';
  sRzColorBtnText                        = 'Button Text';
  sRzColorInactiveCaptionText            = 'Inactive Caption Text';
  sRzColorBtnHighlight                   = 'Button Highlight';
  sRzColor3DDkShadow                     = '3D Dark Shadow';
  sRzColor3DLight                        = '3D Light';
  sRzColorInfoText                       = 'Info Text';
  sRzColorInfoBk                         = 'Info Background';
  sRzColorHotLight                       = 'Hot Light';
  sRzColorGradientActiveCaption          = 'Gradient Active Caption';
  sRzColorGradientInactiveCaption        = 'Gradient Inactive Caption';
  sRzColorMenuHighlight                  = 'Menu Highlight';
  sRzColorMenuBar                        = 'Menu Bar';

  sRzDefaultColorCaption = 'Default';
  sRzNoColorCaption      = 'None';
  sRzCustomColorCaption  = 'More Colors...';

implementation

uses
  Registry,
  {$IFDEF VCL60_OR_HIGHER}
  Types,
  {$ENDIF}
  {$IFDEF VCL70_OR_HIGHER}
  Themes,
  UxTheme,
  {$ELSE}
  RzThemeSrv,
  RzUxTheme,
  RzTmSchema,
  {$ENDIF}
  SysUtils;

{&RT}
{=======================}
{== TRzBorder Methods ==}
{=======================}

constructor TRzBorder.Create( AOwner: TComponent );
begin
  inherited;
  {&RCI}
  FBorderInner := fsNone;
  FBorderOuter := fsGroove;
  FBorderWidth := 0;
  FBevelWidth := 1;
  Caption := '';
  Width := 50;
  Height := 50;
  FBorderColor := clBtnFace;
  FBorderSides := [ sdLeft, sdTop, sdRight, sdBottom ];
  FFlatColor := clBtnShadow;
  FFlatColorAdjustment := 30;
  FBorderHighlight := clBtnHighlight;
  FBorderShadow := clBtnShadow;
end;


procedure TRzBorder.SetBevelWidth( Value: TBevelWidth );
begin
  if FBevelWidth <> Value then
  begin
    FBevelWidth := Value;
    Repaint;
  end;
end;


procedure TRzBorder.SetBorderColor( Value: TColor );
begin
  if FBorderColor <> Value then
  begin
    FBorderColor := Value;
    Repaint;
  end;
end;


procedure TRzBorder.SetBorderInner( Value: TFrameStyleEx );
begin
  if FBorderInner <> Value then
  begin
    FBorderInner := Value;
    Repaint;
  end;
end;


procedure TRzBorder.SetBorderOuter( Value: TFrameStyleEx );
begin
  if FBorderOuter <> Value then
  begin
    FBorderOuter := Value;
    Repaint;
  end;
  {&RV}
end;


procedure TRzBorder.SetBorderSides( Value: TSides );
begin
  if FBorderSides <> Value then
  begin
    FBorderSides := Value;
    Repaint;
  end;
end;


procedure TRzBorder.SetBorderWidth( Value: TBorderWidth );
begin
  if FBorderWidth <> Value then
  begin
    FBorderWidth := Value;
    Repaint;
  end;
end;


procedure TRzBorder.SetFlatColor( Value: TColor );
begin
  if FFlatColor <> Value then
  begin
    FFlatColor := Value;
    Invalidate;
  end;
end;


procedure TRzBorder.SetFlatColorAdjustment( Value: Integer );
begin
  if FFlatColorAdjustment <> Value then
  begin
    FFlatColorAdjustment := Value;
    Invalidate;
  end;
end;


procedure TRzBorder.SetBorderHighlight( Value: TColor );
begin
  if FBorderHighlight <> Value then
  begin
    FBorderHighlight := Value;
    Repaint;
  end;
end;


procedure TRzBorder.SetBorderShadow( Value: TColor );
begin
  if FBorderShadow <> Value then
  begin
    FBorderShadow := Value;
    Repaint;
  end;
end;


procedure TRzBorder.AdjustClientRect( var Rect: TRect );

  procedure AdjustRect( var R: TRect; Sides: TSides; N: Integer );
  begin
    if sdLeft in Sides then
      Inc( R.Left, N );
    if sdTop in Sides then
      Inc( R.Top, N );
    if sdRight in Sides then
      Dec( R.Right, N );
    if sdBottom in Sides then
      Dec( R.Bottom, N );
  end;

begin
  InflateRect( Rect, -BorderWidth, -BorderWidth );

  if FBorderOuter = fsFlat then
    AdjustRect( Rect, FBorderSides, 1 )
  else if FBorderOuter in [ fsStatus, fsPopup ] then
    AdjustRect( Rect, FBorderSides, BevelWidth )
  else if FBorderOuter in [ fsGroove..fsButtonUp, fsFlatBold, fsFlatRounded ] then
    AdjustRect( Rect, FBorderSides, 2 );

  if FBorderInner = fsFlat then
    AdjustRect( Rect, FBorderSides, 1 )
  else if FBorderInner in [ fsStatus, fsPopup ] then
    AdjustRect( Rect, FBorderSides, BevelWidth )
  else if FBorderInner in [ fsGroove..fsButtonUp, fsFlatBold, fsFlatRounded ] then
    AdjustRect( Rect, FBorderSides, 2 );

  if ( Rect.Bottom < Rect.Top ) or ( Rect.Right < Rect.Left ) then
    SetRect( Rect, 0, 0, 0, 0 );
end; {= TRzBorder.AdjustClientRect =}


function TRzBorder.GetClientRect: TRect;
begin
  Result := inherited GetClientRect;
  AdjustClientRect( Result );
end;


function TRzBorder.InteriorColor: TColor;
begin
  Result := clYellow;
end;


type
  TWinControlAccess = class( TWinControl );


procedure TRzBorder.Paint;
var
  R: TRect;
begin
  R := Rect( 0, 0, Width, Height );

  if ( csDesigning in ComponentState ) and ( FBorderOuter = fsNone ) and ( FBorderWidth > 0 ) then
  begin
    // Draw dotted line around control at design-time
    Canvas.Pen.Style := psDot;
    Canvas.Pen.Color := clBlack;
    Canvas.Brush.Style := bsClear;
    Canvas.Rectangle( R );
    Canvas.Brush.Style := bsSolid;
    Canvas.Pen.Style := psSolid;
    InflateRect( R, -1, -1 );
  end;

  R := DrawInnerOuterBorders( Canvas, R, FBorderOuter, FBorderInner, BorderWidth, FBorderSides, FBevelWidth,
                              FBorderColor, FBorderHighlight, FBorderShadow,
                              FlatColor, FlatColorAdjustment, InteriorColor, TWinControlAccess( Parent ).Color,
                              not ( csOpaque in ControlStyle ) {i.e. Transparent} );
end; {= TRzBorder.Paint =}


procedure TRzBorder.MouseEnter;
begin
  if Assigned( FOnMouseEnter ) then
    FOnMouseEnter( Self );
end;


procedure TRzBorder.CMMouseEnter( var Msg: TMessage );
begin
  inherited;
  {$IFDEF VCL70_OR_HIGHER}
  if csDesigning in ComponentState then
    Exit;
  {$ENDIF}
  MouseEnter;
end;


procedure TRzBorder.MouseLeave;
begin
  if Assigned( FOnMouseLeave ) then
    FOnMouseLeave( Self );
end;


procedure TRzBorder.CMMouseLeave( var Msg: TMessage );
begin
  inherited;
  MouseLeave;
end;




{=============================}
{== TRzLEDDisplay Constants ==}
{=============================}

type
  TRzLEDValidChars = ' '..'';

  TRzLEDCharMask = record
    Col0: Byte;
    Col1: Byte;
    Col2: Byte;
    Col3: Byte;
    Col4: Byte;
  end;

  TRzLEDCharacters = array[ TRzLEDValidChars ] of TRzLEDCharMask;

const
  DotMasks: TRzLEDCharacters = ( ( { } Col0: $00; Col1: $00; Col2: $00; Col3: $00; Col4: $00 ),
                                 ( {!} Col0: $00; Col1: $00; Col2: $FA; Col3: $00; Col4: $00 ),
                                 ( {"} Col0: $00; Col1: $C0; Col2: $00; Col3: $C0; Col4: $00 ),
                                 ( {#} Col0: $28; Col1: $7C; Col2: $28; Col3: $7C; Col4: $28 ),
                                 ( { } Col0: $24; Col1: $54; Col2: $FE; Col3: $54; Col4: $48 ),  // Dollar sign $
                                 ( {%} Col0: $64; Col1: $68; Col2: $10; Col3: $2C; Col4: $4C ),
                                 ( {&} Col0: $6C; Col1: $92; Col2: $AA; Col3: $44; Col4: $0A ),
                                 ( {'} Col0: $00; Col1: $20; Col2: $C0; Col3: $00; Col4: $00 ),
                                 ( {(} Col0: $00; Col1: $00; Col2: $7C; Col3: $82; Col4: $00 ),
                                 ( {)} Col0: $00; Col1: $82; Col2: $7C; Col3: $00; Col4: $00 ),
                                 ( {*} Col0: $54; Col1: $38; Col2: $FE; Col3: $38; Col4: $54 ),
                                 ( {+} Col0: $10; Col1: $10; Col2: $7C; Col3: $10; Col4: $10 ),
                                 ( {,} Col0: $00; Col1: $02; Col2: $04; Col3: $00; Col4: $00 ),
                                 ( {-} Col0: $10; Col1: $10; Col2: $10; Col3: $10; Col4: $10 ),
                                 ( {.} Col0: $00; Col1: $00; Col2: $02; Col3: $00; Col4: $00 ),
                                 ( {/} Col0: $04; Col1: $08; Col2: $10; Col3: $20; Col4: $40 ),
                                 ( {0} Col0: $7C; Col1: $8A; Col2: $92; Col3: $A2; Col4: $7C ),
                                 ( {1} Col0: $00; Col1: $42; Col2: $FE; Col3: $02; Col4: $00 ),
                                 ( {2} Col0: $46; Col1: $8A; Col2: $92; Col3: $92; Col4: $62 ),
                                 ( {3} Col0: $44; Col1: $92; Col2: $92; Col3: $92; Col4: $6C ),
                                 ( {4} Col0: $F0; Col1: $10; Col2: $10; Col3: $10; Col4: $FE ),
                                 ( {5} Col0: $F4; Col1: $92; Col2: $92; Col3: $92; Col4: $8C ),
                                 ( {6} Col0: $7C; Col1: $92; Col2: $92; Col3: $92; Col4: $4C ),
                                 ( {7} Col0: $C0; Col1: $80; Col2: $8E; Col3: $90; Col4: $E0 ),
                                 ( {8} Col0: $6C; Col1: $92; Col2: $92; Col3: $92; Col4: $6C ),
                                 ( {9} Col0: $64; Col1: $92; Col2: $92; Col3: $92; Col4: $7C ),
                                 ( {:} Col0: $00; Col1: $00; Col2: $24; Col3: $00; Col4: $00 ),
                                 ( {;} Col0: $00; Col1: $02; Col2: $24; Col3: $00; Col4: $00 ),
                                 ( {<} Col0: $10; Col1: $28; Col2: $44; Col3: $82; Col4: $00 ),
                                 ( {=} Col0: $28; Col1: $28; Col2: $28; Col3: $28; Col4: $28 ),
                                 ( {>} Col0: $00; Col1: $82; Col2: $44; Col3: $28; Col4: $10 ),
                                 ( {?} Col0: $40; Col1: $80; Col2: $9A; Col3: $90; Col4: $60 ),
                                 ( {@} Col0: $7C; Col1: $92; Col2: $AA; Col3: $BA; Col4: $70 ),
                                 ( {A} Col0: $7E; Col1: $90; Col2: $90; Col3: $90; Col4: $7E ),
                                 ( {B} Col0: $FE; Col1: $92; Col2: $92; Col3: $92; Col4: $6C ),
                                 ( {C} Col0: $7C; Col1: $82; Col2: $82; Col3: $82; Col4: $44 ),
                                 ( {D} Col0: $FE; Col1: $82; Col2: $82; Col3: $82; Col4: $7C ),
                                 ( {E} Col0: $FE; Col1: $92; Col2: $92; Col3: $92; Col4: $82 ),
                                 ( {F} Col0: $FE; Col1: $90; Col2: $90; Col3: $90; Col4: $80 ),
                                 ( {G} Col0: $7C; Col1: $82; Col2: $92; Col3: $92; Col4: $5C ),
                                 ( {H} Col0: $FE; Col1: $10; Col2: $10; Col3: $10; Col4: $FE ),
                                 ( {I} Col0: $82; Col1: $82; Col2: $FE; Col3: $82; Col4: $82 ),
                                 ( {J} Col0: $04; Col1: $02; Col2: $02; Col3: $02; Col4: $FC ),
                                 ( {K} Col0: $FE; Col1: $10; Col2: $28; Col3: $44; Col4: $82 ),
                                 ( {L} Col0: $FE; Col1: $02; Col2: $02; Col3: $02; Col4: $02 ),
                                 ( {M} Col0: $FE; Col1: $40; Col2: $20; Col3: $40; Col4: $FE ),
                                 ( {N} Col0: $FE; Col1: $20; Col2: $10; Col3: $08; Col4: $FE ),
                                 ( {O} Col0: $7C; Col1: $82; Col2: $82; Col3: $82; Col4: $7C ),
                                 ( {P} Col0: $FE; Col1: $90; Col2: $90; Col3: $90; Col4: $60 ),
                                 ( {Q} Col0: $7C; Col1: $82; Col2: $82; Col3: $86; Col4: $7E ),
                                 ( {R} Col0: $FE; Col1: $90; Col2: $90; Col3: $90; Col4: $6E ),
                                 ( {S} Col0: $64; Col1: $92; Col2: $92; Col3: $92; Col4: $4C ),
                                 ( {T} Col0: $80; Col1: $80; Col2: $FE; Col3: $80; Col4: $80 ),
                                 ( {U} Col0: $FC; Col1: $02; Col2: $02; Col3: $02; Col4: $FC ),
                                 ( {V} Col0: $E0; Col1: $18; Col2: $06; Col3: $18; Col4: $E0 ),
                                 ( {W} Col0: $FC; Col1: $02; Col2: $0C; Col3: $02; Col4: $FC ),
                                 ( {X} Col0: $C6; Col1: $28; Col2: $10; Col3: $28; Col4: $C6 ),
                                 ( {Y} Col0: $C0; Col1: $20; Col2: $1E; Col3: $20; Col4: $C0 ),
                                 ( {Z} Col0: $86; Col1: $8A; Col2: $92; Col3: $A2; Col4: $C2 ),
                                 ( {[} Col0: $00; Col1: $FE; Col2: $82; Col3: $82; Col4: $00 ),
                                 ( {\} Col0: $40; Col1: $20; Col2: $10; Col3: $08; Col4: $04 ),
                                 ( {]} Col0: $00; Col1: $82; Col2: $82; Col3: $FE; Col4: $00 ),
                                 ( {^} Col0: $20; Col1: $40; Col2: $80; Col3: $40; Col4: $20 ),
                                 ( {_} Col0: $02; Col1: $02; Col2: $02; Col3: $02; Col4: $02 ),
                                 ( {`} Col0: $00; Col1: $00; Col2: $C0; Col3: $20; Col4: $00 ),
                                 ( {a} Col0: $04; Col1: $2A; Col2: $2A; Col3: $2A; Col4: $1E ),
                                 ( {b} Col0: $FE; Col1: $22; Col2: $22; Col3: $22; Col4: $1C ),
                                 ( {c} Col0: $1C; Col1: $22; Col2: $22; Col3: $22; Col4: $14 ),
                                 ( {d} Col0: $1C; Col1: $22; Col2: $22; Col3: $22; Col4: $FE ),
                                 ( {e} Col0: $1C; Col1: $2A; Col2: $2A; Col3: $2A; Col4: $18 ),
                                 ( {f} Col0: $10; Col1: $7E; Col2: $90; Col3: $90; Col4: $40 ),
                                 ( {g} Col0: $10; Col1: $2A; Col2: $2A; Col3: $2A; Col4: $1C ),
                                 ( {h} Col0: $FE; Col1: $20; Col2: $20; Col3: $20; Col4: $1E ),
                                 ( {i} Col0: $00; Col1: $22; Col2: $BE; Col3: $02; Col4: $00 ),
                                 ( {j} Col0: $00; Col1: $02; Col2: $BC; Col3: $00; Col4: $00 ),
                                 ( {k} Col0: $FE; Col1: $08; Col2: $08; Col3: $14; Col4: $22 ),
                                 ( {l} Col0: $00; Col1: $82; Col2: $FE; Col3: $02; Col4: $00 ),
                                 ( {m} Col0: $3E; Col1: $20; Col2: $3E; Col3: $20; Col4: $1E ),
                                 ( {n} Col0: $3E; Col1: $20; Col2: $20; Col3: $20; Col4: $1E ),
                                 ( {o} Col0: $1C; Col1: $22; Col2: $22; Col3: $22; Col4: $1C ),
                                 ( {p} Col0: $3E; Col1: $28; Col2: $28; Col3: $28; Col4: $10 ),
                                 ( {q} Col0: $10; Col1: $28; Col2: $28; Col3: $28; Col4: $3E ),
                                 ( {r} Col0: $3E; Col1: $20; Col2: $20; Col3: $20; Col4: $10 ),
                                 ( {s} Col0: $12; Col1: $2A; Col2: $2A; Col3: $2A; Col4: $24 ),
                                 ( {t} Col0: $20; Col1: $FC; Col2: $22; Col3: $22; Col4: $00 ),
                                 ( {u} Col0: $3C; Col1: $02; Col2: $02; Col3: $02; Col4: $3E ),
                                 ( {v} Col0: $38; Col1: $04; Col2: $02; Col3: $04; Col4: $38 ),
                                 ( {w} Col0: $3C; Col1: $02; Col2: $0C; Col3: $02; Col4: $3C ),
                                 ( {x} Col0: $22; Col1: $14; Col2: $08; Col3: $14; Col4: $22 ),
                                 ( {y} Col0: $22; Col1: $14; Col2: $08; Col3: $10; Col4: $20 ),
                                 ( {z} Col0: $22; Col1: $26; Col2: $2A; Col3: $32; Col4: $22 ),
                                 ( { } Col0: $00; Col1: $10; Col2: $6C; Col3: $82; Col4: $00 ),  // {
                                 ( {|} Col0: $00; Col1: $00; Col2: $FE; Col3: $00; Col4: $00 ),
                                 ( { } Col0: $00; Col1: $82; Col2: $6C; Col3: $10; Col4: $00 ),  // }
                                 ( {~} Col0: $40; Col1: $80; Col2: $40; Col3: $20; Col4: $40 ),
//                                 ( {} Col0: $FE; Col1: $92; Col2: $A6; Col3: $CA; Col4: $FE ) );
                                 ( {} Col0: $00; Col1: $7C; Col2: $7C; Col3: $7C; Col4: $00 ) );


{===========================}
{== TRzLEDDisplay Methods ==}
{===========================}


constructor TRzLEDDisplay.Create( AOwner: TComponent );
begin
  inherited;

  ControlStyle := ControlStyle + [ csOpaque ];

  FDotSize := 2;
  Height := 30;
  Width := 100;
  FBackColor := clBlack;
  FSegOnColor := clLime;
  FSegOffColor := $00003300;

  FScrolling := False;
  FSteps := Width;
  FCurrentStep := 0;
  FScrollType := stRightToLeft;

  FScrollDelay := 100;
  FTimer := TTimer.Create( Self );
  FTimer.Enabled := FScrolling;
  FTimer.OnTimer := TimerEventHandler;
  FTimer.Interval := FScrollDelay;

  {&RCI}
  BorderOuter := fsStatus;
end;


destructor TRzLEDDisplay.Destroy;
begin
  FTimer.Free;
  inherited;
end;


procedure TRzLEDDisplay.Loaded;
begin
  inherited;
  SetBounds( Left, Top, Width, Height );
end;


procedure TRzLEDDisplay.DefineProperties( Filer: TFiler );
begin
  inherited;
  // Handle the fact that the SegSpacing and DisplayCells properties were published in version 2.x
  Filer.DefineProperty( 'SegSpacing', TRzOldPropReader.ReadOldIntegerProp, nil, False );
  Filer.DefineProperty( 'DisplayCells', TRzOldPropReader.ReadOldIntegerProp, nil, False );
end;


procedure TRzLEDDisplay.SetBounds( ALeft, ATop, AWidth, AHeight: Integer );
begin
  inherited;
  UpdateDotDimensions;
end;


procedure TRzLEDDisplay.UpdateDotDimensions;
var
  R: TRect;
begin
  R := ClientRect;
  FDotSize := Trunc( ( R.Bottom - R.Top ) / 7.6 );
  if FDotSize < 1 then
    FDotSize := 1;
  FDotGap := Trunc( FDotSize * 0.1 );
  UpdateSteps;
end;


function TRzLEDDisplay.InteriorColor: TColor;
begin
  Result := FBackColor;
end;


procedure TRzLEDDisplay.Paint;
var
  Bmp: TBitmap;
  R, CellRect: TRect;
  X, I, NumCols, Len, CellWidth, CellHeight, BaseX, BaseY: Integer;
begin
  inherited;

  R := ClientRect;
  OffsetRect( R, -R.Left, -R.Top );

  if ( R.Bottom <= R.Top ) or ( R.Right <= R.Left ) or ( R.Bottom - R.Top <= 7 ) then
    Exit;

  // Create Memory Bitmap
  Bmp := TBitmap.Create;
  try
    // Make memory Bitmap same twice as wide as client rect
    Bmp.Height := R.Bottom - R.Top;
    Bmp.Width := R.Right - R.Left;

    // Fill background Color
    Bmp.Canvas.Brush.Color := FBackColor;
    Bmp.Canvas.FillRect( Rect( 0, 0, Bmp.Width, Bmp.Height ) );

    CellWidth := 6 * ( FDotSize + FDotGap );
    CellHeight := 7 * FDotSize + 6 * FDotGap;
    BaseX := R.Left;
    BaseY := R.Top + ( ( R.Bottom - R.Top ) - CellHeight ) div 2;

    // Fill rest of display area with empty LED Dots
    while BaseX < R.Right do
    begin
      SetRect( CellRect, BaseX, BaseY, BaseX + CellWidth, BaseY + CellHeight );
      DrawCell( Bmp.Canvas, CellRect, ' ' );
      BaseX := CellRect.Right;
    end;

    if ( FScrollType = stNone ) or not FScrolling then
      X := 0
    else if FScrollType = stRightToLeft then
    begin
      NumCols := ( ClientRect.Right - ClientRect.Left ) div ( FDotSize + FDotGap );
      X := NumCols * ( FDotSize + FDotGap ) - FCurrentStep;
    end
    else
    begin
      X := - CellWidth * Length( FCaption ) + FCurrentStep;
    end;

    BaseX := R.Left + X;

    // Draw Characters from Caption
    Len := Length( FCaption );
    for I := 1 to Len do
    begin
      SetRect( CellRect, BaseX, BaseY, BaseX + CellWidth, BaseY + CellHeight );
      if Ord( FCaption[ I ] ) in [ 32..126 ] then
        DrawCell( Bmp.Canvas, CellRect, FCaption[ I ] )
      else
        DrawCell( Bmp.Canvas, CellRect, Chr( 127 ) );
      BaseX := CellRect.Right;
    end;

    Canvas.CopyMode := cmSrcCopy;
    Canvas.Draw( ClientRect.Left, ClientRect.Top, Bmp );
  finally
    Bmp.Free;
  end;
end; {= TRzLEDDisplay.Paint =}


procedure TRzLEDDisplay.DrawCell( Canvas: TCanvas; Bounds: TRect; Symbol: Char );
var
  Row, Col, X, Y: Integer;
begin
  for Row := 0 to 6 do
  begin
    Y := Bounds.Top + Row * ( FDotSize + FDotGap );
    for Col := 0 to 5 do
    begin
      X := Bounds.Left + Col * ( FDotSize + FDotGap );
      Canvas.Pen.Color := FBackColor;
      Canvas.Brush.Color := DotColor( Symbol, Col, Row );
      Canvas.Rectangle( X, Y, X + FDotSize + 1, Y + FDotSize + 1 );
    end;
  end;
end; {= TRzLEDDisplay.DrawCell =}


function TRzLEDDisplay.DotColor( Symbol: Char; Col, Row: Integer ): TColor;
var
  ColMask: Byte;
begin
  if Col = 5 then
  begin
    Result := FSegOffColor;
    Exit;
  end;

  case Col of
    0:
    begin
      ColMask := DotMasks[ Symbol ].Col0;
    end;

    1:
    begin
      ColMask := DotMasks[ Symbol ].Col1;
    end;

    2:
    begin
      ColMask := DotMasks[ Symbol ].Col2;
    end;

    3:
    begin
      ColMask := DotMasks[ Symbol ].Col3;
    end;

    else
    begin
      ColMask := DotMasks[ Symbol ].Col4;
    end;
  end;

  if ColMask and ( $80 shr Row ) <> 0 then
    Result := FSegOnColor
  else
    Result := FSegOffColor;
end;


procedure TRzLEDDisplay.SetBevelWidth( Value: TBevelWidth );
begin
  inherited;
  UpdateDotDimensions;
end;


procedure TRzLEDDisplay.SetBorderInner( Value: TFrameStyleEx );
begin
  inherited;
  UpdateDotDimensions;
end;


procedure TRzLEDDisplay.SetBorderOuter( Value: TFrameStyleEx );
begin
  inherited;
  UpdateDotDimensions;
end;


procedure TRzLEDDisplay.SetBorderSides( Value: TSides );
begin
  inherited;
  UpdateDotDimensions;
end;


procedure TRzLEDDisplay.SetBorderWidth( Value: TBorderWidth );
begin
  inherited;
  UpdateDotDimensions;
end;


procedure TRzLEDDisplay.SetBackColor( Value: TColor );
begin
  if FBackColor <> Value then
  begin
    FBackColor := Value;
    Repaint;
  end;
end;


procedure TRzLEDDisplay.SetSegOnColor( Value: TColor );
begin
  if FSegOnColor <> Value then
  begin
    FSegOnColor := Value;
    Repaint;
  end;
end;


procedure TRzLEDDisplay.SetSegOffColor( Value: TColor );
begin
  if FSegOffColor <> Value then
  begin
    FSegOffColor := Value;
    Repaint;
  end;
end;


procedure TRzLEDDisplay.SetCaption( const Value: TCaption );
begin
  {&RV}
  if FCaption <> Value then
  begin
    FCaption := Value;
    Perform( cm_TextChanged, 0, 0 );
    Repaint;
  end;
end;


procedure TRzLEDDisplay.SetScrollType( Value: TRzScrollType );
begin
  if FScrollType <> Value then
  begin
    FScrollType := Value;
    FTimer.Enabled := FScrollType <> stNone;
    Invalidate;
  end;
end;


procedure TRzLEDDisplay.SetScrolling( Value: Boolean );
begin
  if FScrolling <> Value then
  begin
    FScrolling := Value;
    FTimer.Enabled := FScrolling;
    if not FScrolling then
      FCurrentStep := 0;
    Invalidate;
  end;
end;


procedure TRzLEDDisplay.SetScrollDelay( Value: Word );
begin
  if FScrollDelay <> Value then
  begin
    FScrollDelay := Value;
    if FTimer <> nil then
      FTimer.Interval := FScrollDelay;
  end;
end;


procedure TRzLEDDisplay.TimerEventHandler( Sender: TObject );
begin
  if not FTimer.Enabled then
    Exit;

  Inc( FCurrentStep, FDotSize + FDotGap );

  Paint;

  if FCurrentStep >= FSteps then
  begin
    FCurrentStep := 0;
    ScrollComplete;
  end;
end;


procedure TRzLEDDisplay.CMTextChanged( var Msg: TMessage );
begin
  inherited;
  UpdateSteps;
  Invalidate;
end;


procedure TRzLEDDisplay.UpdateSteps;
begin
  FSteps := 6 * ( FDotSize + FDotGap ) * Length( FCaption ) + Width;
end;


procedure TRzLEDDisplay.ScrollComplete;
begin
  if Assigned( FOnScrollComplete ) then
    FOnScrollComplete( Self );
end;


{======================}
{== TRzMeter Methods ==}
{======================}

constructor TRzMeter.Create( AOwner: TComponent );
begin
  inherited;

  ControlStyle := ControlStyle + [ csFramed, csOpaque ];

  BorderOuter := fsStatus;
  Height := 30;
  Width := 150;

  FMin := 0;
  FMax := 100;
  FValue := 0;
  FBarColor := clRed;
  FBackColor := clBlack;

  FDirection := dirRight;
  FShowPercent := True;

  FMeterType := mtLED;
  FMeterShape := msRectangular;
  FTrapDirect := tdLargeToSmall;
  FTrapShape := tsCenter;
  FTrapMin := 6;

  FSegSpacing := 2;
  FSegOffColor := clBlack;

  FSegCount[ 0 ] := 5;
  FSegColor[ 0 ] := clGreen;
  FSegCount[ 1 ] := 3;
  FSegColor[ 1 ] := clYellow;
  FSegCount[ 2 ] := 2;
  FSegColor[ 2 ] := clRed;

  FBitmap := TBitmap.Create;
  FBitmap.Width := 0;
  FBitmap.Height := 0;
  FBitmap.OnChange := BitmapChangedHandler;
  {&RCI}
end; {= TRzMeter.Create =}


destructor TRzMeter.Destroy;
begin
  FBitmap.free;
  inherited;
end;


function TRzMeter.GetPercent: Integer;
begin
  Result := ( ( FValue - FMin ) * 100 ) div ( FMax - FMin );
end;


function TRzMeter.InteriorColor: TColor;
begin
  Result := FBackColor;
end;


procedure TRzMeter.Paint;
var
  Bmp: TBitmap;
  R: TRect;
  Trap, TmpTrap: TTrap;
begin
  if ( Height < 4 ) or ( Width < 4 ) then
    Exit;

  if FMeterShape = msRectangular then
    inherited;

  with Canvas do
  begin
    Bmp := TBitmap.Create;                              { Create Memory Bitmap }
    try
      if FMeterShape = msRectangular then
        R := ClientRect
      else
        R := Rect( 0, 0, Width, Height );

      { Make memory Bitmap same size as client rect }
      Bmp.Height := R.Bottom - R.Top;
      Bmp.Width := R.Right - R.Left;

      { Fill background Color }
      if FMeterShape = msRectangular then
        Bmp.Canvas.Brush.Color := FBackColor
      else
        Bmp.Canvas.Brush.Color := clBtnFace;

      Bmp.Canvas.FillRect( Rect( 0, 0, Bmp.Width, Bmp.Height ) );

      if BorderOuter in [ fsLowered, fsRaised ] then
      begin
        if FMeterShape = msTrapezoidal then
        begin
          SetTrapezoid( Trap, R, FTrapMin, FTrapShape, FDirection, FTrapDirect );
          if FBackColor <> clBtnFace then
          begin
            TmpTrap := Trap;
            Bmp.Canvas.Brush.Color := FBackColor;

            TmpTrap.UpperRight.x := TmpTrap.UpperRight.x - 1;
            TmpTrap.LowerLeft.y := TmpTrap.LowerLeft.y - 1;
            TmpTrap.LowerRight.y := TmpTrap.LowerRight.y - 1;
            TmpTrap.LowerRight.x := TmpTrap.LowerRight.x - 1;

            Bmp.Canvas.Polygon( [ TmpTrap.UpperLeft, TmpTrap.UpperRight,
                                  TmpTrap.LowerRight, TmpTrap.LowerLeft ] );
          end;
          DrawTrapezoidBorder( Bmp.Canvas, Trap, bsLowered, BevelWidth )
        end;

        FBWidth := FBevelWidth;
        InflateRect( R, -FBevelWidth, -FBevelWidth );
      end
      else
        FBWidth := 0;

      { Draw Bar }
      if FMeterShape = msRectangular then
      begin
        OffsetRect( R, -ClientRect.Left, -ClientRect.Top );
        Dec( R.Left );
        Dec( R.Top );
      end;

      case FMeterType of
        mtNormal, mtBar3D:
          DrawStandardBar( Bmp.Canvas, R );

        mtLED:
          DrawLEDBar( Bmp.Canvas, R );
      end;

      { Transfer to screen }
      CopyMode := cmSrcCopy;
      if FMeterShape = msRectangular then
        Draw( ClientRect.Left, ClientRect.Top, Bmp )
      else
        Draw( 0, 0, Bmp );

    finally
      Bmp.Free;
    end;
  end;
end; {= TRzMeter.Paint =}


procedure TRzMeter.DrawStandardBar( Canvas: TCanvas; Bounds: TRect );
var
  Coord: Longint;                 { Needed for Large Ranges, conversion errors }
  Str: string[ 15 ];
  TmpRect: TRect;
  Trap: TTrap;
  TmpTrap: TTrap;
  Percent: Integer;
  X, Y: Integer;
  Rgn: THandle;
  Points: array[ 0..3 ] of TPoint;   { Segment color info (limit to 3 colors)  }
begin
  TmpRect := ClientRect;

  if ( FMeterShape = msTrapezoidal ) and ( FTrapDirect = tdSmallToLarge ) then
  begin
    SetTrapezoid( TmpTrap, TmpRect, FTrapMin, FTrapShape, FDirection, FTrapDirect );
    SetTrapezoid( Trap, Bounds, FTrapMin - ( FBWidth * 2 ), FTrapShape, FDirection, FTrapDirect );
  end;

  case FDirection of
    dirRight:
    begin
      Coord := Bounds.Right;
      Bounds.Right := Word( ( Coord * (FValue - FMin) ) div (FMax - FMin) );
      TmpRect.Right := Bounds.Right;

      if Bounds.Right < Bounds.Left then
        Bounds.Right := Bounds.Left
    end;

    dirDown:
    begin
      Coord := Bounds.Bottom;
      Bounds.Bottom := Word( ( Coord * (FValue - FMin) ) div (FMax - FMin) );
      TmpRect.Bottom := Bounds.Bottom;

      if Bounds.Bottom < Bounds.Top then
        Bounds.Bottom := Bounds.Top
    end;

    dirUp:
    begin
      Coord := Bounds.Bottom;
      Bounds.Top := Word( ( Bounds.Bottom + Bounds.Top ) - ( Coord * (FValue - FMin) ) div (FMax - FMin) );

      if Bounds.Top > Bounds.Bottom then
        Bounds.Top := Bounds.Bottom;
      TmpRect.Top := Bounds.Top;
    end;

    dirLeft:
    begin
      Coord := Bounds.Right;
      Bounds.Left := Word( ( Bounds.Right + Bounds.Left ) - ( Coord * (FValue - FMin) ) div (FMax - FMin) );

      if Bounds.Left > Bounds.Right then
        Bounds.Left := Bounds.Right;
      TmpRect.Left := Bounds.Left;
    end;
  end; { case }

  if ( FMeterShape = msTrapezoidal ) and ( FTrapDirect = tdSmallToLarge ) then
  begin
    TmpTrap := AdjustTrapezoid( TmpTrap, TmpRect, FDirection );
    Trap := AdjustTrapezoid( Trap, Bounds, FDirection );
  end;

  if ( FBitmap.Width <> 0 ) and ( FBitmap.Height <> 0 ) then
  begin
    if FMeterShape = msRectangular then
    begin
      { Draw surface with given bitmap. }
      TileBitmap( Canvas, FBitmap, Bounds );
    end
    else
    begin
      if FTrapDirect = tdLargeToSmall then
        SetTrapezoid( Trap, Bounds, FTrapMin - ( FBWidth * 2 ), FTrapShape, FDirection, FTrapDirect );

      Trap.UpperRight.x := Trap.UpperRight.x - 1;
      Trap.LowerLeft.y := Trap.LowerLeft.y - 1;
      Trap.LowerRight.y := Trap.LowerRight.y - 1;
      Trap.LowerRight.x := Trap.LowerRight.x - 1;

      if FValue > 0 then
      begin
        Points[ 0 ] := Trap.UpperLeft;
        Points[ 1 ] := Trap.UpperRight;
        Points[ 2 ] := Trap.LowerRight;
        Points[ 3 ] := Trap.LowerLeft;

        Rgn := CreatePolygonRgn( Points, 4, WINDING );
        SelectClipRgn( Canvas.Handle, Rgn );

        TileBitmap( Canvas, FBitmap, Bounds );

        SelectClipRgn( Canvas.Handle, 0 );
        DeleteObject( Rgn );
      end;
    end;
  end
  else { if FBitmap.Width = 0 or FBitmap.Height = 0 }
  begin
    Canvas.Brush.Style := FBrushStyle;
    Canvas.Brush.color := FBarColor;
    Canvas.Pen.color := FBarColor;

    if FBrushStyle <> bsSolid then
    begin
      if FMeterShape = msRectangular then
      begin
        Canvas.Rectangle( Bounds.Left, Bounds.Top, Bounds.Right, Bounds.Bottom );
      end
      else
      begin
        if FTrapDirect = tdLargeToSmall then
          SetTrapezoid( Trap, Bounds, FTrapMin - ( FBWidth * 2 ), FTrapShape, FDirection, FTrapDirect );

        Trap.UpperRight.x := Trap.UpperRight.x - 1;
        Trap.LowerLeft.y := Trap.LowerLeft.y - 1;
        Trap.LowerRight.y := Trap.LowerRight.y - 1;
        Trap.LowerRight.x := Trap.LowerRight.x - 1;

        if FValue > 0 then
          Canvas.Polygon( [ Trap.UpperLeft, Trap.UpperRight,
                            Trap.LowerRight, Trap.LowerLeft ] );
      end;
    end
    else if FMeterShape = msRectangular then
      Canvas.FillRect( Bounds )
    else
    begin
      if FTrapDirect = tdLargeToSmall then
        SetTrapezoid( Trap, Bounds, FTrapMin - ( FBWidth * 2 ), FTrapShape, FDirection, FTrapDirect );

      Trap.UpperRight.x := Trap.UpperRight.x - 1;
      Trap.LowerLeft.y := Trap.LowerLeft.y - 1;
      Trap.LowerRight.y := Trap.LowerRight.y - 1;
      Trap.LowerRight.x := Trap.LowerRight.x - 1;

      if FValue > 0 then
        Canvas.Polygon( [ Trap.UpperLeft, Trap.UpperRight,
                          Trap.LowerRight, Trap.LowerLeft ] );
    end;

  end;

   { Put 3D shadow around bar if mtBar3D }

  if FMeterType = mtBAR3D then
  begin
    if ( ( TmpRect.Right - TmpRect.Left ) > ( FBevelWidth * 2 ) ) and
       ( ( TmpRect.Bottom - TmpRect.Top ) > ( FBevelWidth * 2 ) ) then
    begin
      if FMeterShape = msRectangular then
      begin
        DrawBevel( Canvas, Bounds, clBtnHighlight, clBtnShadow, FBevelWidth, sdAllSides );
      end
      else
      begin
        if FTrapDirect = tdLargeToSmall then
          SetTrapezoid( TmpTrap, tmpRect, FTrapMin, FTrapShape, FDirection, FTrapDirect );

        DrawTrapezoidBorder( Canvas, TmpTrap, bsRaised, FBevelWidth );
      end;
    end;
  end;

  { Display % text  }
  if FShowPercent = True then
  begin
    { 100% check done just in case }
    Percent := ( ( ( FValue - FMin ) * 100 ) div ( FMax - FMin ) );

    Str := Format( '%d%%', [ Percent ] );

    Canvas.Brush.Style := bsClear;
    Canvas.Font := Self.Font;

    X := ( ( ClientRect.Right - ClientRect.Left ) - Canvas.TextWidth( Str ) ) div 2;
    Y := ( ( ClientRect.Bottom - ClientRect.Top ) - Canvas.TextHeight( Str ) ) div 2;

    Canvas.TextOut( X, Y, Str );
  end;
end; {= TRzMeter.DrawStandardBar =}


{=============================================================================}
{ Draws a LED Style Bar                                                       }
{=============================================================================}

procedure TRzMeter.DrawLEDBar( Canvas: TCanvas; Bounds: TRect );
var
  NumLeds, W, H, BaseX, BaseY, Count, I, Idx: Integer;
  FirstTime: boolean;
  R: TRect;
  Trap: TTrap;
  OrigTrap: TTrap;
  FNumSegments: TPositiveByte;
begin
  BaseX := 0;
  BaseY := 0;
  W := 0;
  H := 0;

  { Calculate Number of LED's to light. }
  FNumSegments := FSegCount[ 0 ] + FSegCount[ 1 ] + FSegCount[ 2 ];
  NumLeds := ( FNumSegments * ( FValue - FMin ) ) div ( FMax - FMin );

  { Put spacing around LED's }
  if FMeterShape = msTrapezoidal then
  begin
    SetTrapezoid( OrigTrap, Bounds, FTrapMin - ( FBWidth * 2 ), FTrapShape, FDirection, FTrapDirect );
    InflateTrapezoid( OrigTrap, -FSegSpacing );
  end;

  InflateRect( Bounds, -FSegSpacing, -FSegSpacing );

  { Setup outline pen }
  Canvas.Pen.Style := psSolid;
  Canvas.Pen.Width := 1;
  Canvas.Pen.Color := clBlack;

  Canvas.Brush.Color := FSegColor[ 0 ];

  case FDirection of
    dirRight:
    begin
      W := ( ( Bounds.Right - Bounds.Left ) - ( FSegSpacing * ( FNumSegments - 2 ) ) ) div FNumSegments;
      H := Bounds.Bottom - Bounds.Top;
      BaseX := Bounds.Left;
      BaseY := Bounds.Top;
    end;

    dirDown:
    begin
      H := ( ( Bounds.Bottom - Bounds.Top ) - ( FSegSpacing * ( FNumSegments - 2 ) ) ) div FNumSegments;
      W := Bounds.Right - Bounds.Left;
      BaseX := Bounds.Left;
      BaseY := Bounds.Top;
    end;

    dirUp:
    begin
      W := Bounds.Right - Bounds.Left;
      H := ( ( Bounds.Bottom - Bounds.Top ) - ( FSegSpacing * ( FNumSegments - 2 ) ) ) div FNumSegments;
      BaseX := Bounds.Left;
      BaseY := Bounds.Bottom - H;
    end;

    dirLeft:
    begin
      H := Bounds.Bottom - Bounds.Top;
      W := ( ( ( Bounds.Right - Bounds.Left ) - ( FSegSpacing * ( FNumSegments - 2 ) ) ) div FNumSegments );
      BaseX := Bounds.Right - W;
      BaseY := Bounds.Top;
    end;
  end; { case }

  Count := 0;
  Idx := 0;
  FirstTime := True;

  for I := 0 to FNumSegments - 1 do
  begin
    if I >= NumLeds then                            { Only color up to NumLeds }
    begin
      if FirstTime then
      begin
        FirstTime := False;
        Canvas.Brush.Color := FSegOffColor;
      end;
    end
    else
    begin
      { Check for only 3 segment colors }
      if ( Idx < 3 ) and ( Count >= FSegCount[ Idx ] ) then
      begin
        Inc( Idx );
        if Idx < 3 then
        begin
          Count := 0;
          Canvas.Brush.Color := FSegColor[ Idx ];
        end;
      end;
    end;

    if FMeterShape = msRectangular then
    begin
      {Canvas.Rectangle( BaseX, BaseY, BaseX + W, BaseY + H );}
      R := Rect( BaseX + 1, BaseY + 1, BaseX + W - 1, BaseY + H - 1 );
      Canvas.FillRect( R );
    end
    else
    begin
      Bounds.Left := BaseX;
      Bounds.Top := BaseY;
      Bounds.Right := BaseX + W;
      Bounds.Bottom := BaseY + H;

      Trap := AdjustTrapezoid( OrigTrap, Bounds, FDirection );

      Trap.UpperRight.X := Trap.UpperRight.x - 1;
      Trap.LowerLeft.Y := Trap.LowerLeft.y - 1;
      Trap.LowerRight.Y := Trap.LowerRight.y - 1;
      Trap.LowerRight.X := Trap.LowerRight.x - 1;

      Canvas.Polygon( [ Trap.UpperLeft, Trap.UpperRight,
                        Trap.LowerRight, Trap.LowerLeft ] );
    end;

    case FDirection of
      dirUp:
        BaseY := BaseY - ( H + FSegSpacing );

      dirRight:
        BaseX := BaseX + ( W + FSegSpacing );

      dirDown:
        BaseY := BaseY + ( H + FSegSpacing );

      dirLeft:
        BaseX := BaseX - ( W + FSegSpacing );
    end;

    Inc( Count );
  end;
end; {= DrawLEDBar =}


procedure TRzMeter.SetMin( Value: Integer );
begin
  if FMin <> Value then
  begin
    FMin := Value;
    Repaint;
  end;
end;

procedure TRzMeter.SetMax( Value: Integer );
begin
  if FMax <> Value then
  begin
    FMax := Value;
    Repaint;
  end;
end;

procedure TRzMeter.SetValue( Value: Integer );
begin
  if FValue <> Value then
  begin

    if Value < FMin then
      FValue := FMin
    else
      if Value > FMax then
      FValue := FMax
    else
      FValue := Value;

    Repaint;
  end;
  {&RV}
end;

procedure TRzMeter.SetBackColor( Value: TColor );
begin
  if FBackColor <> Value then
  begin
    FBackColor := Value;
    Repaint;
  end;
end;


procedure TRzMeter.SetMeterType( Value: TRzMeterType );
begin
  if FMeterType <> Value then
  begin
    FMeterType := Value;
    Repaint;
  end;
end;


procedure TRzMeter.SetDirection( Value: TDirection );
begin
  if FDirection <> Value then
  begin
    FDirection := Value;
    Repaint;
  end;
end;

procedure TRzMeter.SetMeterShape( Value: TRzMeterShape );
begin
  if FMeterShape <> Value then
  begin
    FMeterShape := Value;
    Repaint;
  end;
end;

procedure TRzMeter.SetTrapDirect( Value: TTrapDirect );
begin
  if FTrapDirect <> Value then
  begin
    FTrapDirect := Value;
    Repaint;
  end;
end;

procedure TRzMeter.SetTrapShape( Value: TTrapShape );
begin
  if FTrapShape <> Value then
  begin
    FTrapShape := Value;
    Repaint;
  end;
end;

procedure TRzMeter.SetTrapMin( Value: Integer );
begin
  if FTrapMin <> Value then
  begin
    FTrapMin := Value;
    Repaint;
  end;
end;


procedure TRzMeter.BitmapChangedHandler( Sender: TObject );
begin
  Repaint;
end;


procedure TRzMeter.SetBitmap( Value: TBitmap );
begin
  FBitmap.Assign( Value );
end;


procedure TRzMeter.SetBrush( Value: TBrushStyle );
begin
  if FBrushStyle <> Value then
  begin
    FBrushStyle := Value;
    Repaint;
  end;
end;

procedure TRzMeter.SetShowPercent( Value: Boolean );
begin
  if FShowPercent <> Value then
  begin
    FShowPercent := Value;
    Repaint;
  end;
end;

procedure TRzMeter.SetBarColor( Value: TColor );
begin
  if FBarColor <> Value then
  begin
    FBarColor := Value;
    Repaint;
  end;
end;

procedure TRzMeter.SetSegSpacing( Value: Byte );
begin
  if FSegSpacing <> Value then
  begin
    FSegSpacing := Value;
    Repaint;
  end;
end;

procedure TRzMeter.SetSegOffColor( Value: TColor );
begin
  if FSegOffColor <> Value then
  begin
    FSegOffColor := Value;
    Repaint;
  end;
end;


function TRzMeter.GetSegCount( Index: Integer ): TPositiveByte;
begin
  Result := FSegCount[ Index ];
end;

procedure TRzMeter.SetSegCount( Index: Integer; Value: TPositiveByte );
begin
  if Value <> FSegCount[ Index ] then
  begin
    FSegCount[ Index ] := Value;
    Repaint;
  end;
end;


function TRzMeter.GetSegColor( Index: Integer ): TColor;
begin
  Result := FSegColor[ Index ];
end;

procedure TRzMeter.SetSegColor( Index: Integer; Value: TColor );
begin
  if Value <> FSegColor[ Index ] then
  begin
    FSegColor[ Index ] := Value;
    Repaint;
  end;
end;

procedure TRzMeter.AddValue( Number: Longint );
begin
  Value := FValue + Number;
  Repaint;
end;


{==============================}
{== TRzColorPicker Constants ==}
{==============================}

type
  TColorData = record
    Color: TColor;
    Name: string;
  end;

const
  sciNoColor    = -1;
  sciCustom     = -2;
  sciCustomPick = -3;
  sciDefault    = -4;
  sciBlankCell  = -5;
  sciNone       = -6;

  StockColorsCount = 40;
  TotalColorsCount = 70;
  ColorSwatches: array[ 0..TotalColorsCount - 1 ] of TColorData =
    ( ( Color: $00000000;                 Name: sRzColorBlack ),
      ( Color: $00003399;                 Name: sRzColorBrown ),
      ( Color: $00003333;                 Name: sRzColorOliveGreen ),
      ( Color: $00003300;                 Name: sRzColorDarkGreen ),
      ( Color: $00663300;                 Name: sRzColorDarkTeal ),
      ( Color: $00800000;                 Name: sRzColorDarkBlue ),
      ( Color: $00993333;                 Name: sRzColorIndigo ),
      ( Color: $00333333;                 Name: sRzColorGray80 ),

      ( Color: $00000080;                 Name: sRzColorDarkRed ),
      ( Color: $000066FF;                 Name: sRzColorOrange ),
      ( Color: $00008080;                 Name: sRzColorDarkYellow ),
      ( Color: $00008000;                 Name: sRzColorGreen ),
      ( Color: $00808000;                 Name: sRzColorTeal ),
      ( Color: $00FF0000;                 Name: sRzColorBlue ),
      ( Color: $00996666;                 Name: sRzColorBlueGray ),
      ( Color: $00808080;                 Name: sRzColorGray50 ),

      ( Color: $000000FF;                 Name: sRzColorRed ),
      ( Color: $000099FF;                 Name: sRzColorLightOrange ),
      ( Color: $0000CC99;                 Name: sRzColorLime ),
      ( Color: $00669933;                 Name: sRzColorSeaGreen ),
      ( Color: $00999933;                 Name: sRzColorAqua ),
      ( Color: $00FF6633;                 Name: sRzColorLightBlue ),
      ( Color: $00800080;                 Name: sRzColorViolet ),
      ( Color: $00999999;                 Name: sRzColorGray40 ),

      ( Color: $00FF00FF;                 Name: sRzColorPink ),
      ( Color: $0000CCFF;                 Name: sRzColorGold ),
      ( Color: $0000FFFF;                 Name: sRzColorYellow ),
      ( Color: $0000FF00;                 Name: sRzColorBrightGreen ),
      ( Color: $00FFFF00;                 Name: sRzColorTurquoise),
      ( Color: $00FFCC00;                 Name: sRzColorSkyBlue ),
      ( Color: $00663399;                 Name: sRzColorPlum ),
      ( Color: $00C0C0C0;                 Name: sRzColorGray25 ),

      ( Color: $00CC99FF;                 Name: sRzColorRose ),
      ( Color: $0099CCFF;                 Name: sRzColorTan ),
      ( Color: $0099FFFF;                 Name: sRzColorLightYellow ),
      ( Color: $00CCFFCC;                 Name: sRzColorLightGreen ),
      ( Color: $00FFFFCC;                 Name: sRzColorLightTurquoise ),
      ( Color: $00FFCC99;                 Name: sRzColorPaleBlue ),
      ( Color: $00FF99CC;                 Name: sRzColorLavender ),
      ( Color: $00FFFFFF;                 Name: sRzColorWhite ),

      ( Color: clScrollBar;               Name: sRzColorScrollBar ),
      ( Color: clBackground;              Name: sRzColorBackground ),
      ( Color: clActiveCaption;           Name: sRzColorActiveCaption ),
      ( Color: clInactiveCaption;         Name: sRzColorInactiveCaption ),
      ( Color: clMenu;                    Name: sRzColorMenu ),
      ( Color: clWindow;                  Name: sRzColorWindow ),
      ( Color: clWindowFrame;             Name: sRzColorWindowFrame ),
      ( Color: clMenuText;                Name: sRzColorMenuText ),
      ( Color: clWindowText;              Name: sRzColorWindowText ),
      ( Color: clCaptionText;             Name: sRzColorCaptionText ),
      ( Color: clActiveBorder;            Name: sRzColorActiveBorder ),
      ( Color: clInactiveBorder;          Name: sRzColorInactiveBorder ),
      ( Color: clAppWorkSpace;            Name: sRzColorAppWorkSpace ),
      ( Color: clHighlight;               Name: sRzColorHighlight ),
      ( Color: clHighlightText;           Name: sRzColorHighlightText ),
      ( Color: clBtnFace;                 Name: sRzColorBtnFace ),
      ( Color: clBtnShadow;               Name: sRzColorBtnShadow ),
      ( Color: clGrayText;                Name: sRzColorGrayText ),
      ( Color: clBtnText;                 Name: sRzColorBtnText ),
      ( Color: clInactiveCaptionText;     Name: sRzColorInactiveCaptionText ),
      ( Color: clBtnHighlight;            Name: sRzColorBtnHighlight ),
      ( Color: cl3DDkShadow;              Name: sRzColor3DDkShadow ),
      ( Color: cl3DLight;                 Name: sRzColor3DLight ),
      ( Color: clInfoText;                Name: sRzColorInfoText ),
      ( Color: clInfoBk;                  Name: sRzColorInfoBk ),
      ( Color: clHotLight;                Name: sRzColorHotLight ),
      ( Color: clGradientActiveCaption;   Name: sRzColorGradientActiveCaption ),
      ( Color: clGradientInactiveCaption; Name: sRzColorGradientInactiveCaption ),
      ( Color: clMenuHighlight;           Name: sRzColorMenuHighlight ),
      ( Color: clMenuBar;                 Name: sRzColorMenuBar ) );


{============================}
{== TRzColorPicker Methods ==}
{============================}

constructor TRzColorPicker.Create( AOwner: TComponent );
var
  C: DWord;
  ElementDetails: TThemedElementDetails;
begin
  inherited;

  ControlStyle := ControlStyle + [ csOpaque ];
  AutoSize := True;
  BorderWidth := 2;
  Color := clWindow;
  FlatColorAdjustment := 0;
  BorderColor := clWindow;
  ParentColor := False;

  FThemeBorderColor := clBtnShadow;
  if ThemeServices.ThemesEnabled then
  begin
    ElementDetails := ThemeServices.GetElementDetails( teEditRoot );
    GetThemeColor( ThemeServices.Theme[ teEdit ], ElementDetails.Part, ElementDetails.State, TMT_BORDERCOLOR, C );
    FThemeBorderColor := C;
    BorderOuter := fsFlat;
    FlatColor := FThemeBorderColor;
    FlatColorAdjustment := 0;
  end
  else
    BorderOuter := fsLowered;

  FSelColorIndex := sciNoColor;
  FHighlightColorIndex := sciNone;

  FShowNoColor := False;
  FShowDefaultColor := False;
  FShowSystemColors := False;
  FShowCustomColor := False;
  FColorDlgOptions := [ cdFullOpen ];
  FCustomColor := clWhite;
  FDefaultColor := clHighlight;
  FShowColorHints := True;
end;


procedure TRzColorPicker.Loaded;
begin
  inherited;

  if ThemeServices.ThemesEnabled then
  begin
    // Override any streamed out values read in from the DFM file
    BorderOuter := fsFlat;
    FlatColor := FThemeBorderColor;
    FlatColorAdjustment := 0;
  end;
end;


procedure TRzColorPicker.Notification( AComponent: TComponent; Operation: TOperation );
begin
  inherited;

  if ( Operation = opRemove ) and ( AComponent = FCustomColors ) then
    FCustomColors := nil;
end;


function TRzColorPicker.InteriorColor: TColor;
begin
  Result := Color;
end;


procedure TRzColorPicker.Paint;
var
  CW, CH, CellX, CellY, CellIndex, Col, Row: Integer;
  R, CellRect: TRect;
  TopOffset, AdjHeight: Integer;
  ElementDetails: TThemedElementDetails;


  procedure DrawNoColorArea;
  var
    R, CR: TRect;
    S: string;
  begin
    R := Rect( ClientRect.Left, ClientRect.Top, ClientRect.Left + CW, TopOffset );
    CR := R;
    InflateRect( R, -3, -3 );

    if FSelColorIndex = sciNoColor  then
    begin
      Canvas.Brush.Color := clWindow;
      Canvas.FillRect( CR );
      if ThemeServices.ThemesEnabled then
      begin
        ElementDetails := ThemeServices.GetElementDetails( ttbButtonChecked );
        ThemeServices.DrawElement( Canvas.Handle, ElementDetails, CR );
      end
      else
        DrawBevel( Canvas, CR, clHighlight, clHighlight, 1, sdAllSides );
    end
    else if FHighlightColorIndex = sciNoColor  then
    begin
      if ThemeServices.ThemesEnabled then
      begin
        ElementDetails := ThemeServices.GetElementDetails( ttbButtonHot );
        ThemeServices.DrawElement( Canvas.Handle, ElementDetails, CR );
        SetBkMode( Canvas.Handle, Windows.Transparent );
        if FNoColorCaption <> '' then
          S := FNoColorCaption
        else
          S := sRzNoColorCaption;
        DrawText( Canvas.Handle, PChar( S ), -1, R, dt_Center or dt_VCenter or dt_SingleLine );
        ExcludeClipRect( Canvas.Handle, CR.Left, CR.Top, CR.Right, CR.Bottom );
      end
      else
        DrawEdge( Canvas.Handle, CR, bdr_RaisedOuter, bf_Flat or bf_Rect or bf_Middle or bf_Soft );
    end
    else
      CR := R;

    DrawEdge( Canvas.Handle, R, bdr_RaisedOuter, bf_Rect or bf_Flat or bf_Middle );
    SetBkMode( Canvas.Handle, Windows.Transparent );
    if FNoColorCaption <> '' then
      S := FNoColorCaption
    else
      S := sRzNoColorCaption;
    DrawText( Canvas.Handle, PChar( S ), -1, R, dt_Center or dt_VCenter or dt_SingleLine );
    ExcludeClipRect( Canvas.Handle, CR.Left, CR.Top, CR.Right, CR.Bottom );
  end; {= DrawNoColorArea =}


  procedure DrawDefaultColorArea;
  var
    AreaRect, BtnRect, SampleRect, CellRect: TRect;
    S: string;
  begin
    AreaRect := Rect( ClientRect.Left, TopOffset - Margin, ClientRect.Left + CW, TopOffset );
    BtnRect := AreaRect;
    BtnRect.Right := CW - Margin;
    SampleRect := AreaRect;
    SampleRect.Left := BtnRect.Right;
    InflateRect( BtnRect, -3, -3 );

    CellRect := SampleRect;
    InflateRect( CellRect, -4, -4 );
    Canvas.Brush.Color := FDefaultColor;
    Canvas.FillRect( CellRect );
    InflateRect( CellRect, 1, 1 );
    DrawEdge( Canvas.Handle, CellRect, bdr_RaisedOuter, bf_Rect or bf_Flat );
    ExcludeClipRect( Canvas.Handle, CellRect.Left, CellRect.Top, CellRect.Right, CellRect.Bottom );

    if FSelColorIndex = sciDefault then
    begin
      Canvas.Brush.Color := clWindow;
      Canvas.FillRect( SampleRect );
      if ThemeServices.ThemesEnabled then
      begin
        ElementDetails := ThemeServices.GetElementDetails( ttbButtonChecked );
        ThemeServices.DrawElement( Canvas.Handle, ElementDetails, SampleRect );
      end
      else
        DrawBevel( Canvas, SampleRect, clHighlight, clHighlight, 1, sdAllSides );
      ExcludeClipRect( Canvas.Handle, SampleRect.Left, SampleRect.Top, SampleRect.Right, SampleRect.Bottom );
    end
    else if FHighlightColorIndex = sciDefault then
    begin
      if ThemeServices.ThemesEnabled then
      begin
        ElementDetails := ThemeServices.GetElementDetails( ttbButtonHot );
        ThemeServices.DrawElement( Canvas.Handle, ElementDetails, AreaRect );
        SetBkMode( Canvas.Handle, Windows.Transparent );
        if FDefaultColorCaption <> '' then
          S := FDefaultColorCaption
        else
          S := sRzDefaultColorCaption;
        DrawText( Canvas.Handle, PChar( S ), -1, BtnRect, dt_Center or dt_VCenter or dt_SingleLine );
      end
      else
        DrawEdge( Canvas.Handle, AreaRect, bdr_RaisedOuter, bf_Flat or bf_Rect or bf_Soft );
      ExcludeClipRect( Canvas.Handle, AreaRect.Left, AreaRect.Top, AreaRect.Right, AreaRect.Bottom );
    end;

    DrawEdge( Canvas.Handle, BtnRect, bdr_RaisedOuter, bf_Rect or bf_Flat or bf_Middle );
    SetBkMode( Canvas.Handle, Windows.Transparent );
    if FDefaultColorCaption <> '' then
      S := FDefaultColorCaption
    else
      S := sRzDefaultColorCaption;
    DrawText( Canvas.Handle, PChar( S ), -1, BtnRect, dt_Center or dt_VCenter or dt_SingleLine );
    ExcludeClipRect( Canvas.Handle, BtnRect.Left, BtnRect.Top, BtnRect.Right, BtnRect.Bottom );
  end; {= DrawDefaultColorArea =}


  procedure DrawCustomColorArea;
  var
    AreaRect, BtnRect, SampleRect, CellRect, TempRect: TRect;
    S: string;
  begin
    AreaRect := Rect( ClientRect.Left, ClientRect.Bottom - Margin, ClientRect.Left + CW, ClientRect.Bottom );
    BtnRect := AreaRect;
    BtnRect.Right := CW - Margin;
    SampleRect := AreaRect;
    SampleRect.Left := BtnRect.Right;
    InflateRect( BtnRect, -3, -3 );

    CellRect := SampleRect;
    InflateRect( CellRect, -4, -4 );
    Canvas.Brush.Color := FCustomColor;
    Canvas.FillRect( CellRect );
    InflateRect( CellRect, 1, 1 );
    DrawEdge( Canvas.Handle, CellRect, bdr_RaisedOuter, bf_Rect or bf_Flat );
    ExcludeClipRect( Canvas.Handle, CellRect.Left, CellRect.Top, CellRect.Right, CellRect.Bottom );

    if FSelColorIndex = sciCustom then
    begin
      Canvas.Brush.Color := clWindow;
      Canvas.FillRect( SampleRect );
      if ThemeServices.ThemesEnabled then
      begin
        ElementDetails := ThemeServices.GetElementDetails( ttbButtonChecked );
        ThemeServices.DrawElement( Canvas.Handle, ElementDetails, SampleRect );
      end
      else
        DrawBevel( Canvas, SampleRect, clHighlight, clHighlight, 1, sdAllSides );
      ExcludeClipRect( Canvas.Handle, SampleRect.Left, SampleRect.Top, SampleRect.Right, SampleRect.Bottom );
    end
    else if FHighlightColorIndex = sciCustom then
    begin
      if ThemeServices.ThemesEnabled then
      begin
        ElementDetails := ThemeServices.GetElementDetails( ttbButtonHot );
        ThemeServices.DrawElement( Canvas.Handle, ElementDetails, SampleRect );
      end
      else
        DrawEdge( Canvas.Handle, SampleRect, bdr_RaisedOuter, bf_Flat or bf_Rect or bf_Middle or bf_Soft );
      ExcludeClipRect( Canvas.Handle, SampleRect.Left, SampleRect.Top, SampleRect.Right, SampleRect.Bottom );
    end;

    if FHighlightColorIndex = sciCustomPick then
    begin
      TempRect := BtnRect;
      InflateRect( TempRect, 3, 3 );

      if ThemeServices.ThemesEnabled then
      begin
        ElementDetails := ThemeServices.GetElementDetails( ttbButtonHot );
        ThemeServices.DrawElement( Canvas.Handle, ElementDetails, TempRect );
        SetBkMode( Canvas.Handle, Windows.Transparent );
        if FCustomColorCaption <> '' then
          S := FCustomColorCaption
        else
          S := sRzCustomColorCaption;
        DrawText( Canvas.Handle, PChar( S ), -1, BtnRect, dt_Center or dt_VCenter or dt_SingleLine );

      end
      else
        DrawEdge( Canvas.Handle, TempRect, bdr_RaisedOuter, bf_Flat or bf_Rect or bf_Soft );
      ExcludeClipRect( Canvas.Handle, TempRect.Left, TempRect.Top, TempRect.Right, TempRect.Bottom );
    end;

    DrawEdge( Canvas.Handle, BtnRect, bdr_RaisedOuter, bf_Rect or bf_Flat or bf_Middle );

    SetBkMode( Canvas.Handle, Windows.Transparent );
    if FCustomColorCaption <> '' then
      S := FCustomColorCaption
    else
      S := sRzCustomColorCaption;
    DrawText( Canvas.Handle, PChar( S ), -1, BtnRect, dt_Center or dt_VCenter or dt_SingleLine );

    ExcludeClipRect( Canvas.Handle, BtnRect.Left, BtnRect.Top, BtnRect.Right, BtnRect.Bottom );
  end; {= DrawCustomColorArea =}


  procedure DrawSystemColors;
  var
    R: TRect;
    Row, Col: Integer;
  begin
    Canvas.Pen.Width := 1;
    Canvas.Pen.Color := clBtnShadow;
    Canvas.Brush.Style := bsSolid;
    if FShowCustomColor then
      R := Bounds( 0, ClientRect.Bottom - Margin - 4 * CellY, CellX, CellY )
    else
      R := Bounds( 0, ClientRect.Bottom - 4 * CellY, CellX, CellY );

    for Row := 0 to 3 do
    begin
      OffsetRect( R, -R.Left + ClientRect.Left, 0 );
      for Col := 0 to 7 do
      begin
        if ( Row = 3 ) and ( Col = 6 ) then
          Break;
        CellRect := R;
        InflateRect( CellRect, -4, -4 );

        Canvas.Brush.Color := ColorSwatches[ CellIndex ].Color;

        Canvas.FillRect( CellRect );
        InflateRect( CellRect, 1, 1 );
        DrawEdge( Canvas.Handle, CellRect, bdr_RaisedOuter, bf_Rect or bf_Flat );
        ExcludeClipRect( Canvas.Handle, CellRect.Left, CellRect.Top, CellRect.Right, CellRect.Bottom );

        if FSelColorIndex = CellIndex then
        begin
          Canvas.Brush.Color := clWindow;
          Canvas.FillRect( R );
          if ThemeServices.ThemesEnabled then
          begin
            ElementDetails := ThemeServices.GetElementDetails( ttbButtonChecked );
            ThemeServices.DrawElement( Canvas.Handle, ElementDetails, R );
          end
          else
            DrawBevel( Canvas, R, clHighlight, clHighlight, 1, sdAllSides );
          ExcludeClipRect( Canvas.Handle, R.Left, R.Top, R.Right, R.Bottom );
        end
        else if FHighlightColorIndex = CellIndex then
        begin
          if ThemeServices.ThemesEnabled then
          begin
            ElementDetails := ThemeServices.GetElementDetails( ttbButtonHot );
            ThemeServices.DrawElement( Canvas.Handle, ElementDetails, R );
          end
          else
            DrawEdge( Canvas.Handle, R, bdr_RaisedOuter, bf_Flat or bf_Rect or bf_Middle or bf_Soft );
          ExcludeClipRect( Canvas.Handle, R.Left, R.Top, R.Right, R.Bottom );
        end;

        Inc( CellIndex );
        OffsetRect( R, CellX, 0 );
      end;
      OffsetRect( R, 0, CellY );
    end;
  end; {= DrawSystemColors =}

begin {= TRzColorPicker.Paint =}
  inherited;

  Canvas.Font := Font;

  CW := ClientRect.Right - ClientRect.Left;
  CH := ClientRect.Bottom - ClientRect.Top;

  AdjHeight := CH;

  CellX := CW div 8;
  TopOffset := ClientRect.Top;
  if FShowNoColor then
  begin
    TopOffset := ClientRect.Top + Margin;
    Dec( AdjHeight, Margin );
    DrawNoColorArea;
  end;

  if FShowDefaultColor then
  begin
    if FShowNoColor then
      TopOffset := ClientRect.Top + 2 * Margin
    else
      TopOffset := ClientRect.Top + Margin;
    Dec( AdjHeight, Margin );
    DrawDefaultColorArea;
  end;

  if FShowCustomColor then
  begin
    Dec( AdjHeight, Margin );
    DrawCustomColorArea;
  end;


  if FShowSystemColors then
    CellY := ( AdjHeight - 8 ) div 9
  else
    CellY := AdjHeight div 5;

  R := Bounds( 0, TopOffset, CellX, CellY );

  CellIndex := 0;
  Canvas.Pen.Width := 1;
  Canvas.Pen.Color := clBtnShadow;
  Canvas.Brush.Style := bsSolid;

  for Row := 0 to 4 do
  begin
    OffsetRect( R, -R.Left + ClientRect.Left, 0 );
    for Col := 0 to 7 do
    begin
      CellRect := R;
      InflateRect( CellRect, -4, -4 );

      Canvas.Brush.Color := ColorSwatches[ CellIndex ].Color;

      Canvas.FillRect( CellRect );
      InflateRect( CellRect, 1, 1 );
      DrawEdge( Canvas.Handle, CellRect, bdr_RaisedOuter, bf_Rect or bf_Flat );
      ExcludeClipRect( Canvas.Handle, CellRect.Left, CellRect.Top, CellRect.Right, CellRect.Bottom );

      if CellIndex = FSelColorIndex then
      begin
        Canvas.Brush.Color := clWindow;
        Canvas.FillRect( R );
        if ThemeServices.ThemesEnabled then
        begin
          ElementDetails := ThemeServices.GetElementDetails( ttbButtonChecked );
          ThemeServices.DrawElement( Canvas.Handle, ElementDetails, R );
        end
        else
          DrawBevel( Canvas, R, clHighlight, clHighlight, 1, sdAllSides );
        ExcludeClipRect( Canvas.Handle, R.Left, R.Top, R.Right, R.Bottom );
      end
      else if CellIndex = FHighlightColorIndex then
      begin
        if ThemeServices.ThemesEnabled then
        begin
          ElementDetails := ThemeServices.GetElementDetails( ttbButtonHot );
          ThemeServices.DrawElement( Canvas.Handle, ElementDetails, R );
        end
        else
          DrawEdge( Canvas.Handle, R, bdr_RaisedOuter, bf_Flat or bf_Rect or bf_Middle );
        ExcludeClipRect( Canvas.Handle, R.Left, R.Top, R.Right, R.Bottom );
      end;

      Inc( CellIndex );
      OffsetRect( R, CellX, 0 );
    end;
    OffsetRect( R, 0, CellY );
  end;

  if FShowSystemColors then
  begin
    // Draw Divider Line
    Canvas.Pen.Color := clBtnShadow;
    Canvas.MoveTo( ClientRect.Left + 3, R.Top + 4 );
    Canvas.LineTo( CW, R.Top + 4 );
    ExcludeClipRect( Canvas.Handle, ClientRect.Left + 3, R.Top + 4, CW, R.Top + 5 );
    DrawSystemColors;
  end;


  // Filling the client rect after drawing all the cells eliminates the flicker
  Canvas.Brush.Color := Color;
  Canvas.FillRect( ClientRect );
end; {= TRzColorPicker.Paint =}



procedure TRzColorPicker.MouseDown( Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
var
  CellIndex: Integer;
begin
  if Button = mbLeft then
  begin
    CellIndex := HitTest( X, Y );

    if CellIndex <> sciBlankCell then
    begin
      if CellIndex = sciCustomPick then
      begin
        FHighlightColorIndex := sciNone;
        Repaint;
        PickCustomColor;
      end
      else
        SelColorIndex := CellIndex;
    end;
  end;
  inherited;
end;


procedure TRzColorPicker.MouseMove( Shift: TShiftState; X, Y: Integer );
var
  CellIndex: Integer;
begin
  if ShowColorHints then
    DoHint( X, Y );

  if csLButtonDown in ControlState then
  begin
    CellIndex := HitTest( X, Y );
    if CellIndex <> sciCustomPick then
      SelColorIndex := CellIndex;
  end
  else
  begin
    CellIndex := HitTest( X, Y );
    SetHighlightColorIndex( CellIndex );
  end;

  inherited;
end;


function TRzColorPicker.Margin: Integer;
begin
  Result := Abs( Font.Height ) + 12;
end;


function TRzColorPicker.HitTest( X, Y: Integer ): Integer;
var
  CellX, CellY, CellIndex, Col, Row: Integer;
  R: TRect;
  P: TPoint;
  AdjHeight, TopMargin, BottomMargin: Integer;
  Found: Boolean;
begin
  Result := sciNoColor;
  AdjHeight := ClientHeight;

  TopMargin := Margin + 1;
  BottomMargin := Margin;

  if FShowNoColor then
  begin
    if Y < TopMargin then
      Exit;
    Dec( Y, TopMargin );
    Dec( AdjHeight, TopMargin );
  end;

  if FShowDefaultColor then
  begin
    if FShowNoColor then
    begin
      if Y < Margin then
      begin
        Result := sciDefault;
        Exit;
      end;
      Dec( Y, Margin );
      Dec( AdjHeight, Margin );
    end
    else
    begin
      if Y < TopMargin then
      begin
        Result := sciDefault;
        Exit;
      end;
      Dec( Y, TopMargin );
      Dec( AdjHeight, TopMargin );
    end
  end;

  if FShowCustomColor then
  begin
    Dec( AdjHeight, BottomMargin );
  end;

  if FShowSystemColors then
    CellY := ( AdjHeight - 8 ) div 9
  else
    CellY := AdjHeight div 5;


  P := Point( X, Y );
  CellX := ClientWidth div 8;
//  CellY := AdjHeight div 5;
  R := Bounds( 0, 0, CellX, CellY );
  CellIndex := 0;

  Found := False;
  Row := 0;
  while ( Row <= 4 ) and not Found do
  begin
    OffsetRect( R, -R.Left, 0 );
    Col := 0;
    while ( Col <= 7 ) and not Found do
    begin
      if PtInRect( R, P ) then
      begin
        Result := CellIndex;
        Found := True;
      end;
      Inc( CellIndex );
      OffsetRect( R, CellX, 0 );
      Inc( Col );
    end;
    OffsetRect( R, 0, CellY );
    Inc( Row );
  end;

  if FShowSystemColors and not Found then
  begin
    if PtInRect( Rect( 0, R.Top, ClientWidth, R.Top + 8 ), P ) then
    begin
      Result := sciBlankCell;
      Found := True;  // Clicked on divider line
    end
    else
    begin
      OffsetRect( R, 0, 8 );
      Row := 0;
      while ( Row <= 3 ) and not Found do
      begin
        OffsetRect( R, -R.Left, 0 );
        Col := 0;
        while ( Col <= 7 ) and not Found do
        begin
          if PtInRect( R, P ) then
          begin
            if ( Row = 3 ) and ( Col >= 6 ) then
              Result := sciBlankCell
            else
              Result := CellIndex;
            Found := True;
          end;
          Inc( CellIndex );
          OffsetRect( R, CellX, 0 );
          Inc( Col );
        end;
        OffsetRect( R, 0, CellY );
        Inc( Row );
      end;
    end;
  end;


  if not Found and FShowCustomColor then
  begin
    // Is mouse over Custom button or Custom Color?
    if X < ( ClientWidth - Margin ) then
      Result := sciCustomPick
    else
      Result := sciCustom;
  end;
end; {= TRzColorPicker.HitTest =}


function TRzColorPicker.GetCellRect( Index: Integer ): TRect;
var
  CellX, CellY: Integer;
  AdjHeight, TopMargin, BottomMargin: Integer;
begin
  AdjHeight := ClientHeight;
  TopMargin := Margin + 1;
  BottomMargin := Margin;

  if FShowNoColor then
    Dec( AdjHeight, TopMargin );

  if FShowDefaultColor then
    Dec( AdjHeight, TopMargin );

  if FShowCustomColor then
    Dec( AdjHeight, BottomMargin );

  if FShowSystemColors then
    CellY := ( AdjHeight - 8 ) div 9
  else
    CellY := AdjHeight div 5;


  CellX := ClientWidth div 8;

  Result := Rect( 0, 0, 0, 0 );

  if Index < StockColorsCount then
  begin
    Result := Bounds( CellX * ( Index mod 8 ), CellY * ( Index div 8 ), CellX, CellY );
  end
  else if Index < TotalColorsCount then
  begin
    Result := Bounds( CellX * ( Index mod 8 ), CellY * ( Index div 8 ) + 8, CellX, CellY );
  end;

  if FShowNoColor then
    OffsetRect( Result, 0, TopMargin );

  if FShowDefaultColor then
    OffsetRect( Result, 0, TopMargin );
end; {= TRzColorPicker.GetCellRect =}


procedure TRzColorPicker.SetCustomColor( Value: TColor );
begin
  FCustomColor := Value;
  if FShowCustomColor then
    Repaint;
end;


procedure TRzColorPicker.SetCustomColors( Value: TRzCustomColors );
begin
  if FCustomColors <> Value then
  begin
    FCustomColors := Value;
    if Value <> nil then
      Value.FreeNotification( Self );
  end;
end;


procedure TRzColorPicker.PickCustomColor;
var
  Dlg: TColorDialog;
begin
  Dlg := TColorDialog.Create( Self );
  try
    Dlg.Color := FCustomColor;
    if FCustomColors <> nil then
      Dlg.CustomColors := FCustomColors.Colors;
    Dlg.Options := FColorDlgOptions;
    if Dlg.Execute then
    begin
      if FCustomColors <> nil then
        FCustomColors.Colors := Dlg.CustomColors;
      SetCustomColor( Dlg.Color );
      SelColorIndex := sciCustom;
    end;
  finally
    Dlg.Free;
  end;
end;


procedure TRzColorPicker.SetDefaultColor( Value: TColor );
begin
  FDefaultColor := Value;
  if FShowDefaultColor then
    Repaint;
end;



procedure TRzColorPicker.UpdateBounds;
var
  NW, NH: Integer;
begin
  CanAutoSize( NW, NH );
  SetBounds( Left, Top, NW, NH );
end;


function TRzColorPicker.CanAutoSize( var NewWidth, NewHeight: Integer ): Boolean;
begin
  NewWidth := 18 * 8 + 2 * ClientRect.Left;
  NewHeight := 18 * 5 + 2 * ClientRect.Top;

  if FShowSystemColors then
    Inc( NewHeight, 4 * 18 + 8 );

  if FShowNoColor then
    Inc( NewHeight, Margin + 1 );

  if FShowDefaultColor then
    Inc( NewHeight, Margin + 1 );

  if FShowCustomColor then
    Inc( NewHeight, Margin );

  Result := True;
end;


procedure TRzColorPicker.ColorChanged;
begin
  if Assigned( FOnChange ) then
    FOnChange( Self );
end;


procedure TRzColorPicker.SetCustomColorCaption( const Value: string );
begin
  if FCustomColorCaption <> Value then
  begin
    FCustomColorCaption := Value;
    Invalidate;
  end;
end;


procedure TRzColorPicker.SetNoColorCaption( const Value: string );
begin
  if FNoColorCaption <> Value then
  begin
    FNoColorCaption := Value;
    Invalidate;
  end;
end;


procedure TRzColorPicker.SetShowNoColor( Value: Boolean );
begin
  if FShowNoColor <> Value then
  begin
    FShowNoColor := Value;
    if AutoSize then
      UpdateBounds;
    Invalidate;
  end;
end;


procedure TRzColorPicker.SetShowCustomColor( Value: Boolean );
begin
  if FShowCustomColor <> Value then
  begin
    FShowCustomColor := Value;
    if AutoSize then
      UpdateBounds;
    Invalidate;
  end;
end;


procedure TRzColorPicker.SetShowSystemColors( Value: Boolean );
begin
  if FShowSystemColors <> Value then
  begin
    FShowSystemColors := Value;
    if AutoSize then
      UpdateBounds;
    Invalidate;
  end;
end;



procedure TRzColorPicker.SetDefaultColorCaption( const Value: string );
begin
  if FDefaultColorCaption <> Value then
  begin
    FDefaultColorCaption := Value;
    Invalidate;
  end;
end;


procedure TRzColorPicker.SetShowDefaultColor( Value: Boolean );
begin
  if FShowDefaultColor <> Value then
  begin
    FShowDefaultColor := Value;
    if AutoSize then
      UpdateBounds;
    Invalidate;
  end;
end;


procedure TRzColorPicker.SetSelColorIndex( Value: Integer );
begin
  if ( FSelColorIndex <> Value ) or ( FSelColorIndex = sciCustom ) then
  begin
    FSelColorIndex := Value;
    Repaint;
    ColorChanged;
    if FSelColorIndex = sciCustom then
      Click;  // To close up the popup, when used in a TRzColorEdit
  end;
end;


procedure TRzColorPicker.SetHighlightColorIndex( Value: Integer );
begin
  if FHighlightColorIndex <> Value then
  begin
    FHighlightColorIndex := Value;
    Repaint;
  end;
end;


function TRzColorPicker.GetSelectedColor: TColor;
begin
  case FSelColorIndex of
    sciNoColor, sciBlankCell:
      Result := clNone;

    sciCustom, sciCustomPick:
      Result := FCustomColor;

    sciDefault:
      Result := FDefaultColor;

    else
      Result := ColorSwatches[ FSelColorIndex ].Color;
  end;
end;


procedure TRzColorPicker.SetSelectedColor( Value: TColor );
var
  CellIndex, I: Integer;
begin
  CellIndex := sciNoColor;

  // Change FSelColorIndex to match Value color
  if Value <> clNone then
  begin
    if FShowDefaultColor then
    begin
      if ColorToRGB( Value ) = ColorToRGB( FDefaultColor ) then
        CellIndex := sciDefault;
    end;

    if FShowSystemColors and ( CellIndex = sciNoColor ) then
    begin
      for I := StockColorsCount to TotalColorsCount - 1 do
      begin
        if Value = ColorSwatches[ I ].Color then
        begin
          CellIndex := I;
          Break;
        end;
      end;
    end;

    if CellIndex = sciNoColor then
    begin
      Value := ColorToRGB( Value );

      for I := 0 to StockColorsCount - 1 do
      begin
        if Value = ColorToRGB( ColorSwatches[ I ].Color ) then
        begin
          CellIndex := I;
          Break;
        end;
      end;
    end;


    if CellIndex = sciNoColor then
    begin
      // Must be a custom color
      SetCustomColor( Value );
      CellIndex := sciCustom;
    end;
  end;

  SelColorIndex := CellIndex;
end; {= TRzColorPicker.SetSelectedColor =}


procedure TRzColorPicker.MouseEnter;
var
  P: TPoint;
begin
  inherited;

  GetCursorPos( P );
  P := ScreenToClient( P );
  if FShowColorHints then
    DoHint( P.X, P.Y );
end;


procedure TRzColorPicker.MouseLeave;
begin
  inherited;
  FHighlightColorIndex := sciNone;
  Repaint;
  ReleaseHintWindow;
end;


function TRzColorPicker.CalcHintRect( MaxWidth: Integer; const HintStr: string; HintWnd: THintWindow ): TRect;
begin
  Result := HintWnd.CalcHintRect( Screen.Width, HintStr, nil );
end;


procedure TRzColorPicker.DoHint( X, Y: Integer );
var
  Idx: Integer;
  R, IR, WinRect: TRect;
  P: TPoint;
  HintStr: string;
begin
  Idx := HitTest( X, Y );
  Canvas.Font := Font;
  if not ( csDesigning in ComponentState ) and ( Idx >= 0 ) and PtInRect( ClientRect, Point( X, Y ) ) and ForegroundTask then
  begin
    if not Assigned( FHintWnd ) then
    begin
      FHintWnd := THintWindow.Create( Self );
      FHintWnd.Color := Application.HintColor;
    end;

    HintStr := ColorSwatches[ Idx ].Name;
    FHintWnd.Canvas.Font := Self.Font;
    R := CalcHintRect( Screen.Width, HintStr, FHintWnd );

    IR := GetCellRect( Idx );

    P := ClientToScreen( Point( IR.Left, IR.Bottom ) );
    OffsetRect( R, P.X + 4, P.Y + 12 );

    GetWindowRect( FHintWnd.Handle, WinRect );

    if not IsWindowVisible( FHintWnd.Handle ) or not ( ( R.Left = WinRect.Left ) and ( R.Top = WinRect.Top ) ) then
      FHintWnd.ActivateHint( R, HintStr )
  end
  else
  begin
    ReleaseHintWindow;
    Repaint;
  end;
end;


procedure TRzColorPicker.ReleaseHintWindow;
begin
  if Assigned( FHintWnd ) then
    FHintWnd.ReleaseHandle;
end;


procedure TRzColorPicker.CMFontChanged( var Msg: TMessage );
begin
  inherited;
  Repaint;
end;


{&RUIF}
end.

