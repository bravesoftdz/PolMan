unit UProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzDBEdit, RzLabel, DBCtrls, RzDBCmbo,
  ExtCtrls, RzPanel, RzCmboBx, RzRadGrp, RzDBRGrp, RzLstBox, RzChkLst,
  RzButton, RzRadChk, RzDBChk, DB, {ADODS,} ADODB;

type
  TProductForm = class(TForm)
    DSProduct: TDataSource;
    qProduct: TADOQuery;
    qDynamicRates: TADOQuery;
    RzPanel1: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    RzLabel3: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBNumericEdit2: TRzDBNumericEdit;
    RzDBNumericEdit3: TRzDBNumericEdit;
    RzDBNumericEdit4: TRzDBNumericEdit;
    RzDBNumericEdit5: TRzDBNumericEdit;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    RzDBDateTimeEdit2: TRzDBDateTimeEdit;
    RzGroupBox2: TRzGroupBox;
    DynamicRatesList: TRzCheckList;
    RzGroupBox3: TRzGroupBox;
    ProductType: TRzDBLookupComboBox;
    RzGroupBox4: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel12: TRzLabel;
    ProductProvider: TRzDBLookupComboBox;
    ProductName: TRzDBEdit;
    ProductCurrency: TRzDBLookupComboBox;
    RzGroupBox5: TRzGroupBox;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzDBLookupComboBox4: TRzDBLookupComboBox;
    RzDBCheckBox2: TRzDBCheckBox;
    RzDBNumericEdit10: TRzDBNumericEdit;
    RzDBNumericEdit11: TRzDBNumericEdit;
    RzGroupBox6: TRzGroupBox;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    RzDBLookupComboBox5: TRzDBLookupComboBox;
    RzDBCheckBox4: TRzDBCheckBox;
    RzDBNumericEdit12: TRzDBNumericEdit;
    RzDBNumericEdit13: TRzDBNumericEdit;
    RzDBCheckBox6: TRzDBCheckBox;
    RzGroupBox7: TRzGroupBox;
    RzLabel7: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    RzDBLookupComboBox6: TRzDBLookupComboBox;
    RzDBCheckBox1: TRzDBCheckBox;
    RzDBNumericEdit6: TRzDBNumericEdit;
    RzDBNumericEdit7: TRzDBNumericEdit;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    RzDBCheckBox5: TRzDBCheckBox;
    RzGroupBox8: TRzGroupBox;
    FundList: TRzListBox;
    DeleteFundButton: TRzButton;
    AddFundButton: TRzButton;
    EditButton: TRzButton;
    SaveButton: TRzButton;
    DeleteButton: TRzButton;
    ProviderCommButton: TRzButton;
    BrokerCommButton: TRzButton;
    CloseButton: TRzButton;
    qFunds: TADOQuery;
    qDelete: TADOQuery;
    function ValidateProductSettings : Boolean;
    procedure LoadDynamicRates;
    procedure SaveDynamicRates;
    procedure ProductTypeExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SaveButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure ProductTypeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ProviderCommButtonClick(Sender: TObject);
    procedure BrokerCommButtonClick(Sender: TObject);
    procedure AddFundButtonClick(Sender: TObject);
    procedure LoadFunds;
    procedure DeleteFundButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    ProductID : Integer;
    EditAction : Byte;
  end;

var
  ProductForm: TProductForm;

implementation

{$R *.dfm}

uses
UMain, UProviderCommission, UBaseCommission, UDataModule;

//------------------------------------------------------------------------------

function TProductForm.ValidateProductSettings : Boolean;

begin
  ProductProvider.Color := clWindow;
  ProductName.Color := clWindow;
  ProductCurrency.Color := clWindow;
  ProductType.Color := clWindow;
  Result := True;
  if ProductProvider.Text = '' then begin Result := False; ProductProvider.Color := clInfoBk; end;
  if ProductName.Text  = '' then begin Result := False; ProductName.Color := clInfoBk; end;
  if ProductCurrency.Text  = '' then begin Result := False; ProductCurrency.Color := clInfoBk; end;
  if ProductType.Text =  '' then begin Result := False; ProductType.Color := clInfoBk; end;
  if not Result then
  begin
    MessageDlg('Missing Fields has been highlighted! Please fill these out and try again', mtINFORMATION, [mbOK], 0);
    Exit;
  end;
  if (MainForm.qProductType.FieldValues['product_type_id'] = 2) and (DynamicRatesList.ItemsChecked = 0) then
  begin
    Result := False;
    MessageDlg('You must check the allowed dynamic rates for a dynamic product!', mtINFORMATION, [mbOK], 0);
    DynamicRatesList.Enabled := True;
  end;
