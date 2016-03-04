{=======================================================================================================================
  RzShellDialogs Unit

  Raize Components - Component Source Unit
  Raize Shell Controls are licensed from Plasmatech Software Design.


  Components            Description
  ----------------------------------------------------------------------------------------------------------------------
  TRzSelectFolderDialog Dialog-based component used to select folders from the Explorer namespace.


  Modification History
  ----------------------------------------------------------------------------------------------------------------------
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
  1.3d   (18 Apr 1998)  * Added public Form property to TRzSelectFolderDialog, giving access to the form object
                          from component events.
                        * Added properties, events and methods to TRzSelectFolderForm to better support visual
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

unit RzShellDialogs;

interface

uses
  Classes,
  Controls,
  Forms,
  Windows,
  ShlObj,
  RzShellCtrls,
  RzCommon;

type
  TRzSelectFolderDialogOption =
  (
    sfdoCreateDeleteButtons,
    sfdoContextMenus,
    sfdoReadOnly,
    sfdoIncludeNonFolders,
    sfdoOleDrag,
    sfdoOleDrop,
    sfdoCreateFolderIcon,
    sfdoDeleteFolderIcon,
    sfdoVirtualFolders,
    sfdoShowHidden
  );
  TRzSelectFolderDialogOptions = set of TRzSelectFolderDialogOption;

const
  DEF_SFDO_OPTIONS = [ sfdoContextMenus, sfdoCreateFolderIcon, sfdoDeleteFolderIcon, sfdoShowHidden ];

type
  {===================================================}
  {== TRzCustomSelectFolderDialog Class Declaration ==}
  {===================================================}

  TRzShellDialog = class( TComponent )
  private
    FFormWidth, FFormHeight: Integer;
    FWindowState: TWindowState;
    FTitle: string;
    FOnInit: TNotifyEvent;
    FOnFormShow: TNotifyEvent;
    FOnFormClose: TNotifyEvent;
    FExecuting: Boolean;
  protected
    FAboutInfo: TRzAboutInfo;

    procedure DoInitialized; dynamic;
    function DoExecute: Boolean; dynamic; abstract;

    property Executing: Boolean
      read FExecuting;

    property Title: string
      read FTitle
      write FTitle;

    property FormWidth: Integer
      read FFormWidth
      write FFormWidth
      default -1;

    property FormHeight: Integer
      read FFormHeight
      write FFormHeight
      default -1;

    property FormWindowState: TWindowState
      read FWindowState
      write FWindowState
      default wsNormal;

    property OnInitialized: TNotifyEvent
      read FOnInit
      write FOnInit;

    property OnFormClose: TNotifyEvent
      read FOnFormClose
      write FOnFormClose;

    property OnFormShow: TNotifyEvent
      read FOnFormShow
      write FOnFormShow;
  public
    constructor Create( AOwner: TComponent ); override;

    function Execute: Boolean;

    procedure ReadStateFromRegistry( BaseKey: HKEY; SubKeyName, ValueName: string );
    procedure WriteStateToRegistry( BaseKey: HKEY; SubKeyName, ValueName: string );

    procedure ReadStateFromStream( Stream: TStream ); dynamic;
    procedure WriteStateToStream( Stream: TStream ); dynamic;
  published
  end;

  {===================================================}
  {== TRzCustomSelectFolderDialog Class Declaration ==}
  {===================================================}

  TRzFolderBrowseSelChangeEvent = procedure( Sender: TObject; NewSel: PItemIdList ) of object;

  TRzCustomSelectFolderDialog = class( TRzShellDialog )
  private
    FForm: TCustomForm;
    FBaseFolder: TRzShellLocator;

    FOptions: TRzSelectFolderDialogOptions;
    FOnAddItem: TRzShAddItemEvent;
    FOnSelChange: TRzFolderBrowseSelChangeEvent;
    FStatus: string;
    FSelectedFolder: TRzShellLocator;

    function GetOkEnabled: Boolean;
    function GetSelectedPathName: string;

    procedure SetBaseFolder( Value: TRzShellLocator );
    procedure SetOkEnabled( Value: Boolean );
    procedure SetStatus( const Value: string );
    procedure SetSelectedPathName( const Value: string );
    procedure SetSelectedFolder( Value: TRzShellLocator );
  protected
    procedure AssertFormActive;
    procedure AssertFormNotActive;

    function DoExecute: Boolean; override;
    function CreateForm: TCustomForm; dynamic;
    procedure InitForm( Form: TCustomForm ); dynamic;
    procedure SaveFormSettings( Form: TCustomForm ); dynamic;

  protected
    property Form: TCustomForm
      read FForm;

    property SelectedPathName: string
      read GetSelectedPathName
      write SetSelectedPathName;

    property SelectedFolder: TRzShellLocator
      read FSelectedFolder
      write SetSelectedFolder;

    property Status: string
      read FStatus
      write SetStatus;

    property OkEnabled: Boolean
      read GetOkEnabled
      write SetOkEnabled;

    property BaseFolder: TRzShellLocator
      read FBaseFolder
      write SetBaseFolder;

    property Options: TRzSelectFolderDialogOptions
      read FOptions
      write FOptions
      default DEF_SFDO_OPTIONS;

    property OnAddItem: TRzShAddItemEvent
      read FOnAddItem
      write FOnAddItem;

    property OnSelChange: TRzFolderBrowseSelChangeEvent
      read FOnSelChange
      write FOnSelChange;
  public
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;

    property Executing;
  end;


  {=============================================}
  {== TRzSelectFolderDialog Class Declaration ==}
  {=============================================}

  TRzSelectFolderDialog = class( TRzCustomSelectFolderDialog )
  public
    property Form;
    property SelectedFolder;
    property SelectedPathName;
    property Status;
    property OkEnabled;
  published
    property About: TRzAboutInfo
      read FAboutInfo
      write FAboutInfo
      stored False;

    property Title;
    property FormWidth;
    property FormHeight;
    property FormWindowState;

    property BaseFolder;
    property Options;

    property OnAddItem;
    property OnFormClose;
    property OnFormShow;
    property OnSelChange;
    property OnInitialized;
  end;



type
  TRzOpenSaveOption =
  (
    osoAllowMultiselect,     // When True, this option allows users to select more than one file in the File Name list view.

    osoCreatePrompt,         // When True, this option displays a dialog box with a message if the user enters a
                             // filename that doesn't exist in the File Name edit box and chooses OK (Open/Save).
                             // The message tells the user the file doesn't exist and asks if the user wants to create
                             // a new file with that name.

    osoExtensionDifferent,   // This option is set when the filename returned from the dialog box has an extension that
                             // differs from the default file extension, the value in the DefaultExt property. Your
                             // application can then use this information. Setting an ofExtensionDifferent value with
                             // the Object Inspector has no meaning.

    osoFileMustExist,        // If True, this option displays a dialog box with a message if the user enters a file that
                             // doesn't exist in the File Name edit box and chooses OK. The message informs the user the
                             // file can't be found and asks the user to make sure they entered the correct path and
                             // filename.
    osoHideReadOnly,
    osoNoChangeDir,
    osoNoDereferenceLinks,   // If True, directs the dialog box to return the path and filename of the selected shortcut
                             // (.LNK) file. If this value is not given, the dialog box returns the path and filename of
                             // the file referenced by the shortcut.

    //osoNoLongNames,
    //osoNoNetworkButton,
    osoNoReadOnlyReturn,     // If True, a message box appears informing the user if the selected file is read-only.

    osoNoTestFileCreate,     // This option applies only when the user wants to save a file on a create-no-modify
                             // network share point, which can't be opened again once it has been opened. If
                             // ofNoTestFileCreate is True, your application won't check for write protection, a full
                             // disk, an open drive door, or network protection when saving the file because doing so
                             // creates a test file. Your application will then have to handle file operations carefully
                             // so that a file isn't closed until you really want it to be.

    osoNoValidate,           // If True, this option doesn't prevent the user from entering invalid characters in a
                             // filename. If ofNoValidate is False and the user enters invalid characters for a filename
                             // in the File Name edit box, a message dialog box appears informing the user the filename
                             // contains invalid characters.

    osoOverwritePrompt,      // If True, this option displays a message dialog box if the user attempts to save a file
                             // that already exists. The message informs the user the file exists and lets the user
                             // choose to overwrite the existing file or not.

    osoReadOnly,             // If True, the Read Only check box is checked when the dialog box is displayed.

    osoPathMustExist,        // If this option is True, the user can type only existing path names as part of the
                             // filename in the File Name edit box. If the user enters a path name that doesn't exist,
                             // a message box appears informing the user that the path name is invalid.

    osoShareAware,           // If True, the dialog box ignores all sharing errors and returns the name of the selected
                             // file even though a sharing violation occurred. If ofShareAware is False, a sharing
                             // violation results in a message box informing the user of the problem.

    osoShowHelp,             // If True, this option displays a Help button in the dialog box.

    osoAllowTree,            // If True then a "Show Tree" button is placed on the button bar
    osoShowTree,             // If True then shows a tree view to the left of the list view, like a mini-explorer.
    osoShowHints,            // If True then popup hints are enabled
    osoHideFoldersInListWhenTreeVisible,

    osoOleDrag,              // True allows Ole drag operations
    osoOleDrop,              // True allows Ole drop operations

    osoShowHidden            // If False, then hidden and system files do not appear in the tree or list.
  );

  TRzOpenSaveOptions = set of TRzOpenSaveOption;


const
  DEF_OPEN_OPTIONS = [ osoHideReadOnly, osoAllowTree, osoShowHints, osoOleDrag, osoOleDrop, osoShowHidden ];
  DEF_SAVE_OPTIONS = [ osoHideReadOnly, osoAllowTree, osoShowHints, osoOleDrag, osoOleDrop, osoShowHidden ];


type

  {=====================================}
  {== TRzFileDialog Class Declaration ==}
  {=====================================}

  TRzFileDialog = class( TRzShellDialog )
  private
    FHistoryList: TStrings;
    FOptions: TRzOpenSaveOptions;
    FDefaultExt: string;
    FFiles: TStrings;
    FFilter: string;
    FFilterIndex: Integer;
    FHelpContext: THelpContext;
    FInitialDir: string;
    FFormSplitterPos: Integer;

    FOnAddListItem: TRzShAddItemEvent;
    FOnAddTreeItem: TRzShAddItemEvent;
    FOnAddComboItem: TRzShAddItemEvent;
    FOnFolderChanged: TNotifyEvent;
    FOnSelectionChanged: TNotifyEvent;
    FOnTypeChanged: TNotifyEvent;
    FOnHelp: THelpEvent;

    function  GetFilename: string;
    function  GetFilterIndex: Integer;
    procedure SetFilename( const Value: string );
    procedure SetOptions( Value: TRzOpenSaveOptions );
    procedure SetFilter( const Value: string );
    procedure SetFilterIndex( Value: Integer );
    procedure SetFormSplitterPos( Value: Integer );
    procedure SetOnAddListItem( Value: TRzShAddItemEvent );
    procedure SetOnAddTreeItem( Value: TRzShAddItemEvent );
    procedure SetOnAddComboItem( Value: TRzShAddItemEvent );
    procedure SetHistoryList( Value: TStrings );
  protected
    FForm: TCustomForm;

    function DoExecute: Boolean; override;
    function CreateForm: TCustomForm; dynamic;
    procedure InitForm( Form: TCustomForm ); dynamic;
    procedure SaveFormSettings( Form: TCustomForm ); dynamic;

    property Form: TCustomForm
      read FForm;

    property DefaultExt: string
      read FDefaultExt
      write FDefaultExt;

    property Options: TRzOpenSaveOptions
      read FOptions
      write SetOptions;

    property FileName: string
      read GetFilename
      write SetFilename;

    property Files: TStrings
      read FFiles;

    property Filter: string
      read FFilter
      write SetFilter;

    property FilterIndex: Integer
      read GetFilterIndex
      write SetFilterIndex
      default 1;

    property FormSplitterPos: Integer
      read FFormSplitterPos
      write SetFormSplitterPos
      default -1;

    property HelpContext: THelpContext
      read FHelpContext
      write FHelpContext
      default 0;

    property HistoryList: TStrings
      read FHistoryList
      write SetHistoryList
      stored False;

    property InitialDir: string
      read FInitialDir
      write FInitialDir;

    property OnAddListItem: TRzShAddItemEvent
      read FOnAddListItem
      write SetOnAddListItem;

    property OnAddTreeItem: TRzShAddItemEvent
      read FOnAddTreeItem
      write SetOnAddTreeItem;

    property OnAddComboItem: TRzShAddItemEvent
      read FOnAddComboItem
      write SetOnAddComboItem;

    property OnHelp: THelpEvent
      read FOnHelp
      write FOnHelp;

    property OnFolderChanged: TNotifyEvent
      read FOnFolderChanged
      write FOnFolderChanged;

    property OnSelectionChanged: TNotifyEvent
      read FOnSelectionChanged
      write FOnSelectionChanged;

    property OnTypeChanged: TNotifyEvent
      read FOnTypeChanged
      write FOnTypeChanged;
  public
    constructor Create( AOwner: TComponent ); override;
    destructor  Destroy; override;

    procedure ReadStateFromStream( Stream: TStream ); override;
    procedure WriteStateToStream( Stream: TStream ); override;

  published
  end;


  {===========================================}
  {== TRzCustomOpenDialog Class Declaration ==}
  {===========================================}

  TRzCustomOpenDialog = class( TRzFileDialog )
  protected
    procedure InitForm( Form: TCustomForm ); override;
  public
    constructor Create( AOwner: TComponent ); override;
  end;


  {=====================================}
  {== TRzOpenDialog Class Declaration ==}
  {=====================================}

  TRzOpenDialog = class( TRzCustomOpenDialog )
  public
    property Executing;
    property FileName;
    property Files;
    property Form;
  published
    property About: TRzAboutInfo
      read FAboutInfo
      write FAboutInfo
      stored False;

    property Title;
    property Options default DEF_OPEN_OPTIONS;
    property Filter;
    property FilterIndex;
    property FormWidth;
    property FormHeight;
    property FormWindowState;
    property FormSplitterPos;
    property HelpContext;
    property HistoryList;
    property InitialDir;

    property DefaultExt;

    property OnAddListItem;
    property OnAddTreeItem;
    property OnAddComboItem;
    property OnInitialized;

    property OnHelp;

    property OnFormClose;
    property OnFormShow;
    property OnFolderChanged;
    property OnSelectionChanged;
    property OnTypeChanged;
  end;



  {===========================================}
  {== TRzCustomSaveDialog Class Declaration ==}
  {===========================================}

  TRzCustomSaveDialog = class( TRzFileDialog )
  protected
    procedure InitForm( Form: TCustomForm ); override;
  public
    constructor Create( aOwner: TComponent ); override;
  end;


  {=====================================}
  {== TRzSaveDialog Class Declaration ==}
  {=====================================}

  TRzSaveDialog = class( TRzCustomSaveDialog )
  public
    property Executing;
    property FileName;
    property Files;
    property Form;
  published
    property About: TRzAboutInfo
      read FAboutInfo
      write FAboutInfo
      stored False;

    property DefaultExt;

    property Title;
    property Options default DEF_SAVE_OPTIONS;
    property Filter;
    property FilterIndex;
    property FormWidth;
    property FormHeight;
    property FormWindowState;
    property FormSplitterPos;
    property HelpContext;
    property HistoryList;
    property InitialDir;

    property OnAddListItem;
    property OnAddTreeItem;
    property OnAddComboItem;
    property OnInitialized;

    property OnHelp;

    property OnFormClose;
    property OnFormShow;
    property OnFolderChanged;
    property OnSelectionChanged;
    property OnTypeChanged;
  end;


implementation

uses
  SysUtils,
  Registry,
  RzShellConsts,
  RzShellFolderForm,
  RzShellOpenForm;


procedure RaiseNotActive;
begin
  raise Exception.Create( 'TRzSelectFolderDialog form not active' );
end;


procedure RaiseAlreadyActive;
begin
  raise Exception.Create( 'TRzSelectFolderDialog form already active' );
end;


procedure GetWndRestoreRect( h: HWND; var r: TRect );
var
  wp: TWindowPlacement;
begin
  wp.length := Sizeof( TWindowPlacement );
  GetWindowPlacement( h, @wp );
  r := wp.rcNormalPosition;
end;


type
  TMemoryStream2 = class( TMemoryStream )
  public
    property Capacity;  // Why wasn't this public to start with???
  end;


{============================}
{== TRzShellDialog Methods ==}
{============================}

constructor TRzShellDialog.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );
  FFormWidth := -1;
  FFormHeight := -1;
  FWindowState := wsNormal;
