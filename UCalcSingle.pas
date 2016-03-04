unit UCalcSingle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  DB, cxDBData, RzButton, ExtCtrls, RzPanel, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, {ADODS,} DateUtils, StdCtrls, cxDataStorage,
  ADODB, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TCalcSingleForm = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    RzPanel1: TRzPanel;
    CloseButton: TRzButton;
    qPolicyData: TADOQuery;
    qCommission: TADOQuery;
    qProductSpecifics: TADOQuery;
    qAddPayment: TADOQuery;
    Button1: TButton;
    qSalesVol: TADOQuery;
    qEBNPayments: TADOQuery;
    procedure Hello;
    procedure GetProviderComm(ProductID : Integer; PolStart : TDate; Var ContractID : Integer; Var y1, y2, y3, y4, y5, renew, other : Real);
    function CalculateProviderComm(AppID : Integer) : Integer;
    function CalculateBrokerComm(AppID : Integer) : Integer;
    function CalculateOverride(AppID : Integer) : Integer;
    function GetCurrentSalesVolume(ProductID, BrokerID : Integer) : Real;
    function GetBrokerComm(BrokerID, ProductID, CommLevel : Integer; PolStart : TDate; Var y1, y2, y3, y4, y5, renew, other : Real) : Byte;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    pid : Integer;
  end;

var
  CalcSingleForm: TCalcSingleForm;

implementation

{$R *.dfm}

uses
tbj_utils, UMain, UDataModule;

//------------------------------------------------------------------------------

procedure TCalcSingleForm.GetProviderComm(ProductID : Integer; PolStart : TDate; Var ContractID : Integer; Var y1, y2, y3, y4, y5, renew, other : Real);

begin
  with qCommission do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_product_provider_commission WHERE product_id = ' + IntToStr(ProductID) + ' ORDER BY contract_date ASC');
    Open;
    if (RecordCount > 1) then
    begin
      First;
      while not EOF do
      begin
        if (FieldValues['contract_date'] <= PolStart) then
        Next
        else Break;
      end;
    end;
    if (RecordCount = 0) then
    begin
       ContractID := 0;
       y1 := 0;
       y2 := 0;
       y3 := 0;
       y4 := 0;
       y5 := 0;
       renew := 0;
       other := 0;
    end
    else
    begin
    //showmessage(floattostr( FieldValues['y1_rate']));
       ContractID := FieldValues['agreement_id'];
       y1 := FieldValues['y1_rate'];
       y2 := FieldValues['y2_rate'];
       y3 := FieldValues['y3_rate'];
       y4 := FieldValues['y4_rate'];
       y5 := FieldValues['y5_rate'];
       renew := FieldValues['renewal_rate'];
       other := FieldValues['other_rate'];
    end;
    Close;
  end;
end;

//------------------------------------------------------------------------------

function TCalcSingleForm.CalculateProviderComm(AppID : Integer) : Integer;

var
ProductID, ContractID : Integer;
AppStart, PaymentDueDate1, PaymentDueDate2, PaymentDueDate3, PaymentDueDate4, PaymentDueDate5 : TDate;
NextPayment, MaturityDate : TDate;
y1, y2, y3, y4, y5, renew, other, Payment : Real;
RenewAfter, RenewFreq, ShowPaymentAs : Integer;


