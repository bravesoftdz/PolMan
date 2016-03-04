unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzSplit, Menus, RzGroupBar, StdCtrls, Mask,
  RzEdit, RzBtnEdt, RzCmboBx, RzDBCmbo, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGridCardView, {ADODS,} Registry,
  DBCtrls, cxCurrencyEdit, ImgList, ComCtrls, ToolWin, RzStatus,
  cxDataStorage, ADODB, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, Settings,
  xmldom, XMLIntf, msxmldom, XMLDoc;

type
  TMainForm = class(TForm)
    MainSplitter: TRzSplitter;
    TopPanel: TRzPanel;
    RightPanel: TRzPanel;
    MainMenu: TMainMenu;
    MenuFile: TMenuItem;
    MenuExit: TMenuItem;
    MainStatusBar: TRzStatusBar;
    RzPanel1: TRzPanel;
    HeaderLabel: TLabel;
    LeftPanel: TRzPanel;
    RzGroupBar1: TRzGroupBar;
    BrokerGroup: TRzGroup;
    ResultView: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    ResultGrid: TcxGrid;
    qResult: TADOQuery;
    DSResult: TDataSource;
    qLookIn: TADOQuery;
    DSLookIn: TDataSource;
    LogMemo: TMemo;
    cxStyleRepository1: TcxStyleRepository;
    OddColor: TcxStyle;
    MainToolbar: TToolBar;
    BrokerToolButton: TToolButton;
    NewClientToolButton: TToolButton;
    qCountryNames: TADOQuery;
    DSCountries: TDataSource;
    qCurrency: TADOQuery;
    DSCurrency: TDataSource;
    qCommissionLevel: TADOQuery;
    DSCommissionLevel: TDataSource;
    qFrequency: TADOQuery;
    DSFrequency: TDataSource;
    qBrokerStatus: TADOQuery;
    DSBrokerStatus: TDataSource;
    MenuImport: TMenuItem;
    MenuPrudential: TMenuItem;
    MenuPrudentialImportCommissionStatements: TMenuItem;
    MenuPrudentialImportPipeLineReport: TMenuItem;
    ClientGroup: TRzGroup;
    PolicyGroup: TRzGroup;
    RzGroup3: TRzGroup;
    qMisc: TADOQuery;
    RzStatusPane1: TRzStatusPane;
    RzVersionInfoStatus1: TRzVersionInfoStatus;
    RzKeyStatus1: TRzKeyStatus;
    RzKeyStatus2: TRzKeyStatus;
    RzKeyStatus3: TRzKeyStatus;
    RzKeyStatus4: TRzKeyStatus;
    StagedData1: TMenuItem;
    Brokers1: TMenuItem;
    Clients1: TMenuItem;
    Policies1: TMenuItem;
    ProductGroup: TRzGroup;
    qProfStatus: TADOQuery;
    DSProfStatus: TDataSource;
    qTitle2: TADOQuery;
    qTitle1: TADOQuery;
    DSTitle2: TDataSource;
    DSTitle1: TDataSource;
    qSex: TADOQuery;
    DSSex: TDataSource;
    qIDCard: TADOQuery;
    DSIDCard: TDataSource;
    qProductType: TADOQuery;
    qStatus: TADOQuery;
    qBusinessArea: TADOQuery;
    qProductName: TADOQuery;
    DSProductName: TDataSource;
    DSProductType: TDataSource;
    DSStatus: TDataSource;
    DSBusinessArea: TDataSource;
    NewPolicyToolButton: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButtonReports: TToolButton;
    ProductProviderGroup: TRzGroup;
    qProductProvider: TADOQuery;
    DSProductProvider: TDataSource;
    qCommissionBase: TADOQuery;
    DSCommissionBase: TDataSource;
    qPaymentType: TADOQuery;
    DSPaymentType: TDataSource;
    ToolbarImages: TImageList;
    ExitToolButton: TToolButton;
    ToolButton4: TToolButton;
    ProductToolButton: TToolButton;
    PolicyToolButton: TToolButton;
    ConnectDBStatus: TRzStatusPane;
    ToolButton5: TToolButton;
    MenuAutoLogin: TMenuItem;
    function GetCountryNumber(CountryName : String) : Byte;
    procedure ConnectConnection;
    procedure BuildQuery;
    function LoadLookInFields(DataView : Byte) : Boolean;
    function LoadGridColumns : Boolean;
    function SetGridClick(DataView : Byte) : Boolean;
    procedure BrokerLookup;
    procedure ClientLookup;
    procedure PolicyLookup;
    procedure BrokerGroupItems0Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BrokerToolButtonClick(Sender: TObject);
    procedure ResultViewDblClick(Sender: TObject);
    procedure NewClientToolButtonClick(Sender: TObject);
    procedure MenuPrudentialImportCommissionStatementsClick(Sender: TObject);
    procedure MenuPrudentialImportPipeLineReportClick(Sender: TObject);
    procedure BrokerGroupItems1Click(Sender: TObject);
    procedure BrokerGroupItems2Click(Sender: TObject);
    procedure BrokerGroupItems3Click(Sender: TObject);
    procedure BrokerGroupItems4Click(Sender: TObject);
    procedure BrokerGroupItems5Click(Sender: TObject);
    procedure BrokerGroupClose(Sender: TObject);
    procedure MenuExitClick(Sender: TObject);
    procedure ClientGroupItems0Click(Sender: TObject);
    procedure ClientGroupItems1Click(Sender: TObject);
    procedure ClientGroupItems2Click(Sender: TObject);
    procedure ClientGroupItems3Click(Sender: TObject);
    procedure ClientGroupItems4Click(Sender: TObject);
    procedure ClientGroupItems5Click(Sender: TObject);
    procedure ClientGroupItems6Click(Sender: TObject);
    procedure BrokerGroupItems6Click(Sender: TObject);
    procedure RzGroup2Items1Click(Sender: TObject);
    procedure RzGroup2Items2Click(Sender: TObject);
    procedure RzGroup2Items3Click(Sender: TObject);
    procedure RzGroup2Items4Click(Sender: TObject);
    procedure RzGroup2Items5Click(Sender: TObject);
    procedure RzGroup2Items0Click(Sender: TObject);
    procedure RzGroup2Items6Click(Sender: TObject);
    procedure NewPolicyToolButtonClick(Sender: TObject);
    procedure RzGroup1Items1Click(Sender: TObject);
    procedure RzGroup1Items0Click(Sender: TObject);
    procedure RzGroup4Items3Click(Sender: TObject);
    procedure ProductLookup;
    procedure RzGroup4Items0Click(Sender: TObject);
    procedure ExitToolButtonClick(Sender: TObject);
    procedure ProductToolButtonClick(Sender: TObject);
    procedure PolicyToolButtonClick(Sender: TObject);
    procedure ToolButtonReportsClick(Sender: TObject);
    procedure MenuAutoLoginClick(Sender: TObject);
    procedure ToolButtonConnectionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    procedure SelectDB(WhatDB : Byte);
    procedure Login;
    procedure AppException(Sender: TObject; E: Exception);    
  public
    QueryFilterString, JoinString : String;

  end;

