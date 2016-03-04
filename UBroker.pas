unit UBroker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzTabs, ExtCtrls, RzPanel, RzEdit, StdCtrls, Mask,
  RzDBEdit, DBCtrls, RzDBCmbo, DB, {ADODS,} UBrokerDirectAgreements,
  {UBrokerInformation,} RzButton, RzRadChk, RzDBChk, RzLstBox, RzDBList,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, RzRadGrp, RzDBRGrp,
  RzDBBnEd, RzLabel, RzCmboBx, Grids, DBGrids, RzDBLbl, StrUtils,
  cxDataStorage, cxCurrencyEdit, ADODB, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TBrokerForm = class(TForm)
    ClientPanel: TRzPanel;
    BrokerPageControl: TRzPageControl;
    BrokerInformation: TRzTabSheet;
    Compliance: TRzTabSheet;
    ProductAgreements: TRzTabSheet;
    TabSheet4: TRzTabSheet;
    TabSheet5: TRzTabSheet;
    TabSheet6: TRzTabSheet;
    TabSheet7: TRzTabSheet;
    qBrokerInfo: TADOQuery;
    DSBrokerInfo: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    RzDBMemo1: TRzDBMemo;
    RzDBLookupComboBox3: TRzDBLookupComboBox;
    RzDBLookupComboBox4: TRzDBLookupComboBox;
    RzDBLookupComboBox5: TRzDBLookupComboBox;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    RzDBDateTimeEdit2: TRzDBDateTimeEdit;
    RzDBLookupComboBox6: TRzDBLookupComboBox;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    TabSheet8: TRzTabSheet;
    RzDBDateTimeEdit3: TRzDBDateTimeEdit;
    RzDBDateTimeEdit5: TRzDBDateTimeEdit;
    RzDBDateTimeEdit6: TRzDBDateTimeEdit;
    RzDBDateTimeEdit7: TRzDBDateTimeEdit;
    RzDBDateTimeEdit8: TRzDBDateTimeEdit;
    RzDBDateTimeEdit9: TRzDBDateTimeEdit;
    RzDBDateTimeEdit10: TRzDBDateTimeEdit;
    RzDBDateTimeEdit11: TRzDBDateTimeEdit;
    RzDBDateTimeEdit12: TRzDBDateTimeEdit;
    RzDBDateTimeEdit13: TRzDBDateTimeEdit;
    RzDBDateTimeEdit14: TRzDBDateTimeEdit;
    RzDBDateTimeEdit15: TRzDBDateTimeEdit;
    RzDBDateTimeEdit16: TRzDBDateTimeEdit;
    RzDBDateTimeEdit18: TRzDBDateTimeEdit;
    RzDBDateTimeEdit19: TRzDBDateTimeEdit;
    RzDBDateTimeEdit20: TRzDBDateTimeEdit;
    RzDBDateTimeEdit21: TRzDBDateTimeEdit;
    RzDBDateTimeEdit23: TRzDBDateTimeEdit;
    RzDBDateTimeEdit24: TRzDBDateTimeEdit;
    RzDBDateTimeEdit25: TRzDBDateTimeEdit;
    RzDBDateTimeEdit26: TRzDBDateTimeEdit;
    RzDBDateTimeEdit27: TRzDBDateTimeEdit;
    RzDBDateTimeEdit28: TRzDBDateTimeEdit;
    RzDBDateTimeEdit29: TRzDBDateTimeEdit;
    RzDBDateTimeEdit30: TRzDBDateTimeEdit;
    RzDBDateTimeEdit31: TRzDBDateTimeEdit;
    RzDBDateTimeEdit32: TRzDBDateTimeEdit;
    RzDBDateTimeEdit33: TRzDBDateTimeEdit;
    RzDBCheckBox1: TRzDBCheckBox;
    RzDBCheckBox2: TRzDBCheckBox;
    RzDBCheckBox3: TRzDBCheckBox;
    RzDBCheckBox4: TRzDBCheckBox;
    RzDBCheckBox5: TRzDBCheckBox;
    RzDBCheckBox6: TRzDBCheckBox;
    RzDBCheckBox7: TRzDBCheckBox;
    RzDBCheckBox8: TRzDBCheckBox;
    RzDBCheckBox9: TRzDBCheckBox;
    RzDBCheckBox10: TRzDBCheckBox;
    RzDBCheckBox11: TRzDBCheckBox;
    RzDBCheckBox12: TRzDBCheckBox;
    RzDBCheckBox13: TRzDBCheckBox;
    RzDBCheckBox15: TRzDBCheckBox;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    qBrokerCompliance: TADOQuery;
    DSBrokerCompliance: TDataSource;
    Label26: TLabel;
    Label31: TLabel;
    BankDetails: TRzDBRadioGroup;
    Label23: TLabel;
    RzDBEdit13: TRzDBEdit;
    BICLabel: TLabel;
    IBANLabel: TLabel;
    RzDBEdit14: TRzDBEdit;
    UseIBAN: TRzDBCheckBox;
    IBANEdit: TRzDBButtonEdit;
    RzDBCheckBox14: TRzDBCheckBox;
    RzDBCheckBox17: TRzDBCheckBox;
    RzDBCheckBox16: TRzDBCheckBox;
    RzDBNumericEdit2: TRzDBNumericEdit;
    qBrokerAgreements: TADOQuery;
    qLoadRates: TADOQuery;
    DSLoadRates: TDataSource;
    qValidate: TADOQuery;
    CloseButton: TRzButton;
    EditBrokerInfoButton: TRzButton;
    SaveBrokerInfoButton: TRzButton;
    EditBrokerComplianceButton: TRzButton;
    SaveBrokerComplianceButton: TRzButton;
    AddAgreementButton: TRzButton;
    DeleteAgreementButton: TRzButton;
    BrokerAgreementsDBTableView1: TcxGridDBTableView;
    BrokerAgreementsLevel1: TcxGridLevel;
    BrokerAgreements: TcxGrid;
    DSBrokerAgreements: TDataSource;
    BrokerAgreementsDBTableView1DBColumn1: TcxGridDBColumn;
    BrokerAgreementsDBTableView1DBColumn2: TcxGridDBColumn;
    BrokerAgreementsDBTableView1DBColumn3: TcxGridDBColumn;
    RzDBLabel1: TRzDBLabel;
    RzGroupBox1: TRzGroupBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    AddOverrideAgreementButton: TRzButton;
    EditOverrideAgreementButton: TRzButton;
    DeleteOverrideAgreementButton: TRzButton;
    qBrokerCommission: TADOQuery;
    DSBrokerCommission: TDataSource;
    CommissionOverview: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    CommLevel: TcxGridDBColumn;
    VolLevel: TcxGridDBColumn;
    Y1: TcxGridDBColumn;
    Renewal: TcxGridDBColumn;
    Other: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    qOverRideBroker: TADOQuery;
    qOverrideProduct: TADOQuery;
    DSOverrideBroker: TDataSource;
    DSOverrideProduct: TDataSource;
    OverrideBrokerSelect: TRzDBLookupComboBox;
    OverrideProductSelect: TRzDBLookupComboBox;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    qOverrideAgreements: TADOQuery;
    DSOverrideAgreement: TDataSource;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    qAddOverrideAgreement: TADOQuery;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    qOverrideDetails: TADOQuery;
    DSOverrideDetails: TDataSource;
    Label24: TLabel;
    qDelete: TADOQuery;
    RzDBLabel2: TRzDBLabel;
    RzLabel4: TRzLabel;
    RzGroupBox4: TRzGroupBox;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    Y1Comm: TRzDBNumericEdit;
    Y2Comm: TRzDBNumericEdit;
    Y3Comm: TRzDBNumericEdit;
    Y4Comm: TRzDBNumericEdit;
    Y5Comm: TRzDBNumericEdit;
    RenewalComm: TRzDBNumericEdit;
    OtherComm: TRzDBNumericEdit;
    RzGroupBox5: TRzGroupBox;
    AddVolLevelButton: TRzButton;
    RzGroupBox2: TRzGroupBox;
    AddCommLevelButton: TRzButton;
    DelVolLevelButton: TRzButton;
    DelCommLevelButton: TRzButton;
    CommLevelList: TRzListBox;
    VolLevelList: TRzListBox;
    OverrideLabel: TRzLabel;
    Y2: TcxGridDBColumn;
    Y3: TcxGridDBColumn;
    Y4: TcxGridDBColumn;
    Y5: TcxGridDBColumn;
    OBSLabel2: TRzLabel;
    OBSLabel1: TRzLabel;
    qLoadLevels: TADOQuery;
    procedure SetPageControlAppendMode(AppendMode: Boolean);
    procedure GetBrokerInfo(BrokerID: Integer);
    procedure GetBrokerCompliance(BrokerID: Integer);
    procedure GetBrokerAgreements(BrokerID, ProductID, ContractDateID, LevelID: Integer);
    function LoadBrokerRates(ProductID : Integer; SpecificRates : Boolean) : Boolean;
    procedure FormShow(Sender: TObject);
    procedure EditBrokerInfoButtonClick(Sender: TObject);
    procedure SaveBrokerInfoButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure EditBrokerComplianceButtonClick(Sender: TObject);
    function CheckBrokerBaseInfo : Boolean;
    procedure SaveBrokerComplianceButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UseIBANClick(Sender: TObject);
    procedure IBANEditButtonClick(Sender: TObject);
    procedure BrokerPageControlChanging(Sender: TObject; NewIndex: Integer; var AllowChange: Boolean);
    function ValidateAddAgreement : String;
    procedure AddAgreementButtonClick(Sender: TObject);
    procedure CommissionReadOnly(ReadOnly : Boolean);
    procedure LoadCommission(CommLevel : Integer);
    procedure BrokerAgreementsDBTableView1DblClick(Sender: TObject);
    procedure BrokerAgreementsDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure EditAgreementButtonClick(Sender: TObject);
    procedure LoadOverrideAgreements(BrokerID : Integer);
    procedure AddOverrideAgreementButtonClick(Sender: TObject);
    procedure LoadOverrideDetails;
    procedure cxGrid1Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure EditOverrideAgreementButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure DeleteAgreementButtonClick(Sender: TObject);
    procedure CommLevelListClick(Sender: TObject);
    procedure LoadCommissionLevels;
  private
    { Private declarations }
  public
    NewBroker : Boolean;
    AddAgreement_PID : Integer;

  end;

