{=======================================================================================================================
  DisplayFrame Unit

  Raize Components - Demo Program Source Unit

  Copyright © 1995-2002 by Raize Software, Inc.  All Rights Reserved.
=======================================================================================================================}

{$I RC3Demo.inc}

unit DisplayFrame;

interface

uses
  Forms,
  RzStatus,
  ImgList,
  Controls,
  RzPanel,
  RzEdit,
  RzBorder,
  RzAnimtr,
  RzRadGrp,
  RzButton,
  RzRadChk,
  StdCtrls,
  RzCmboBx,
  Mask,
  RzSpnEdt,
  RzTrkBar,
  RzLabel,
  RzPrgres,
  Classes,
  ExtCtrls,
  Windows,
  Graphics, RzBckgnd;

type
  TFmeDisplay = class(TFrame)
    PnlTitle: TRzLabel;
    RzPanel1: TRzPanel;
    RzBackground1: TRzBackground;
    GrpTRzProgressBar: TRzGroupBox;
    PbrPreview: TRzProgressBar;
    RzLabel2: TRzLabel;
    TrkPercent: TRzTrackBar;
    SpnTotal: TRzSpinEdit;
    SpnPartsComp: TRzSpinEdit;
    CbxOuter: TRzComboBox;
    ChkLED: TRzCheckBox;
    EdtBarColor: TRzColorEdit;
    EdtBackColor: TRzColorEdit;
    GrpTRzLabel: TRzGroupBox;
    LblPreview: TRzLabel;
    GrpTextStyle: TRzRadioGroup;
    GrpRotation: TRzGroupBox;
    LblAngle: TRzLabel;
    TrkAngle: TRzTrackBar;
    RzAnimator1: TRzAnimator;
    GrpTRzLEDDisplay: TRzGroupBox;
    LedPreview: TRzLEDDisplay;
    RzLabel1: TRzLabel;
    EdtLedCaption: TRzEdit;
    GrpDirection: TRzRadioGroup;
    ChkScroll: TRzCheckBox;
    RzGroupBox1: TRzGroupBox;
    RzVersionInfoStatus2: TRzVersionInfoStatus;
    RzVersionInfoStatus3: TRzVersionInfoStatus;
    RzVersionInfoStatus1: TRzVersionInfoStatus;
    RzVersionInfoStatus4: TRzVersionInfoStatus;
    ImageList1: TImageList;
    RzVersionInfo1: TRzVersionInfo;
    TrkBorderWidth: TRzTrackBar;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    procedure GrpTextStyleClick(Sender: TObject);
    procedure TrkAngleDrawTick( TrackBar: TRzTrackBar; Canvas: TCanvas; Location: TPoint; Index: Integer );
    procedure TrkAngleChange(Sender: TObject);
    procedure TrkPercentChange(Sender: TObject);
    procedure SpnPartsCompChange(Sender: TObject);
    procedure SpnTotalChange(Sender: TObject);
    procedure SpnPartsCompChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure EdtLedCaptionChange(Sender: TObject);
    procedure CbxOuterChange(Sender: TObject);
    procedure ChkLEDClick(Sender: TObject);
    procedure ChkScrollClick(Sender: TObject);
    procedure GrpDirectionClick(Sender: TObject);
    procedure EdtBarColorChange(Sender: TObject);
    procedure EdtBackColorChange(Sender: TObject);
    procedure TrkBorderWidthChange(Sender: TObject);
  public
    procedure Init;
  end;


implementation

{$R *.dfm}


uses
  RzCommon,
  SysUtils;


procedure TFmeDisplay.Init;
begin
  {$IFDEF VCL70_OR_HIGHER}
  ParentBackground := False;
  {$ENDIF}
end;


procedure TFmeDisplay.GrpTextStyleClick(Sender: TObject);
begin
  LblPreview.TextStyle := TTextStyle( GrpTextStyle.ItemIndex );
end;


procedure TFmeDisplay.TrkAngleDrawTick(TrackBar: TRzTrackBar;
  Canvas: TCanvas; Location: TPoint; Index: Integer);
var
  W, Degree : Integer;
begin
  Degree := Index;
  if ( Degree mod 90 ) = 0 then
  begin
    Canvas.Brush.Style := bsClear;
    Canvas.Font.Name := 'Small Fonts';
    Canvas.Font.Size := 7;
    Canvas.Font.Style := [];
    W := Canvas.TextWidth( IntToStr( Degree ) );
    Canvas.TextOut( Location.X - (W div 2), 1, IntToStr( Degree ) );
  end;
end;


procedure TFmeDisplay.TrkAngleChange(Sender: TObject);
var
  Angle : Integer;
begin
  Angle := TrkAngle.Position;
  LblAngle.Caption := IntToStr( Angle ) + '°';
  LblPreview.Angle := Angle;
end;



procedure TFmeDisplay.TrkPercentChange(Sender: TObject);
begin
  SpnPartsComp.Value := 0;
  SpnTotal.Value := 0;
  PbrPreview.Percent := TrkPercent.Position;
end;

procedure TFmeDisplay.SpnPartsCompChange(Sender: TObject);
begin
  PbrPreview.PartsComplete := SpnPartsComp.IntValue;
end;

procedure TFmeDisplay.SpnTotalChange(Sender: TObject);
begin
  SpnPartsComp.Value := 0;
  SpnPartsCompChange( Self );

  PbrPreview.TotalParts := SpnTotal.IntValue;
end;

procedure TFmeDisplay.SpnPartsCompChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if SpnTotal.IntValue = 0 then
    AllowChange := False;
end;

procedure TFmeDisplay.EdtLedCaptionChange(Sender: TObject);
begin
  LedPreview.Caption := EdtLedCaption.Text;
end;

procedure TFmeDisplay.CbxOuterChange(Sender: TObject);
begin
  PbrPreview.BorderOuter := TFrameStyle( CbxOuter.ItemIndex );
end;

procedure TFmeDisplay.ChkLEDClick(Sender: TObject);
begin
  if ChkLED.Checked then
    PbrPreview.BarStyle := bsLED
  else
    PbrPreview.BarStyle := bsTraditional;
end;

procedure TFmeDisplay.ChkScrollClick(Sender: TObject);
begin
  LedPreview.Scrolling := ChkScroll.Checked;
  GrpDirection.Enabled := ChkScroll.Checked;
end;

procedure TFmeDisplay.GrpDirectionClick(Sender: TObject);
begin
  if GrpDirection.ItemIndex = 0 then
    LedPreview.ScrollType := stRightToLeft
  else
    LedPreview.ScrollType := stLeftToRight;
end;

procedure TFmeDisplay.EdtBarColorChange(Sender: TObject);
begin
  PbrPreview.BarColor := EdtBarColor.SelectedColor;
end;

procedure TFmeDisplay.EdtBackColorChange(Sender: TObject);
begin
  PbrPreview.BackColor := EdtBackColor.SelectedColor;
  PbrPreview.BorderColor := EdtBackColor.SelectedColor;
end;

procedure TFmeDisplay.TrkBorderWidthChange(Sender: TObject);
begin
  PbrPreview.BorderWidth := TrkBorderWidth.Position;
end;

end.


