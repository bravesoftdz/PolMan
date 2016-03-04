unit UPolicy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzDBEdit, StdCtrls, RzCmboBx, RzDBCmbo,
  DBCtrls, RzLabel, Mask, RzEdit, RzDBBnEd, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, {ADODS,} DateUtils,
  RzButton, RzRadChk, RzDBChk, cxDataStorage, ADODB, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter {, frxClass, frxDBSet, RzRadChk, RzDBChk};

type
  TPolicyForm = class(TForm)
    MainPolicyPanel: TRzPanel;
    RzLabel22: TRzLabel;
    RzLabel23: TRzLabel;
    RzLabel24: TRzLabel;
    RzLabel25: TRzLabel;
    RzLabel26: TRzLabel;
    RzLabel27: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBEdit1: TRzDBEdit;
    ProductSelect: TRzDBLookupComboBox;
    RzDBNumericEdit2: TRzDBNumericEdit;
    RzDBNumericEdit3: TRzDBNumericEdit;
    RzDBLookupComboBox5: TRzDBLookupComboBox;
    PolicyStartDate: TRzDBDateTimeEdit;
    PolicyEndDate: TRzDBDateTimeEdit;
    RzDBDateTimeEdit4: TRzDBDateTimeEdit;
    RzDBDateTimeEdit5: TRzDBDateTimeEdit;
    PolicyTerm: TRzDBNumericEdit;
    RzDBLookupComboBox7: TRzDBLookupComboBox;
    RzLabel3: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    BrokerSelect: TRzDBLookupComboBox;
    RzDBLookupComboBox8: TRzDBLookupComboBox;
    Client1Edit: TRzDBButtonEdit;
    InsuredLife1Edit: TRzDBButtonEdit;
    InsuredLife2Edit: TRzDBButtonEdit;
    InsuredLife3Edit: TRzDBButtonEdit;
    InsuredLife4Edit: TRzDBButtonEdit;
    InsuredLife5Edit: TRzDBButtonEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    RzLabel28: TRzLabel;
    qPolicyInfo: TADOQuery;
    DSPolicyInfo: TDataSource;
    RzDBNumericEdit6: TRzDBNumericEdit;
    RzDBDateTimeEdit3: TRzDBDateTimeEdit;
    RzLabel29: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    qBroker: TADOQuery;
    DSBroker: TDataSource;
    RzDBDateTimeEdit6: TRzDBDateTimeEdit;
    qClient1Info: TADOQuery;
    DSClient1: TDataSource;
    qLife1: TADOQuery;
    DSLife1: TDataSource;
    DSLife2: TDataSource;
    DSLife3: TDataSource;
    DSLife4: TDataSource;
    DSLife5: TDataSource;
    qLife2: TADOQuery;
    qLife3: TADOQuery;
    qLife4: TADOQuery;
    qLife5: TADOQuery;
    RzDBLookupComboBox6: TRzDBLookupComboBox;
    qDynamicRate: TADOQuery;
    DSDynamicRate: TDataSource;
    DeletePolicyButton: TRzButton;
    EditPolicyInfoButton: TRzButton;
    SavePolicyInfoButton: TRzButton;
    ClosePolicyInfoButton: TRzButton;
    TestPaymentsButton: TRzButton;
    RzLabel30: TRzLabel;
    RzDBMemo1: TRzDBMemo;
    RzLabel31: TRzLabel;
    Client2Edit: TRzDBButtonEdit;
    qClient2Info: TADOQuery;
    DSClient2: TDataSource;
    PrintSummarySheetButton: TRzButton;
    qPrintSummary: TADOQuery;
    qBrokerLevel: TADOQuery;
    DSProductTypes: TDataSource;
    RzDBEdit3: TRzDBEdit;
    qProductTypes: TADOQuery;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    qProductFields: TADOQuery;
    qAgreementID: TADOQuery;
    RzDBCheckBox1: TRzDBCheckBox;
    RzLabel32: TRzLabel;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    qFund: TADOQuery;
    DSFund: TDataSource;
    function SetPolicyLevel(BrokerID : Integer) : Boolean;
    function SetProductFields(ProductID : Integer) : Boolean;
    procedure GetPolicyInfo;
    procedure GetClientInfo;
    procedure LoadDynamicRates;
    procedure FormShow(Sender: TObject);
    procedure EditPolicyInfoButtonClick(Sender: TObject);
    function ValidatePolicyData : Boolean;
    procedure SavePolicyInfoButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DeletePolicyButtonClick(Sender: TObject);
    procedure AddCLientID(WhatClient : Byte);
    procedure RemoveClientID(WhatClient : Byte);
    procedure EditClientID(WhatClient : Byte);
    procedure Client1EditButtonClick(Sender: TObject);
    procedure InsuredLife1EditButtonClick(Sender: TObject);
    procedure InsuredLife2EditButtonClick(Sender: TObject);
    procedure InsuredLife3EditButtonClick(Sender: TObject);
    procedure InsuredLife4EditButtonClick(Sender: TObject);
    procedure InsuredLife5EditButtonClick(Sender: TObject);
    procedure PolicyStartDateChange(Sender: TObject);
    procedure ProductSelectCloseUp(Sender: TObject);
    procedure ProductSelectKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Client2EditButtonClick(Sender: TObject);
    procedure PrintSummarySheetButtonClick(Sender: TObject);
    procedure BrokerSelectCloseUp(Sender: TObject);
    function SetAgreementID(BrokerID, ProductID : Integer) : Boolean;
    procedure LoadFunds;
  private
    { Private declarations }
  public
    NewPolicy : Boolean;
    ClientAction : Byte;
    NewClientID : Integer;
    PolicyID : Integer;
  end;