var
  MainForm: TMainForm;
  DetailView : Byte;      //what are we looking at - 1~broker, 2~clients etc
  DEVCO : Boolean;
  DefaultHeaderCaption : String;

implementation

uses UBroker, UClient, UPicklist, UPolicy, UProductProvider, UProduct, tbj_utils,
  UCalcSingle, {IniFiles,} ULogin, UDataModule;

{$R *.dfm}

//------------------------------------------------------------------------------

function TMainForm.GetCountryNumber(CountryName : String) : Byte;

begin
  with qMisc do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT country_id FROM tbl_country WHERE country_name = ' + CountryName);
    Open;
    Result := FieldValues['country_id'];
    Close;
  end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.Login;
  var
    FLogin: TLoginForm;
    ADefaultConnected: Boolean;
    FDatabase, FServer, FName: String;

    procedure ReCreateButtons;
      var
        i: Integer;
        FToolButton: TToolButton;
        FBitmap: TBitmap;
        FConnectIndex: Integer;
        LastBtnIdx: Integer;
    begin

      if MainToolbar.ButtonCount > 11 then
      for i := MainToolbar.ButtonCount - 1 downto MainToolbar.ButtonCount - DM.Settings.Connections.Count do
        MainToolbar.Buttons[i].Free;

      // Clear loaded images
      if ToolbarImages.Count > 7 then
      begin
        for i := ToolbarImages.Count - 1 downto ToolbarImages.Count - DM.Settings.Connections.Count do
        ToolbarImages.Delete(i);
      end;

      for i := 0 to DM.Settings.Connections.Count - 1 do
      begin
        FToolButton := TToolButton.Create(MainToolbar);
        FToolButton.Parent := MainToolbar;
        FToolButton.Name := 'ToolButtonConnect' + IntToStr(i);
        FToolButton.Caption := DM.Settings.Connections.Connection[i].Name;

        LastBtnIdx := MainToolbar.ButtonCount - 1;
        if LastBtnIdx > -1 then
          FToolButton.Left := MainToolbar.Buttons[LastBtnIdx].Left +
            MainToolbar.Buttons[LastBtnIdx].Width
        else
          FToolButton.Left := 0;

        FToolButton.Tag := i;
        FToolButton.OnClick := ToolButtonConnectionClick;

        FBitmap := TBitmap.Create;
        FBitmap.LoadFromFile(ExtractFilePath(ParamStr(0)) + DM.Settings.Connections.Connection[i].Icon);
        ToolbarImages.Add(FBitmap, nil);
        FToolButton.ImageIndex := FConnectIndex + 7;

        if i = DM.Settings.Connections.DefaultConnection then
          FToolButton.Down := True;
        Inc(FConnectIndex);
      end;

      if FDatabase = 'db_pman_devco' then
      begin
        DEVCO := True;
        ProductProviderGroup.Visible := False;
      end
      else
      begin
        DEVCO := False;
        ProductProviderGroup.Visible := True;
      end;

      DefaultHeaderCaption := FName;
      HeaderLabel.Caption := DefaultHeaderCaption;

      // connect db
      ConnectDBStatus.Caption := 'Server: ' + FServer + '  -  Connection: ' + FDatabase;
      MenuAutoLogin.Enabled := True;
      MenuAutoLogin.Checked := True;

      ADefaultConnected := True;

    end;