end;


procedure TRzShellDialog.DoInitialized;
begin
  if Assigned( FOnInit ) then
    FOnInit( Self );
end;


procedure TRzShellDialog.ReadStateFromRegistry( BaseKey: HKEY; SubKeyName, ValueName: string );
var
  r: TRegistry;
  ms: TMemoryStream2;
begin
  r := TRegistry.Create;
  ms := TMemoryStream2.Create;
  ms.Capacity := 128;
  try
    r.RootKey := baseKey;
    r.OpenKey( SubKeyName, False );
    ms.Capacity := r.ReadBinaryData( ValueName, ms.Memory^, ms.Capacity );
    ms.Position := 0;
    ReadStateFromStream( ms );
    r.CloseKey;
  finally
    ms.Free;
    r.Free;
  end;
end;


procedure TRzShellDialog.WriteStateToRegistry( BaseKey: HKEY; SubKeyName, ValueName: string );
var
  r: TRegistry;
  ms: TMemoryStream;
begin
  r := TRegistry.Create;
  ms := TMemoryStream.Create;
  try
    r.RootKey := baseKey;
    r.OpenKey( SubKeyName, True );
    WriteStateToStream( ms );
    r.WriteBinaryData( ValueName, ms.Memory^, ms.Size );
    r.CloseKey;
  finally
    ms.Free;
    r.Free;
  end;