var
  BrokerForm: TBrokerForm;
  BrokerID, LastAgreementID : Integer;


implementation

uses UMain, {UFinance,} UPicklist, tbj_utils, UDataModule;

{$R *.dfm}

//------------------------------------------------------------------------------

procedure TBrokerForm.SetPageControlAppendMode(AppendMode : Boolean);

var
i : Byte;

begin
  for i := 1 to 7 do
    BrokerPageControl.Pages[i].TabVisible := not AppendMode
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.GetBrokerInfo(BrokerID : Integer);

begin
  with qBrokerInfo do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_broker WHERE broker_id = ' + IntToStr(BrokerID));
    Open;
    if (Recordcount = 0) then Append;
  end;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.GetBrokerCompliance(BrokerID : Integer);

begin
  with qBrokerCompliance do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_broker_compliance WHERE broker_id = ' + IntToStr(BrokerID));
    Open;
    if (RecordCount = 0) then
    DM.DB_POLMAN.Execute('INSERT INTO tbl_broker_compliance (broker_id) VALUES(' + IntToStr(BrokerID) + ')');
    Refresh;
  end;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.GetBrokerAgreements(BrokerID, ProductID, ContractDateID, LevelID: Integer);

begin
  with qBrokerAgreements do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT tbl_product.product_name, tbl_broker_agreement.*');
    SQL.Add('FROM tbl_broker_agreement INNER JOIN');
    SQL.Add('tbl_product ON tbl_broker_agreement.product_id = tbl_product.product_id');
    SQL.Add('WHERE tbl_broker_agreement.broker_id = ' + IntToStr(BrokerID));
    SQL.Add('ORDER BY product_name');
    Open;
  end;
