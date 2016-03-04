{=======================================================================================================================
  RzDBGrid Unit

  Raize Components - Component Source Unit


  Components            Description
  ----------------------------------------------------------------------------------------------------------------------
  TRzDBGrid             Enhanced DBGrid that supports Custom Framing and additional display options for grid cells.


  Modification History
  ----------------------------------------------------------------------------------------------------------------------
  3.0.9  (22 Sep 2003)  * Surfaced OnResize event in TRzDBGrid.

  3.0.8  (29 Aug 2003)  * Initial release.
                        * The TRzDBGrid is a direct descendant of the VCL TDBGrid that supports Custom Framing
                          and additional display options for grid cells.


  Copyright � 2003 by Raize Software, Inc.  All Rights Reserved.
=======================================================================================================================}

{$I RzComps.inc}

unit RzDBGrid;

interface

uses
  {$IFDEF USE_CS}
  CSIntf,
  {$ENDIF}
  SysUtils,
  Messages,
  Windows,
  Classes,
  Controls,
  StdCtrls,
  Graphics,
  Grids,
  DBGrids,
  RzCommon;

type
  {=================================}
  {== TRzDBGrid Class Declaration ==}
  {=================================}

  TRzDBGrid = class( TDBGrid )
  private
    FLineColor: TColor;
    FFixedLineColor: TColor;

    FUpdatingColor: Boolean;
    FDisabledColor: TColor;
    FFocusColor: TColor;
    FNormalColor: TColor;
    FFrameColor: TColor;
    FFrameController: TRzFrameController;
    FFrameHotColor: TColor;
    FFrameHotTrack: Boolean;
    FFrameHotStyle: TFrameStyle;
    FFrameSides: TSides;
    FFrameStyle: TFrameStyle;
    FFrameVisible: Boolean;
    FFramingPreference: TFramingPreference;

    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;

    { Message Handling Methods }
    procedure CMEnabledChanged( var Msg: TMessage ); message cm_EnabledChanged;
    procedure WMNCPaint( var Msg: TWMNCPaint ); message wm_NCPaint;
    procedure CMParentColorChanged( var Msg: TMessage ); message cm_ParentColorChanged;
    procedure CMEnter( var Msg: TCMEnter ); message cm_Enter;
    procedure CMExit( var Msg: TCMExit ); message cm_Exit;
    procedure CMMouseEnter( var Msg: TMessage ); message cm_MouseEnter;
    procedure CMMouseLeave( var Msg: TMessage ); message cm_MouseLeave;
    procedure WMSize( var Msg: TWMSize ); message wm_Size;
  protected
    FAboutInfo: TRzAboutInfo;
    FCanvas: TCanvas;
    FOverControl: Boolean;

    procedure Loaded; override;
    procedure Notification( AComponent: TComponent; Operation: TOperation ); override;

    procedure UpdateColors; virtual;
    procedure UpdateFrame( ViaMouse, InFocus: Boolean ); virtual;
    procedure RepaintFrame; virtual;

    function IsActiveControl: Boolean;
    procedure Paint; override;
    {$IFNDEF VCL60_OR_HIGHER}
    procedure ChangeGridOrientation( RightToLeftOrientation: Boolean );
    {$ENDIF}
    procedure GridRectToScreenRect( GridRect: TGridRect; var ScreenRect: TRect; IncludeLine: Boolean );

    { Event Dispatch Methods }
    procedure MouseEnter; dynamic;
    procedure MouseLeave; dynamic;

    { Property Access Methods }
    function GetColor: TColor; virtual;
    procedure SetColor( Value: TColor ); virtual;
    function IsColorStored: Boolean;
    function IsFocusColorStored: Boolean;
    function NotUsingController: Boolean;
    procedure SetDisabledColor( Value: TColor ); virtual;
    procedure SetFocusColor( Value: TColor ); virtual;
    procedure SetFrameColor( Value: TColor ); virtual;
    procedure SetFrameController( Value: TRzFrameController ); virtual;
    procedure SetFrameHotColor( Value: TColor ); virtual;
    procedure SetFrameHotTrack( Value: Boolean ); virtual;
    procedure SetFrameHotStyle( Value: TFrameStyle ); virtual;
    procedure SetFrameSides( Value: TSides ); virtual;
    procedure SetFrameStyle( Value: TFrameStyle ); virtual;
    procedure SetFrameVisible( Value: Boolean ); virtual;
    procedure SetFramingPreference( Value: TFramingPreference ); virtual;
    procedure SetFixedLineColor( Value: TColor ); virtual;
    procedure SetLineColor( Value: TColor ); virtual;
  public
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;

    function UseThemes: Boolean; virtual;
  published
    property About: TRzAboutInfo
      read FAboutInfo
      write FAboutInfo
      stored False;

    property Color: TColor
      read GetColor
      write SetColor
      stored IsColorStored
      default clWindow;

    property DisabledColor: TColor
      read FDisabledColor
      write SetDisabledColor
      stored NotUsingController
      default clBtnFace;

    property FocusColor: TColor
      read FFocusColor
      write SetFocusColor
      stored IsFocusColorStored
      default clWindow;

    property FrameColor: TColor
      read FFrameColor
      write SetFrameColor
      stored NotUsingController
      default clBtnShadow;

    property FrameController: TRzFrameController
      read FFrameController
      write SetFrameController;

    property FrameHotColor: TColor
      read FFrameHotColor
      write SetFrameHotColor
      stored NotUsingController
      default clBtnShadow;

    property FrameHotStyle: TFrameStyle
      read FFrameHotStyle
      write SetFrameHotStyle
      stored NotUsingController
      default fsFlatBold;

    property FrameHotTrack: Boolean
      read FFrameHotTrack
      write SetFrameHotTrack
      stored NotUsingController
      default False;

    property FrameSides: TSides
      read FFrameSides
      write SetFrameSides
      stored NotUsingController
      default sdAllSides;

    property FrameStyle: TFrameStyle
      read FFrameStyle
      write SetFrameStyle
      stored NotUsingController
      default fsFlat;

    property FrameVisible: Boolean
      read FFrameVisible
      write SetFrameVisible
      stored NotUsingController
      default False;

    property FramingPreference: TFramingPreference
      read FFramingPreference
      write SetFramingPreference
      default fpXPThemes;


    property FixedLineColor: TColor
      read FFixedLineColor
      write SetFixedLineColor
      default clBtnShadow;

    property LineColor: TColor
      read FLineColor
      write SetLineColor
      default clBtnFace;

    property OnMouseEnter: TNotifyEvent
      read FOnMouseEnter
      write FOnMouseEnter;

    property OnMouseLeave: TNotifyEvent
      read FOnMouseLeave
      write FOnMouseLeave;

    { Inherited Properties & Events }
    property Height default 125;
    property Width default 325;

    property OnResize;
  end;