var
  PolicyForm: TPolicyForm;

implementation

uses UMain, UClientOption, UClient, UDataModule, tbj_utils;

{$R *.dfm}

//------------------------------------------------------------------------------

function TPolicyForm.SetPolicyLevel(BrokerID : Integer) : Boolean;

begin
  Result := False;
  if (qPolicyInfo.State = dsEdit) or (qPolicyInfo.State = dsInsert) then
  begin
    Result := True;
    with qBrokerLevel do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT comm_level FROM tbl_broker WHERE broker_id = ' + IntToStr(BrokerID));
      Open;
      if (RecordCount = 0) or (FieldValues['comm_level'] = NULL) then
      begin
        Result := False;
        Exit;
      end
      else
        qPolicyInfo.FieldValues['pol_comm_level'] :=  FieldValues['comm_level'];
    end;
  end;
end;

//------------------------------------------------------------------------------

function TPolicyForm.SetProductFields(ProductID : Integer) : Boolean;

begin
  Result := False;
  if (qPolicyInfo.State = dsEdit) or (qPolicyInfo.State = dsInsert) then
  begin
    Result := True;
    with qProductFields do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT product_type, product_currency FROM tbl_product WHERE product_id = ' + IntToStr(ProductID));
      Open;
      if (RecordCount = 0) or (FieldValues['product_type'] = NULL) or (FieldValues['product_currency'] = NULL) then
      begin
        Result := False;
        Exit;
      end
      else
      begin
        qPolicyInfo.FieldValues['pol_type_id'] :=  FieldValues['product_type'];
        qPolicyInfo.FieldValues['pol_currency'] :=  FieldValues['product_currency'];
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------


procedure TPolicyForm.GetPolicyInfo;

begin
  with qPolicyInfo do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT tbl_policy.*, tbl_product_type.product_type_desc, tbl_currency.currency_tag, tbl_commission_level.level_letter');
    SQL.Add('FROM tbl_policy LEFT OUTER JOIN');
    SQL.Add('tbl_product_type ON tbl_policy.pol_type_id = tbl_product_type.product_type_id LEFT OUTER JOIN');
    SQL.Add('tbl_currency ON tbl_policy.pol_currency = tbl_currency.currency_id LEFT OUTER JOIN');
    SQL.Add('tbl_commission_level ON tbl_policy.pol_comm_level = tbl_commission_level.level_id');
    SQL.Add('WHERE pol_id = ' + IntToStr(PolicyID));
    Open;
    if (Recordcount = 0) then
    begin
      Append;
      Post;
      Edit;
      PolicyID := FieldValues['pol_id'];
      SavePolicyInfoButton.Enabled := True;
      GetPolicyInfo;
      EditPolicyInfoButtonClick(Self);
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.GetClientInfo;

