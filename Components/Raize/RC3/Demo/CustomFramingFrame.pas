{=======================================================================================================================
  CustomFramingFrame Unit

  Raize Components - Demo Program Source Unit

  Copyright © 1995-2002 by Raize Software, Inc.  All Rights Reserved.
=======================================================================================================================}

{$I RC3Demo.inc}

unit CustomFramingFrame;

interface

uses
  Forms,
  ImgList,
  Controls,
  RzEdit,
  ComCtrls,
  RzListVw,
  StdCtrls,
  RzLstBox,
  RzSpnEdt,
  RzBtnEdt,
  RzCmboBx,
  RzPanel,
  RzRadGrp,
  Mask,
  RzButton,
  RzRadChk,
  RzLabel,
  ExtCtrls,
  Classes,
  RzBckgnd,
  RzCommon;

type
  TFmeCustomFraming = class(TFrame)
    RzPanel1: TRzPanel;
    CbxFrameHotStyle: TRzComboBox;
    CbxFrameStyle: TRzComboBox;
    ChkFrameHotTrack: TRzCheckBox;
    ChkFlatButtons: TRzCheckBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzFrameController1: TRzFrameController;
    RzEdit1: TRzEdit;
    RzMemo1: TRzMemo;
    CbxStandard: TRzComboBox;
    RzColorComboBox1: TRzColorComboBox;
    RzFontComboBox1: TRzFontComboBox;
    RzButtonEdit1: TRzButtonEdit;
    RzSpinEdit1: TRzSpinEdit;
    ChkFrameVisible: TRzCheckBox;
    EdtFrameColor: TRzColorEdit;
    EdtColor: TRzColorEdit;
    EdtDisabledColor: TRzColorEdit;
    EdtFocusColor: TRzColorEdit;
    EdtFlatButtonColor: TRzColorEdit;
    RzFontListBox1: TRzFontListBox;
    RzListView1: TRzListView;
    ImageList1: TImageList;
    RzDateTimeEdit1: TRzDateTimeEdit;
    RzDateTimeEdit2: TRzDateTimeEdit;
    EdtFrameHotColor: TRzColorEdit;
    GrpFrameSides: TRzCheckGroup;
    RzFrameController2: TRzFrameController;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzSeparator1: TRzSeparator;
    PnlTitle: TRzPanel;
    procedure ChkFlatButtonsClick(Sender: TObject);
    procedure ChkFrameVisibleClick(Sender: TObject);
    procedure ChkFrameHotTrackClick(Sender: TObject);
    procedure CbxFrameStyleChange(Sender: TObject);
    procedure CbxFrameHotStyleChange(Sender: TObject);
    procedure EdtFrameColorChange(Sender: TObject);
    procedure EdtColorChange(Sender: TObject);
    procedure GrpFrameSidesChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure EdtFocusColorChange(Sender: TObject);
    procedure EdtDisabledColorChange(Sender: TObject);
    procedure EdtFlatButtonColorChange(Sender: TObject);
    procedure EdtFrameHotColorChange(Sender: TObject);
  private
  public
    procedure Init;
  end;


implementation

{$R *.dfm}

uses
  SysUtils;

procedure TFmeCustomFraming.Init;
begin
  {$IFDEF VCL70_OR_HIGHER}
  ParentBackground := False;
  {$ENDIF}
  RzDateTimeEdit1.Date := Date;
  RzDateTimeEdit2.Time := Time;
  CbxFrameHotStyle.FindItem( 'fsFlatBold' );
  CbxFrameStyle.FindItem( 'fsFlat' );
  CbxStandard.FindItem( 'Hysteria' );
end;

procedure TFmeCustomFraming.ChkFlatButtonsClick(Sender: TObject);
begin
  RzFrameController1.FlatButtons := ChkFlatButtons.Checked;
end;

procedure TFmeCustomFraming.ChkFrameVisibleClick(Sender: TObject);
begin
  RzFrameController1.FrameVisible := ChkFrameVisible.Checked;
end;

procedure TFmeCustomFraming.ChkFrameHotTrackClick(Sender: TObject);
begin
  RzFrameController1.FrameHotTrack := ChkFrameHotTrack.Checked;
  if ChkFrameHotTrack.Checked then
    ChkFrameVisible.Checked := True;
  CbxFrameHotStyle.Enabled := ChkFrameHotTrack.Checked;
  EdtFrameHotColor.Enabled := ChkFrameHotTrack.Checked;
end;

procedure TFmeCustomFraming.CbxFrameStyleChange(Sender: TObject);
begin
  RzFrameController1.FrameStyle := TFrameStyle( CbxFrameStyle.ItemIndex );
end;

procedure TFmeCustomFraming.CbxFrameHotStyleChange(Sender: TObject);
begin
  RzFrameController1.FrameHotStyle := TFrameStyle( CbxFrameHotStyle.ItemIndex );
end;

procedure TFmeCustomFraming.EdtFrameColorChange(Sender: TObject);
begin
  RzFrameController1.FrameColor := EdtFrameColor.SelectedColor;
end;

procedure TFmeCustomFraming.EdtColorChange(Sender: TObject);
begin
  RzFrameController1.Color := EdtColor.SelectedColor;
end;

procedure TFmeCustomFraming.GrpFrameSidesChange(Sender: TObject; Index: Integer; NewState: TCheckBoxState);
var
  S: TSides;
begin
  S := [];
  if GrpFrameSides.ItemChecked[ 0 ] then
    S := S + [ sdLeft ];
  if GrpFrameSides.ItemChecked[ 1 ] then
    S := S + [ sdTop ];
  if GrpFrameSides.ItemChecked[ 2 ] then
    S := S + [ sdRight ];
  if GrpFrameSides.ItemChecked[ 3 ] then
    S := S + [ sdBottom ];

  RzFrameController1.FrameSides := S;
end;

procedure TFmeCustomFraming.EdtFocusColorChange(Sender: TObject);
begin
  RzFrameController1.FocusColor := EdtFocusColor.SelectedColor;
end;

procedure TFmeCustomFraming.EdtDisabledColorChange(Sender: TObject);
begin
  RzFrameController1.DisabledColor := EdtDisabledColor.SelectedColor;
end;

procedure TFmeCustomFraming.EdtFlatButtonColorChange(Sender: TObject);
begin
  RzFrameController1.FlatButtonColor := EdtFlatButtonColor.SelectedColor;
end;

procedure TFmeCustomFraming.EdtFrameHotColorChange(Sender: TObject);
begin
  RzFrameController1.FrameHotColor := EdtFrameHotColor.SelectedColor;
end;

end.