end;


procedure TRzShellDialog.ReadStateFromStream( Stream: TStream );
begin
  Stream.ReadBuffer( FFormWidth, Sizeof( Integer ) );
  Stream.ReadBuffer( FFormHeight, Sizeof( Integer ) );
  Stream.ReadBuffer( FWindowState, Sizeof( TWindowState ) );
end;


procedure TRzShellDialog.WriteStateToStream( Stream: TStream );
begin
  Stream.WriteBuffer( FFormWidth, Sizeof( Integer ) );
  Stream.WriteBuffer( FFormHeight, Sizeof( Integer ) );
  Stream.WriteBuffer( FWindowState, Sizeof( TWindowState ) );
end;


function TRzShellDialog.Execute: Boolean;
begin
  if FExecuting then
    raise Exception.Create( ClassName + ' already executing' );
  FExecuting := True;
  try
    Result := DoExecute;
  finally
    FExecuting := False;
  end;
end;



{=========================================}
{== TRzCustomSelectFolderDialog Methods ==}
{=========================================}

constructor TRzCustomSelectFolderDialog.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );
  Title := '';
  Options := DEF_SFDO_OPTIONS;
  FSelectedFolder := TRzShellLocator.Create;
  FBaseFolder := TRzShellLocator.Create;
end;