end;

//------------------------------------------------------------------------------

function TBrokerForm.LoadBrokerRates(ProductID : Integer; SpecificRates : Boolean) : Boolean;

begin
  with qLoadRates do
  begin
    Close;
    SQL.Clear;
    //tbj - always specific so change here 2007
    if SpecificRates then
      SQL.Add('SELECT * FROM tbl_')
    else
      SQL.Add('SELECT * FROM tbl_broker_base_commission WHERE ');
  end;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.FormShow(Sender: TObject);

var
TitleString : string;

begin
  TitleString := '';
  if NewBroker then
  begin
    BrokerID := 0;  //appends a new record via GetBrokerInfo
    TitleString := 'New Broker';
    SaveBrokerInfoButton.Enabled := True;
    SetPageControlAppendMode(True);
  end
  else
  begin
    BrokerID := MainForm.qResult.FieldValues['broker_id'];
    if not VarIsNull(MainForm.qResult.FieldValues['broker_company']) then
      TitleString :=(MainForm.qResult.FieldValues['broker_company']) + ' ';
    if not VarIsNull(MainForm.qResult.FieldValues['broker_firstname']) then
      TitleString := TitleString + (MainForm.qResult.FieldValues['broker_firstname']) + ' ';
    if not VarIsNull(MainForm.qResult.FieldValues['broker_lastname']) then
      TitleString :=  TitleString + (MainForm.qResult.FieldValues['broker_lastname']);
  end;
  BrokerForm.Caption := TitleString;
  BrokerPageControl.ActivePageIndex := 0;
  GetBrokerInfo(BrokerID);
  MainForm.qCountryNames.Open;
  MainForm.qCurrency.Open;
  MainForm.qCommissionLevel.Open;
  MainForm.qFrequency.Open;
  MainForm.qBrokerStatus.Open;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.EditBrokerInfoButtonClick(Sender: TObject);

