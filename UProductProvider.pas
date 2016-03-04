unit UProductProvider;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, StdCtrls, RzLstBox, RzLabel, DBCtrls,
  RzDBCmbo, Mask, RzEdit, RzDBEdit, DB, {ADODS,} RzButton, ADODB;

type
  TProductProviderForm = class(TForm)
    BackPanel: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    ProductProviderCompanyName: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzLabel7: TRzLabel;
    ContactList: TRzListBox;
    RzLabel8: TRzLabel;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    qProductProviderInfo: TADOQuery;
    qProductProviderContacts: TADOQuery;
    DSProductProviderInfo: TDataSource;
    DSProductProviderContacts: TDataSource;
    qMaxID: TADOQuery;
    RzLabel15: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzLabel16: TRzLabel;
    DeleteCompanyButton: TRzButton;
    EditCompanyButton: TRzButton;
    SaveCompanyButton: TRzButton;
    CloseButton: TRzButton;
    DeleteContactButton: TRzButton;
    AddContactButton: TRzButton;
    EditContactButton: TRzButton;
    SaveContactButton: TRzButton;
    procedure LoadProductProviderInfo;
    procedure LoadProductProviderContacts;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditCompanyButtonClick(Sender: TObject);
    procedure SaveCompanyButtonClick(Sender: TObject);
    procedure EditContactButtonClick(Sender: TObject);
    procedure SaveContactButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ContactListClick(Sender: TObject);
    procedure AddContactButtonClick(Sender: TObject);
    procedure DeleteContactButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    ProductProviderID : Integer;
    EditAction : Byte;
  end;

var
ProductProviderForm: TProductProviderForm;
ProductProviderSaved : Boolean;
implementation

uses UMain, UDataModule;

{$R *.dfm}

//------------------------------------------------------------------------------

procedure TProductProviderForm.LoadProductProviderInfo;

var
MaxID : Integer;

begin
  with qProductProviderInfo do
  begin
    Close;
    SQL.Clear;
    case EditAction of
      1:{new product provider}
      begin
        DM.DB_POLMAN.Execute('INSERT INTO tbl_product_provider (product_provider_company) VALUES (' + AnsiquotedStr('New Product Provider','''') + ')');
        qMaxID.Open;
        MaxID := qMaxID.FieldValues['max_id'];
        qMaxID.Close;
        SQL.Add('SELECT * FROM tbl_product_provider WHERE product_provider_id = ' + IntToStr(MaxID));
      end;
      2:{edit existing provider}
      SQL.Add('SELECT * FROM tbl_product_provider WHERE product_provider_id = ' + IntToStr(ProductProviderID));
    end; //of case
    Open;
  end;
end;

//------------------------------------------------------------------------------

procedure TProductProviderForm.LoadProductProviderContacts;

begin
  ContactList.Clear;
  with qProductProviderContacts do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_product_provider_contacts WHERE product_provider_id = ' + IntToStr(ProductProviderID) + ' AND contact_name IS NOT NULL ORDER BY contact_name');
    Open;
    First;
    while not EOF do
    begin
      ContactList.Add(FieldValues['contact_name']);
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TProductProviderForm.CloseButtonClick(Sender: TObject);

begin
  if (EditAction = 1) and not ProductProviderSaved then
    DM.DB_POLMAN.Execute('DELETE FROM tbl_product_provider WHERE product_provider_id = ' + IntToStr(qProductProviderInfo.FieldValues['product_provider_id']));
  if (qProductProviderContacts.State = dsEdit) or (qProductProviderContacts.State = dsInsert) then
    qProductProviderContacts.Cancel;
  qProductProviderInfo.Close;
  qProductProviderContacts.Close;
  ProductProviderForm.Close;
end;

//------------------------------------------------------------------------------

procedure TProductProviderForm.FormShow(Sender: TObject);

begin
  MainForm.qCountryNames.Open;
  ProductProviderSaved := False;
  LoadProductProviderInfo;
  LoadProductProviderContacts;
  if (EditAction = 1) then //adding new so logically click the editbutton
  begin
    EditCompanyButton.OnClick(Self);
    ProductProviderCompanyName.SelectAll;
    ProductProviderCompanyName.SetFocus;
  end;
end;

//------------------------------------------------------------------------------

procedure TProductProviderForm.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  MainForm.qCountryNames.Close;
  qProductProviderInfo.Close;
  qProductProviderContacts.Close;
end;

//------------------------------------------------------------------------------

procedure TProductProviderForm.EditCompanyButtonClick(Sender: TObject);

begin
  DSProductProviderInfo.AutoEdit := True;
  SaveCompanyButton.Enabled := True;
end;

//------------------------------------------------------------------------------

procedure TProductProviderForm.SaveCompanyButtonClick(Sender: TObject);

begin
  if (qProductProviderInfo.State = dsEdit) or (qProductProviderInfo.State = dsInsert) then
  begin
    ProductProviderSaved := True;
    qProductProviderInfo.Post;
    DSProductProviderInfo.AutoEdit := False;
    SaveCompanyButton.Enabled := False;
  end;
end;

//------------------------------------------------------------------------------

procedure TProductProviderForm.EditContactButtonClick(Sender: TObject);

begin
  if ContactList.ItemIndex = -1 then
  begin
    MessageDlg('Select Contact from list!', mtINFORMATION, [mbOK], 0);
    Exit;
  end;
  qProductProviderContacts.Edit;
  DSProductProviderContacts.AutoEdit := True;
  SaveContactButton.Enabled := True;
end;

//------------------------------------------------------------------------------

procedure TProductProviderForm.SaveContactButtonClick(Sender: TObject);

begin
  if (qProductProviderContacts.State = dsEdit) or (qProductProviderContacts.State = dsInsert) then
  begin
    qProductProviderContacts.Post;
    DSProductProviderContacts.AutoEdit := False;
    SaveContactButton.Enabled := False;
    LoadProductProviderContacts;
  end;
end;

//------------------------------------------------------------------------------


procedure TProductProviderForm.ContactListClick(Sender: TObject);

begin
  qProductProviderContacts.Locate('contact_name', ContactList.SelectedItem, []);
end;

//------------------------------------------------------------------------------

procedure TProductProviderForm.AddContactButtonClick(Sender: TObject);

begin
  qProductProviderContacts.Append;
  qProductProviderContacts.Fieldvalues['product_provider_id'] := qProductProviderinfo.Fieldvalues['product_provider_id'];
  SaveContactButton.Enabled := True;
end;

//------------------------------------------------------------------------------

procedure TProductProviderForm.DeleteContactButtonClick(Sender: TObject);

begin
  if ContactList.ItemIndex = -1 then
  begin
    MessageDlg('Select Contact from list!', mtINFORMATION, [mbOK], 0);
    Exit;
  end;
  qProductProviderContacts.Locate('contact_name', ContactList.SelectedItem, []);
  qProductProviderContacts.Delete;
  LoadProductProviderContacts;
end;

//------------------------------------------------------------------------------

end.