implementation

uses
  {$IFDEF VCL70_OR_HIGHER}
  Themes,
  UxTheme,
  {$ELSE}
  RzThemeSrv,
  RzUxTheme,
  RzTmSchema,
  {$ENDIF}
  DB,
  Forms,
  Math,
  {$IFDEF VCL60_OR_HIGHER}
  RTLConsts,
  {$ENDIF}
  Consts;

type
  PIntArray = ^TIntArray;
  TIntArray = array[0..MaxCustomExtents] of Integer;


{=======================}
{== Support Functions ==}
{=======================}

function PointInGridRect( Col, Row: Longint; const Rect: TGridRect ): Boolean;
begin
  Result := ( Col >= Rect.Left ) and ( Col <= Rect.Right ) and ( Row >= Rect.Top ) and ( Row <= Rect.Bottom );
end;


procedure FillDWord( var Dest; Count, Value: Integer ); register;
asm
  XCHG  EDX, ECX
  PUSH  EDI
  MOV   EDI, EAX
  MOV   EAX, EDX
  REP   STOSD
  POP   EDI
end;


{-----------------------------------------------------------------------------------------------------------------------
  StackAlloc

  Allocates a 'small' block of memory from the stack by decrementing SP.  This provides the allocation speed of a local
  variable, but the runtime size flexibility of heap allocated memory.
-----------------------------------------------------------------------------------------------------------------------}

function StackAlloc( Size: Integer ): Pointer; register;
asm
  POP   ECX          // return address
  MOV   EDX, ESP
  ADD   EAX, 3
  AND   EAX, not 3   // round up to keep ESP dword aligned
  CMP   EAX, 4092
  JLE   @@2
@@1:
  SUB   ESP, 4092
  PUSH  EAX          // make sure we touch guard page, to grow stack
  SUB   EAX, 4096
  JNS   @@1
  ADD   EAX, 4096
@@2:
  SUB   ESP, EAX
  MOV   EAX, ESP     // function result = low memory address of block
  PUSH  EDX          // save original SP, for cleanup
  MOV   EDX, ESP
  SUB   EDX, 4
  PUSH  EDX          // save current SP, for sanity check  (sp = [sp])
  PUSH  ECX          // return to caller
end;


{-----------------------------------------------------------------------------------------------------------------------
  StackFree

  Pops the memory allocated by StackAlloc off the stack.

  - Calling StackFree is optional - SP will be restored when the calling routine exits, but it's a good idea to free
    the stack allocated memory ASAP anyway.
  - StackFree must be called in the same stack context as StackAlloc - not in a subroutine or finally block.
  - Multiple StackFree calls must occur in reverse order of their corresponding StackAlloc calls.
  - Built-in sanity checks guarantee that an improper call to StackFree will not corrupt the stack. Worst case is that
    the stack block is not released until the calling routine exits.
-----------------------------------------------------------------------------------------------------------------------}

procedure StackFree( P: Pointer ); register;
asm
  POP   ECX                     // return address
  MOV   EDX, DWORD PTR [ESP]
  SUB   EAX, 8
  CMP   EDX, ESP                // sanity check #1 (SP = [SP])
  JNE   @@1
  CMP   EDX, EAX                // sanity check #2 (P = this stack block)
  JNE   @@1
  MOV   ESP, DWORD PTR [ESP+4]  // restore previous SP