end;

//------------------------------------------------------------------------------

procedure TProductForm.LoadDynamicRates;

var
i : Byte;

begin
  DynamicRatesList.UncheckAll;
  with qDynamicRates do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_dynrate WHERE product_id = ' + IntToStr(ProductID));
    Open;
    if (RecordCount = 0) then
    begin
      Close;
      Exit;
    end;
    First;
    while not EOF do
    begin
      //showmessage(FormatFloat('0.00',FieldValues['dynrate']));
      DynamicRatesList.ItemChecked[DynamicRatesList.IndexOf(FormatFloat('0.00',FieldValues['dynrate']))] := True;
      Next;
    end;
    Close;
  end;
end;

//------------------------------------------------------------------------------

procedure TProductForm.SaveDynamicRates;

var
i : Byte;

begin
  //this is lazy, but is modified very infrequenctly
  DM.DB_POLMAN.Execute('DELETE FROM tbl_dynrate WHERE product_id = ' + IntToStr(ProductID));
  for i := 0 to DynamicRatesList.Count - 1 do
    if DynamicRatesList.ItemChecked[i] then
      DM.DB_POLMAN.Execute('INSERT INTO tbl_dynrate (product_id, dynrate) VALUES('+IntToStr(ProductID)+','+DynamicRatesList.ItemCaption(i)+')');
end;

//------------------------------------------------------------------------------

procedure TProductForm.ProductTypeExit(Sender: TObject);

begin
  DynamicRatesList.Enabled := ProductType.KeyValue = 2;
end;

//------------------------------------------------------------------------------

procedure TProductForm.FormShow(Sender: TObject);

begin
  ProductForm.Caption := 'Product ID ' + IntToStr(ProductID);
  MainForm.qProductProvider.Open;
  MainForm.qProductType.Open;
  MainForm.qCommissionBase.Open;
  MainForm.qPaymentType.Open;
  MainForm.qCurrency.Open;
  DynamicRatesList.UncheckAll;
  LoadFunds;
  with qProduct do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_product WHERE product_id = ' + IntToStr(ProductID));
    Open;
    if (Recordcount = 0) then
    begin
      Append;
      DSProduct.AutoEdit := True;
      SaveButton.Enabled := True;
    end;
  end;
  LoadDynamicRates;
end;

//------------------------------------------------------------------------------

procedure TProductForm.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  MainForm.qProductProvider.Close;
  MainForm.qProductType.Close;
  MainForm.qCommissionBase.Close;
  MainForm.qPaymentType.Close;
  MainForm.qCurrency.Close;
  DynamicRatesList.Enabled := False;
end;

//------------------------------------------------------------------------------

procedure TProductForm.SaveButtonClick(Sender: TObject);

begin
  if not ValidateProductSettings then
    Exit;
  if (qProduct.State = dsEdit) or (qProduct.State = dsInsert) then
  begin
    qProduct.Post;
    DSProduct.AutoEdit := False;
  end;
  SaveButton.Enabled := False;
  ProductID := qProduct.FieldValues['product_id'];
  if qProduct.FieldValues['product_type'] = 2 then
    SaveDynamicRates;
end;

//------------------------------------------------------------------------------

procedure TProductForm.EditButtonClick(Sender: TObject);

begin
  DSProduct.AutoEdit := True;
  qProduct.Edit;
  SaveButton.Enabled := True;
  DynamicRatesList.Enabled := qProduct.FieldValues['product_type'] = 2;
end;

//------------------------------------------------------------------------------

procedure TProductForm.CloseButtonClick(Sender: TObject);

begin
  if (ProductID = 0) and ((qProduct.State = dsEdit) or (qProduct.State = dsInsert)) then
    qProduct.Cancel;
  ProductForm.Close;
end;

//------------------------------------------------------------------------------

procedure TProductForm.ProductTypeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

begin
  ProductTypeExit(Self);
end;

//------------------------------------------------------------------------------

procedure TProductForm.ProviderCommButtonClick(Sender: TObject);