begin
  ADefaultConnected := False;

  if DM.Settings.AutoLogin then
  begin

    FDatabase := DM.Settings.Connections.Connection[DM.Settings.Connections.DefaultConnection].Database;
    FServer := DM.Settings.Connections.Connection[DM.Settings.Connections.DefaultConnection].Server;
    FName := DM.Settings.Connections.Connection[DM.Settings.Connections.DefaultConnection].Name;

    if not DM.Settings.WindowsAuthentication then
      DM.DB_POLMAN.ConnectionString := 'Provider=SQLOLEDB.1;Password=' + DM.Settings.Password  +
      ';Persist Security Info=True;User ID=' + DM.Settings.Login + ';Initial Catalog=' + FDatabase +
      ';Data Source=' + FServer +
      ';Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False'
    else
      DM.DB_POLMAN.ConnectionString :=
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=' +
      FDatabase + ';Data Source=' + FServer;

      try

        DM.DB_POLMAN.Connected := True;
        ReCreateButtons;
      except
        on E: Exception do
          ADefaultConnected := False;
      end;
  end;

  if ADefaultConnected then Exit;

  FLogin := TLoginForm.Create(Self);
  try
    if FLogin.ShowModal = mrOk then
    begin

      FDatabase := FLogin.Database;
      FServer := FLogin.Server;
      FName := FLogin.Name;

      ReCreateButtons;
    end;
  finally
    FreeAndNil(FLogin);
  end;
  if not ADefaultConnected then
    Application.Terminate;
end;

//------------------------------------------------------------------------------

procedure TMainForm.ConnectConnection;
  var
//    IniFile : TIniFile;
    CatStr, DBStr : String;
    ConnectionCount: Integer;
    FLogin: TLoginForm;
    ThisVersion: String;
begin
  DM.DB_POLMAN.Connected := False; //delphi opens it from time to time when coding?
  ConnectionCount := 0;