@@1:
  PUSH  ECX                     // return to caller
end;


{&RT}
{=======================}
{== TRzDBGrid Methods ==}
{=======================}

constructor TRzDBGrid.Create( AOwner: TComponent );
begin
  inherited;
  {&RCI}

  FCanvas := TControlCanvas.Create;
  TControlCanvas( FCanvas ).Control := Self;

  FDisabledColor := clBtnFace;
  FFocusColor := clWindow;
  FNormalColor := clWindow;
  FFrameColor := clBtnShadow;
  FFrameController := nil;
  FFrameHotColor := clBtnShadow;
  FFrameHotTrack := False;
  FFrameHotStyle := fsFlatBold;
  FFrameSides := sdAllSides;
  FFrameStyle := fsFlat;
  FFrameVisible := False;
  FFramingPreference := fpXPThemes;

  FLineColor := clBtnFace;
  FFixedLineColor := clBtnShadow;

  Height := 125;
  Width := 325;
  {&RV}
end;


destructor TRzDBGrid.Destroy;
begin
  if FFrameController <> nil then
    FFrameController.RemoveControl( Self );
  FCanvas.Free;
  inherited;
end;


procedure TRzDBGrid.Loaded;
begin
  inherited;
  UpdateColors;
  UpdateFrame( False, False );
end;


procedure TRzDBGrid.Notification( AComponent: TComponent; Operation: TOperation );
begin
  inherited;
  if ( Operation = opRemove ) and ( AComponent = FFrameController ) then
    FFrameController := nil;
end;


function TRzDBGrid.GetColor: TColor;
begin
  Result := inherited Color;
end;


procedure TRzDBGrid.SetColor( Value: TColor );
begin
  if Color <> Value then
  begin
    inherited Color := Value;
    if not FUpdatingColor then
    begin
      if FFocusColor = FNormalColor then
        FFocusColor := Value;
      FNormalColor := Value;
    end;
    if FFrameVisible and not UseThemes then
      RepaintFrame;
  end;
end;


function TRzDBGrid.IsColorStored: Boolean;
begin
  Result := NotUsingController and Enabled;
end;


function TRzDBGrid.IsFocusColorStored: Boolean;
begin
  Result := NotUsingController and ( ColorToRGB( FFocusColor ) <> ColorToRGB( Color ) );
end;


function TRzDBGrid.NotUsingController: Boolean;
begin
  Result := FFrameController = nil;
end;


procedure TRzDBGrid.SetDisabledColor( Value: TColor );
begin
  FDisabledColor := Value;
  if not Enabled then
    UpdateColors;
end;


procedure TRzDBGrid.SetFocusColor( Value: TColor );
begin
  FFocusColor := Value;
  if Focused then
    UpdateColors;
end;


procedure TRzDBGrid.SetFrameColor( Value: TColor );
begin
  if FFrameColor <> Value then
  begin
    FFrameColor := Value;
    RepaintFrame;
  end;
end;


procedure TRzDBGrid.SetFrameController( Value: TRzFrameController );
begin
  if FFrameController <> nil then
    FFrameController.RemoveControl( Self );
  FFrameController := Value;
  if Value <> nil then
  begin
    Value.AddControl( Self );
    Value.FreeNotification( Self );
  end;
end;


procedure TRzDBGrid.SetFrameHotColor( Value: TColor );
begin
  if FFrameHotColor <> Value then
  begin
    FFrameHotColor := Value;
    RepaintFrame;
  end;
end;


procedure TRzDBGrid.SetFrameHotTrack( Value: Boolean );
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
    RepaintFrame;
    Invalidate;
  end;
end;


procedure TRzDBGrid.SetFrameHotStyle( Value: TFrameStyle );
begin
  if FFrameHotStyle <> Value then
  begin
    FFrameHotStyle := Value;
    RepaintFrame;
  end;
end;


procedure TRzDBGrid.SetFrameSides( Value: TSides );
begin
  if FFrameSides <> Value then
  begin
    FFrameSides := Value;
    RepaintFrame;
  end;
end;


procedure TRzDBGrid.SetFrameStyle( Value: TFrameStyle );
begin
  if FFrameStyle <> Value then
  begin
    FFrameStyle := Value;
    RepaintFrame;
  end;
end;


procedure TRzDBGrid.SetFrameVisible( Value: Boolean );
begin
  if FFrameVisible <> Value then
  begin
    FFrameVisible := Value;
    if FFrameVisible then
      Ctl3D := True;
    RecreateWnd;
  end;
end;


procedure TRzDBGrid.SetFramingPreference( Value: TFramingPreference );
begin
  if FFramingPreference <> Value then
  begin
    FFramingPreference := Value;
    if FFramingPreference = fpCustomFraming then
      RepaintFrame;
  end;
end;


