{=======================================================================================================================
  MainForm Unit

  Raize Components - Demo Program Source Unit

  Copyright © 1995-2002 by Raize Software, Inc.  All Rights Reserved.
=======================================================================================================================}

{$I RC3Demo.inc}

// Undefine the following symbol if your version of Delphi or C++Builder does not support database access.
{$DEFINE DEMO_DATA_AWARE_CTRLS}

unit MainForm;

interface

uses
  Windows,
  Forms,
  ExtCtrls,
  RzBHints,
  RzForms,
  RzCommon,
  StdActns,
  Classes,
  ActnList,
  ImgList,
  Controls,
  Menus,
  RzGroupBar,
  RzButton,
  RzPanel,
  RzStatus,
  StdCtrls,
  ComCtrls,
  RzEdit,
  RzSplit,
  RzTabs,
  RzLabel,
  CustomFramingFrame,
  TabsFrame,
  ComboBoxesFrame,
  ListBoxesFrame,
  CommonControlsFrame,
  EditsFrame,
  ButtonsFrame,
  DisplayFrame,
  WidgetForm,
  {$IFDEF DEMO_DATA_AWARE_CTRLS}
  ReservationFrame,
  CustomerForm,
  {$ENDIF}
  ShellFrame,
  LauncherFrame,
  SendMessageFrame, RzPrgres, RzBorder, Graphics;