begin
  qClient1Info.Close;
  qClient2Info.Close;
  qLife1.Close;
  qLife2.Close;
  qLife3.Close;
  qLife4.Close;
  qLife5.Close;
  qPolicyInfo.Refresh;
  if qPolicyInfo.FieldValues['pol_client1_id'] <> NULL then
  begin
    with qClient1Info do
    begin
      SQL.Clear;
      SQL.Add('set CONCAT_NULL_YIELDS_NULL OFF ');
      SQL.Add('SELECT client_id, ltrim(client_company + '' '' + client_firstname + '' '' + client_lastname) as client1_full_name');
      SQL.Add('FROM tbl_client');
      SQL.Add('WHERE client_id = ' + IntToStr(qPolicyInfo.FieldValues['pol_client1_id']));
      Open;
    end;
  end;

  if qPolicyInfo.FieldValues['pol_client2_id'] <> NULL then
  begin
    with qClient2Info do
    begin
      SQL.Clear;
      SQL.Add('set CONCAT_NULL_YIELDS_NULL OFF ');
      SQL.Add('SELECT client_id, ltrim(client_company + '' '' + client_firstname + '' '' + client_lastname) as client2_full_name');
      SQL.Add('FROM tbl_client');
      SQL.Add('WHERE client_id = ' + IntToStr(qPolicyInfo.FieldValues['pol_client2_id']));
      Open;
    end;
  end;

  if qPolicyInfo.FieldValues['pol_life1_insured'] <> NULL then
  begin
    with qLife1 do
    begin
      SQL.Clear;
      SQL.Add('set CONCAT_NULL_YIELDS_NULL OFF ');
      SQL.Add('SELECT client_id, ltrim(client_company + '' '' + client_firstname + '' '' + client_lastname) as client_full_name');
      SQL.Add('FROM tbl_client');
      SQL.Add('WHERE client_id = ' + IntToStr(qPolicyInfo.FieldValues['pol_life1_insured']));
      Open;
    end;
  end;
  if qPolicyInfo.FieldValues['pol_life2_insured'] <> NULL then
  begin
    with qLife2 do
    begin
      SQL.Clear;
      SQL.Add('set CONCAT_NULL_YIELDS_NULL OFF ');
      SQL.Add('SELECT client_id, ltrim(client_company + '' '' + client_firstname + '' '' + client_lastname) as client_full_name');
      SQL.Add('FROM tbl_client');
      SQL.Add('WHERE client_id = ' + IntToStr(qPolicyInfo.FieldValues['pol_life2_insured']));
      Open;
    end;
  end;
  if qPolicyInfo.FieldValues['pol_life3_insured'] <> NULL then
  begin
    with qLife3 do
    begin
      SQL.Clear;
      SQL.Add('set CONCAT_NULL_YIELDS_NULL OFF ');
      SQL.Add('SELECT client_id, ltrim(client_company + '' '' + client_firstname + '' '' + client_lastname) as client_full_name');
      SQL.Add('FROM tbl_client');
      SQL.Add('WHERE client_id = ' + IntToStr(qPolicyInfo.FieldValues['pol_life3_insured']));
      Open;
    end;
  end;
  if qPolicyInfo.FieldValues['pol_life4_insured'] <> NULL then
  begin
    with qLife4 do
    begin
      SQL.Clear;
      SQL.Add('set CONCAT_NULL_YIELDS_NULL OFF ');
      SQL.Add('SELECT client_id, ltrim(client_company + '' '' + client_firstname + '' '' + client_lastname) as client_full_name');
      SQL.Add('FROM tbl_client');
      SQL.Add('WHERE client_id = ' + IntToStr(qPolicyInfo.FieldValues['pol_life4_insured']));
      Open;
    end;
  end;
  if qPolicyInfo.FieldValues['pol_life5_insured'] <> NULL then
  begin
    with qLife5 do
    begin
      SQL.Clear;
      SQL.Add('set CONCAT_NULL_YIELDS_NULL OFF ');
      SQL.Add('SELECT client_id, ltrim(client_company + '' '' + client_firstname + '' '' + client_lastname) as client_full_name');
      SQL.Add('FROM tbl_client');
      SQL.Add('WHERE client_id = ' + IntToStr(qPolicyInfo.FieldValues['pol_life5_insured']));
      Open;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.LoadDynamicRates;