procedure TRzDBGrid.RepaintFrame;
var
  R: TRect;
begin
  R := ClientRect;
  RedrawWindow( Handle, @R, 0, rdw_Invalidate or rdw_UpdateNow or rdw_Frame );
end;


function TRzDBGrid.UseThemes: Boolean;
begin
  Result := ( FFramingPreference = fpXPThemes ) and ThemeServices.ThemesEnabled;
end;


procedure TRzDBGrid.CMEnabledChanged( var Msg: TMessage );
begin
  inherited;
  UpdateColors;
end;


procedure TRzDBGrid.SetFixedLineColor( Value: TColor );
begin
  if FFixedLineColor <> Value then
  begin
    FFixedLineColor := Value;
    Invalidate;
  end;
end;


procedure TRzDBGrid.SetLineColor( Value: TColor );
begin
  if FLineColor <> Value then
  begin
    FLineColor := Value;
    Invalidate;
  end;
end;


procedure TRzDBGrid.WMNCPaint( var Msg: TWMNCPaint );
var
  DC: HDC;
  C: DWord;
  ElementDetails: TThemedElementDetails;

  {---------------------------------------------------------------------------------------------------------------------
    DrawGridFrame

    Draws Custom Framing frame around the grid. This version is different than the RzCommon.DrawFrame in that for the
    fsFlat style, the upper-left erase color needs to be a different color than the lower-right erase color.
  ---------------------------------------------------------------------------------------------------------------------}
  procedure DrawGridFrame( Canvas: TCanvas; FrameStyle: TFrameStyle; ULEraseColor, LREraseColor, FrameColor: TColor;
                           FrameSides: TSides );
  var
    R: TRect;
  begin
    R := Rect( 0, 0, Width, Height );
    DrawBevel( Canvas, R, ULEraseColor, LREraseColor, 2, sdAllSides );

    if FrameStyle = fsFlat then
      DrawSides( Canvas, R, FrameColor, FrameColor, FrameSides )
    else if FrameStyle = fsFlatBold then
      DrawBevel( Canvas, R, FrameColor, FrameColor, 2, FrameSides )
    else
      DrawBorderSides( Canvas, R, FrameStyle, FrameSides );
  end;

begin {= TRzDBGrid.WMNCPaint =}
  inherited;                       { Must call inherited so scroll bar show up }

  if FFrameVisible and not UseThemes then
  begin
    DC := GetWindowDC( Handle );
    FCanvas.Handle := DC;
    try
      if FFrameHotTrack and ( Focused or FOverControl ) then
        DrawGridFrame( FCanvas, FFrameHotStyle, FixedColor, Color, FFrameHotColor, FFrameSides )
      else
        DrawGridFrame( FCanvas, FFrameStyle, FixedColor, Color, FFrameColor, FFrameSides );
    finally
      FCanvas.Handle := 0;
      ReleaseDC( Handle, DC );
    end;
    Msg.Result := 0;
  end
  else if ThemeServices.ThemesEnabled then
  begin
    DC := GetWindowDC( Handle );
    FCanvas.Handle := DC;
    try
      ElementDetails := ThemeServices.GetElementDetails( teEditRoot );
      GetThemeColor( ThemeServices.Theme[ teEdit ], ElementDetails.Part, ElementDetails.State, TMT_BORDERCOLOR, C );
      DrawGridFrame( FCanvas, fsFlat, FixedColor, Color, C, sdAllSides );
    finally
      FCanvas.Handle := 0;
      ReleaseDC( Handle, DC );
    end;
    Msg.Result := 0;
  end;
end; {= TRzDBGrid.WMNCPaint =}


procedure TRzDBGrid.CMParentColorChanged( var Msg: TMessage );
begin
  inherited;
  if FFrameVisible and not UseThemes then
    RepaintFrame;
end;


procedure TRzDBGrid.UpdateColors;
begin
  if csLoading in ComponentState then
    Exit;

  FUpdatingColor := True;
  try
    if not Enabled then
      Color := FDisabledColor
    else if Focused then
      Color := FFocusColor
    else
      Color := FNormalColor;
  finally
    FUpdatingColor := False;
  end;
end;


procedure TRzDBGrid.UpdateFrame( ViaMouse, InFocus: Boolean );
begin
  if ViaMouse then
    FOverControl := InFocus;

  if FFrameHotTrack then
    RepaintFrame;

  UpdateColors;
end;


procedure TRzDBGrid.CMEnter( var Msg: TCMEnter );
begin
  UpdateFrame( False, True );
  inherited;
end;


procedure TRzDBGrid.CMExit( var Msg: TCMExit );
begin
  inherited;
  UpdateFrame( False, False );
end;


procedure TRzDBGrid.MouseEnter;
begin
  if Assigned( FOnMouseEnter ) then
    FOnMouseEnter( Self );
end;


procedure TRzDBGrid.CMMouseEnter( var Msg: TMessage );
begin
  inherited;
  {$IFDEF VCL70_OR_HIGHER}
  if csDesigning in ComponentState then
    Exit;
  {$ENDIF}
  UpdateFrame( True, True );
  MouseEnter;