destructor TRzCustomSelectFolderDialog.Destroy;
begin
  FSelectedFolder.Free;
  FBaseFolder.Free;
  inherited;
end;


function TRzCustomSelectFolderDialog.GetOkEnabled: Boolean;
begin
  AssertFormActive;
  Result := TRzSelectFolderForm( FForm ).OkEnabled;
end;


function TRzCustomSelectFolderDialog.GetSelectedPathname: string;
begin
  Result := FSelectedFolder.Pathname;
end;


procedure TRzCustomSelectFolderDialog.SetBaseFolder( Value: TRzShellLocator );
begin
  FBaseFolder.Assign( Value );
end;


procedure TRzCustomSelectFolderDialog.SetOkEnabled( Value: Boolean );
begin
  AssertFormActive;
  TRzSelectFolderForm( FForm ).OkEnabled := Value;
end;


procedure TRzCustomSelectFolderDialog.SetStatus( const Value: string );
begin
  if Assigned( FForm ) then
    TRzSelectFolderForm( FForm ).Status := Value;
  FStatus := Value;
end;


procedure TRzCustomSelectFolderDialog.SetSelectedPathName( const Value: string );
begin
  FSelectedFolder.PathName := Value;
end;


procedure TRzCustomSelectFolderDialog.SetSelectedFolder( Value: TRzShellLocator );
begin
  FSelectedFolder.Assign( Value );