begin
  with qDynamicRate do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_dynrate WHERE product_id = ' + IntToStr(MainForm.qProductName.FieldValues['product_id']));
    Open;
    if (RecordCount = 0) then
      Close;
  end;
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.FormShow(Sender: TObject);

begin
  if NewPolicy then
    PolicyID := 0  // triggers a new policy in GetPolicyInfo
  else
    PolicyID := MainForm.qResult.FieldValues['pol_id'];
  qBroker.Open;
  MainForm.qBusinessArea.Open;
  MainForm.qStatus.Open;
  MainForm.qCurrency.Open;
  MainForm.qProductName.Open;
  MainForm.qProductType.Open;
  MainForm.qFrequency.Open;
  //tProductTypes.Open;
  GetPolicyInfo;
  GetClientInfo;
  ProductSelectCloseUp(Self);
  //if not NewPolicy then LoadFunds;
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.EditPolicyInfoButtonClick(Sender: TObject);

begin
  DSPolicyInfo.AutoEdit := True;
  SavePolicyInfoButton.Enabled := True;
end;

//------------------------------------------------------------------------------

function TPolicyForm.ValidatePolicyData : Boolean;

begin
  Result := True;
  if not SetAgreementID(qPolicyInfo.FieldValues['pol_broker_id'], qPolicyInfo.FieldValues['pol_product_id']) then
  begin
    Result := False;
    MessageDlg('Missing contract for broker!', mtERROR, [mbOK], 0);
    Exit;
  end;
  if not Result then
    MessageDlg('One or more errors was detected - the policy is not valid and will not be calculated!', mtWARNING, [mbOK], 0);
    // a lot more stuff here to check - gw/cp/bb to decide - tbj    
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.SavePolicyInfoButtonClick(Sender: TObject);

begin
  if (qPolicyInfo.State = dsEdit) or (qPolicyInfo.State = dsInsert) then
  begin
    qPolicyInfo.FieldValues['last_edit'] := Now;
    qPolicyInfo.FieldValues['valid_app'] := ValidatePolicyData;
    qPolicyInfo.Post;
    DSPolicyInfo.AutoEdit := False;
  end
  else MessageDlg('Nothing to Save!', mtINFORMATION, [mbOK], 0);
  SavePolicyInfoButton.Enabled := False;
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.CloseButtonClick(Sender: TObject);

begin
  qBroker.Close;
  qPolicyInfo.Close;
  PolicyForm.Close;
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  NewPolicy := False;
  qDynamicRate.Close;
  qFund.CLose;
  //tProductTypes.Close;
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.DeletePolicyButtonClick(Sender: TObject);

begin
  // check payments here - if count(payment_done) > 0 then refuse unless clawback amount matches payments
  if (MessageDlg('This will delete the current selected policy! Continue?', mtWARNING, [mbYes, mbNo], 0) = mrNo) then Exit;
  qPolicyInfo.Delete;
  MainForm.qResult.Refresh;
  //MainForm.HeaderLabel.Caption := 'Clients [Current Selection = ' +IntToStr(MainForm.qResult.RecordCount)+ ']';
  PolicyForm.Close;
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.AddClientID(WhatClient : Byte);