end;


procedure TRzDBGrid.MouseLeave;
begin
  if Assigned( FOnMouseLeave ) then
    FOnMouseLeave( Self );
end;


procedure TRzDBGrid.CMMouseLeave( var Msg: TMessage );
begin
  inherited;
  UpdateFrame( True, False );
  MouseLeave;
end;


procedure TRzDBGrid.WMSize( var Msg: TWMSize );
begin
  inherited;
  if FFrameVisible and not UseThemes then
    RepaintFrame;
end;


function TRzDBGrid.IsActiveControl: Boolean;
var
  H: Hwnd;
  ParentForm: TCustomForm;
begin
  Result := False;
  ParentForm := GetParentForm( Self );
  if Assigned( ParentForm ) then
  begin
    if ParentForm.ActiveControl = Self then
      Result := True
  end
  else
  begin
    H := GetFocus;
    while IsWindow( H ) and ( Result = False ) do
    begin
      if H = WindowHandle then
        Result := True
      else
        H := GetParent( H );
    end;
  end;
end; {= TRzDBGrid.IsActiveControl =}



// This access class is needed in order to access the Options property from the TCustomGrid class, which is a different
// type from the Options property in the TDBGrid class.

type
  TCustomGridAccess = class( TCustomGrid );


procedure TRzDBGrid.Paint;
var
  LC: TColor;
  DrawInfo: TGridDrawInfo;
  Sel: TGridRect;
  UpdateRect: TRect;
  AFocRect, FocRect: TRect;
  PointsList: PIntArray;
  StrokeList: PIntArray;
  MaxStroke: Integer;

  {---------------------------------------------------------------------------------------------------------------------
    DrawLines

    CellBounds is 4 integers: StartX, StartY, StopX, StopY
    Horizontal lines:         MajorIndex = 0
    Vertical lines:           MajorIndex = 1
  ---------------------------------------------------------------------------------------------------------------------}
  procedure DrawLines( DoHorz, DoVert: Boolean; Col, Row: Longint; const CellBounds: array of Integer;
                       OnColor, OffColor: TColor);
  const
    FlatPenStyle = ps_Geometric or ps_Solid or ps_EndCap_Flat or ps_Join_Miter;

    procedure DrawAxisLines( const AxisInfo: TGridAxisDrawInfo; Cell, MajorIndex: Integer; UseOnColor: Boolean );
    var
      Line: Integer;
      LogBrush: TLogBrush;
      Index: Integer;
      Points: PIntArray;
      StopMajor, StartMinor, StopMinor, StopIndex: Integer;
      LineIncr: Integer;
    begin
      if AxisInfo.EffectiveLineWidth <> 0 then
      begin
        Canvas.Pen.Width := GridLineWidth;
        if UseOnColor then
          Canvas.Pen.Color := OnColor
        else
          Canvas.Pen.Color := OffColor;

        if Canvas.Pen.Width > 1 then
        begin
          LogBrush.lbStyle := bs_Solid;
          LogBrush.lbColor := Canvas.Pen.Color;
          LogBrush.lbHatch := 0;
          Canvas.Pen.Handle := ExtCreatePen( FlatPenStyle, Canvas.Pen.Width, LogBrush, 0, nil );
        end;

        Points := PointsList;
        Line := CellBounds[ MajorIndex ] + AxisInfo.EffectiveLineWidth shr 1 + AxisInfo.GetExtent( Cell );

        if UseRightToLeftAlignment and ( MajorIndex = 0 ) then
          Inc( Line );

        StartMinor := CellBounds[ MajorIndex xor 1 ];
        StopMinor := CellBounds[ 2 + ( MajorIndex xor 1 ) ];
        StopMajor := CellBounds[ 2 + MajorIndex ] + AxisInfo.EffectiveLineWidth;
        StopIndex := MaxStroke * 4;

        Index := 0;
        repeat
          Points^[ Index + MajorIndex ] := Line;           // MoveTo
          Points^[ Index + ( MajorIndex xor 1 ) ] := StartMinor;
          Inc( Index, 2 );
          Points^[ Index + MajorIndex ] := Line;           // LineTo
          Points^[ Index + ( MajorIndex xor 1 ) ] := StopMinor;
          Inc( Index, 2 );

          // Skip hidden columns/rows.  We don't have stroke slots for them
          // A column/row with an extent of -EffectiveLineWidth is hidden
          repeat
            Inc( Cell );
            LineIncr := AxisInfo.GetExtent( Cell ) + AxisInfo.EffectiveLineWidth;
          until ( LineIncr > 0 ) or ( Cell > AxisInfo.LastFullVisibleCell );
          Inc( Line, LineIncr );
        until ( Line > StopMajor ) or ( Cell > AxisInfo.LastFullVisibleCell ) or ( Index > StopIndex );

        // 2 integers per point, 2 points per line -> Index div 4
        PolyPolyLine( Canvas.Handle, Points^, StrokeList^, Index shr 2 );
      end;
    end; {= DrawAxisLines =}

  begin {= DrawLines =}
    if ( CellBounds[ 0 ] = CellBounds[ 2 ] ) or ( CellBounds[ 1 ] = CellBounds[ 3 ] ) then
      Exit;

    if not DoHorz then
    begin
      DrawAxisLines( DrawInfo.Vert, Row, 1, DoHorz );
      DrawAxisLines( DrawInfo.Horz, Col, 0, DoVert );
    end
    else
    begin
      DrawAxisLines( DrawInfo.Horz, Col, 0, DoVert );
      DrawAxisLines( DrawInfo.Vert, Row, 1, DoHorz );
    end;
  end; {= DrawLines =}


  procedure DrawCells( ACol, ARow: Longint; StartX, StartY, StopX, StopY: Integer; Color: TColor;
                       IncludeDrawState: TGridDrawState );
  var
    CurCol, CurRow: Longint;
    AWhere, Where: TRect;
    DrawState: TGridDrawState;
    Focused: Boolean;
  begin
    CurRow := ARow;
    Where.Top := StartY;
    while ( Where.Top < StopY ) and ( CurRow < RowCount ) do
    begin
      CurCol := ACol;
      Where.Left := StartX;
      Where.Bottom := Where.Top + RowHeights[ CurRow ];
      while ( Where.Left < StopX ) and ( CurCol < ColCount ) do
      begin
        Where.Right := Where.Left + ColWidths[ CurCol ];
        if ( Where.Right > Where.Left ) and RectVisible( Canvas.Handle, Where ) then
        begin
          DrawState := IncludeDrawState;
          Focused := IsActiveControl;
          if Focused and ( CurRow = Row ) and ( CurCol = Col ) then
            Include( DrawState, gdFocused );

          if PointInGridRect( CurCol, CurRow, Sel ) then
            Include( DrawState, gdSelected );

          if not ( gdFocused in DrawState ) or
             not ( goEditing in TCustomGridAccess( Self ).Options ) or
             not EditorMode or
             ( csDesigning in ComponentState ) then
          begin
            if DefaultDrawing or ( csDesigning in ComponentState ) then
            begin
              Canvas.Font := Self.Font;
              if ( gdSelected in DrawState ) and
                 ( not ( gdFocused in DrawState ) or
                   ( [ goDrawFocusSelected, goRowSelect ] * TCustomGridAccess( Self ).Options <> [] ) ) then
              begin
                Canvas.Brush.Color := clHighlight;
                Canvas.Font.Color := clHighlightText;
              end
              else
                Canvas.Brush.Color := Color;
              Canvas.FillRect( Where );
            end;

            DrawCell( CurCol, CurRow, Where, DrawState );

            (*
            The last step performed by the call to DrawCell above is the following. This is what gives the fixed cells
            a raised look in the inherited grid. We simply paint over this to remove the raised appearance.

            if ( gdFixed in AState ) and ( [ dgRowLines, dgColLines ] * Options = [ dgRowLines, dgColLines ] ) then
            begin
              InflateRect( ARect, 1, 1 );
              DrawEdge( Canvas.Handle, ARect, BDR_RAISEDINNER, BF_BOTTOMRIGHT );
              DrawEdge( Canvas.Handle, ARect, BDR_RAISEDINNER, BF_TOPLEFT );
            end;
            *)

            if ( gdFixed in DrawState ) then
            begin
              // Remove raised appearance from fixed cells
              Canvas.Brush.Style := bsClear;
              Canvas.Pen.Color := FixedColor;
              Canvas.Rectangle( Where );
              Canvas.Brush.Style := bsSolid;
            end;

            if DefaultDrawing and not ( csDesigning in ComponentState ) and ( gdFocused in DrawState ) and
               ( [goEditing, goAlwaysShowEditor] * TCustomGridAccess(Self).Options <> [goEditing, goAlwaysShowEditor] )
               and not ( goRowSelect in TCustomGridAccess( Self ).Options ) then
            begin
              if not UseRightToLeftAlignment then
                DrawFocusRect( Canvas.Handle, Where )
              else
              begin
                AWhere := Where;
                AWhere.Left := Where.Right;
                AWhere.Right := Where.Left;
                DrawFocusRect( Canvas.Handle, AWhere );
              end;
            end;
          end;
        end;
        Where.Left := Where.Right + DrawInfo.Horz.EffectiveLineWidth;
        Inc( CurCol );
      end;
      Where.Top := Where.Bottom + DrawInfo.Vert.EffectiveLineWidth;
      Inc( CurRow );
    end;
  end; {= DrawCells =}

