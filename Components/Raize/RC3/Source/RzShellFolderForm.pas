{=======================================================================================================================
  RzShellFolderForm Unit

  Raize Components - Component Source Unit
  Raize Shell Controls are licensed from Plasmatech Software Design.


  Components            Description
  ----------------------------------------------------------------------------------------------------------------------
  TRzShellTree          Explorer-like tree view of the namespace.


  Modification History
  ----------------------------------------------------------------------------------------------------------------------
  3.0.6  (11 Apr 2003)  * Modified fix introduced in 3.0.4 to address Large Font issues (i.e. removed DeferredAutoFill).

  3.0.4  (04 Mar 2003)  * Fixed problem with nodes in tree view not showing up when running under Large Fonts.
                        * Fixed problem with status bar showing above buttons when running under Large Fonts.
                        
  3.0.3  (21 Jan 2003)  * Modified the layout of the dialog.
                        * StatusTxt was removed. StatusBar added--displays selected node.

  3.0    (20 Dec 2002)  * Initial inclusion in Raize Components.

  1.6b   ( 7 Mar 2002)  * C++Builder 6 release.
  1.6a   (11 Jan 2002)  * Removed dependency on Ole2 unit.
  1.6    (28 Jun 2001)  * Delphi 6 release, no changes.
  1.5c   (30 Mar 2001)  * No changes.
  1.5b   (12 Dec 2000)  * No changes.
  1.5a   (14 May 2000)  * No changes.
  1.5    ( 3 Mar 2000)  * C++Builder 5 support.
  1.4a   (15 Dec 1999)  * No changes.
  1.4    (14 Sep 1999)  * Fixed occasional visual glitch with size-grip control.
  1.3h   (29 Mar 1999)  * Added size-grip to bottom right corner of form.
                        * Fixed access violation on large-fonts systems.
  1.3g   ( 1 Dec 1998)  * No changes.
  1.3f   (12 Jul 1998)  * Fixed problem with positioning of Create/Delete buttons.
                        * Fixed OnAddItem event not firing.
  1.3e   (22 Apr 1998)  * No changes.
  1.3d   (18 Apr 1998)  * Added public Form property to TRzFolderBrowseDlg, giving access to the form object
                          from component events.
                        * Added properties, events and methods to TRzFrmFolderBrowseDlg to better support visual
                          inheritance. Reference to the component object is no longer kept in the form object,
                          making visual inheritance and customization a lot easier.
                        * Fixed OnInitialized event - it is now correctly invoked.
  1.3c   (16 Mar 1998)  * Added sfdoShowHidden option.
  1.3b   ( 7 Feb 1998)  * No changes.
  1.3a   ( 7 Jan 1998)  * No changes.
  1.3    (28 Nov 1997)  * Added internationalisation support.
                        * Added sfdoCreateFolderIcon, sfdoDeleteFolderIcon and sfdoVirtualFolders options.
                        * Fixed problem with OnAddItem event not being called.
  1.2b   (12 Oct 1997)  * No changes.
  1.2a   ( 5 Oct 1997)  * No changes.
  1.2    ( 6 Sep 1997)  * Added sfdoOleDrag and sfdoOleDrop options.
  1.1a   ( 6 Jul 1997)  * Added sfdoIncludeNonFolders option.
  1.1    (26 Jun 1997)  * Added OnCustomDrawSh event.
                        * Added BaseFolder property.
  1.0c   (31 May 1997)  * No significant changes.
  1.0b   (17 May 1997)  * Delphi 3 support.
  1.0a   ( 1 May 1997)  * Fixed GP fault when pressing F5 in tree.
  1.0    (21 Apr 1997)  * Released version 1.0

  ----------------------------------------------------------------------------------------------------------------------
  Copyright © 1995-2003 by Raize Software, Inc.  All Rights Reserved.
  Copyright © 1996-2003 by Plasmatech Software Design. All Rights Reserved.
=======================================================================================================================}

{$I RzComps.inc}

{$RANGECHECKS OFF}
{$WRITEABLECONST OFF}
{$TYPEDADDRESS ON}

unit RzShellFolderForm;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ComCtrls,
  ExtCtrls,
  Buttons,
  ShlObj,
  RzTreeVw,
  RzShellIntf,
  RzShellCtrls,
  RzShellDialogs, RzPanel, ImgList, RzButton;

type
  TRzSelectFolderForm = class( TForm )
    ShellTree: TRzShellTree;
    ButtonPanel: TPanel;
    OkBtn: TButton;
    CancelBtn: TButton;
    RzStatusBar1: TRzStatusBar;
    BtnNewFolder: TRzToolButton;
    BtnDeleteFolder: TRzToolButton;
    ImageList1: TImageList;
    procedure FormResize( Sender: TObject );
    procedure ShellTreeChange( Sender: TObject; Node: TTreeNode );
    procedure FormCreate( Sender: TObject );
    procedure CreateBtnClick( Sender: TObject );
    procedure DeleteBtnClick( Sender: TObject );
  private
    function GetSelectedPathname: string;
    function GetStatus: string;
    function GetOkEnabled: Boolean;
    procedure SetSelectedPathname( const Value: string );
    procedure SetStatus( const Value: string );
    procedure SetOkEnabled( Value: Boolean );
    procedure WMGetMinMaxInfo( var Msg: TWMGetMinMaxInfo ); message WM_GETMINMAXINFO;
  protected