begin
  case WhatClient of
    0: dm.DB_POLMAN.Execute('UPDATE tbl_policy SET pol_client1_id = ' + IntToStr(NewClientID) + ' WHERE pol_id = ' + IntToStr(qPolicyInfo.Fieldvalues['pol_id']));
    6: dm.DB_POLMAN.Execute('UPDATE tbl_policy SET pol_client2_id = ' + IntToStr(NewClientID) + ' WHERE pol_id = ' + IntToStr(qPolicyInfo.Fieldvalues['pol_id']));
    1: dm.DB_POLMAN.Execute('UPDATE tbl_policy SET pol_life1_insured = ' + IntToStr(NewClientID) + ' WHERE pol_id = ' + IntToStr(qPolicyInfo.Fieldvalues['pol_id']));
    2: dm.DB_POLMAN.Execute('UPDATE tbl_policy SET pol_life2_insured = ' + IntToStr(NewClientID) + ' WHERE pol_id = ' + IntToStr(qPolicyInfo.Fieldvalues['pol_id']));
    3: dm.DB_POLMAN.Execute('UPDATE tbl_policy SET pol_life3_insured = ' + IntToStr(NewClientID) + ' WHERE pol_id = ' + IntToStr(qPolicyInfo.Fieldvalues['pol_id']));
    4: dm.DB_POLMAN.Execute('UPDATE tbl_policy SET pol_life4_insured = ' + IntToStr(NewClientID) + ' WHERE pol_id = ' + IntToStr(qPolicyInfo.Fieldvalues['pol_id']));
    5: dm.DB_POLMAN.Execute('UPDATE tbl_policy SET pol_life5_insured = ' + IntToStr(NewClientID) + ' WHERE pol_id = ' + IntToStr(qPolicyInfo.Fieldvalues['pol_id']));
  end; //of case
  ClientForm.EditClientFromPolicy := False;
  GetClientInfo;
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.RemoveClientID(WhatClient : Byte);

begin
  Client1Edit.Refresh;
  Client2Edit.Refresh;
  case WhatClient of
    0: begin DM.DB_POLMAN.Execute('UPDATE tbl_policy SET pol_client1_id = NULL WHERE pol_id = ' + IntToStr(qPolicyInfo.Fieldvalues['pol_id'])); qCLient1Info.Refresh; end;
    6: begin DM.DB_POLMAN.Execute('UPDATE tbl_policy SET pol_client2_id = NULL WHERE pol_id = ' + IntToStr(qPolicyInfo.Fieldvalues['pol_id'])); qCLient2Info.Refresh; end;
    1: begin DM.DB_POLMAN.Execute('UPDATE tbl_policy SET pol_life1_insured = NULL WHERE pol_id = ' + IntToStr(qPolicyInfo.Fieldvalues['pol_id'])); qLife1.Refresh; end;
    2: begin DM.DB_POLMAN.Execute('UPDATE tbl_policy SET pol_life2_insured = NULL WHERE pol_id = ' + IntToStr(qPolicyInfo.Fieldvalues['pol_id'])); qLife2.Refresh; end;
    3: begin DM.DB_POLMAN.Execute('UPDATE tbl_policy SET pol_life3_insured = NULL WHERE pol_id = ' + IntToStr(qPolicyInfo.Fieldvalues['pol_id'])); qLife3.Refresh; end;
    4: begin DM.DB_POLMAN.Execute('UPDATE tbl_policy SET pol_life4_insured = NULL WHERE pol_id = ' + IntToStr(qPolicyInfo.Fieldvalues['pol_id'])); qLife4.Refresh; end;
    5: begin DM.DB_POLMAN.Execute('UPDATE tbl_policy SET pol_life5_insured = NULL WHERE pol_id = ' + IntToStr(qPolicyInfo.Fieldvalues['pol_id'])); qLife5.Refresh; end;
  end; //of case
  ClientForm.EditClientFromPolicy := False;
  GetClientInfo;
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.EditClientID(WhatClient : Byte);

