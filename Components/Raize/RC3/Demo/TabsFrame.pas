{=======================================================================================================================
  PanelsFrame Unit

  Raize Components - Demo Program Source Unit

  Copyright © 1995-2002 by Raize Software, Inc.  All Rights Reserved.
=======================================================================================================================}

{$I RC3Demo.inc}

unit TabsFrame;

interface

uses
  Forms,
  ImgList,
  Controls,
  RzTabs,
  Graphics,
  Classes,
  RzBckgnd, StdCtrls, RzLabel, ExtCtrls, RzPanel, RzButton, RzRadChk,
  RzRadGrp, Mask, RzEdit, RzBorder, RzCommon;

type
  TFmeTabs = class(TFrame)
    ImageList1: TImageList;
    PnlTitle: TRzPanel;
    RzPanel2: TRzPanel;
    RzSeparator1: TRzSeparator;
    GrpTabStyle: TRzGroupBox;
    GrpTabOrientation: TRzGroupBox;
    BtnSingleSlant: TRzToolButton;
    BtnDoubleSlant: TRzToolButton;
    BtnCutCorner: TRzToolButton;
    BtnRoundCorners: TRzToolButton;
    BtnTop: TRzToolButton;
    BtnBottom: TRzToolButton;
    BtnLeft: TRzToolButton;
    BtnRight: TRzToolButton;
    OptTop: TRzRadioButton;
    OptBottom: TRzRadioButton;
    OptLeft: TRzRadioButton;
    OptRight: TRzRadioButton;
    OptSingleSlant: TRzRadioButton;
    OptDoubleSlant: TRzRadioButton;
    OptCutCorner: TRzRadioButton;
    OptRoundCorners: TRzRadioButton;
    RzPanel1: TRzPanel;
    PgcPreview: TRzPageControl;
    TabDates: TRzTabSheet;
    TabFonts: TRzTabSheet;
    TabNotes: TRzTabSheet;
    TabSearch: TRzTabSheet;
    TabPrint: TRzTabSheet;
    GrpTabSequence: TRzRadioGroup;
    GrpImages: TRzGroupBox;
    ChkImages: TRzCheckBox;
    GrpImagePosition: TRzRadioGroup;
    GrpPageDisplay: TRzGroupBox;
    GrpHotTrack: TRzGroupBox;
    GrpHotTrackStyle: TRzRadioGroup;
    EdtHotTrackColor: TRzColorEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    ChkComplement: TRzCheckBox;
    RzBorder1: TRzBorder;
    RzCustomColors1: TRzCustomColors;
    ChkColoredTabs: TRzCheckBox;
    ChkMultiLine: TRzCheckBox;
    EdtFrameColor: TRzColorEdit;
    RzLabel7: TRzLabel;
    GrpTabColors: TRzGroupBox;
    RzLabel4: TRzLabel;
    EdtHighlightBarColor: TRzColorEdit;
    RzLabel5: TRzLabel;
    EdtShadowColor: TRzColorEdit;
    RzLabel6: TRzLabel;
    EdtUnselectedColor: TRzColorEdit;
    ChkUseGradients: TRzCheckBox;
    EdtPageColor: TRzColorEdit;
    RzLabel8: TRzLabel;
    ChkHorizontalText: TRzCheckBox;
    procedure BtnTabStyleClick(Sender: TObject);
    procedure OptTabStyleClick(Sender: TObject);
    procedure OptTabOrientationClick(Sender: TObject);
    procedure BtnTabOrientationClick(Sender: TObject);
    procedure ChkImagesClick(Sender: TObject);
    procedure GrpTabSequenceClick(Sender: TObject);
    procedure ChkColoredTabsClick(Sender: TObject);
    procedure ChkMultiLineClick(Sender: TObject);
    procedure ChkHorizontalTextClick(Sender: TObject);
    procedure GrpImagePositionClick(Sender: TObject);
    procedure GrpHotTrackStyleClick(Sender: TObject);
    procedure EdtHotTrackColorChange(Sender: TObject);
    procedure ChkComplementClick(Sender: TObject);
    procedure ChkUseGradientsClick(Sender: TObject);
    procedure EdtHighlightBarColorChange(Sender: TObject);
    procedure EdtShadowColorChange(Sender: TObject);
    procedure EdtUnselectedColorChange(Sender: TObject);
    procedure EdtFrameColorChange(Sender: TObject);
    procedure EdtPageColorChange(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Init;
  end;


implementation

{$R *.dfm}

uses
  Windows;

procedure TFmeTabs.Init;
begin
  {$IFDEF VCL70_OR_HIGHER}
  ParentBackground := False;
  {$ENDIF}
end;


procedure TFmeTabs.BtnTabStyleClick(Sender: TObject);
begin
  case TRzToolButton( Sender ).Tag of
    0: OptSingleSlant.Checked := True;
    1: OptDoubleSlant.Checked := True;
    2: OptCutCorner.Checked := True;
    3: OptRoundCorners.Checked := True;
  end;
end;

procedure TFmeTabs.OptTabStyleClick(Sender: TObject);
begin
  PgcPreview.TabStyle := TRzTabStyle( TRzRadioButton( Sender ).Tag );
end;


procedure TFmeTabs.BtnTabOrientationClick(Sender: TObject);
begin
  case TRzToolButton( Sender ).Tag of
    0: OptTop.Checked := True;
    1: OptLeft.Checked := True;
    2: OptBottom.Checked := True;
    3: OptRight.Checked := True;
  end;
end;

procedure TFmeTabs.OptTabOrientationClick(Sender: TObject);
begin
  PgcPreview.TabOrientation := TRzTabOrientation( TRzRadioButton( Sender ).Tag );
  case PgcPreview.TabOrientation of
    toTop, toBottom:
    begin
      PgcPreview.TextOrientation := orHorizontal;
      PgcPreview.ImagePosition := ipLeft;
    end;

    toLeft, toRight:
    begin
      PgcPreview.TextOrientation := orVertical;
      if PgcPreview.TabOrientation = toRight then
        PgcPreview.ImagePosition := ipTop
      else
        PgcPreview.ImagePosition := ipBottom;
    end;
  end;
  ChkHorizontalText.Checked := PgcPreview.TextOrientation = orHorizontal;
  GrpImagePosition.ItemIndex := Ord( PgcPreview.ImagePosition );
end;


procedure TFmeTabs.ChkImagesClick(Sender: TObject);
begin
  if ChkImages.Checked then
    PgcPreview.Images := ImageList1
  else
    PgcPreview.Images := nil;
end;

procedure TFmeTabs.GrpTabSequenceClick(Sender: TObject);
begin
  PgcPreview.TabSequence := TRzTabSequence( GrpTabSequence.ItemIndex );
end;

procedure TFmeTabs.ChkColoredTabsClick(Sender: TObject);
begin
  if ChkColoredTabs.Checked then
  begin
    PgcPreview.UseColoredTabs := True;
    TabDates.Color := RGB( 255, 204, 204 );
    TabFonts.Color := RGB( 204, 255, 204 );
    TabNotes.Color := RGB( 255, 255, 204 );
    TabSearch.Color := RGB( 204, 255, 255 );
    TabPrint.Color := RGB( 255, 204, 255 );
  end
  else
  begin
    PgcPreview.UseColoredTabs := False;
    PgcPreview.Color := clBtnFace;
  end;
end;

procedure TFmeTabs.ChkMultiLineClick(Sender: TObject);
begin
  PgcPreview.MultiLine := ChkMultiLine.Checked;
end;

procedure TFmeTabs.ChkHorizontalTextClick(Sender: TObject);
begin
  if ChkHorizontalText.Checked then
    PgcPreview.TextOrientation := orHorizontal
  else
    PgcPreview.TextOrientation := orVertical;
end;

procedure TFmeTabs.GrpImagePositionClick(Sender: TObject);
begin
  PgcPreview.ImagePosition := TRzImagePosition( GrpImagePosition.ItemIndex );
end;

procedure TFmeTabs.GrpHotTrackStyleClick(Sender: TObject);
begin
  PgcPreview.HotTrackStyle := TRzHotTrackStyle ( GrpHotTrackStyle.ItemIndex );
  ChkComplement.Enabled := GrpHotTrackStyle.ItemIndex = 0;
end;

procedure TFmeTabs.EdtHotTrackColorChange(Sender: TObject);
begin
  PgcPreview.HotTrackColor := EdtHotTrackColor.SelectedColor;
end;

procedure TFmeTabs.ChkComplementClick(Sender: TObject);
begin
  if ChkComplement.Checked then
    PgcPreview.HotTrackColorType := htctComplement
  else
    PgcPreview.HotTrackColorType := htctActual;
end;

procedure TFmeTabs.ChkUseGradientsClick(Sender: TObject);
begin
  PgcPreview.UseGradients := ChkUseGradients.Checked;
end;

procedure TFmeTabs.EdtHighlightBarColorChange(Sender: TObject);
begin
  PgcPreview.TabColors.HighlightBar := EdtHighlightBarColor.SelectedColor;
end;

procedure TFmeTabs.EdtShadowColorChange(Sender: TObject);
begin
  PgcPreview.TabColors.Shadow := EdtShadowColor.SelectedColor;
end;

procedure TFmeTabs.EdtUnselectedColorChange(Sender: TObject);
begin
  PgcPreview.TabColors.Unselected := EdtUnselectedColor.SelectedColor;
end;

procedure TFmeTabs.EdtFrameColorChange(Sender: TObject);
begin
  PgcPreview.FlatColor := EdtFrameColor.SelectedColor;
end;

procedure TFmeTabs.EdtPageColorChange(Sender: TObject);
begin
  PgcPreview.Color := EdtPageColor.SelectedColor;
end;

end.