//  IniFile :=  TIniFile.Create( IncludeTrailingPathDelimiter( ExtractFilePath(ParamStr(0))) + 'PolMan.ini' );
  DM.Settings := LoadSettings(IncludeTrailingPathDelimiter( ExtractFilePath(ParamStr(0))) + 'Settings.xml');
//  ConnectionCount := IniFile.ReadInteger('ConnectionList','ItemCount',0);
  ConnectionCount := DM.Settings.Connections.Count;
//  IniFile.Free;
  if ConnectionCount = 0 then
  begin
    //use defaults
    CatStr := 'db_pman_live';
    DBStr := 'EBN-SVR03';
    try
      DM.DB_POLMAN.ConnectionString := 'Provider=SQLOLEDB.1;Password=labello;Persist Security Info=True;User ID=db_user;Initial Catalog=' + CatStr +';Data Source=' + DBStr +';Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False';
      DM.DB_POLMAN.Connected := True;
    except
      MessageDlg('An error occured while trying to connect to the Connection! Terminating...', mtERROR, [mbOK], 0);
      Application.Terminate;
    end;
  end
  else
  begin
    Login;
  end;

  {KUZMENKO}
  ThisVersion := GetAppVersion;
  if DEVCO then
    MainForm.Caption := 'Prudential Policy Manager v. ' + ThisVersion
  else
    MainForm.Caption := 'European Business Network - Policy Manager v. ' + ThisVersion;
end;

//------------------------------------------------------------------------------

procedure TMainForm.BuildQuery;

var
SelectString, FromString : String;

begin
  with qLookIn do
  begin
    First;
    SelectString := 'SELECT ' + FieldValues['table_name'] + '.' + FieldValues['datafield_name'];
    FromString := 'FROM ' + FieldValues['table_name'] + ' ';
    while not EOF do
    begin
      Next;
      if not EOF then
        SelectString := SelectString + ', ' + FieldValues['table_name'] + '.' + FieldValues['datafield_name'];
    end;
  end;
  with qResult do
  begin
    Close;
    SQL.Clear;
    SQL.Add(SelectString);
    case DetailView of  //some views require join statements - check procedure for each cat.
      3,5 : SQL.Add(JoinString);
      else SQL.Add(FromString);
    end; //of case
    SQL.Add(QueryFilterString);
    Open;
    //LogMemo.Visible := True;
    //LogMemo.Clear;
    //LogMemo.Lines := SQL;
  end;
  QueryFilterString := '';
end;

//------------------------------------------------------------------------------

function TMainForm.LoadLookInFields(DataView : Byte) : Boolean;

begin
  Result := True;
  try
    with qLookIn do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT lookup_id, table_name, datafield_name, datafield_desc_name, column_def_width, column_money, load_order FROM tbl_lookup_fields');
      SQL.Add('WHERE lookup_id = ' + IntToStr(DataView));
      SQL.Add('ORDER BY load_order');
//logmemo.lines := SQL;
      Open;
      Result := (RecordCount <> 0);
    end;
  except
    Result := False;
  end;
end;

//------------------------------------------------------------------------------

function TMainForm.LoadGridColumns : Boolean;

var
ResultColumn : TcxGridDBColumn;
i : Byte;

begin
  if (qResult.RecordCount = 0) then Exit;
  ResultView.ClearItems;
  ResultView.DataController.CreateAllItems;
  qLookIn.First;
  for i := 0 to ResultView.ColumnCount - 1 do     //0 to x-1?
  begin
     //columns we do not display but need in result set
    if qLookIn.FieldValues['column_def_width'] = 0 then Continue;
    with ResultView.Columns[i] do
    begin
      Caption := qLookIn.FieldValues['datafield_desc_name'];
      Width := qLookIn.FieldValues['column_def_width'];
      Options.Editing := False;
      if (qLookIn.FieldValues['column_money'] <> 0) then
      begin
        PropertiesClass := TcxCurrencyEditProperties;
        // need to cast the items properties this way - see
        // http://www.devexpress.com/Support/KnowledgeBase/ShowArticle.xml?kbid=1097&prod=&tech=&kbss=currencyedit
        TcxCurrencyEditProperties(ResultView.Columns[i].Properties).DecimalPlaces := 2;
        TcxCurrencyEditProperties(ResultView.Columns[i].Properties).DisplayFormat := ',0.00;-,0.00';
      end;
    end;
    qLookIn.Next;
  end;