end;


procedure TRzCustomSelectFolderDialog.AssertFormActive;
begin
  if not Assigned( FForm ) then
    RaiseNotActive;
end;


procedure TRzCustomSelectFolderDialog.AssertFormNotActive;
begin
  if Assigned( FForm ) then
    RaiseAlreadyActive;
end;


function TRzCustomSelectFolderDialog.DoExecute: Boolean;
var
  c: TCursor;
  f: TRzSelectFolderForm;
begin
  AssertFormNotActive;
  c := Screen.Cursor;
  Screen.Cursor := crHourglass;
  f := nil;
  try
    f := TRzSelectFolderForm( CreateForm );
    InitForm( f );
    FForm := f;
    f := nil;

    DoInitialized;
    Result := ( FForm.ShowModal = mrOk );

    if not ( csDesigning in ComponentState ) then
      SaveFormSettings( FForm );
  finally
    FForm.Free;
    FForm := nil;
    f.Free;
    Screen.Cursor := c;
  end;
end; {= TRzCustomSelectFolderDialog.DoExecute =}


function TRzCustomSelectFolderDialog.CreateForm: TCustomForm;
begin
  Result := TRzSelectFolderForm.Create( Application );
end;


procedure TRzCustomSelectFolderDialog.InitForm( Form: TCustomForm );
var
  F: TRzSelectFolderForm;