begin
  DSBrokerInfo.AutoEdit := True;
  SaveBrokerInfoButton.Enabled := True;
end;

//------------------------------------------------------------------------------

function TBrokerForm.CheckBrokerBaseInfo : Boolean;

begin
  Result := True;
  If qBrokerInfo.FieldValues['comm_level'] = NULL then Result := False;
  If qBrokerInfo.FieldValues['broker_currency'] = NULL then Result := False;
  If qBrokerInfo.FieldValues['broker_payment_frequency'] = NULL then Result := False;
  If qBrokerInfo.FieldValues['broker_status'] = NULL then Result := False;
  If qBrokerInfo.FieldValues['broker_firstname'] = NULL then Result := False;
  If qBrokerInfo.FieldValues['broker_lastname'] = NULL then Result := False;
  if not Result then
    MessageDlg('One or more mandatory data fields are missing! Please ensure that'#13 +
               ' - Brokers first and last name are filled out'#13 +
               ' - Brokers level is set'#13 +
               ' - Brokers currency is set'#13 +
               ' - Brokers payment frequency is set'#13 +
               ' - Brokers status is set', mtERROR, [mbOK], 0);
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.SaveBrokerInfoButtonClick(Sender: TObject);

begin
  if (qBrokerInfo.State = dsEdit) or (qBrokerInfo.State = dsInsert) then
  begin
    if not CheckBrokerBaseInfo then Exit;
    qBrokerInfo.FieldValues['last_edit'] := Now;
    qBrokerInfo.Post;
    DSBrokerInfo.AutoEdit := False;
    if NewBroker then
    begin
      NewBroker := False;
      SetPageControlAppendMode(False);
      BrokerID :=  qBrokerInfo.FieldValues['broker_id'];
    end;
  end
  else MessageDlg('Nothing to Save!', mtINFORMATION, [mbOK], 0);
  SaveBrokerInfoButton.Enabled := False;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.EditBrokerComplianceButtonClick(Sender: TObject);
begin
  DSBrokerCompliance.AutoEdit := True;
  qBrokerCompliance.Edit;
  SaveBrokerComplianceButton.Enabled := True;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.SaveBrokerComplianceButtonClick(Sender: TObject);

begin
  if (qBrokerCompliance.State = dsEdit) or (qBrokerCompliance.State = dsInsert) then
  begin
    qBrokerCompliance.Post;
    DSBrokerCompliance.AutoEdit := False;
  end
  else MessageDlg('Nothing to Save!', mtINFORMATION, [mbOK], 0);
  SaveBrokerComplianceButton.Enabled := False;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.CloseButtonClick(Sender: TObject);

begin
  BrokerForm.Close;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  qBrokerInfo.Close;
  qBrokerCompliance.Close;
  qBrokerAgreements.Close;
  qValidate.Close;
  SaveBrokerInfoButton.Enabled := False;
  //showmessage('helo');
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.UseIBANClick(Sender: TObject);

begin
  if UseIBAN.Checked then
  begin
    BICLabel.Caption := 'BIC (SWIFT)';
    IBANLabel.Caption := 'IBAN Number';
    IBANEdit.Button.Enabled := True;
  end
  else
  begin
    BICLabel.Caption := 'BLZ';
    IBANLabel.Caption := 'Account Number';
    IBANEdit.Button.Enabled := False;
  end
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.IBANEditButtonClick(Sender: TObject);

var
TheMessage : String;

begin
  if IBANEdit.Text = '' then Exit;
  case ValidateIBAN(IBANEdit.Text) of
    0 : TheMessage := 'This IBAN number is valid!';
    1 : TheMessage := 'This IBAN number is not valid! Please check length of entered IBAN number';
    2 : TheMessage := 'This IBAN number is not valid! Illegal characters were detected';
    3 : TheMessage := 'This IBAN number is not valid! Please check length of entered IBAN number';
    4 : TheMessage := 'This IBAN number is not valid! It cannot be validated';
  end;
  MessageDlg(TheMessage, mtINFORMATION, [mbOK], 0);
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.BrokerPageControlChanging(Sender: TObject; NewIndex: Integer; var AllowChange: Boolean);

