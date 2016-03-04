unit UPicklist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLstBox, RzPanel, ExtCtrls, DB, {ADODS,} RzButton,
  ADODB;

type
  TPicklistForm = class(TForm)
    RzPanel1: TRzPanel;
    PicklistFramer: TRzGroupBox;
    PicklistBox: TRzListBox;
    qPickList: TADOQuery;
    CancelButton: TRzButton;
    OKButton: TRzButton;
    function LoadPickList(CallerID : Byte) : Boolean;
    procedure FormShow(Sender: TObject);
    procedure PicklistBoxDblClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure PicklistBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    
  end;

var
  PicklistForm: TPicklistForm;
  CID, DView : Byte;
implementation

uses UMain, UPolicy, UBroker, UDataModule;

{$R *.dfm}

//------------------------------------------------------------------------------

function TPicklistForm.LoadPickList(CallerID : Byte) : Boolean;

var
PickListQuery : String;

begin
  CID := CallerID;
  DView := DetailView;
  PickListQuery := '';
  case CallerID of
    // broker data
    1: PickListQuery := 'SELECT DISTINCT broker_company AS picklist_items FROM tbl_broker WHERE broker_company IS NOT NULL AND broker_status = 1 ORDER BY broker_company';
    2: PickListQuery := 'SELECT DISTINCT broker_firstname AS picklist_items FROM tbl_broker WHERE broker_firstname IS NOT NULL AND broker_status = 1 ORDER BY broker_firstname';
    3: PickListQuery := 'SELECT DISTINCT broker_lastname AS picklist_items FROM tbl_broker WHERE broker_lastname IS NOT NULL AND broker_status = 1 ORDER BY broker_lastname';
    4: PickListQuery := 'SELECT DISTINCT broker_city AS picklist_items FROM tbl_broker WHERE broker_city IS NOT NULL AND broker_status = 1 ORDER BY broker_city';
    5: PickListQuery := 'SELECT DISTINCT country_name AS picklist_items FROM tbl_broker INNER JOIN tbl_country ON tbl_country.country_id = tbl_broker.broker_country  WHERE broker_country IS NOT NULL ORDER BY tbl_country.country_name';
    // client data
    6: PickListQuery := 'SELECT DISTINCT client_company AS picklist_items FROM tbl_client WHERE client_company IS NOT NULL ORDER BY client_company';
    7: PickListQuery := 'SELECT DISTINCT client_firstname AS picklist_items FROM tbl_client WHERE client_firstname IS NOT NULL ORDER BY client_firstname';
    8: PickListQuery := 'SELECT DISTINCT client_lastname AS picklist_items FROM tbl_client WHERE client_lastname IS NOT NULL ORDER BY client_lastname';
    9: PickListQuery := 'SELECT DISTINCT client_city AS picklist_items FROM tbl_client WHERE client_city IS NOT NULL ORDER BY client_city';
    10: PickListQuery := 'SELECT DISTINCT country_name AS picklist_items FROM tbl_client INNER JOIN tbl_country ON tbl_country.country_id = tbl_client.client_country  WHERE client_country IS NOT NULL ORDER BY tbl_country.country_name';
    // policy data
    11: PickListQuery := 'SELECT DISTINCT pol_id AS picklist_items FROM tbl_policy WHERE pol_id IS NOT NULL ORDER BY pol_id';
    12: PickListQuery := 'SELECT DISTINCT pol_number AS picklist_items FROM tbl_policy WHERE pol_number IS NOT NULL ORDER BY pol_number';
    13: PickListQuery := 'SELECT policy_status_id, policy_status_desc AS picklist_items FROM tbl_status_policy WHERE policy_status_desc IS NOT NULL ORDER BY policy_status_desc';
    14: PickListQuery := 'SELECT product_id, product_name AS picklist_items FROM tbl_product WHERE product_name IS NOT NULL ORDER BY product_name';
    15: PickListQuery := 'SELECT product_provider_id, product_provider_company AS picklist_items FROM tbl_product_provider ORDER BY product_provider_company';
    // client pick from policy form
    16: PickListQuery := 'SET CONCAT_NULL_YIELDS_NULL OFF; SELECT client_id, ltrim(client_company + '' '' + client_firstname + '' '' + client_lastname) AS picklist_items FROM tbl_client ORDER BY picklist_items';
    // product pick from broker agreement form - only products with broker commission agreements (which implies a supplier commission exists)
    17: PickListQuery := 'SELECT DISTINCT tbl_product.product_name AS picklist_items, tbl_product.product_id FROM tbl_product INNER JOIN tbl_broker_base_commission ON tbl_product.product_id = tbl_broker_base_commission.product_id';
  end; //of case
  with qPickList do
  begin
    Close;
    SQL.Clear;
    SQL.Add(PickListQuery);
    Open;
    First;
    PicklistBox.Items.Clear;
    while not EOF do
    begin
      PicklistBox.Items.Add(FieldValues['picklist_items']);
      Next;
    end;
    //Close;
  end;
end;

//------------------------------------------------------------------------------

procedure TPicklistForm.FormShow(Sender: TObject);

begin
  PicklistBox.ItemIndex := 0;
  PicklistBox.SetFocus;
end;

//------------------------------------------------------------------------------

procedure TPicklistForm.PicklistBoxDblClick(Sender: TObject);

begin
  case CID of
    1..12 : MainForm.QueryFilterString := AnsiQuotedStr(PicklistBox.SelectedItem, '''');
    // 13 = policy status
    13: begin
          qPicklist.Locate('picklist_items',PicklistBox.SelectedItem, []);
          MainForm.QueryFilterString := IntToStr(qPicklist.FieldValues['policy_status_id']);
        end;
    // 14=policy product
    14: begin
          qPicklist.Locate('picklist_items',PicklistBox.SelectedItem, []);
          MainForm.QueryFilterString := IntToStr(qPicklist.FieldValues['product_id']);
        end;
    // 15=policy product provider
    15: begin
          qPicklist.Locate('picklist_items',PicklistBox.SelectedItem, []);
          MainForm.QueryFilterString := IntToStr(qPicklist.FieldValues['product_provider_id']);
        end;
    // client select from policy form
    16: begin
          qPickList.Locate('picklist_items', PicklistBox.SelectedItem, []);
          PolicyForm.NewClientID := qPickList.FieldValues['client_id'];
        end;
    17: begin
          qPickList.Locate('picklist_items', PicklistBox.SelectedItem, []);
          BrokerForm.AddAgreement_PID := qPickList.FieldValues['product_id'];
        end;
  end; // of case
  PicklistForm.Close;
end;

//------------------------------------------------------------------------------

procedure TPicklistForm.OKButtonClick(Sender: TObject);

begin
  PicklistBoxDblClick(Self);
end;

//------------------------------------------------------------------------------

procedure TPicklistForm.CancelButtonClick(Sender: TObject);

begin
  MainForm.QueryFilterString := '';
  PicklistForm.Close;
end;

//------------------------------------------------------------------------------

procedure TPicklistForm.PicklistBoxKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

begin
  if (Key = VK_RETURN) then PicklistBox.OnDblClick(Self);
end;

//------------------------------------------------------------------------------

procedure TPicklistForm.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  qPickList.Close;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
end.
