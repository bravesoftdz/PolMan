{=======================================================================================================================
  ShellFrame Unit

  Raize Components - Demo Program Source Unit

  Copyright © 1995-2002 by Raize Software, Inc.  All Rights Reserved.
=======================================================================================================================}

{$I RC3Demo.inc}

unit ShellFrame;

interface

uses
  Forms,
  RzShellDialogs,
  ImgList,
  Controls,
  RzPanel,
  RzButton,
  ComCtrls,
  RzListVw,
  RzShellCtrls,
  StdCtrls,
  RzCmboBx,
  RzTreeVw,
  Classes,
  ExtCtrls,
  RzSplit, RzLabel;

type
  TFmeShell = class(TFrame)
    SplPreview: TRzSplitter;
    RzStatusBar1: TRzStatusBar;
    RzShellTree1: TRzShellTree;
    RzShellList1: TRzShellList;
    RzPanel1: TRzPanel;
    RzShellCombo1: TRzShellCombo;
    RzToolbar1: TRzToolbar;
    ImageList1: TImageList;
    BtnOpen: TRzToolButton;
    BtnSave: TRzToolButton;
    RzSpacer1: TRzSpacer;
    BtnUpOneLevel: TRzToolButton;
    BtnSelectFolder: TRzToolButton;
    RzSpacer2: TRzSpacer;
    BtnViewIcons: TRzToolButton;
    BtnViewList: TRzToolButton;
    BtnViewDetails: TRzToolButton;
    RzOpenDialog1: TRzOpenDialog;
    RzSaveDialog1: TRzSaveDialog;
    RzSelectFolderDialog1: TRzSelectFolderDialog;
    PnlTitle: TRzPanel;
    procedure BtnViewIconsClick(Sender: TObject);
    procedure BtnViewListClick(Sender: TObject);
    procedure BtnViewDetailsClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnUpOneLevelClick(Sender: TObject);
    procedure BtnSelectFolderClick(Sender: TObject);
    procedure RzShellTree1Change(Sender: TObject; Node: TTreeNode);
    procedure RzPanel1Resize(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Init;
  end;


implementation

{$R *.dfm}

procedure TFmeShell.Init;
begin
  {$IFDEF VCL70_OR_HIGHER}
  ParentBackground := False;
  {$ENDIF}
end;


procedure TFmeShell.BtnViewIconsClick(Sender: TObject);
begin
  RzShellList1.ViewStyle := vsIcon;
end;

procedure TFmeShell.BtnViewListClick(Sender: TObject);
begin
  RzShellList1.ViewStyle := vsList;
end;

procedure TFmeShell.BtnViewDetailsClick(Sender: TObject);
begin
  RzShellList1.ViewStyle := vsReport;
end;

procedure TFmeShell.BtnOpenClick(Sender: TObject);
begin
  RzOpenDialog1.Execute;
end;

procedure TFmeShell.BtnSaveClick(Sender: TObject);
begin
  RzSaveDialog1.Execute;
end;

procedure TFmeShell.BtnUpOneLevelClick(Sender: TObject);
begin
  RzShellTree1.GoUp( 1 );
end;

procedure TFmeShell.BtnSelectFolderClick(Sender: TObject);
begin
  if RzSelectFolderDialog1.Execute then
  begin
    RzShellTree1.SelectedFolder := RzSelectFolderDialog1.SelectedFolder;
  end;
end;

procedure TFmeShell.RzShellTree1Change(Sender: TObject; Node: TTreeNode);
begin
  RzStatusBar1.SimpleCaption := RzShellTree1.SelectedPathName;
end;

procedure TFmeShell.RzPanel1Resize(Sender: TObject);
begin
  // This could be done using Anchors, but this causes the DesignSize property to get streamed out if working in
  // Delphi 6 or higher, and this property cannot be read in by Delphi 5.
  RzShellCombo1.Width := RzPanel1.Width;
end;

end.