begin
  DSBrokerInfo.AutoEdit := False;
  qBrokerInfo.Cancel;
  SaveBrokerInfoButton.Enabled := False;
  DSBrokerCompliance.AutoEdit := False;
  qBrokerCompliance.Cancel;
  DSOverrideDetails.AutoEdit := False;
  qOverrideDetails.Cancel;
  SaveBrokerComplianceButton.Enabled := False;
  qOverrideDetails.Close;
  qOverrideAgreements.Close;
  DSBrokerCompliance.AutoEdit := False;
  case NewIndex of
    0: begin end; //broker information
    1: GetBrokerCompliance(BrokerID); //compliance
    2: begin GetBrokerAgreements(BrokerID, 0, 0, 0);{ LoadCommission;} DSBrokerCommission.AutoEdit := False; end;//product agreements
    3: begin
          qOverrideBroker.Open; qOverrideProduct.Open;
          LoadOverrideAgreements(BrokerID);
          OverrideBrokerSelect.ClearKeyValue;
          OverrideProductSelect.ClearKeyValue;
       end; //override agreements
    4: begin end; //bonus agreements
    5: begin end; //managed brokers
    6: begin end; //clients
    7: begin end; //reports and stats
  end; //of case
end;

//------------------------------------------------------------------------------

function TBrokerForm.ValidateAddAgreement : String;
//need to check if the current agreement is already in list before adding

var
ContractDate: String;

begin
  Result := '';
  //tbj - remember to suggest contract date from base commission scheme
  if InputQuery('Start Contract Date', 'Please enter contract start date [DD/MM/YYYY]', ContractDate) then
  begin
    try
      StrToDate(ContractDate);
    except
      MessageDlg('Invalid date!', mtERROR, [mbOK], 0);
      Exit;
    end;