begin
  if (qProduct.State = dsEdit) or (qProduct.State = dsInsert) then
  begin
    MessageDlg('Please save changes first!', mtINFORMATION, [mbOK], 0);
    Exit;
  end;
  ProviderCommissionForm.ProductID := qProduct.FieldValues['product_id'];
  ProviderCommissionForm.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TProductForm.BrokerCommButtonClick(Sender: TObject);

begin
  BaseCommissionForm.ProductID := qProduct.FieldValues['product_id'];
  if not BaseCommissionForm.LoadContractDates then
  begin
    MessageDlg('You must enter provider commissions for a product first!', mtINFORMATION, [mbOK], 0);
    Exit;
  end;
  BaseCommissionForm.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TProductForm.AddFundButtonClick(Sender: TObject);

var
NewFund : String;

begin
  if InputQuery('Add Fund', 'Please enter name of fund', NewFund) then
  begin
    DM.DB_POLMAN.Execute('INSERT INTO tbl_funds (product_id, fund_name) VALUES (' + IntToStr(ProductID) + ',' + AnsiQuotedStr(NewFund, '''') + ')');
    LoadFunds;
  end;
end;

//------------------------------------------------------------------------------

procedure TProductForm.DeleteFundButtonClick(Sender: TObject);

begin
  if FundList.SelectedItem = '' then
  begin
    MessageDlg('Select a fund to delete!', mtWARNING, [mbOK], 0);
    Exit;
  end;
  DM.DB_POLMAN.Execute('DELETE FROM tbl_funds WHERE fund_name = ' + AnsiQuotedStr(FundList.SelectedItem, '''') + ' AND product_id = ' + IntToStr(ProductID));
  LoadFunds;
end;

//------------------------------------------------------------------------------

procedure TProductForm.LoadFunds;

begin
  FundList.Items.Clear;
  with qFunds do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_funds WHERE product_id = ' + IntToStr(ProductID) + ' ORDER BY fund_name');
    Open;
    If RecordCount > 0 then
    begin
      First;
      while not EOF do
      begin
        FundList.Items.Add(FieldValues['fund_name']);
        Next;
      end;
    end;
    Close;
  end;
end;

//------------------------------------------------------------------------------

procedure TProductForm.DeleteButtonClick(Sender: TObject);

var
PolIDStr, BrokerIDStr : String;

begin
  //first check there are no policies
  with qDelete do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_policy WHERE pol_product_id = ' +IntToStr(ProductID));
    Open;
    if (RecordCount > 0) then
    begin
      First;
      PolIDStr := IntToStr(FieldValues['pol_id']);
      MessageDlg('You cannot delete this product! There are associated policies (first one found is Policy ID '+ PolIDStr + ')', mtERROR, [mbOK], 0);
      Close;
      Exit;
    end;
  end;
  //then check there are no agreements
  with qDelete do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_broker_agreement WHERE product_id = ' +IntToStr(ProductID));
    Open;
    if (RecordCount > 0) then
    begin
      First;
      BrokerIDStr := IntToStr(FieldValues['broker_id']);
      MessageDlg('You cannot delete this product! There are associated broker agreements (first one found is Broker ID '+ BrokerIDStr + ')', mtERROR, [mbOK], 0);
      Close;
      Exit;
    end;
  end;
  //then check there are no override agreements
  with qDelete do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_override WHERE product_id = ' +IntToStr(ProductID));
    Open;
    if (RecordCount > 0) then
    begin
      First;
      BrokerIDStr := IntToStr(FieldValues['broker_id']);
      MessageDlg('You cannot delete this product! There are associated overide agreements (first one found is Broker ID '+ BrokerIDStr + ')', mtERROR, [mbOK], 0);
      Close;
      Exit;
    end;
  end;
  //then clean the tables
  with DM.DB_POLMAN do
  begin
    Execute('DELETE FROM tbl_broker_base_commission WHERE product_id = ' + IntToStr(ProductID));
    Execute('DELETE FROM tbl_product WHERE product_id = ' + IntToStr(ProductID));
    Execute('DELETE FROM tbl_product_provider_commission WHERE product_id = ' + IntToStr(ProductID));
    Execute('DELETE FROM tbl_override WHERE product_id = ' + IntToStr(ProductID));
  end;
  MainForm.qResult.Refresh;
  ProductForm.CLose;
end;

//------------------------------------------------------------------------------

end.