end;

//------------------------------------------------------------------------------

function TMainForm.SetGridClick(DataView : Byte) : Boolean;

begin

end;

//------------------------------------------------------------------------------

procedure TMainForm.BrokerLookup;

begin
  BrokerForm.NewBroker := False;
  if LoadLookInFields(1) then
  begin
    DetailView := 1;
    BuildQuery;
    LoadGridColumns;
    HeaderLabel.Caption := 'Brokers [Current Selection = ' +IntToStr(qResult.RecordCount)+ ']';
  end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.ClientLookup;

begin
  JoinString := '';
  ClientForm.NewClient := False;
  if LoadLookInFields(2) then
  begin
    DetailView := 2;
    BuildQuery;
    LoadGridColumns;
    HeaderLabel.Caption := 'Clients [Current Selection = ' +IntToStr(qResult.RecordCount)+ ']';
  end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.PolicyLookup;
// be aware - changed from inner joins to left joins to show all - need to discuss
// what fields are required when setting up a policy - tbj 20060920
begin
  PolicyForm.NewPolicy := False;
  if LoadLookInFields(3) then
  begin
    DetailView := 3;
    JoinString := 'FROM tbl_policy ' +
                  'LEFT JOIN tbl_product ON tbl_policy.pol_product_id = tbl_product.product_id '+
                  'LEFT JOIN tbl_status_policy ON tbl_policy.pol_status_id = tbl_status_policy.policy_status_id '+
                  'LEFT JOIN tbl_product_provider ON tbl_product.product_provider_id = tbl_product_provider.product_provider_id '+
                  'LEFT JOIN tbl_frequency ON tbl_frequency.frequency_id = tbl_policy.pol_frequency ' +
                  'LEFT JOIN tbl_client ON tbl_client.client_id = tbl_policy.pol_life1_insured'; //added 2007-05-21 - GW
    BuildQuery;
    LoadGridColumns;
    HeaderLabel.Caption := 'Policies [Current Selection = ' +IntToStr(qResult.RecordCount)+ ']';
  end;
end;

//------------------------------------------------------------------------------


procedure TMainForm.BrokerGroupItems0Click(Sender: TObject);

begin
  //QueryFilterString := 'WHERE broker_status = 1';  //we show only active brokers
  BrokerLookup;
end;

//------------------------------------------------------------------------------

procedure TMainForm.BrokerGroupItems1Click(Sender: TObject);

begin
  PickListForm.LoadPickList(1);
  PickListForm.ShowModal;
  if QueryFilterString = '' then Exit;
  QueryFilterString := 'WHERE broker_company = ' + QueryFilterString;
  BrokerLookup;
end;

//------------------------------------------------------------------------------

procedure TMainForm.BrokerGroupItems2Click(Sender: TObject);

begin
  PickListForm.LoadPickList(2);
  PickListForm.ShowModal;
  if QueryFilterString = '' then Exit;
  QueryFilterString := 'WHERE broker_firstname = ' + QueryFilterString;
  BrokerLookup;
end;

//------------------------------------------------------------------------------

procedure TMainForm.BrokerGroupItems3Click(Sender: TObject);

begin
  PickListForm.LoadPickList(3);
  PickListForm.ShowModal;
  if QueryFilterString = '' then Exit;
  QueryFilterString := 'WHERE broker_lastname = ' + QueryFilterString;
  BrokerLookup;
end;

//------------------------------------------------------------------------------

procedure TMainForm.BrokerGroupItems4Click(Sender: TObject);

begin
  PickListForm.LoadPickList(4);
  PickListForm.ShowModal;
  if QueryFilterString = '' then Exit;
  QueryFilterString := 'WHERE broker_city = ' + QueryFilterString;
  BrokerLookup;

end;
//------------------------------------------------------------------------------

procedure TMainForm.BrokerGroupItems5Click(Sender: TObject);

begin
  PickListForm.LoadPickList(5);
  PickListForm.ShowModal;
  if QueryFilterString = '' then Exit;
  QueryFilterString := 'WHERE broker_country = ' + IntToStr(GetCountryNumber(QueryFilterString));
  BrokerLookup;
