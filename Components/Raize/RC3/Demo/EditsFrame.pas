{=======================================================================================================================
  EditsFrame Unit

  Raize Components - Demo Program Source Unit

  Copyright © 1995-2002 by Raize Software, Inc.  All Rights Reserved.
=======================================================================================================================}

{$I RC3Demo.inc}

unit EditsFrame;

interface

uses
  Forms,
  RzCommon,
  RzEdit,
  Controls,
  StdCtrls,
  RzCmboBx,
  RzBtnEdt,
  RzSpnEdt,
  RzButton,
  RzRadChk,
  Mask,
  RzLabel,
  Classes,
  ExtCtrls,
  RzPanel;

type
  TFmeEdits = class(TFrame)
    GrpEdits: TRzGroupBox;
    GrpSpinEdits: TRzGroupBox;
    GrpButtonEdits: TRzGroupBox;
    BedPreview: TRzButtonEdit;
    SpnPreview: TRzSpinEdit;
    RzEdit1: TRzEdit;
    RzMaskEdit1: TRzMaskEdit;
    ChkSpnFlat: TRzCheckBox;
    ChkHorzBtns: TRzCheckBox;
    ChkDirection: TRzCheckBox;
    SpnButtonWidth: TRzSpinner;
    RzLabel1: TRzLabel;
    ChkBtnFlat: TRzCheckBox;
    ChkButtonVisible: TRzCheckBox;
    ChkAltBtnVisible: TRzCheckBox;
    CbxButtonKind: TRzComboBox;
    CbxAltBtnKind: TRzComboBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    GrpDateTimeColor: TRzGroupBox;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    Label1: TLabel;
    RzDateTimeEdit1: TRzDateTimeEdit;
    RzDateTimeEdit2: TRzDateTimeEdit;
    RzColorEdit1: TRzColorEdit;
    RzFrameController1: TRzFrameController;
    PnlTitle: TRzPanel;
    procedure SpnButtonWidthChange(Sender: TObject);
    procedure ChkSpnFlatClick(Sender: TObject);
    procedure ChkHorzBtnsClick(Sender: TObject);
    procedure ChkDirectionClick(Sender: TObject);
    procedure ChkBtnFlatClick(Sender: TObject);
    procedure ChkButtonVisibleClick(Sender: TObject);
    procedure ChkAltBtnVisibleClick(Sender: TObject);
    procedure CbxButtonKindChange(Sender: TObject);
    procedure CbxAltBtnKindChange(Sender: TObject);
  private
  public
    procedure Init;
  end;


implementation

{$R *.dfm}

uses
  SysUtils;

procedure TFmeEdits.Init;
begin
  {$IFDEF VCL70_OR_HIGHER}
  ParentBackground := False;
  {$ENDIF}

//  CbxButtonKind.FindItem( 'bkLookup' );
//  CbxAltBtnKind.FindItem( 'bkLookup' );

  RzDateTimeEdit1.Date := Date;
  RzDateTimeEdit2.Time := Time;
end;


procedure TFmeEdits.SpnButtonWidthChange(Sender: TObject);
begin
  SpnPreview.ButtonWidth := SpnButtonWidth.Value;
end;

procedure TFmeEdits.ChkSpnFlatClick(Sender: TObject);
begin
  SpnPreview.FlatButtons := ChkSpnFlat.Checked;
end;

procedure TFmeEdits.ChkHorzBtnsClick(Sender: TObject);
begin
  if ChkHorzBtns.Checked then
    SpnPreview.Orientation := orHorizontal
  else
    SpnPreview.Orientation := orVertical;
end;

procedure TFmeEdits.ChkDirectionClick(Sender: TObject);
begin
  if ChkDirection.Checked then
    SpnPreview.Direction := sdLeftRight
  else
    SpnPreview.Direction := sdUpDown;
end;

procedure TFmeEdits.ChkBtnFlatClick(Sender: TObject);
begin
  BedPreview.FlatButtons := ChkBtnFlat.Checked;
end;

procedure TFmeEdits.ChkButtonVisibleClick(Sender: TObject);
begin
  BedPreview.ButtonVisible := ChkButtonVisible.Checked;
end;

procedure TFmeEdits.ChkAltBtnVisibleClick(Sender: TObject);
begin
  BedPreview.AltBtnVisible := ChkAltBtnVisible.Checked;
end;

procedure TFmeEdits.CbxButtonKindChange(Sender: TObject);
begin
  BedPreview.ButtonKind := TButtonKind( CbxButtonKind.ItemIndex + 1 );
end;

procedure TFmeEdits.CbxAltBtnKindChange(Sender: TObject);
begin
  BedPreview.AltBtnKind := TButtonKind( CbxAltBtnKind.ItemIndex + 1 );
end;


end.