type
  TFrmMain = class(TForm)
    PnlNotes: TRzSizePanel;
    MainMenu1: TMainMenu;
    MnuDemo: TMenuItem;
    MnuExit: TMenuItem;
    StsMain: TRzStatusBar;
    RzMarqueeStatus1: TRzMarqueeStatus;
    RzClockStatus1: TRzClockStatus;
    RzKeyStatus1: TRzKeyStatus;
    RzKeyStatus2: TRzKeyStatus;
    RzKeyStatus3: TRzKeyStatus;
    RzResourceStatus1: TRzResourceStatus;
    StsNotes: TRzGlyphStatus;
    MnuView: TMenuItem;
    MnuMainToolbar: TMenuItem;
    MnuStatusBar: TMenuItem;
    MnuNotes: TMenuItem;
    MnuSep2: TMenuItem;
    MnuCustomFraming: TMenuItem;
    MnuComboBoxes: TMenuItem;
    MnuWidgets: TMenuItem;
    MnuButtons: TMenuItem;
    MnuListBoxes: TMenuItem;
    MnuShell: TMenuItem;
    MnuCommon: TMenuItem;
    MnuDatabase: TMenuItem;
    MnuEdits: TMenuItem;
    MnuSendMessage: TMenuItem;
    MnuLauncher: TMenuItem;
    TbrMain: TRzToolbar;
    ImageList1: TImageList;
    BtnFrames: TRzToolButton;
    BtnComboBoxes: TRzToolButton;
    BtnListBoxes: TRzToolButton;
    BtnCommon: TRzToolButton;
    BtnEdits: TRzToolButton;
    BtnButtons: TRzToolButton;
    BtnWidgets: TRzToolButton;
    BtnDatabase: TRzToolButton;
    BtnShell: TRzToolButton;
    BtnLauncher: TRzToolButton;
    BtnSendMsg: TRzToolButton;
    ActionList1: TActionList;
    ActCustomFraming: TAction;
    ActComboBoxes: TAction;
    ActListBoxes: TAction;
    ActCommonControls: TAction;
    ActEdits: TAction;
    ActButtons: TAction;
    ActWidgets: TAction;
    ActDatabase: TAction;
    ActShell: TAction;
    ActLauncher: TAction;
    ActSendMessages: TAction;
    ActWindowClose: TWindowClose;
    ActWindowCascade: TWindowCascade;
    ActWindowTileHorizontal: TWindowTileHorizontal;
    ActWindowTileVertical: TWindowTileVertical;
    ActWindowMinimizeAll: TWindowMinimizeAll;
    ActWindowArrange: TWindowArrange;
    ActWindowCloseAll: TAction;
    ActToolbarCustomize: TAction;
    EdtNotes: TRzRichEdit;
    RzSizePanel1: TRzSizePanel;
    RzGroupBar1: TRzGroupBar;
    GrpStyles: TRzGroup;
    GrpSamples: TRzGroup;
    GrpToolbar: TRzGroup;
    RzRegIniFile1: TRzRegIniFile;
    RzFormState1: TRzFormState;
    BtnDisplay: TRzToolButton;
    ActDisplay: TAction;
    ActTabs: TAction;
    BtnTabs: TRzToolButton;
    RzBalloonHints1: TRzBalloonHints;
    PgcWorkArea: TRzPageControl;
    TabCustomFraming: TRzTabSheet;
    TabTabs: TRzTabSheet;
    TabEdits: TRzTabSheet;
    TabComboBoxes: TRzTabSheet;
    TabListBoxes: TRzTabSheet;
    TabCommonControls: TRzTabSheet;
    TabButtons: TRzTabSheet;
    TabDisplay: TRzTabSheet;
    TabDatabase: TRzTabSheet;
    TabWidgets: TRzTabSheet;
    TabShell: TRzTabSheet;
    TabLauncher: TRzTabSheet;
    TabSendMessages: TRzTabSheet;
    TabWelcome: TRzTabSheet;
    ActWelcome: TAction;
    BtnWelcome: TRzToolButton;
    RzLabel1: TRzLabel;
    MnuWelcome: TMenuItem;
    MnuTabs: TMenuItem;
    MnuDisplay: TMenuItem;
    LblWidgetFormToFront: TRzLabel;
    RzLabel9: TRzLabel;
    RzPanel1: TRzPanel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure MnuExitClick(Sender: TObject);
    procedure MnuMainToolbarClick(Sender: TObject);
    procedure MnuStatusBarClick(Sender: TObject);
    procedure MnuNotesClick(Sender: TObject);
    procedure RzGroup1Items0Click(Sender: TObject);
    procedure RzGroup1Items1Click(Sender: TObject);
    procedure RzGroup1Items2Click(Sender: TObject);
    procedure ActCustomFramingExecute(Sender: TObject);
    procedure ActComboBoxesExecute(Sender: TObject);
    procedure ActListBoxesExecute(Sender: TObject);
    procedure ActCommonControlsExecute(Sender: TObject);
    procedure ActEditsExecute(Sender: TObject);
    procedure ActButtonsExecute(Sender: TObject);
    procedure ActWidgetsExecute(Sender: TObject);
    procedure ActDatabaseExecute(Sender: TObject);
    procedure ActShellExecute(Sender: TObject);
    procedure ActLauncherExecute(Sender: TObject);
    procedure ActSendMessagesExecute(Sender: TObject);
    procedure ActToolbarCustomizeExecute(Sender: TObject);
    procedure ActWindowCloseAllExecute(Sender: TObject);
    procedure GrpToolbarNoTextClick(Sender: TObject);
    procedure GrpToolbarShowTextClick(Sender: TObject);
    procedure GrpToolbarTextRightClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActDisplayExecute(Sender: TObject);
    procedure ActTabsExecute(Sender: TObject);
    procedure ActWelcomeExecute(Sender: TObject);
    procedure LblWidgetFormToFrontClick(Sender: TObject);
  private
    FPath: string;

    FCustomFramingFrame: TFmeCustomFraming;
    FTabsFrame: TFmeTabs;
    FComboBoxesFrame: TFmeComboBoxes;
    FListBoxesFrame: TFmeListBoxes;
    FCommonControlsFrame: TFmeCommonControls;
    FEditsFrame: TFmeEdits;
    FButtonsFrame: TFmeButtons;
    FDisplayFrame: TFmeDisplay;
    FWidgetsForm: TFrmWidgets;
    {$IFDEF DEMO_DATA_AWARE_CTRLS}
    FReservationsFrame: TFmeReservations;
    {$ENDIF}
    FShellFrame: TFmeShell;
    FLauncherFrame: TFmeLauncher;
    FSendMessagesFrame: TFmeSendMessages;
    procedure ShowWidgetsForm;
  public
    procedure ClearNotes;
    procedure LoadNotes( const FileName: string );
    procedure RestoreMainNotes;
    procedure ClearWidgetRef;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses
  SysUtils;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FPath := ExtractFilePath( ParamStr( 0 ) );
  TbrMain.RestoreLayout;
  RestoreMainNotes;
  {$IFNDEF DEMO_DATA_AWARE_CTRLS}
  ActDatabase.Enabled := False;
  {$ENDIF}
end;


procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TbrMain.SaveLayout;
end;


procedure TFrmMain.ClearNotes;
begin
  EdtNotes.Clear;
end;


procedure TFrmMain.LoadNotes( const FileName: string );
begin
  EdtNotes.Clear;
  EdtNotes.Lines.LoadFromFile( FPath + FileName + '.rtf' );
end;


procedure TFrmMain.RestoreMainNotes;
begin
  LoadNotes( 'MainForm' );
end;


procedure TFrmMain.MnuExitClick(Sender: TObject);
begin
  Close;
end;