begin {= TRzDBGrid.Paint =}
  if UseRightToLeftAlignment then
    ChangeGridOrientation( True );

  UpdateRect := Canvas.ClipRect;
  CalcDrawInfo( DrawInfo );

  if ( DrawInfo.Horz.EffectiveLineWidth > 0 ) or ( DrawInfo.Vert.EffectiveLineWidth > 0 ) then
  begin
    // Draw the grid line in the four areas (fixed, fixed), (variable, fixed), (fixed, variable) and
    // (variable, variable).

    LC := FLineColor;
    MaxStroke := Max( DrawInfo.Horz.LastFullVisibleCell - LeftCol + FixedCols,
                      DrawInfo.Vert.LastFullVisibleCell - TopRow + FixedRows ) + 3;

    PointsList := StackAlloc( MaxStroke * SizeOf( TPoint ) * 2 );
    StrokeList := StackAlloc( MaxStroke * SizeOf( Integer ) );
    FillDWord( StrokeList^, MaxStroke, 2 );

    if ColorToRGB( LineColor ) = ColorToRGB( Color ) then
      LC := DarkerColor( LineColor, 50 );

    DrawLines( goFixedHorzLine in TCustomGridAccess( Self ).Options,
               goFixedVertLine in TCustomGridAccess( Self ).Options,
               0, 0,
               [ 0, 0, DrawInfo.Horz.FixedBoundary, DrawInfo.Vert.FixedBoundary ],
               FFixedLineColor, FixedColor );

    DrawLines( goFixedHorzLine in TCustomGridAccess( Self ).Options,
               goFixedVertLine in TCustomGridAccess( Self ).Options,
               LeftCol, 0,
               [ DrawInfo.Horz.FixedBoundary, 0, DrawInfo.Horz.GridBoundary, DrawInfo.Vert.FixedBoundary],
               FFixedLineColor, FixedColor );

    DrawLines( goFixedHorzLine in TCustomGridAccess( Self ).Options,
               goFixedVertLine in TCustomGridAccess( Self ).Options,
               0, TopRow,
               [ 0, DrawInfo.Vert.FixedBoundary, DrawInfo.Horz.FixedBoundary, DrawInfo.Vert.GridBoundary ],
               FFixedLineColor, FixedColor );

    DrawLines( goHorzLine in TCustomGridAccess( Self ).Options,
               goVertLine in TCustomGridAccess( Self ).Options,
               LeftCol, TopRow,
               [ DrawInfo.Horz.FixedBoundary, DrawInfo.Vert.FixedBoundary, DrawInfo.Horz.GridBoundary,
                 DrawInfo.Vert.GridBoundary ],
               LC, Color );

    StackFree( StrokeList );
    StackFree( PointsList );
  end;

  // Draw the cells in the four areas
  Sel := Selection;

  DrawCells( 0, 0, 0, 0, DrawInfo.Horz.FixedBoundary, DrawInfo.Vert.FixedBoundary, FixedColor, [ gdFixed ] );

  DrawCells( LeftCol, 0, DrawInfo.Horz.FixedBoundary {!!- FColOffset}, 0, DrawInfo.Horz.GridBoundary,
             DrawInfo.Vert.FixedBoundary, FixedColor, [ gdFixed ] );

  DrawCells( 0, TopRow, 0, DrawInfo.Vert.FixedBoundary, DrawInfo.Horz.FixedBoundary, DrawInfo.Vert.GridBoundary,
             FixedColor, [ gdFixed ] );

  DrawCells( LeftCol, TopRow, DrawInfo.Horz.FixedBoundary {!!- FColOffset},
             DrawInfo.Vert.FixedBoundary, DrawInfo.Horz.GridBoundary, DrawInfo.Vert.GridBoundary, Color, [] );

  if not ( csDesigning in ComponentState ) and ( goRowSelect in TCustomGridAccess( Self ).Options ) and
     DefaultDrawing and Focused then
  begin
    GridRectToScreenRect( Selection, FocRect, False );
    if not UseRightToLeftAlignment then
      Canvas.DrawFocusRect( FocRect )
    else
    begin
      AFocRect := FocRect;
      AFocRect.Left := FocRect.Right;
      AFocRect.Right := FocRect.Left;
      DrawFocusRect( Canvas.Handle, AFocRect );
    end;
  end;

  // Fill in area not occupied by cells
  if DrawInfo.Horz.GridBoundary < DrawInfo.Horz.GridExtent then
  begin
    Canvas.Brush.Color := Color;
    Canvas.FillRect( Rect( DrawInfo.Horz.GridBoundary, 0, DrawInfo.Horz.GridExtent, DrawInfo.Vert.GridBoundary ) );
  end;

  if DrawInfo.Vert.GridBoundary < DrawInfo.Vert.GridExtent then
  begin
    Canvas.Brush.Color := Color;
    Canvas.FillRect( Rect( 0, DrawInfo.Vert.GridBoundary, DrawInfo.Horz.GridExtent, DrawInfo.Vert.GridExtent ) );
  end;

  if UseRightToLeftAlignment then
    ChangeGridOrientation( False );