begin
  case WhatClient of
    0: ClientForm.ClientID := qCLient1Info.FieldValues['client_id'];
    1: ClientForm.ClientID := qLife1.FieldValues['client_id'];
    2: ClientForm.ClientID := qLife2.FieldValues['client_id'];
    3: ClientForm.ClientID := qLife3.FieldValues['client_id'];
    4: ClientForm.ClientID := qLife4.FieldValues['client_id'];
    5: ClientForm.ClientID := qLife5.FieldValues['client_id'];
    6: ClientForm.ClientID := qCLient2Info.FieldValues['client_id'];
  end;
  ClientForm.EditClientFromPolicy := True;
  ClientForm.ShowModal;
end;

//------------------------------------------------------------------------------


procedure TPolicyForm.Client1EditButtonClick(Sender: TObject);

begin
  ClientAction := 0; // modified on form clientoptions
  ClientOptionForm.CallerID := 0;
  ClientOptionForm.ShowModal;
  case ClientAction of
    0 : Exit;  //user cancelled
    1, 2 : AddClientID(0);
    3 : RemoveClientID(0);
    4 : EditClientID(0);
  end; // of case
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.InsuredLife1EditButtonClick(Sender: TObject);

begin
  ClientAction := 0;
  ClientOptionForm.CallerID := 1;
  ClientOptionForm.ShowModal;
  case ClientAction of
    0 : Exit;  //user cancelled
    1, 2 : AddClientID(1);
    3 : RemoveClientID(1);
    4 : EditClientID(1);
  end; // of case
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.InsuredLife2EditButtonClick(Sender: TObject);

begin
  ClientAction := 0;
  ClientOptionForm.CallerID := 2;
  ClientOptionForm.ShowModal;
  case ClientAction of
    0 : Exit;  //user cancelled
    1, 2 : AddClientID(2);
    3 : RemoveClientID(2);
    4 : EditClientID(2);
  end; // of case
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.InsuredLife3EditButtonClick(Sender: TObject);

begin
  ClientAction := 0;
  ClientOptionForm.CallerID := 3;
  ClientOptionForm.ShowModal;
  case ClientAction of
    0 : Exit;  //user cancelled
    1, 2 : AddClientID(3);
    3 : RemoveClientID(3);
    4 : EditClientID(3);
  end; // of case
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.InsuredLife4EditButtonClick(Sender: TObject);

begin
  ClientAction := 0;
  ClientOptionForm.CallerID := 4;
  ClientOptionForm.ShowModal;
  case ClientAction of
    0 : Exit;  //user cancelled
    1, 2 : AddClientID(4);
    3 : RemoveClientID(4);
    4 : EditClientID(4);
  end; // of case
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.InsuredLife5EditButtonClick(Sender: TObject);

begin
  ClientAction := 0;
  ClientOptionForm.CallerID := 5;
  ClientOptionForm.ShowModal;
  case ClientAction of
    0 : Exit;  //user cancelled
    1, 2 : AddClientID(5);
    3 : RemoveClientID(5);
    4 : EditClientID(5);
  end; // of case
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.Client2EditButtonClick(Sender: TObject);

begin
  ClientAction := 0;
  ClientOptionForm.CallerID := 6;
  ClientOptionForm.ShowModal;
  case ClientAction of
    0 : Exit;  //user cancelled
    1, 2 : AddClientID(6);
    3 : RemoveClientID(6);
    4 : EditClientID(6);
  end; // of case
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.PolicyStartDateChange(Sender: TObject);

begin
  if (PolicyTerm.Value <> NULL) and (PolicyStartDate.Date <> NULL) then
    PolicyEndDate.Date := IncYear(PolicyStartDate.Date, Trunc(PolicyTerm.Value));
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.ProductSelectCloseUp(Sender: TObject);

begin
  if qPolicyInfo.FieldValues['pol_product_id'] <> NULL then
    SetProductFields(qPolicyInfo.FieldValues['pol_product_id']);
  if not VarIsNull(qPolicyInfo.FieldValues['pol_type_id']) then
  begin
    if qPolicyInfo.FieldValues['pol_type_id'] = 2 then
      LoadDynamicRates
  end
  else if (MainForm.qProductName.FieldValues['product_type'] = 2) then
    LoadDynamicRates;