end;

//------------------------------------------------------------------------------

procedure TMainForm.BrokerGroupItems6Click(Sender: TObject);
//add broker
begin
  BrokerForm.NewBroker := True;
  BrokerForm.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TMainForm.ClientGroupItems0Click(Sender: TObject);

begin
  QueryFilterString := '';
  ClientLookup;
end;

//------------------------------------------------------------------------------

procedure TMainForm.ClientGroupItems1Click(Sender: TObject);

begin
  PickListForm.LoadPickList(6);
  PickListForm.ShowModal;
  if QueryFilterString = '' then Exit;
  QueryFilterString := 'WHERE client_company = ' + QueryFilterString;
  ClientLookup;
end;

//------------------------------------------------------------------------------

procedure TMainForm.ClientGroupItems2Click(Sender: TObject);

begin
  PickListForm.LoadPickList(7);
  PickListForm.ShowModal;
  if QueryFilterString = '' then Exit;
  QueryFilterString := 'WHERE client_firstname = ' + QueryFilterString;
  ClientLookup;
end;

//------------------------------------------------------------------------------

procedure TMainForm.ClientGroupItems3Click(Sender: TObject);

begin
  PickListForm.LoadPickList(8);
  PickListForm.ShowModal;
  if QueryFilterString = '' then Exit;
  QueryFilterString := 'WHERE client_lastname = ' + QueryFilterString;
  ClientLookup;
end;

//------------------------------------------------------------------------------

procedure TMainForm.ClientGroupItems4Click(Sender: TObject);

begin
  PickListForm.LoadPickList(9);
  PickListForm.ShowModal;
  if QueryFilterString = '' then Exit;
  QueryFilterString := 'WHERE client_city = ' + QueryFilterString;
  ClientLookup;
end;

//------------------------------------------------------------------------------

procedure TMainForm.ClientGroupItems5Click(Sender: TObject);

begin
  PickListForm.LoadPickList(10);
  PickListForm.ShowModal;
  if QueryFilterString = '' then Exit;
  QueryFilterString := 'WHERE client_country = ' + IntToStr(GetCountryNumber(QueryFilterString));
  ClientLookup;
end;

//------------------------------------------------------------------------------

procedure TMainForm.ClientGroupItems6Click(Sender: TObject);
//add client
begin
  ClientForm.NewClient := True;
  ClientForm.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TMainForm.FormShow(Sender: TObject);
  var
    v1, v2,v3, v4 : Integer;
begin
  ConnectConnection;
  DEVCO := False;
  {POLAK}
//  ThisVersion := GetFileVersion(Application.ExeName, v1, v2,v3, v4 );
  DetailView := 0;
end;

//------------------------------------------------------------------------------

procedure TMainForm.SelectDB(WhatDB : Byte);
//  var
//    EBNReg : TRegistry;
//    IniFile: TIniFile;
begin
  DM.DB_POLMAN.Connected := False; //delphi opens it from time to time when coding?
{
  try
    EBNReg :=  TRegistry.Create;
    with EBNReg do
    begin
      RootKey := HKEY_CURRENT_USER;
      if OpenKey('SOFTWARE\EBN\POLICY MANAGER', True) then
      begin
        case WhatDB of
          1: WriteString('Catalog','db_pman_live'); //ebn Connection
          2: WriteString('Catalog','db_pman_devco'); //devco Connection
          3: WriteString('Catalog','db_pman_dev'); //development Connection
        end; //of case
      end
        else MessageDlg('Unable to open the regsitry for writing!', mtERROR, [mbOK], 0);
    end;
  finally
    EBNReg.Free;
  end;
  FormShow(Self);
}
{
  IniFile :=  TIniFile.Create( IncludeTrailingPathDelimiter( ExtractFilePath(ParamStr(0))) +
    'PolMan.ini' );
  try

    IniFile.WriteInteger('Connection','DefaultConnection',WhatDB);

  finally
    IniFile.Free;
  end;
}

  DM.Settings.Connections.DefaultConnection := WhatDB;

  Login;
end;