{
    if InputQuery('End Contract Date', 'Please enter contract end date [DD/MM/YYYY]. Leave blank if open-ended contract', ContractDateEnd) then
    begin
      if (ContractDateEnd <> '') then
      try
        StrToDate(ContractDateEnd);
      except
        MessageDlg('Invalid date!', mtERROR, [mbOK], 0);
        Exit;
      end;
      if (ContractDateEnd <> '') then
      begin
        //if
      end;
    end;
}

    PickListForm.LoadPickList(17);
    PickListForm.ShowModal;

    with qValidate do
    begin
      //check for base commission scheme - this must exist
      Close;
      SQL.Add('SELECT DISTINCT contract_date FROM tbl_broker_base_commission WHERE product_id = ' + IntToStr(AddAgreement_PID) + ' AND comm_level = ' + IntToStr(qBrokerInfo.FieldValues['comm_level']) + ' ORDER BY contract_date DESC');
      Open;
      if (RecordCount = 0) then
      begin
        MessageDlg('Base commission system scheme is missing! Create the base commission scheme and retry', mtERROR, [mbOK], 0);
        Close;
        Exit;
      end;
      //then check if an agreement already exists (same product - same date for this broker)
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM tbl_broker_agreement WHERE broker_id = ' + IntToStr(BrokerID) + ' AND product_id = ' + IntToStr(AddAgreement_PID) + ' AND contract_date >= ''' + ReturnISODate(StrToDate(ContractDate)) + '''');
      Open;
      if (RecordCount > 0) then
      begin
        MessageDlg('Agreement for this product exists for this date (or a later date)! Nothing added', mtINFORMATION, [mbOK], 0);
        Close;
        Exit;
      end;
      Close;
      //add new contract
      try
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO tbl_broker_agreement (broker_id, product_id, contract_date, contract_level) VALUES('+IntToStr(BrokerID) + ',' + IntToStr(AddAgreement_PID) + ',' + AnsiQuotedStr(ReturnISODate(StrToDate(ContractDate)),'''')  + ',' + IntToStr(qBrokerInfo.FieldValues['comm_level']) + ')');
        ExecSQL;
        Result := ContractDate;
        SQL.Clear;
        SQL.Add('SELECT IDENT_CURRENT(''tbl_broker_agreement'') AS last_agreement_id');
        Open;
        LastAgreementID := FieldValues['last_agreement_id'];
        Close;
        SQL.Clear;
      except
        Result := '';
        SQL.Clear;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.AddAgreementButtonClick(Sender: TObject);

var
Contractdate : String;

begin
  Contractdate := ValidateAddAgreement;
  if (ContractDate <> '') then
    GetBrokerAgreements(BrokerID, 0, 0 ,0); //refresh
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.CommissionReadOnly(ReadOnly : Boolean);

begin
  Y1Comm.ReadOnly := ReadOnly;
  Y2Comm.ReadOnly := ReadOnly;
  Y3Comm.ReadOnly := ReadOnly;
  Y4Comm.ReadOnly := ReadOnly;
  Y5Comm.ReadOnly := ReadOnly;
  RenewalComm.ReadOnly := ReadOnly;
  OtherComm.ReadOnly := ReadOnly;
  AddCommLevelButton.Enabled := ReadOnly;
  DelCommLevelButton.Enabled := ReadOnly;
  AddVolLevelButton.Enabled := ReadOnly;
  AddVolLevelButton.Enabled := ReadOnly;
  OBSLabel1.Visible := ReadOnly;
  OBSLabel2.Visible := ReadOnly;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.LoadCommission(CommLevel : Integer);

var
RecBrokerID : Integer;
RecBroker : String;

begin
  //first check if active policies - if yes then read-only
  with qBrokerCommission do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_policy WHERE pol_agreement_id = ' + IntToStr(qBrokeragreements.FieldValues['agreement_id']) + ' AND pol_comm_level = ' + IntToStr(CommLevel));
    Open;
    CommissionReadOnly(RecordCount > 0);
  end;
  //load volume levels if any
  VolLevelList.Clear;
  with qBrokerCommission do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT volume_level FROM tbl_broker_commission WHERE ');
    SQL.Add('agreement_id = ' + IntToStr(qBrokerAgreements.FieldValues['agreement_id']));
    //SQL.Add('contract_date =  ' + AnsiQuotedStr(ReturnIsoDate(qBrokerAgreements.FieldValues['contract_date']), ''''));
    //SQL.Add('AND product_id = ' + IntToStr(qBrokerAgreements.FieldValues['product_id']));
    //SQL.Add('AND broker_id = ' + IntToStr(BrokerID));
    SQL.Add('AND volume_level > 0');  //is 0 when no volume level
    Open;
    if RecordCount > 0 then
    begin
      First;
      while not EOF do
      begin
         VolLevelList.Items.Add(IntToStr(FieldValues['comm_level']));
         Next;
      end;
    end;
  end;
  with qBrokerCommission do
  begin
    //first check if we display override broker name
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_override WHERE override_broker_id = ' + IntToStr(BrokerID)  + ' AND product_id = ' + IntToStr(qBrokerAgreements.FieldValues['product_id']) + ' AND contract_date >= ' + AnsiQuotedStr(ReturnISODate(Date), '''') );
    Open;
    OverrideLabel.Visible := (RecordCount > 0);
    if (RecordCount > 0) then
    begin // for display purpose - we show name of broker that receives the override
      RecBrokerID := FieldValues['broker_id'];
      Close;
      SQL.Clear;
      SQL.Add('SELECT broker_company + '' '' + broker_firstname + '' '' + broker_lastname AS broker_fullname FROM tbl_broker WHERE broker_id = ' + IntToStr(RecBrokerID));
      Open;
      RecBroker := AnsiReplaceStr(FieldValues['broker_fullname'], '&', '&&');
      OverrideLabel.Caption := 'Override to ' + RecBroker;
    end 
    else OverrideLabel.Caption := '';
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_broker_commission WHERE ');
    SQL.Add('agreement_id = ' + IntToStr(qBrokerAgreements.FieldValues['agreement_id']));
    SQL.Add('AND comm_level = ' + IntToStr(CommLevel));
    //SQL.Add('contract_date =  ' + AnsiQuotedStr(ReturnIsoDate(qBrokerAgreements.FieldValues['contract_date']), ''''));
    //SQL.Add('AND product_id = ' + IntToStr(qBrokerAgreements.FieldValues['product_id']));
    //SQL.Add('AND broker_id = ' + IntToStr(BrokerID));
    Open;
  end;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.BrokerAgreementsDBTableView1DblClick(Sender: TObject);

begin
  LoadCommissionLevels;
  if CommLevelList.Items.Count > 0 then
  begin
    CommLevelList.ItemIndex := 0;
    CommLevelList.OnClick(Self);
  end;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.BrokerAgreementsDBTableView1CellClick(  Sender: TcxCustomGridTableView;  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);

begin
  LoadCommissionLevels;
  if CommLevelList.Items.Count > 0 then
  begin
    CommLevelList.ItemIndex := 0;
    CommLevelList.OnClick(Self);
  end;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.EditAgreementButtonClick(Sender: TObject);

begin
  qBrokerCommission.Edit;
  DSBrokerCommission.AutoEdit := True;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.LoadOverrideAgreements(BrokerID : Integer);

begin
  with qOverrideAgreements do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT tbl_override.contract_date, tbl_override.comm_level, tbl_override.broker_id, tbl_override.override_broker_id, tbl_override.product_id,');
    SQL.Add('tbl_product.product_name, tbl_broker.broker_company + '' '' + tbl_broker.broker_firstname + '' '' + tbl_broker.broker_lastname AS broker_fullname');
    SQL.Add('FROM tbl_override INNER JOIN tbl_broker ON tbl_override.override_broker_id = tbl_broker.broker_id INNER JOIN');
    SQL.Add('tbl_product ON tbl_override.product_id = tbl_product.product_id');
    SQL.Add('WHERE tbl_override.broker_id = ' + IntToStr(BrokerID));
    Open;
  end;
end;

//------------------------------------------------------------------------------


procedure TBrokerForm.LoadOverrideDetails;

begin
  with qOverrideDetails do
  begin
    Close;
    SQL.Clear;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_broker_commission WHERE ');
    //SQL.Add('contract_date =  ' + AnsiQuotedStr(ReturnIsoDate(qOverrideAgreements.FieldValues['contract_date']), ''''));
    SQL.Add('comm_level = ' + IntToStr(qOverrideAgreements.FieldValues['comm_level']));
    SQL.Add('AND product_id = ' + IntToStr(qOverrideAgreements.FieldValues['product_id']));
    SQL.Add('AND broker_id = ' + IntToStr(qOverrideAgreements.FieldValues['override_broker_id']));
    Open;

//Memo1.Lines.Clear;
//Memo1.Lines := SQL;
//Memo1.selectall;
//Memo1.CopyToClipboard;
    //showmessage('helo');
  end;
end;

//------------------------------------------------------------------------------


procedure TBrokerForm.AddOverrideAgreementButtonClick(Sender: TObject);


var
ContractDateStart : String;

begin
  if (OverrideBrokerSelect.Text = '') or (OverrideProductSelect.Text = '') then
  begin
    MessageDlg('You must select a broker and a product before adding an override agreement!', mtWARNING, [mbOK], 0);
    Exit;
  end;

  // check if adding override on himself
  if (BrokerID = qOverrideBroker.FieldValues['broker_id']) then
  begin
    MessageDlg('You cannot add an override agreement on the same broker!', mtWARNING, [mbOK], 0);
    Exit;
  end;

  //tbj - remember to suggest contract date from base commission scheme
  if InputQuery('Start Contract Date', 'Please enter contract start date [DD/MM/YYYY]', ContractDateStart) then
  begin
    try
      StrToDate(ContractDateStart);
    except
      MessageDlg('Invalid date!', mtERROR, [mbOK], 0);
      Exit;
    end;
    ContractDateStart := AnsiQuotedStr(ReturnISODate(StrToDate(ContractDateStart)), '''');
    with qAddOverrideAgreement do
    begin
      //first check if agreement is already in
      SQL.Clear;
      SQL.Add('SELECT * FROM tbl_override WHERE comm_level = ' + IntToStr(qOverrideBroker.FieldValues['comm_level']));
      SQL.Add('AND broker_id = ' + IntToStr(BrokerID) + ' AND override_broker_id = ' + IntToStr(qOverrideBroker.FieldValues['broker_id']));
      SQL.Add('AND product_id = ' + IntToStr(qOverrideProduct.FieldValues['product_id']));
      Open;
      if (RecordCount <> 0) then
      begin
        Close;
        MessageDlg('Override agreement already exists!', mtWARNING, [mbOK], 0);
        Exit;
      end;
      //then check if the reverse agreement is already in
      CLose;
      SQL.Clear;
      SQL.Add('SELECT * FROM tbl_override WHERE comm_level = ' + IntToStr(qOverrideBroker.FieldValues['comm_level']));
      SQL.Add('AND broker_id = ' + IntToStr(qOverrideBroker.FieldValues['broker_id']) + ' AND override_broker_id = ' + IntToStr(BrokerID));
      SQL.Add('AND product_id = ' + IntToStr(qOverrideProduct.FieldValues['product_id']));
      Open;

      if (RecordCount <> 0) then
      begin
        Close;
        MessageDlg('A reverse override agreement already exists!', mtWARNING, [mbOK], 0);
        Exit;
      end;
      //then check if base comm scheme exists
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM tbl_broker_base_commission WHERE product_id = ' + IntToStr(qOverrideProduct.FieldValues['product_id']));
      SQL.Add('AND comm_level = ' + IntToStr(qOverrideBroker.FieldValues['comm_level']));
      Open;
      if (RecordCount = 0) then
      begin
        Close;
        MessageDlg('Base Commission Scheme for this product is missing or incomplete!', mtWARNING, [mbOK], 0);
        Exit;
      end;
      //then check that override broker (the person "paying") has contracts on the selected product
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM tbl_broker_commission WHERE');
      SQL.Add('broker_id = ' + IntToStr(qOverrideBroker.FieldValues['broker_id']));
      SQL.Add('AND product_id = ' + IntToStr(qOverrideProduct.FieldValues['product_id']));
      SQL.Add('AND comm_level = ' + IntToStr(qOverrideBroker.FieldValues['comm_level']));
      SQL.Add('AND contract_date <= ' + ContractDateStart);
      Open;
      if (RecordCount = 0) then
      begin
        Close;
        MessageDlg('The broker you are trying to place an override on does not have a recent product agreement'#13 +
                   'for ' + qOverrideProduct.FieldValues['product_name'], mtWARNING, [mbOK], 0);
        Exit;
      end;
      //all ok so add the agreement
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO tbl_override (contract_date, comm_level, override_broker_id, broker_id, product_id) VALUES(');
      SQL.Add(ContractDateStart + ',' + IntToStr(qOverrideBroker.FieldValues['comm_level']) + ',' + IntToStr(qOverrideBroker.FieldValues['broker_id']) + ',' + IntToStr(BrokerID) + ',' + IntToStr(qOverrideProduct.FieldValues['product_id']) + ')');
      ExecSQL;
      qOverrideAgreements.Refresh;
    end; //of inputquery begin
  end;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.cxGrid1Click(Sender: TObject);

begin
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);

begin
  if (qOverrideAgreements.RecordCount > 0) then
    LoadOverrideDetails;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.cxGrid1DBTableView1DblClick(Sender: TObject);

begin
  if (qOverrideAgreements.RecordCount > 0) then
    LoadOverrideDetails;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.EditOverrideAgreementButtonClick(Sender: TObject);

begin
  qOverrideDetails.Edit;
  DSOverrideDetails.AutoEdit := True;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.SaveButtonClick(Sender: TObject);

begin
  qBrokerCommission.Edit;
  qBrokerCommission.Post;
  if DSBrokerCommission.AutoEdit = True then
    DSBrokerCommission.AutoEdit := False;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.DeleteAgreementButtonClick(Sender: TObject);

var
AID : Integer;
FirstID : String;

begin
  if not qBrokerCommission.Active then Exit;
  AID := qBrokerAgreements.FieldValues['agreement_id'];
  //if no commission details exists (tbl_broker_commission) it is safe to delete
  if (qBrokerCommission.Recordcount = 0) then
  with qDelete do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM tbl_broker_agreement WHERE agreement_id = ' + IntToStr(AID));
    Open;
    Close;
    //refresh info
    GetBrokerAgreements(BrokerID, 0, 0, 0);
    {LoadCommission;}
    Exit;
  end;

  //we have  commission details - only allow delete if no associated policies exists
  with qDelete do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_policy WHERE pol_agreement_id = ' + IntToStr(AID));
    Open;
    if (RecordCount > 0) then
    begin
      FirstID := IntToStr(FieldValues['pol_id']);
      MessageDlg('You cannot delete this agreement. Associated policies found (first found is Policy ID ' +FirstID+')', mtERROR, [mbOK], 0);
      Close;
      Exit;
    end;
  end;
  //all ok - so delete the agreement and commission details
  with qDelete do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM tbl_broker_commission WHERE agreement_id = ' + IntToStr(AID));
    Open;
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM tbl_broker_agreement WHERE agreement_id = ' + IntToStr(AID));
    Open;
    Close;
  end;
  //refresh info
  GetBrokerAgreements(BrokerID, 0, 0, 0);
  {LoadCommission; }
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.LoadCommissionLevels;

begin
  CommLevelList.Clear;
  with qLoadLevels do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT comm_level FROM tbl_broker_commission WHERE ');
    SQL.Add('agreement_id = ' + IntToStr(qBrokerAgreements.FieldValues['agreement_id']));
    Open;
    if (RecordCount > 0) then
    begin
      First;
      while not EOF do
      begin
        CommLevelList.Items.Add(IntToStr(FieldValues['comm_level']));
        Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TBrokerForm.CommLevelListClick(Sender: TObject);

begin
  if (CommLevelList.Items.Count > 0) and (CommLevelList.SelectedItem <> '') then
    LoadCommission(StrToInt(CommLevelList.SelectedItem));
end;

//------------------------------------------------------------------------------

end.