begin
  F := TRzSelectFolderForm( Form );
  F.OnSelChange := OnSelChange;
  F.ShellTree.OnAddItem := OnAddItem;
  F.OnFormShow := OnFormShow;
  F.OnFormClose := OnFormClose;

  F.Status := Status;
  if ( FormWidth > 0 ) then
    F.Width := FormWidth;
  if ( FormHeight > 0 ) then
    F.Height := FormHeight;
  F.WindowState := FormWindowState;

  F.Options := Options;

  if Title = '' then
    F.Caption := SBrowseForFolder
  else
    F.Caption := Title;

  F.ShellTree.BaseFolder := BaseFolder;
  F.ShellTree.SelectedFolder := SelectedFolder;
end;


procedure TRzCustomSelectFolderDialog.SaveFormSettings( Form: TCustomForm );
var
  tmpr: TRect;
begin
  GetWndRestoreRect( Form.Handle, tmpr );
  FormWidth := tmpr.right - tmpr.left;
  FormHeight := tmpr.bottom - tmpr.top;

  FormWindowState := Form.WindowState;

  if ( Form.ModalResult = mrOk ) then
    SelectedFolder.Assign( TRzSelectFolderForm( Form ).ShellTree.SelectedFolder );
end;


{===========================}
{== TRzFileDialog Methods ==}
{===========================}

