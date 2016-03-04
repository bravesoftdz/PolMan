{=======================================================================================================================
  SendMessageFrame Unit

  Raize Components - Demo Program Source Unit

  Copyright © 1995-2002 by Raize Software, Inc.  All Rights Reserved.
=======================================================================================================================}

{$I RC3Demo.inc}

unit SendMessageFrame;

interface

uses
  Forms,
  ImgList,
  Controls,
  RzShellDialogs,
  RzSndMsg,
  Mask,
  RzEdit,
  StdCtrls,
  RzLstBox,
  RzPanel,
  RzButton,
  Classes,
  ExtCtrls, RzLabel;

type
  TFmeSendMessages = class(TFrame)
    Msg: TRzSendMessage;
    RzToolbar1: TRzToolbar;
    PnlMessage: TRzPanel;
    EdtMessage: TRzMemo;
    GrpAttach: TRzPanel;
    LstFiles: TRzEditListBox;
    PnlHeader: TRzPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtTO: TRzMemo;
    EdtCC: TRzMemo;
    EdtSubject: TRzEdit;
    DlgOpen: TRzOpenDialog;
    BtnSend: TRzToolButton;
    BtnAttach: TRzToolButton;
    ImageList1: TImageList;
    PnlTitle: TRzPanel;
    procedure BtnSendClick(Sender: TObject);
    procedure BtnAttachClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Init;
  end;


implementation

{$R *.dfm}


procedure TFmeSendMessages.Init;
begin
  {$IFDEF VCL70_OR_HIGHER}
  ParentBackground := False;
  {$ENDIF}
end;


procedure TFmeSendMessages.BtnSendClick(Sender: TObject);
begin
  Msg.Attachments := LstFiles.Items;
  Msg.ToRecipients := EdtTO.Lines;
  Msg.CcRecipients := EdtCC.Lines;
  Msg.Send;
  { Clear all fields }
  EdtTo.Clear;
  EdtCC.Clear;
  EdtSubject.Clear;
  EdtMessage.Clear;
  LstFiles.Clear;
end;


procedure TFmeSendMessages.BtnAttachClick(Sender: TObject);
begin
  if DlgOpen.Execute then
    LstFiles.Items.Add( DlgOpen.FileName );
end;


procedure TFmeSendMessages.BtnRemoveClick(Sender: TObject);
begin
  if LstFiles.ItemIndex <> -1 then
    LstFiles.Items.Delete( LstFiles.ItemIndex );
end;


end.