//    FHGripWindow: HWND;
    FExecuting: Boolean;
    FOptions: TRzSelectFolderDialogOptions;
    FOnFormShow: TNotifyEvent;
    FOnFormClose: TNotifyEvent;
    FOnSelChange: TRzFolderBrowseSelChangeEvent;
    FOnAddItem: TRzShAddItemEvent;
    procedure CreateWnd; override;
    procedure DoShow; override;
    procedure DoHide; override;
    procedure DoTranslation; dynamic;
    procedure SetOptions( Value: TRzSelectFolderDialogOptions ); virtual;
  public
    constructor Create( AOwner: TComponent ); override;

    property Executing: Boolean
      read FExecuting;

    property SelectedPathname: string
      read GetSelectedPathname
      write SetSelectedPathname;

    property Status: string
      read GetStatus
      write SetStatus;

    property OkEnabled: Boolean
      read GetOkEnabled
      write SetOkEnabled;

    property Options: TRzSelectFolderDialogOptions
      read FOptions
      write SetOptions;

    property OnAddItem: TRzShAddItemEvent
      read FOnAddItem
      write FOnAddItem;

    property OnFormClose: TNotifyEvent
      read FOnFormClose
      write FOnFormClose;

    property OnFormShow: TNotifyEvent
      read FOnFormShow
      write FOnFormShow;

    property OnSelChange: TRzFolderBrowseSelChangeEvent
      read FOnSelChange
      write FOnSelChange;
  end;


implementation

{$R *.dfm}

uses
  RzShellConsts, RzShellUtils;

const
  SIZEGRIP_SIZE = 13;


{=================================}
{== TFrmFolderBrowseDlg Methods ==}
{=================================}

constructor TRzSelectFolderForm.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );
end;


procedure TRzSelectFolderForm.CreateWnd;
begin
  inherited CreateWnd;
end;


procedure TRzSelectFolderForm.DoShow;
begin
  inherited;
  Font.Name := SDialogFontName;

  ShellTree.Options := ShellTree.Options + [ stoAutoFill ];
  ShellTree.FillItems;

  DoTranslation;
  if Assigned( FOnFormShow ) then
    FOnFormShow( Self );
end;


procedure TRzSelectFolderForm.DoHide;
begin
  inherited;
  if Assigned( FOnFormClose ) then
    FOnFormClose( Self );
end;


procedure TRzSelectFolderForm.DoTranslation;
begin
  OkBtn.Caption := SOkButton;
  CancelBtn.Caption := SCancelButton;
  BtnNewFolder.Caption := SCreateFolder;
  BtnDeleteFolder.Caption := SDeleteHint;

  if Caption = '' then
    Caption := SBrowseForFolder;
end;


procedure TRzSelectFolderForm.SetOptions( Value: TRzSelectFolderDialogOptions );
var
  TreeOptions: TRzShellTreeOptions;

  procedure ApplyOption( Apply: Boolean; Option: TRzShellTreeOption );
  begin
    if Apply then
      Include( treeOptions, Option )
    else
      Exclude( treeOptions, Option );
  end;

begin
  FOptions := Value;

  TreeOptions := ShellTree.Options;
  ApplyOption( sfdoOleDrag in Value, stoOleDrag );
  ApplyOption( sfdoOleDrop in Value, stoOleDrop );
  ApplyOption( sfdoIncludeNonFolders in Value, stoIncludeNonFolders );
  ApplyOption( sfdoVirtualFolders in Value, stoVirtualFolders );
  ApplyOption( sfdoContextMenus in Value, stoContextMenus );
  ApplyOption( sfdoShowHidden in Value, stoShowHidden );
  ShellTree.Options := TreeOptions;

  BtnNewFolder.Visible := ( sfdoCreateDeleteButtons in Value );
  BtnDeleteFolder.Visible := ( sfdoCreateDeleteButtons in Value );

  if sfdoCreateFolderIcon in Value then
    BtnNewFolder.ImageIndex := 0
  else
  begin
    BtnNewFolder.ImageIndex := -1;
  end;
  if sfdoDeleteFolderIcon in Value then
    BtnDeleteFolder.ImageIndex := 2
  else
    BtnDeleteFolder.ImageIndex := -1;

  if not ( sfdoCreateFolderIcon in Value ) or not ( sfdoDeleteFolderIcon in Value ) then 
  begin
    BtnNewFolder.Flat := False;
    BtnDeleteFolder.Flat := False;
  end;

  ShellTree.ReadOnly := ( sfdoReadOnly in Value );
end; {= TRzFrmFolderBrowseDlg.SetOptions =}


function TRzSelectFolderForm.GetSelectedPathname: string;
begin
  Result := ShellTree.SelectedPathname;
end;


function TRzSelectFolderForm.GetStatus: string;
begin
  Result := RzStatusBar1.SimpleCaption;