constructor TRzFileDialog.Create( AOwner: TComponent );
begin
  inherited;
  FFormSplitterPos := -1;
  FFilterIndex := 1;
  FFiles := TStringList.Create;
  FHistoryList := TStringList.Create;
end;


destructor TRzFileDialog.Destroy;
begin
  FFiles.Free;
  FHistoryList.Free;
  inherited;
end;


function TRzFileDialog.CreateForm: TCustomForm;
begin
  Result := TRzShellOpenSaveForm.Create( Application );
end;


function TRzFileDialog.DoExecute: Boolean;
var
  c: TCursor;
  f: TRzShellOpenSaveForm;
begin
  if Assigned(FForm) then
    raise Exception.Create( Format('%s already executing', [Name]) );

  c := Screen.Cursor; Screen.Cursor := crHourglass;
  f:=nil;
  try
    if (csDesigning in ComponentState) then
      FFiles.Clear;

    f := TRzShellOpenSaveForm( CreateForm );
    InitForm(f);
    FForm := f;
    f:=nil;

    DoInitialized;

    Result := (FForm.ShowModal = mrOk);

    if not ( csDesigning in ComponentState ) then
      SaveFormSettings( FForm );
  finally
    FForm.Free;
    FForm := nil;
    Screen.Cursor := c;
    f.Free;
  end;
end;


procedure TRzFileDialog.ReadStateFromStream( Stream: TStream );
var
  f: Boolean;
begin
  inherited;
  Stream.ReadBuffer( f, Sizeof( Boolean ) );
  if f then
    Include( FOptions, osoShowTree )
  else
    Exclude( FOptions, osoShowTree );
  Stream.ReadBuffer( FFormSplitterPos, Sizeof( Integer ) );
end;


procedure TRzFileDialog.WriteStateToStream( Stream: TStream );
var
  f: Boolean;
begin
  inherited;
  f := ( osoShowTree in FOptions );
  Stream.WriteBuffer( f, Sizeof( Boolean ) );
  Stream.WriteBuffer( FFormSplitterPos, Sizeof( FFormSplitterPos ) );
end;


function TRzFileDialog.GetFilename: string;
begin
  if Assigned(FForm) then
    Result := TRzShellOpenSaveForm( FForm ).FileName
  else
    if FFiles.Count>0 then
      Result := FFiles[0]
    else
      Result := '';
end;


function TRzFileDialog.GetFilterIndex: Integer;
begin
  if Assigned( FForm ) then
    Result := TRzShellOpenSaveForm( FForm ).FilterIndex
  else
    Result := FFilterIndex;
end;


procedure TRzFileDialog.SetFilename( const Value: string );
begin
  FFiles.Clear;
  FFiles.Add( Value );
  if Assigned( FForm ) then
    TRzShellOpenSaveForm( FForm ).Filename := Value;
end;


procedure TRzFileDialog.SetOptions( Value: TRzOpenSaveOptions );
begin
  FOptions := Value;
  if Assigned( FForm ) then
    TRzShellOpenSaveForm( FForm ).Options := Value;
end;


procedure TRzFileDialog.SetFilter( const Value: string );
begin
  FFilter := Value;
  if Assigned( FForm ) then
    TRzShellOpenSaveForm( FForm ).Filter := Value;
end;


procedure TRzFileDialog.SetFilterIndex( Value: Integer );
begin
  FFilterIndex := Value;
  if Assigned( FForm ) then
    TRzShellOpenSaveForm( FForm ).FilterIndex := Value;
end;


procedure TRzFileDialog.SetFormSplitterPos( Value: Integer );
begin
  FFormSplitterPos := Value;
  if Assigned( FForm ) then
    TRzShellOpenSaveForm( FForm ).FormSplitterPos := Value;