procedure TFrmMain.ActWindowCloseAllExecute(Sender: TObject);
var
  I: Integer;
begin
  for I := MDIChildCount - 1 downto 0 do
    MDIChildren[ I ].Close;
end;


procedure TFrmMain.MnuMainToolbarClick(Sender: TObject);
begin
  MnuMainToolbar.Checked := not MnuMainToolbar.Checked;
  TbrMain.Visible := MnuMainToolbar.Checked;
end;


procedure TFrmMain.MnuStatusBarClick(Sender: TObject);
begin
  MnuStatusBar.Checked := not MnuStatusBar.Checked;
  StsMain.Visible := MnuStatusBar.Checked;
end;


procedure TFrmMain.MnuNotesClick(Sender: TObject);
begin
  MnuNotes.Checked := not MnuNotes.Checked;
  PnlNotes.Visible := MnuNotes.Checked;
  StsNotes.Enabled := not PnlNotes.Visible;
  if PnlNotes.Visible then
    StsNotes.Caption := ''
  else
    StsNotes.Caption := 'Select View|Notes to see context sensitive notes.';
end;


procedure TFrmMain.RzGroup1Items0Click(Sender: TObject);
begin
  RzGroupBar1.Style := gbsCategoryView;
end;

procedure TFrmMain.RzGroup1Items1Click(Sender: TObject);
begin
  RzGroupBar1.Style := gbsTaskList;
end;

procedure TFrmMain.RzGroup1Items2Click(Sender: TObject);
begin
  RzGroupBar1.Style := gbsOutlook;
end;


procedure TFrmMain.ActWelcomeExecute(Sender: TObject);
begin
  PgcWorkArea.ActivePageIndex := 0;
  RestoreMainNotes;
  

  (*
  if F*Frame = nil then
  begin
    F*Frame := TFme*.Create( Application );
    F*Frame.Parent := Tab*;
    F*Frame.Align := alClient;
  end;

  PgcWorkArea.ActivePageIndex := Act*.Tag;
  LoadNotes( '*' );
  *)
end;


procedure TFrmMain.ActCustomFramingExecute(Sender: TObject);
begin
  if FCustomFramingFrame = nil then
  begin
    FCustomFramingFrame := TFmeCustomFraming.Create( Application );
    FCustomFramingFrame.Parent := TabCustomFraming;
    FCustomFramingFrame.Align := alClient;
    FCustomFramingFrame.Init;
  end;

  PgcWorkArea.ActivePage := TabCustomFraming;
  LoadNotes( 'CustomFraming' );
end;


procedure TFrmMain.ActTabsExecute(Sender: TObject);
begin
  if FTabsFrame = nil then
  begin
    FTabsFrame := TFmeTabs.Create( Application );
    FTabsFrame.Parent := TabTabs;
    FTabsFrame.Align := alClient;
    FTabsFrame.Init;
  end;

  PgcWorkArea.ActivePageIndex := ActTabs.Tag;
  LoadNotes( 'Tabs' );
end;


procedure TFrmMain.ActComboBoxesExecute(Sender: TObject);
begin
  if FComboBoxesFrame = nil then
  begin
    FComboBoxesFrame := TFmeComboBoxes.Create( Application );
    FComboBoxesFrame.Parent := TabComboBoxes;
    FComboBoxesFrame.Align := alClient;
    FComboBoxesFrame.Init;
  end;

  PgcWorkArea.ActivePageIndex := ActComboBoxes.Tag;
  LoadNotes( 'ComboBoxes' );
end;


procedure TFrmMain.ActListBoxesExecute(Sender: TObject);
begin
  if FListBoxesFrame = nil then
  begin
    FListBoxesFrame := TFmeListBoxes.Create( Application );
    FListBoxesFrame.Parent := TabListBoxes;
    FListBoxesFrame.Align := alClient;
    FListBoxesFrame.Init;
  end;

  PgcWorkArea.ActivePageIndex := ActListBoxes.Tag;
  LoadNotes( 'ListBoxes' );
end;


procedure TFrmMain.ActCommonControlsExecute(Sender: TObject);
begin
  if FCommonControlsFrame = nil then
  begin
    FCommonControlsFrame := TFmeCommonControls.Create( Application );
    FCommonControlsFrame.Parent := TabCommonControls;
    FCommonControlsFrame.Align := alClient;
    FCommonControlsFrame.Init;
  end;

  PgcWorkArea.ActivePageIndex := ActCommonControls.Tag;
  LoadNotes( 'CommonControls' );
end;