begin
  Result := 0;  //ok
  with qPolicyData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_policy WHERE pol_id = ' + IntToStr(AppID));
    Open;
    if FieldValues['valid_app'] = 0 then
    begin
      Result := 1;
      Close;
      Exit;
    end;
    //for open-ended policies - assume 40 years for the forecast
    if (FieldValues['pol_date_end'] = NULL) and (FieldValues['pol_date_begin'] <> NULL) then
    begin
      Edit;
      FieldValues['pol_date_end'] := AnsiQuotedStr(ReturnISODate(IncYear(FieldValues['pol_date_begin'], 40)), '''');
      Post;
      Refresh;
    end;
    //ProductID := FieldValues['product_id'];
    //AppStart := FieldValues['pol_date_begin'];
    GetProviderComm(FieldValues['pol_product_id'], FieldValues['pol_date_begin'], ContractID, y1, y2, y3, y4, y5, renew, other);


    with qProductSpecifics do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM tbl_product WHERE product_id = ' + IntToStr(qPolicyData.FieldValues['pol_product_id']));
      Open;
    end;
    //if (FieldValues['product_type'] <> 0) then
    //begin
      //Result := False;
      //qProductSpecifics.Close;
      //Close;
      //Exit;
    //end;
    //initial commission
    PaymentDueDate1 := IncMonth(FieldValues['pol_date_begin'], qProductSpecifics.FieldValues['comm_payment_after_months']);
    PaymentDueDate2 := IncMonth(PaymentDueDate1, 12);
    PaymentDueDate3 := IncMonth(PaymentDueDate2, 12);
    PaymentDueDate4 := IncMonth(PaymentDueDate3, 12);
    PaymentDueDate5 := IncMonth(PaymentDueDate4, 12);

    //clean from tbl_ebn_payments if payments already exist, but check if broker payments are linked first
    with qAddPayment do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM tbl_broker_payments WHERE policy_id = ' + IntToStr(AppID));
      Open;
      if (RecordCount > 0) then
      begin
        Result := 2;
        Close;
        Exit;
      end;
      Close;
      //non linked so safe to delete
      DM.DB_POLMAN.Execute('DELETE FROM tbl_ebn_payments WHERE policy_id = ' + IntToStr(AppID));
    end;
    if (y1 <> 0) then
    begin
      Payment := FieldValues['pol_single_premium'] * (y1/100);
      with qAddPayment do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO tbl_ebn_payments (agreement_id, policy_id, payment_type_id, payment, exchange, payment_due_date, payment_last_edit) VALUES (');
        SQL.Add(IntToStr(ContractID) + ',' + IntToStr(AppID) + ',1, ROUND(' + FloatToStr(Payment) + ',4),'+ IntToStr(qProductSpecifics.FieldValues['product_currency']) + ',' + AnsiQuotedStr(ReturnISODate(PaymentDueDate1), '''') + ',' + AnsiQuotedStr(ReturnISODate(Now), '''') + ')');
        ExecSQL;
      end;
    end;
    if (y2 <> 0) then
    begin
      Payment := FieldValues['pol_single_premium'] * (y2/100);
      with qAddPayment do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO tbl_ebn_payments (agreement_id, policy_id, payment_type_id, payment, exchange, payment_due_date, payment_last_edit) VALUES (');
        SQL.Add(IntToStr(ContractID) + ',' + IntToStr(AppID) + ',2, ROUND(' + FloatToStr(Payment) + ',4),'+ IntToStr(qProductSpecifics.FieldValues['product_currency']) + ',' + AnsiQuotedStr(ReturnISODate(PaymentDueDate2), '''') + ',' + AnsiQuotedStr(ReturnISODate(Now), '''') + ')');
        ExecSQL;
      end;
    end;
    if (y3 <> 0) then
    begin
      Payment := FieldValues['pol_single_premium'] * (y3/100);
      with qAddPayment do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO tbl_ebn_payments (agreement_id, policy_id, payment_type_id, payment, exchange, payment_due_date, payment_last_edit) VALUES (');
        SQL.Add(IntToStr(ContractID) + ',' + IntToStr(AppID) + ',3, ROUND(' + FloatToStr(Payment) + ',4),'+ IntToStr(qProductSpecifics.FieldValues['product_currency']) + ',' + AnsiQuotedStr(ReturnISODate(PaymentDueDate3), '''') + ',' + AnsiQuotedStr(ReturnISODate(Now), '''') + ')');
        ExecSQL;
      end;
    end;
    if (y4 <> 0) then
    begin
      Payment := FieldValues['pol_single_premium'] * (y4/100);
      with qAddPayment do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO tbl_ebn_payments (agreement_id, policy_id, payment_type_id, payment, exchange, payment_due_date, payment_last_edit) VALUES (');
        SQL.Add(IntToStr(ContractID) + ',' + IntToStr(AppID) + ',4, ROUND(' + FloatToStr(Payment) + ',4),'+ IntToStr(qProductSpecifics.FieldValues['product_currency']) + ',' + AnsiQuotedStr(ReturnISODate(PaymentDueDate4), '''') + ',' + AnsiQuotedStr(ReturnISODate(Now), '''') + ')');
        ExecSQL;
      end;
    end;
    if (y5 <> 0) then
    begin
      Payment := FieldValues['pol_single_premium'] * (y5/100);
      with qAddPayment do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO tbl_ebn_payments (agreement_id, policy_id, payment_type_id, payment, exchange, payment_due_date, payment_last_edit) VALUES (');
        SQL.Add(IntToStr(ContractID) + ',' + IntToStr(AppID) + ',5, ROUND(' + FloatToStr(Payment) + ',4),'+ IntToStr(qProductSpecifics.FieldValues['product_currency']) + ',' + AnsiQuotedStr(ReturnISODate(PaymentDueDate5), '''') + ',' + AnsiQuotedStr(ReturnISODate(Now), '''') + ')');
        ExecSQL;
      end;
    end;
    //renewal commission
    if renew <> 0 then
    begin
      Payment := FieldValues['pol_single_premium'] * (renew/100);
      RenewAfter := qProductSpecifics.FieldValues['renewal_payment_after_months'];
      RenewFreq := qProductSpecifics.FieldValues['renewal_frequency_payment_months'];
      MaturityDate := FieldValues['pol_date_end'];
      NextPayment := IncMonth(FieldValues['pol_date_begin'], RenewAfter);
      while NextPayment <= MaturityDate do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO tbl_ebn_payments (agreement_id, policy_id, payment_type_id, payment, exchange, payment_due_date, payment_last_edit) VALUES (');
        SQL.Add(IntToStr(ContractID) + ',' + IntToStr(AppID) + ',50, ROUND(' + FloatToStr(Payment) + ',4),'+ IntToStr(qProductSpecifics.FieldValues['product_currency']) + ',' + AnsiQuotedStr(ReturnISODate(NextPayment), '''') + ',' + AnsiQuotedStr(ReturnISODate(Now), '''') + ')');
        ExecSQL;
        NextPayment := IncMonth(NextPayment, RenewFreq);
      end;
    end;
    //other commission - please note there is a policy specific flag if these payments should be included - ibp from pru has a selectable "broker service fee"
    if (other <> 0) and (FieldValues['additional_comm'] > 0) then
    begin
      //other payments can be selected to be shown as a specific type of payment
      ShowPaymentAs := qProductSpecifics.FieldValues['other_payment_type'];
      Payment := FieldValues['pol_single_premium'] * (renew/100);
      RenewAfter := qProductSpecifics.FieldValues['other_payment_after_months'];
      RenewFreq := qProductSpecifics.FieldValues['other_frequency_payment_months'];
      MaturityDate := FieldValues['pol_date_end'];
      NextPayment := IncMonth(FieldValues['pol_date_begin'], RenewAfter);
      while NextPayment <= MaturityDate do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO tbl_ebn_payments (agreement_id, policy_id, payment_type_id, payment, exchange, payment_due_date, payment_last_edit) VALUES (');
        SQL.Add(IntToStr(ContractID) + ',' + IntToStr(AppID) + ', ShowPaymentAs, ROUND(' + FloatToStr(Payment) + ',4),'+ IntToStr(qProductSpecifics.FieldValues['product_currency']) + ',' + AnsiQuotedStr(ReturnISODate(NextPayment), '''') + ',' + AnsiQuotedStr(ReturnISODate(Now), '''') + ')');
        ExecSQL;
        NextPayment := IncMonth(NextPayment, RenewFreq);
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TCalcSingleForm.GetCurrentSalesVolume(ProductID, BrokerID : Integer) : Real;

begin
  with qSalesVol do
  begin
    CLose;
    SQL.Clear;
    //please note - the volume count does not include the current policy - must be so according to CP
    SQL.Add('SELECT SUM(pol_single_premuim) AS sales_vol FROM tbl_policy WHERE pol_broker_id = ' + IntToStr(BrokerID) + ' AND pol_product_id = ' + IntToStr(ProductID) + ' AND pol_date_begin IS NOT NULL AND pol_date_begin <= GETDATE() AND pol_status = 13');
    Open;
    if (FieldValues['sales_vol'] <> NULL) then
      Result := FieldValues['sales_vol']
    else
      Result := 0;
    Close;
  end;
end;

//------------------------------------------------------------------------------


function TCalcSingleForm.GetBrokerComm(BrokerID, ProductID, CommLevel : Integer; PolStart : TDate; Var y1, y2, y3, y4, y5, renew, other : Real) : Byte;

var
VolBased : Boolean;
SalesVol : Real;
AgreementID : Integer;

begin
  Result := 0; //ok
  VolBased := False;
  with qCommission do
  begin
    Close;
    SQL.Clear;
    //first find agreement to use in tbl_broker_agreement - we get agreement id from this
    SQL.Add('SELECT * FROM tbl_broker_agreement WHERE broker_id = ' + IntToStr(BrokerID) + ' AND contract_level = ' + IntToStr(CommLevel) + ' AND broker_id = ' + IntToStr(BrokerID) + ' ORDER BY contract_date ASC');
    Open;
    if RecordCount = 0 then
    begin
      Result := 1;
      Close;
      Exit;
    end;
    if RecordCount = 1 then
      AgreementID := Fieldvalues['agreement_id']
    else
    begin //find current agreement
      First;
      while not EOF do
      begin
        if Polstart > FieldValues['contract_date'] then
          Next
        else
          Break;
      end;
      Previous;
      AgreementID := Fieldvalues['agreement_id']
    end;
    //then retrieve commission rates based on agreement id
    SQL.Add('SELECT * FROM tbl_broker_commission WHERE agreement_id = ' + IntToStr(AgreementID) + ' ORDER BY volume_level, comm_year');
    Open;

    if (RecordCount > 1) then
    begin
      First;
      while not EOF do
      begin
        if (FieldValues['volume_level'] > 0) then
        begin
          VolBased := True;
          Break;
        end
        else Next;
      end;
    end;
    if VolBased then
    begin
      SalesVol := GetCurrentSalesVolume(ProductID, BrokerID);
      First;
      while not EOF do
      begin
        if SalesVol > FieldValues['volume_level'] then
          Next
        else Break;
      end;
    end;
    y1 := FieldValues['y1_rate'];
    y2 := FieldValues['y2_rate'];
    y3 := FieldValues['y3_rate'];
    y4 := FieldValues['y4_rate'];
    y5 := FieldValues['y5_rate'];
    renew := FieldValues['renewal_rate'];
    other := FieldValues['other_rate'];
  end;
end;


//------------------------------------------------------------------------------

function TCalcSingleForm.CalculateBrokerComm(AppID : Integer) : Integer;

var
ProductID, ContractID : Integer;
AppStart, PaymentDueDate1, PaymentDueDate2, PaymentDueDate3, PaymentDueDate4, PaymentDueDate5 : TDate;
NextPayment, MaturityDate : TDate;
y1, y2, y3, y4, y5, renew, other, Payment : Real;
RenewAfter, RenewFreq, ShowPaymentAs : Integer;


begin
  Result := 0;  //ok
  with qPolicyData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_policy WHERE pol_id = ' + IntToStr(AppID));
    Open;
    if FieldValues['valid_app'] = 0 then
    begin
      Result := 1; //tbj - modify code
      Close;
      Exit;
    end;

    GetBrokerComm(FieldValues['pol_broker_id'], FieldValues['pol_product_id'], FieldValues['pol_comm_level'], FieldValues['pol_date_begin'], y1, y2, y3, y4, y5, renew, other);

    //loop over payments made to ebn and make corresponding payments to broker
    //note that we (can) only match automatically calculated payments
    with qEBNPayments do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM tbl_ebn_payments WHERE policy_id = ' + IntToStr(AppID) + ' AND manual_payment = 0 ORDER BY ebn_payment_id'); //mannual payment cannot be matched automatically
      Open;
      if (RecordCount = 0) then
      begin
        Result := 2; //tbj - modify code
        Close;
        Exit;
      end;
    end;




    if (y1 <> 0) then
    begin
      Payment := FieldValues['pol_single_premium'] * (y1/100);
      with qAddPayment do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO tbl_broker_payments (agreement_id, policy_id, payment_type_id, payment, exchange, payment_due_date, payment_last_edit) VALUES (');
        SQL.Add(IntToStr(ContractID) + ',' + IntToStr(AppID) + ',1, ROUND(' + FloatToStr(Payment) + ',4),'+ IntToStr(qProductSpecifics.FieldValues['product_currency']) + ',' + AnsiQuotedStr(ReturnISODate(PaymentDueDate1), '''') + ',' + AnsiQuotedStr(ReturnISODate(Now), '''') + ')');
        ExecSQL;
      end;
    end;
    if (y2 <> 0) then
    begin
      Payment := FieldValues['pol_single_premium'] * (y2/100);
      with qAddPayment do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO tbl_broker_payments (agreement_id, policy_id, payment_type_id, payment, exchange, payment_due_date, payment_last_edit) VALUES (');
        SQL.Add(IntToStr(ContractID) + ',' + IntToStr(AppID) + ',2, ROUND(' + FloatToStr(Payment) + ',4),'+ IntToStr(qProductSpecifics.FieldValues['product_currency']) + ',' + AnsiQuotedStr(ReturnISODate(PaymentDueDate2), '''') + ',' + AnsiQuotedStr(ReturnISODate(Now), '''') + ')');
        ExecSQL;
      end;
    end;
    if (y3 <> 0) then
    begin
      Payment := FieldValues['pol_single_premium'] * (y3/100);
      with qAddPayment do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO tbl_broker_payments (agreement_id, policy_id, payment_type_id, payment, exchange, payment_due_date, payment_last_edit) VALUES (');
        SQL.Add(IntToStr(ContractID) + ',' + IntToStr(AppID) + ',3, ROUND(' + FloatToStr(Payment) + ',4),'+ IntToStr(qProductSpecifics.FieldValues['product_currency']) + ',' + AnsiQuotedStr(ReturnISODate(PaymentDueDate3), '''') + ',' + AnsiQuotedStr(ReturnISODate(Now), '''') + ')');
        ExecSQL;
      end;
    end;
    if (y4 <> 0) then
    begin
      Payment := FieldValues['pol_single_premium'] * (y4/100);
      with qAddPayment do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO tbl_broker_payments (agreement_id, policy_id, payment_type_id, payment, exchange, payment_due_date, payment_last_edit) VALUES (');
        SQL.Add(IntToStr(ContractID) + ',' + IntToStr(AppID) + ',4, ROUND(' + FloatToStr(Payment) + ',4),'+ IntToStr(qProductSpecifics.FieldValues['product_currency']) + ',' + AnsiQuotedStr(ReturnISODate(PaymentDueDate4), '''') + ',' + AnsiQuotedStr(ReturnISODate(Now), '''') + ')');
        ExecSQL;
      end;
    end;
    if (y5 <> 0) then
    begin
      Payment := FieldValues['pol_single_premium'] * (y5/100);
      with qAddPayment do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO tbl_broker_payments (agreement_id, policy_id, payment_type_id, payment, exchange, payment_due_date, payment_last_edit) VALUES (');
        SQL.Add(IntToStr(ContractID) + ',' + IntToStr(AppID) + ',5, ROUND(' + FloatToStr(Payment) + ',4),'+ IntToStr(qProductSpecifics.FieldValues['product_currency']) + ',' + AnsiQuotedStr(ReturnISODate(PaymentDueDate5), '''') + ',' + AnsiQuotedStr(ReturnISODate(Now), '''') + ')');
        ExecSQL;
      end;
    end;
    //renewal commission
    if renew <> 0 then
    begin
      Payment := FieldValues['pol_single_premium'] * (renew/100);
      RenewAfter := qProductSpecifics.FieldValues['renewal_payment_after_months'];
      RenewFreq := qProductSpecifics.FieldValues['renewal_frequency_payment_months'];
      MaturityDate := FieldValues['pol_date_end'];
      NextPayment := IncMonth(FieldValues['pol_date_begin'], RenewAfter);
      while NextPayment <= MaturityDate do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO tbl_broker_payments (agreement_id, policy_id, payment_type_id, payment, exchange, payment_due_date, payment_last_edit) VALUES (');
        SQL.Add(IntToStr(ContractID) + ',' + IntToStr(AppID) + ',50, ROUND(' + FloatToStr(Payment) + ',4),'+ IntToStr(qProductSpecifics.FieldValues['product_currency']) + ',' + AnsiQuotedStr(ReturnISODate(NextPayment), '''') + ',' + AnsiQuotedStr(ReturnISODate(Now), '''') + ')');
        ExecSQL;
        NextPayment := IncMonth(NextPayment, RenewFreq);
      end;
    end;
    //other commission - please note there is a policy specific flag if these payments should be included - ibp from pru has a selectable "broker service fee"
    if (other <> 0) and (FieldValues['additional_comm'] > 0) then
    begin
      //other payments can be selected to be shown as a specific type of payment
      ShowPaymentAs := qProductSpecifics.FieldValues['other_payment_type'];
      Payment := FieldValues['pol_single_premium'] * (renew/100);
      RenewAfter := qProductSpecifics.FieldValues['other_payment_after_months'];
      RenewFreq := qProductSpecifics.FieldValues['other_frequency_payment_months'];
      MaturityDate := FieldValues['pol_date_end'];
      NextPayment := IncMonth(FieldValues['pol_date_begin'], RenewAfter);
      while NextPayment <= MaturityDate do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO tbl_broker_payments (agreement_id, policy_id, payment_type_id, payment, exchange, payment_due_date, payment_last_edit) VALUES (');
        SQL.Add(IntToStr(ContractID) + ',' + IntToStr(AppID) + ', ShowPaymentAs, ROUND(' + FloatToStr(Payment) + ',4),'+ IntToStr(qProductSpecifics.FieldValues['product_currency']) + ',' + AnsiQuotedStr(ReturnISODate(NextPayment), '''') + ',' + AnsiQuotedStr(ReturnISODate(Now), '''') + ')');
        ExecSQL;
        NextPayment := IncMonth(NextPayment, RenewFreq);
      end;
    end;
  end;
end;


//------------------------------------------------------------------------------


function TCalcSingleForm.CalculateOverride(AppID : Integer) : Integer;

begin

end;

//------------------------------------------------------------------------------

procedure TCalcSingleForm.Hello;

begin

end;

//------------------------------------------------------------------------------


procedure TCalcSingleForm.Button1Click(Sender: TObject);

begin
  CalculateProviderComm(575);
  //CalculateBrokerCommission(575);
  //CalculateOverride(575);
end;

end.