end; {= TRzDBGrid.Paint =}


{$IFNDEF VCL60_OR_HIGHER}

procedure TRzDBGrid.ChangeGridOrientation( RightToLeftOrientation: Boolean );
var
  Org: TPoint;
  Ext: TPoint;
begin
  if RightToLeftOrientation then
  begin
    Org := Point( ClientWidth, 0 );
    Ext := Point( -1, 1 );
    SetMapMode( Canvas.Handle, mm_Anisotropic );
    SetWindowOrgEx( Canvas.Handle, Org.X, Org.Y, nil );
    SetViewportExtEx( Canvas.Handle, ClientWidth, ClientHeight, nil );
    SetWindowExtEx( Canvas.Handle, Ext.X * ClientWidth, Ext.Y * ClientHeight, nil );
  end
  else
  begin
    Org := Point( 0, 0 );
    Ext := Point( 1, 1 );
    SetMapMode( Canvas.Handle, mm_Anisotropic );
    SetWindowOrgEx( Canvas.Handle, Org.X, Org.Y, nil );
    SetViewportExtEx( Canvas.Handle, ClientWidth, ClientHeight, nil );
    SetWindowExtEx( Canvas.Handle, Ext.X * ClientWidth, Ext.Y * ClientHeight, nil );
  end;