procedure TFrmMain.ActEditsExecute(Sender: TObject);
begin
  if FEditsFrame = nil then
  begin
    FEditsFrame := TFmeEdits.Create( Application );
    FEditsFrame.Parent := TabEdits;
    FEditsFrame.Align := alClient;
    FEditsFrame.Init;
  end;

  PgcWorkArea.ActivePageIndex := ActEdits.Tag;
  LoadNotes( 'Edits' );
end;


procedure TFrmMain.ActButtonsExecute(Sender: TObject);
begin
  if FButtonsFrame = nil then
  begin
    FButtonsFrame := TFmeButtons.Create( Application );
    FButtonsFrame.Parent := TabButtons;
    FButtonsFrame.Align := alClient;
    FButtonsFrame.Init;
  end;

  PgcWorkArea.ActivePageIndex := ActButtons.Tag;
  LoadNotes( 'Buttons' );
end;


procedure TFrmMain.ActDisplayExecute(Sender: TObject);
begin
  if FDisplayFrame = nil then
  begin
    FDisplayFrame := TFmeDisplay.Create( Application );
    FDisplayFrame.Parent := TabDisplay;
    FDisplayFrame.Align := alClient;
    FDisplayFrame.Init;
  end;

  PgcWorkArea.ActivePageIndex := ActDisplay.Tag;
  LoadNotes( 'Display' );
end;


procedure TFrmMain.ShowWidgetsForm;
begin
  if FWidgetsForm = nil then
  begin
    FWidgetsForm := TFrmWidgets.Create( Application );
    FWidgetsForm.Show;
  end;

  FWidgetsForm.BringToFront;
end;


procedure TFrmMain.ActWidgetsExecute(Sender: TObject);
begin
  ShowWidgetsForm;
  PgcWorkArea.ActivePageIndex := ActWidgets.Tag;
  LoadNotes( 'Widgets' );
end;


procedure TFrmMain.LblWidgetFormToFrontClick(Sender: TObject);
begin
  ShowWidgetsForm;
end;


procedure TFrmMain.ClearWidgetRef;
begin
  FWidgetsForm := nil;
end;


procedure TFrmMain.ActDatabaseExecute(Sender: TObject);
begin
  {$IFDEF DEMO_DATA_AWARE_CTRLS}
  if FReservationsFrame = nil then
  begin
    FReservationsFrame := TFmeReservations.Create( Application );
    FReservationsFrame.Parent := TabDatabase;
    FReservationsFrame.Align := alClient;
    FReservationsFrame.Init;
  end;

  PgcWorkArea.ActivePageIndex := ActDatabase.Tag;
  LoadNotes( 'Reservation' );
  {$ENDIF}
end;


procedure TFrmMain.ActShellExecute(Sender: TObject);
begin
  if FShellFrame = nil then
  begin
    FShellFrame := TFmeShell.Create( Application );
    FShellFrame.Parent := TabShell;
    FShellFrame.Align := alClient;
    FShellFrame.Init;
  end;

  PgcWorkArea.ActivePageIndex := ActShell.Tag;
  LoadNotes( 'Shell' );
end;


procedure TFrmMain.ActLauncherExecute(Sender: TObject);
begin
  if FLauncherFrame = nil then
  begin
    FLauncherFrame := TFmeLauncher.Create( Application );
    FLauncherFrame.Parent := TabLauncher;
    FLauncherFrame.Align := alClient;
    FLauncherFrame.Init;
  end;

  PgcWorkArea.ActivePageIndex := ActLauncher.Tag;
  LoadNotes( 'Launcher' );
end;


procedure TFrmMain.ActSendMessagesExecute(Sender: TObject);
begin
  if FSendMessagesFrame = nil then
  begin
    FSendMessagesFrame := TFmeSendMessages.Create( Application );
    FSendMessagesFrame.Parent := TabSendMessages;
    FSendMessagesFrame.Align := alClient;
    FSendMessagesFrame.Init;
  end;

  PgcWorkArea.ActivePageIndex := ActSendMessages.Tag;
  LoadNotes( 'SendMessage' );
end;


procedure TFrmMain.ActToolbarCustomizeExecute(Sender: TObject);
begin
  TbrMain.Customize;
end;


procedure TFrmMain.GrpToolbarNoTextClick(Sender: TObject);
begin
  TbrMain.TextOptions := ttoNoTextLabels;
end;

procedure TFrmMain.GrpToolbarShowTextClick(Sender: TObject);
begin
  TbrMain.TextOptions := ttoShowTextLabels;
end;

procedure TFrmMain.GrpToolbarTextRightClick(Sender: TObject);
begin
  TbrMain.TextOptions := ttoSelectiveTextOnRight;
end;


end.
