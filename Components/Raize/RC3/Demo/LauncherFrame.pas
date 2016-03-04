{=======================================================================================================================
  LauncherFrame Unit

  Raize Components - Demo Program Source Unit

  Copyright � 1995-2002 by Raize Software, Inc.  All Rights Reserved.
=======================================================================================================================}

{$I RC3Demo.inc}

unit LauncherFrame;

interface

uses
  Forms,
  Windows,
  RzShellDialogs,
  RzLaunch,
  RzLabel,
  RzButton,
  RzRadChk,
  StdCtrls,
  Mask,
  RzEdit,
  RzBtnEdt,
  Controls,
  ExtCtrls,
  RzPanel,
  Graphics,
  Classes,
  RzBckgnd;

type
  TFmeLauncher = class(TFrame)
    RzLauncher1: TRzLauncher;
    DlgOpen: TRzOpenDialog;
    RzGroupBox1: TRzGroupBox;
    RzLabel2: TRzLabel;
    EdtFileName: TRzButtonEdit;
    RzLabel6: TRzLabel;
    EdtParameters: TRzEdit;
    ChkWait: TRzCheckBox;
    BtnLaunch: TRzButton;
    RzGroupBox2: TRzGroupBox;
    RzLabel3: TRzLabel;
    RzURLLabel4: TRzURLLabel;
    RzLabel4: TRzLabel;
    RzURLLabel5: TRzURLLabel;
    RzURLLabel6: TRzURLLabel;
    RzLabel5: TRzLabel;
    PnlTitle: TRzPanel;
    BtnExecute: TRzButton;
    RzSeparator2: TRzSeparator;
    RzSeparator1: TRzSeparator;
    ChkIgnoreErrors: TRzCheckBox;
    procedure EdtFileNameButtonClick(Sender: TObject);
    procedure BtnLaunchClick(Sender: TObject);
    procedure RzLauncher1Finished(Sender: TObject);
    procedure RzLauncher1Error(Sender: TObject; ErrorCode: Cardinal);
    procedure BtnExecuteClick(Sender: TObject);
  private
    procedure UpdateStatus( Enabled: Boolean );
  public
    procedure Init;
  end;

implementation

{$R *.dfm}

uses
  SysUtils,
  Dialogs;


procedure TFmeLauncher.Init;
begin
  {$IFDEF VCL70_OR_HIGHER}
  ParentBackground := False;
  {$ENDIF}
end;


procedure TFmeLauncher.EdtFileNameButtonClick( Sender: TObject );
begin
  if DlgOpen.Execute then
  begin
    EdtFileName.Text := DlgOpen.FileName;
  end;
end;


procedure TFmeLauncher.BtnLaunchClick( Sender: TObject );
begin
  RzLauncher1.FileName := EdtFileName.Text;
  RzLauncher1.Parameters := EdtParameters.Text;
  RzLauncher1.WaitUntilFinished := ChkWait.Checked;
  RzLauncher1.Launch;

  if RzLauncher1.FileName <> '' then
    UpdateStatus( False );
end;


procedure TFmeLauncher.RzLauncher1Finished( Sender: TObject );
begin
  MessageDlg( RzLauncher1.FileName + ' has finished running.', mtInformation, [ mbOK ], 0 );
  UpdateStatus( True );
end;


procedure TFmeLauncher.RzLauncher1Error( Sender: TObject; ErrorCode: Cardinal );
begin
  MessageDlg( Format( '%s could not be started. ErrorCode = %d', [ RzLauncher1.FileName, ErrorCode ] ),
              mtError, [ mbOK ], 0 );
  UpdateStatus( True );
end;


procedure TFmeLauncher.UpdateStatus( Enabled: Boolean );
begin
  BtnLaunch.Enabled := Enabled;
  ChkWait.Enabled := Enabled;
end;


procedure TFmeLauncher.BtnExecuteClick(Sender: TObject);
var
  ErrorCode: DWord;
begin
  RzLauncher1.FileName := EdtFileName.Text;
  RzLauncher1.Parameters := EdtParameters.Text;
  if ChkIgnoreErrors.Checked then
    RzLauncher1.Execute
  else
  begin
    ErrorCode := RzLauncher1.Execute;
    if ErrorCode <> 0 then
    begin
      MessageDlg( Format( '%s could not be started. ErrorCode = %d', [ RzLauncher1.FileName, ErrorCode ] ),
                  mtError, [ mbOK ], 0 );
    end;
  end;
end;

end.