end;

{$ENDIF}


procedure TRzDBGrid.GridRectToScreenRect( GridRect: TGridRect; var ScreenRect: TRect; IncludeLine: Boolean );

  function LinePos( const AxisInfo: TGridAxisDrawInfo; Line: Integer ): Integer;
  var
    Start, I: Longint;
  begin
    Result := 0;
    if Line < AxisInfo.FixedCellCount then
      Start := 0
    else
    begin
      if Line >= AxisInfo.FirstGridCell then
        Result := AxisInfo.FixedBoundary;
      Start := AxisInfo.FirstGridCell;
    end;
    for I := Start to Line - 1 do
    begin
      Inc( Result, AxisInfo.GetExtent( I ) + AxisInfo.EffectiveLineWidth );
      if Result > AxisInfo.GridExtent then
      begin
        Result := 0;
        Exit;
      end;
    end;
  end; {= LinePos =}


  function CalcAxis( const AxisInfo: TGridAxisDrawInfo; GridRectMin, GridRectMax: Integer;
                     var ScreenRectMin, ScreenRectMax: Integer ): Boolean;
  begin
    Result := False;

    if ( GridRectMin >= AxisInfo.FixedCellCount ) and ( GridRectMin < AxisInfo.FirstGridCell ) then
    begin
      if GridRectMax < AxisInfo.FirstGridCell then
      begin
        FillChar( ScreenRect, SizeOf( ScreenRect ), 0 ); // Erase partial results
        Exit;
      end
      else
        GridRectMin := AxisInfo.FirstGridCell;
    end;

    if GridRectMax > AxisInfo.LastFullVisibleCell then
    begin
      GridRectMax := AxisInfo.LastFullVisibleCell;
      if GridRectMax < AxisInfo.GridCellCount - 1 then
        Inc( GridRectMax );

      if LinePos( AxisInfo, GridRectMax ) = 0 then
        Dec( GridRectMax );
    end;

    ScreenRectMin := LinePos( AxisInfo, GridRectMin );
    ScreenRectMax := LinePos( AxisInfo, GridRectMax );

    if ScreenRectMax = 0 then
      ScreenRectMax := ScreenRectMin + AxisInfo.GetExtent( GridRectMin )
    else
      Inc( ScreenRectMax, AxisInfo.GetExtent( GridRectMax ) );

    if ScreenRectMax > AxisInfo.GridExtent then
      ScreenRectMax := AxisInfo.GridExtent;
    if IncludeLine then
      Inc( ScreenRectMax, AxisInfo.EffectiveLineWidth );

    Result := True;
  end; {= CalcAxis =}

var
  DrawInfo: TGridDrawInfo;
  Hold: Integer;
begin {= TRzDBGrid.GridRectToScreenRect =}
  FillChar( ScreenRect, SizeOf( ScreenRect ), 0 );
  if ( GridRect.Left > GridRect.Right ) or ( GridRect.Top > GridRect.Bottom ) then
    Exit;

  CalcDrawInfo( DrawInfo );
  if GridRect.Left > DrawInfo.Horz.LastFullVisibleCell + 1 then
    Exit;

  if GridRect.Top > DrawInfo.Vert.LastFullVisibleCell + 1 then
    Exit;

  if CalcAxis( DrawInfo.Horz, GridRect.Left, GridRect.Right, ScreenRect.Left, ScreenRect.Right ) then
  begin
    CalcAxis( DrawInfo.Vert, GridRect.Top, GridRect.Bottom, ScreenRect.Top, ScreenRect.Bottom );
  end;

  if UseRightToLeftAlignment and ( Canvas.CanvasOrientation = coLeftToRight ) then
  begin
    Hold := ScreenRect.Left;
    ScreenRect.Left := ClientWidth - ScreenRect.Right;
    ScreenRect.Right := ClientWidth - Hold;
  end;
end; {= TRzDBGrid.GridRectToScreenRect =}


{&RUIF}
end.
