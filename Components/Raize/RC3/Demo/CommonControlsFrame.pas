{=======================================================================================================================
  CommonControlsFrame Unit

  Raize Components - Demo Program Source Unit

  Copyright © 1995-2002 by Raize Software, Inc.  All Rights Reserved.
=======================================================================================================================}

{$I RC3Demo.inc}

unit CommonControlsFrame;

interface

uses
  Forms,
  ImgList,
  Controls,
  Menus,
  RzButton,
  RzRadChk,
  StdCtrls,
  RzLabel,
  RzPanel,
  RzEdit,
  ComCtrls,
  RzListVw,
  RzTreeVw,
  RzSplit,
  RzStatus,
  Classes,
  ExtCtrls;

type
  TFmeCommonControls = class(TFrame)
    RzToolbar1: TRzToolbar;
    RzStatusBar1: TRzStatusBar;
    RzSplitter1: TRzSplitter;
    MnuPopup: TPopupMenu;
    ImlPopup: TImageList;
    MnuMailMessage: TMenuItem;
    N1: TMenuItem;
    MnuAppointment: TMenuItem;
    MnuContact: TMenuItem;
    MnuTask: TMenuItem;
    MnuNote: TMenuItem;
    TvwFolders: TRzCheckTree;
    RzSplitter2: TRzSplitter;
    EdtMessage: TRzMemo;
    RzStatusPane1: TRzStatusPane;
    RzGlyphStatus1: TRzGlyphStatus;
    RzStatusPane2: TRzStatusPane;
    ImlTreeView: TImageList;
    RzListView1: TRzListView;
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    LblFrom: TRzLabel;
    RzLabel5: TRzLabel;
    LblSubject: TRzLabel;
    RzToolbar2: TRzToolbar;
    ChkCascadeChecks: TRzCheckBox;
    RzSpacer5: TRzSpacer;
    ChkAlphaSortAll: TRzCheckBox;
    ChkFillLastCol: TRzCheckBox;
    ChkEditOnRowClick: TRzCheckBox;
    RzToolButton1: TRzToolButton;
    RzSpacer1: TRzSpacer;
    BtnOpen: TRzToolButton;
    BtnSave: TRzToolButton;
    RzSpacer2: TRzSpacer;
    BtnCut: TRzToolButton;
    BtnCopy: TRzToolButton;
    BtnPaste: TRzToolButton;
    BtnUndo: TRzToolButton;
    BtnRedo: TRzToolButton;
    RzSpacer3: TRzSpacer;
    BtnFind: TRzToolButton;
    BtnReplace: TRzToolButton;
    BtnFindNext: TRzToolButton;
    RzLabel9: TRzPanel;
    procedure RzListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ChkCascadeChecksClick(Sender: TObject);
    procedure ChkAlphaSortAllClick(Sender: TObject);
    procedure ChkFillLastColClick(Sender: TObject);
    procedure ChkEditOnRowClickClick(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
  private
  public
    procedure Init;
  end;


implementation

{$R *.dfm}

uses
  Dialogs;


procedure TFmeCommonControls.Init;
begin
  {$IFDEF VCL70_OR_HIGHER}
  ParentBackground := False;
  {$ENDIF}
  TvwFolders.Items[ 0 ].Expand( True );
end;


procedure TFmeCommonControls.RzListView1Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  LblFrom.Caption := Item.Caption;
  if Item.SubItems.Count > 0 then
  begin
    LblSubject.Caption := Item.SubItems[ 0 ];

    EdtMessage.Clear;
    with EdtMessage.Lines do
    begin
      if LblFrom.Caption = 'Jennifer Davis' then
      begin
        Add( 'Hi Raize,' );
        Add( 'Congratulatiosn on the new version. I can''t believe all of the new features!' );
        Add( '' );
        Add( 'Jen' );
      end
      else if LblFrom.Caption = 'Arthur Jones' then
      begin
        Add( 'Hi All,' );
        Add( 'Absolutely Awesome! RC3 is an amazing upgrade to an already great product.' );
        Add( '' );
        Add( 'Art Jones' );
      end
      else if LblFrom.Caption = 'Debra Parker' then
      begin
        Add( 'Hello,' );
        Add( 'I just got the new version. The Custom Framing options are very cool! Keep up the great work.' );
        Add( '' );
        Add( 'Debra' );
      end
      else if LblFrom.Caption = 'Dave Sawyer' then
      begin
        Add( 'Hi,' );
        Add( 'The subject says it all.  Where can I purchase the next generation of Raize Components?' );
        Add( '' );
        Add( 'Dave' );
      end
      else if LblFrom.Caption = 'Cindy White' then
      begin
        Add( 'I just heard about the new version.  I purchased RC 2.1 a while back and I want to know if I''m eligible for an upgrade?' );
        Add( '' );
        Add( 'Cindy' );
      end
      else
        EdtMessage.Clear;
    end;
  end;
end;

procedure TFmeCommonControls.ChkCascadeChecksClick(Sender: TObject);
begin
  TvwFolders.CascadeChecks := ChkCascadeChecks.Checked;
end;

procedure TFmeCommonControls.ChkAlphaSortAllClick(Sender: TObject);
begin
  RzListView1.AlphaSortAll := ChkAlphaSortAll.Checked;
end;

procedure TFmeCommonControls.ChkFillLastColClick(Sender: TObject);
begin
  RzListView1.FillLastColumn := ChkFillLastCol.Checked;
end;

procedure TFmeCommonControls.ChkEditOnRowClickClick(Sender: TObject);
begin
  RzListView1.EditOnRowClick := ChkEditOnRowClick.Checked;
end;

procedure TFmeCommonControls.RzToolButton1Click(Sender: TObject);
begin
  ShowMessage( 'Create a new message' );
end;

end.