end;


function TRzSelectFolderForm.GetOkEnabled: Boolean;
begin
  Result := OkBtn.Enabled
end;


procedure TRzSelectFolderForm.SetSelectedPathname( const Value: string );
begin
  ShellTree.SelectedPathname := Value;
end;


procedure TRzSelectFolderForm.SetStatus( const Value: string );
begin
  RzStatusBar1.SimpleCaption := Value;
end;


procedure TRzSelectFolderForm.SetOkEnabled( Value: Boolean );
begin
  OkBtn.Enabled := Value;
end;


procedure TRzSelectFolderForm.WMGetMinMaxInfo( var Msg: TWMGetMinMaxInfo );
begin
  Msg.minMaxInfo.ptMinTrackSize := Point( 366, 340 );
end;


procedure TRzSelectFolderForm.FormCreate( Sender: TObject );
begin
  ShellTree.ShowRoot := TRUE;
  RzStatusBar1.Top := Height;
end;


procedure CutFirstDirectory(var S: TFileName);
var
  Root: Boolean;
  P: Integer;
begin
  if S = '\' then
    S := ''
  else
  begin
    if S[1] = '\' then
    begin
      Root := True;
      Delete(S, 1, 1);
    end
    else
      Root := False;
    if S[1] = '.' then
      Delete(S, 1, 4);
    P := AnsiPos('\',S);
    if P <> 0 then
    begin
      Delete(S, 1, P);
      S := '...\' + S;
    end
    else
      S := '';
    if Root then
      S := '\' + S;
  end;
end;


function MinimizeName(const Filename: TFileName; Canvas: TCanvas;
  MaxLen: Integer): TFileName;
var
  Drive: TFileName;
  Dir: TFileName;
  Name: TFileName;
begin
  Result := FileName;
  Dir := ExtractFilePath(Result);
  Name := ExtractFileName(Result);

  if (Length(Dir) >= 2) and (Dir[2] = ':') then
  begin
    Drive := Copy(Dir, 1, 2);
    Delete(Dir, 1, 2);
  end
  else
    Drive := '';
  while ((Dir <> '') or (Drive <> '')) and (Canvas.TextWidth(Result) > MaxLen) do
  begin
    if Dir = '\...\' then
    begin
      Drive := '';
      Dir := '...\';
    end
    else if Dir = '' then
      Drive := ''
    else
      CutFirstDirectory(Dir);
    Result := Drive + Dir + Name;
  end;
end;


procedure TRzSelectFolderForm.FormResize( Sender: TObject );
const
  BUTTON_RIGHT_MARGIN = 8;
  CONTROL_HORZ_MARGIN = 12;                 // margin to left and right of controls above bottom buttons
var
  R: TRect;
  T: Integer;
begin
  R := ShellTree.BoundsRect;
  if BtnNewFolder.Visible then
    T := BtnNewFolder.BoundsRect.Bottom + 4
  else if BtnDeleteFolder.Visible then
    T := BtnDeleteFolder.BoundsRect.Bottom + 4
  else
    T := 8;
  ShellTree.BoundsRect := Rect( R.left, T, R.left + Width - CONTROL_HORZ_MARGIN * 2, ButtonPanel.BoundsRect.Top - 4 );

  CancelBtn.Left := ClientRect.Right - BUTTON_RIGHT_MARGIN - CancelBtn.ClientWidth;
  OkBtn.Left := CancelBtn.Left - 8 - OkBtn.ClientWidth;

  if Assigned( ShellTree.Selected ) and Assigned( ShellTree.Selected.Data ) and ( TObject( ShellTree.Selected.Data ) is TRzShellTreeData ) then
  begin
    with TRzShellTreeData( ShellTree.Selected.Data ) do
      Status := MinimizeName( Pathname, Canvas, RzStatusBar1.Width - 20 );
  end;
end; {= TRzFrmFolderBrowseDlg.FormResize =}



procedure TRzSelectFolderForm.ShellTreeChange( Sender: TObject; Node: TTreeNode );
var
  hasPathname: Boolean;
begin
  if Assigned( Node ) and Assigned( Node.Data ) and ( TObject( Node.Data ) is TRzShellTreeData ) then
    with TRzShellTreeData( Node.Data ) do
    begin
      hasPathname := ( Pathname <> '' );

      Status := MinimizeName( Pathname, Canvas, RzStatusBar1.Width - 20 );

      BtnNewFolder.Enabled := hasPathname;
      BtnDeleteFolder.Enabled := hasPathname and ( node.AbsoluteIndex <> 0 );

      if Assigned( OnSelChange ) then
        OnSelChange( Self, {.} AbsoluteIdList );
    end;
end;


procedure TRzSelectFolderForm.CreateBtnClick( Sender: TObject );
begin
  ShellTree.CreateNewFolder( TRUE );
end;


procedure TRzSelectFolderForm.DeleteBtnClick( Sender: TObject );
begin
  ShellTree.DoCommandForNode( ShellTree.Selected, RZSH_CMDS_DELETE );
  ShellTree.RefreshNodes;
end;


end.