//------------------------------------------------------------------------------

procedure TMainForm.BrokerToolButtonClick(Sender: TObject);

begin
  if not BrokerGroup.Opened then
    BrokerGroup.Open;
  BrokerGroupItems0Click(Self);
end;

//------------------------------------------------------------------------------

procedure TMainForm.ResultViewDblClick(Sender: TObject);

begin
  case DetailView of
    1: BrokerForm.ShowModal;
    2: begin ClientForm.EditClientFromPolicy := False; ClientForm.ShowModal; end;
    3: begin
         if PolicyForm.NewPolicy then
            PolicyForm.PolicyID := 0  // triggers a new policy in GetPolicyInfo
         else
            PolicyForm.PolicyID := qResult.FieldValues['pol_id'];
         PolicyForm.ShowModal;
       end;
    4: begin // product providers
         ProductProviderForm.ProductProviderID := qResult.FieldValues['product_provider_id'];
         ProductProviderForm.EditAction := 2;
         ProductProviderForm.ShowModal;
       end;
    5: begin //products
         ProductForm.ProductID := qResult.FieldValues['product_id'];
         ProductForm.ShowModal;
       end;
  end; //of case
end;

//------------------------------------------------------------------------------

procedure TMainForm.NewClientToolButtonClick(Sender: TObject);

begin
  ClientGroup.Items[6].OnClick(Self);
end;

//------------------------------------------------------------------------------

procedure TMainForm.MenuPrudentialImportCommissionStatementsClick(Sender: TObject);

begin
  //ArteInvestUserForm.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TMainForm.MenuPrudentialImportPipeLineReportClick(Sender: TObject);

begin
  //ArteInvestPictureForm.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TMainForm.BrokerGroupClose(Sender: TObject);

begin
  qResult.Close;
  HeaderLabel.Caption := DefaultHeaderCaption;
  ResultView.ClearItems;
end;

//------------------------------------------------------------------------------

procedure TMainForm.MenuExitClick(Sender: TObject);

begin
  Application.Terminate;
end;

//------------------------------------------------------------------------------

procedure TMainForm.RzGroup2Items0Click(Sender: TObject);

begin
  QueryFilterString := '';
  PolicyLookup;
end;

//------------------------------------------------------------------------------

procedure TMainForm.RzGroup2Items1Click(Sender: TObject);

begin
  PickListForm.LoadPickList(11);
  PickListForm.ShowModal;
  if QueryFilterString = '' then Exit;
  QueryFilterString := 'WHERE pol_id = ' + QueryFilterString;
  PolicyLookup;  //application id
end;

//------------------------------------------------------------------------------

procedure TMainForm.RzGroup2Items2Click(Sender: TObject);

begin
  PickListForm.LoadPickList(12);
  PickListForm.ShowModal;
  if QueryFilterString = '' then Exit;
  QueryFilterString := 'WHERE pol_number = ' + QueryFilterString;
  PolicyLookup;  //policy number
end;

//------------------------------------------------------------------------------

procedure TMainForm.RzGroup2Items3Click(Sender: TObject);

begin
  PickListForm.LoadPickList(13);
  PickListForm.ShowModal;
  if QueryFilterString = '' then Exit;
  QueryFilterString := 'WHERE pol_status_id = ' + QueryFilterString;
  PolicyLookup;  //policy status
end;

//------------------------------------------------------------------------------

procedure TMainForm.RzGroup2Items4Click(Sender: TObject);

begin
  PickListForm.LoadPickList(14);
  PickListForm.ShowModal;
  if QueryFilterString = '' then Exit;
  QueryFilterString := 'WHERE pol_product_id = ' + QueryFilterString;
  PolicyLookup;  //product
end;

//------------------------------------------------------------------------------

procedure TMainForm.RzGroup2Items5Click(Sender: TObject);

begin
  PickListForm.LoadPickList(15);
  PickListForm.ShowModal;
  if QueryFilterString = '' then Exit;
  QueryFilterString := 'WHERE tbl_product_provider.product_provider_id = ' + QueryFilterString;
  PolicyLookup;  //product provider
end;

//------------------------------------------------------------------------------

procedure TMainForm.RzGroup2Items6Click(Sender: TObject);