end;

//------------------------------------------------------------------------------


procedure TPolicyForm.ProductSelectKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

begin
  ProductSelectCloseUp(Self);
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.PrintSummarySheetButtonClick(Sender: TObject);
begin
  with qPrintSummary do
  begin
    Close;
    SQL.Clear;
    SQL.Add('set CONCAT_NULL_YIELDS_NULL OFF ');
    SQL.Add('SELECT tbl_policy.*, LTRIM(tbl_broker.broker_company + '' '' + tbl_broker.broker_lastname + '' '' + tbl_broker.broker_firstname) AS broker_fullname,');
    SQL.Add('tbl_product_type.product_type_desc, tbl_currency.currency_tag, tbl_status_policy.policy_status_desc,');
    SQL.Add('LTRIM(tbl_client.client_firstname + '' '' + tbl_client.client_lastname + '' '' + tbl_client.client_company) AS client_fullname, tbl_product.product_name,');
    SQL.Add('tbl_product_provider.product_provider_company');
    SQL.Add('FROM tbl_policy LEFT OUTER JOIN');
    SQL.Add('tbl_broker ON tbl_policy.pol_broker_id = tbl_broker.broker_id LEFT OUTER JOIN');
    SQL.Add('tbl_product_type ON tbl_policy.pol_type_id = tbl_product_type.product_type_id LEFT OUTER JOIN');
    SQL.Add('tbl_product ON tbl_policy.pol_product_id = tbl_product.product_id LEFT OUTER JOIN');
    SQL.Add('tbl_product_provider ON tbl_product.product_provider_id = tbl_product_provider.product_provider_id LEFT OUTER JOIN');
    SQL.Add('tbl_client ON tbl_policy.pol_client1_id = tbl_client.client_id LEFT OUTER JOIN');
    SQL.Add('tbl_currency ON tbl_policy.pol_currency = tbl_currency.currency_id LEFT OUTER JOIN');
    SQL.Add('tbl_status_policy ON tbl_policy.pol_status_id = tbl_status_policy.policy_status_id');
    SQL.Add('WHERE tbl_policy.pol_id = ' + IntToStr(qPolicyInfo.FieldValues['pol_id']));
    Open;
  //remember to run empty queries on data that requires min. 1 record to be active
  //e.g. client/insured life
  end;
  // tbj 2012 ReportPolicyInfo.ShowReport(True);
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.BrokerSelectCloseUp(Sender: TObject);

begin
  if qPolicyInfo.FieldValues['pol_broker_id'] <> NULL then
    SetPolicyLevel(qPolicyInfo.FieldValues['pol_broker_id']);
    //must set level - higest contract level for the broker that are valid
    


end;

//------------------------------------------------------------------------------

function TPolicyForm.SetAgreementID(BrokerID, ProductID : Integer) : Boolean;

begin
  Result := True;
  try
    with qAgreementID do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT DISTINCT contract_date, agreement_id FROM tbl_broker_commission WHERE broker_id = ' + IntToStr(BrokerID) + ' AND product_id = ' + IntToStr(ProductID) + ' AND comm_level = ' + IntToStr(qPolicyInfo.FieldValues['pol_comm_level']));
      SQL.Add('ORDER BY contract_date ASC');
      Open;
      if (RecordCount  = 1) then //most cases will be
      begin
        qPolicyInfo.FieldValues['pol_agreement_id'] := FieldValues['agreement_id'];
        Close;
        Exit;
      end;
      if (RecordCount  = 0) then //no contract on product
      begin
        Result := False;
        Close;
        Exit;
      end;
    end;
  except
    Result := False;
  end;
end;

//------------------------------------------------------------------------------

procedure TPolicyForm.LoadFunds;

begin
  if VarIsNull(qPolicyInfo.FieldValues['pol_product_id']) then Exit;
  with qFund do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_funds WHERE product_id = ' + IntToStr(qPolicyInfo.FieldValues['pol_product_id']));
    Open;
  end;
end;

//------------------------------------------------------------------------------

end.