end;


procedure TRzFileDialog.SetHistoryList( Value: TStrings );
begin
  FHistoryList.Assign( Value );
end;


procedure TRzFileDialog.InitForm( Form: TCustomForm );
var
  F: TRzShellOpenSaveForm;
begin
  F := TRzShellOpenSaveForm( Form );

  F.OnAddListItem := OnAddListItem;
  F.OnAddTreeItem := OnAddTreeItem;
  F.OnAddComboItem := OnAddComboItem;

  F.OnFormClose := OnFormClose;
  F.OnFormShow := OnFormShow;
  F.OnTypeChanged := OnTypeChanged;
  F.OnFolderChanged := OnFolderChanged;
  F.OnSelectionChanged := OnSelectionChanged;

  F.InitialDir := InitialDir;
  F.FileName := FileName;
  F.DefaultExt := DefaultExt;

  F.Options := Options;
  if FormWidth > 0 then
    F.Width := FormWidth;
  if FormHeight > 0 then
    F.Height := FormHeight;
  F.WindowState := FormWindowState;

  F.Filter := Filter;
  F.FilterIndex := FilterIndex;
  F.FormSplitterPos := FormSplitterPos;

  F.LookInTxt.Caption := SLookIn;
  F.FilesOfTypeTxt.Caption := SFilesOfType;
  F.HelpContext := HelpContext;
  F.OnFormHelp := OnHelp;
end;


procedure TRzFileDialog.SaveFormSettings( Form: TCustomForm );
var
  tmpr: TRect;
  F: TRzShellOpenSaveForm;
begin
  F := TRzShellOpenSaveForm( Form );
  Options := F.Options;
  Files.Assign( F.Files );

  GetWndRestoreRect( F.Handle, tmpr );
  FormWidth := tmpr.right - tmpr.left;
  FormHeight := tmpr.bottom - tmpr.top;
  FormWindowState := F.WindowState;

  FilterIndex := F.FilterIndex;
  FormSplitterPos := F.FormSplitterPos;
end;


procedure TRzFileDialog.SetOnAddListItem( Value: TRzShAddItemEvent );
begin
  FOnAddListItem := Value;
  if Assigned( FForm ) then
    TRzShellOpenSaveForm( FForm ).OnAddListItem := Value;
end;


procedure TRzFileDialog.SetOnAddTreeItem( Value: TRzShAddItemEvent );
begin
  FOnAddTreeItem := Value;
  if Assigned( FForm ) then
    TRzShellOpenSaveForm( FForm ).OnAddTreeItem := Value;
end;

procedure TRzFileDialog.SetOnAddComboItem( Value: TRzShAddItemEvent );
begin
  FOnAddComboItem := Value;
//  if Assigned(FForm) then FForm.PTShellTree1.OnAddItem := aValue;
end;


{=================================}
{== TRzCustomOpenDialog Methods ==}
{=================================}

constructor TRzCustomOpenDialog.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );
  FOptions := DEF_OPEN_OPTIONS;
end;

procedure TRzCustomOpenDialog.InitForm( Form: TCustomForm );
var
  F: TRzShellOpenSaveForm;
begin
  inherited;

  F := TRzShellOpenSaveForm( Form );

  if (Title = '') then
    F.Caption := SOpenCaption
  else
    F.Caption := Title;

  F.OpenBtn.Caption := SOpenButton;
end;


{=================================}
{== TRzCustomSaveDialog Methods ==}
{=================================}

constructor TRzCustomSaveDialog.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );
  FOptions := DEF_SAVE_OPTIONS;
end;


procedure TRzCustomSaveDialog.InitForm( Form: TCustomForm );
var
  F: TRzShellOpenSaveForm;
begin
  inherited;

  F := TRzShellOpenSaveForm( Form );

  if (Title = '') then
    F.Caption := SSaveAsCaption
  else
    F.Caption := Title;

  F.OpenBtn.Caption := SSaveButton;
end;


end.