begin
  PolicyForm.NewPolicy := True;
  PolicyForm.PolicyID := 0;
  PolicyForm.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TMainForm.NewPolicyToolButtonClick(Sender: TObject);

begin
  RzGroup2Items6Click(Self);
end;

//------------------------------------------------------------------------------

procedure TMainForm.RzGroup1Items0Click(Sender: TObject);

begin
  if LoadLookInFields(4) then
  begin
    DetailView := 4;
    BuildQuery;
    LoadGridColumns;
    HeaderLabel.Caption := 'Product Suppliers [' +IntToStr(qResult.RecordCount)+ ']';
  end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.RzGroup1Items1Click(Sender: TObject);

begin
  ProductProviderForm.EditAction := 1;
  ProductProviderForm.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TMainForm.RzGroup4Items3Click(Sender: TObject);

begin
  qProductProvider.Open;
  if qProductProvider.RecordCount = 0 then
  begin
    MessageDlg('No product providers has been been defined! You can only set up products when minimum one product provider exist!', mtINFORMATION, [mbOK], 0);
    qProductProvider.Close;
    Exit;
  end;
  qProductProvider.Close;
  ProductForm.ProductID := 0;
  ProductForm.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TMainForm.ProductLookup;

begin
  if LoadLookInFields(5) then
  begin

  //'SELECT tbl_product.product_name, tbl_product_provider.product_provider_company,
//tbl_product_type.product_type_desc, tbl_currency.currency_tag'

  JoinString := ' FROM tbl_product ' +
                ' INNER JOIN tbl_product_provider ON tbl_product.product_provider_id = tbl_product_provider.product_provider_id ' +
                ' INNER JOIN tbl_product_type ON tbl_product.product_type = tbl_product_type.product_type_id ' +
                ' INNER JOIN tbl_currency ON tbl_product.product_currency = tbl_currency.currency_id';
    DetailView := 5;
    BuildQuery;
    LoadGridColumns;
    HeaderLabel.Caption := 'Products [' +IntToStr(qResult.RecordCount)+ ']';
  end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.RzGroup4Items0Click(Sender: TObject);
//show all products
begin
  QueryFilterString := '';
  ProductLookup;
end;

//------------------------------------------------------------------------------

procedure TMainForm.ExitToolButtonClick(Sender: TObject);

begin
  Application.Terminate;
end;

//------------------------------------------------------------------------------

procedure TMainForm.ProductToolButtonClick(Sender: TObject);

begin
  if not ProductGroup.Opened then
    ProductGroup.Open;
  RzGroup4Items0Click(Self);
end;

//------------------------------------------------------------------------------

procedure TMainForm.PolicyToolButtonClick(Sender: TObject);

begin
  if not PolicyGroup.Opened then
    PolicyGroup.Open;
  RzGroup2Items0Click(Self);
end;

//------------------------------------------------------------------------------

procedure TMainForm.ToolButtonReportsClick(Sender: TObject);

begin
  Exit;
  CalcSingleForm.show;
end;

//------------------------------------------------------------------------------

procedure TMainForm.MenuAutoLoginClick(Sender: TObject);
//  var
//    IniFile: TIniFile;
begin
  MenuAutoLogin.Checked := not MenuAutoLogin.Checked;
{
  IniFile :=  TIniFile.Create( IncludeTrailingPathDelimiter( ExtractFilePath(ParamStr(0))) +
    'PolMan.ini' );
  try

    IniFile.WriteInteger('Connection','AutoLogin',Integer(MenuAutoLogin.Checked));

  finally
    IniFile.Free;
  end;
}

  DM.Settings.AutoLogin := MenuAutoLogin.Checked;
  DM.Settings.OwnerDocument.SaveToFile( IncludeTrailingPathDelimiter(
    ExtractFilePath(ParamStr(0))) + 'Settings.xml' );
end;

procedure TMainForm.ToolButtonConnectionClick(Sender: TObject);
begin
  if Sender is TToolButton then
    SelectDB( (Sender as TToolButton).Tag );
end;

procedure TMainForm.AppException(Sender: TObject; E: Exception);
begin

end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Application.OnException := AppException;
end;

end.
