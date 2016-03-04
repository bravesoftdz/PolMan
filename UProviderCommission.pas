unit UProviderCommission;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, Mask, RzEdit, RzDBEdit, RzPanel, ExtCtrls,
  DB, {ADODS,} RzLstBox, RzButton, ADODB;

type
  TProviderCommissionForm = class(TForm)
    RzPanel1: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBNumericEdit2: TRzDBNumericEdit;
    RzDBNumericEdit3: TRzDBNumericEdit;
    RzDBNumericEdit4: TRzDBNumericEdit;
    RzDBNumericEdit5: TRzDBNumericEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    qProviderCommission: TADOQuery;
    DSProviderCommission: TDataSource;
    RzDBNumericEdit6: TRzDBNumericEdit;
    RzLabel6: TRzLabel;
    RzDBNumericEdit7: TRzDBNumericEdit;
    RzLabel7: TRzLabel;
    ContractDate: TRzDBDateTimeEdit;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    qOldContracts: TADOQuery;
    OldContractList: TRzListBox;
    EditButton: TRzButton;
    SaveButton: TRzButton;
    AddContractButton: TRzButton;
    DeleteButton: TRzButton;
    CloseButton: TRzButton;
    procedure LoadOldContracts;
    procedure LoadCommissions;
    procedure SaveButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddContractButtonClick(Sender: TObject);
    procedure OldContractListClick(Sender: TObject);
  private
    { Private declarations }
  public
    ProductID : Integer;
  end;

var
  ProviderCommissionForm: TProviderCommissionForm;

implementation

{$R *.dfm}

uses
UMain, tbj_utils, UDataModule;

//------------------------------------------------------------------------------

procedure TProviderCommissionForm.LoadOldContracts;

begin
  OldContractList.Clear;
  with qOldContracts do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT contract_date FROM tbl_product_provider_commission WHERE product_id = ' + IntToStr(ProductID));
    SQL.Add('ORDER BY contract_date DESC');
    Open;
    if RecordCount > 0 then
    begin
      First;
      while not EOF do
      begin
        OldContractList.Add(DateToStr(FieldValues['contract_date']));
        Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TProviderCommissionForm.LoadCommissions;

begin
  with qProviderCommission do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_product_provider_commission WHERE product_id = ' + IntToStr(ProductID));
    SQL.Add('ORDER BY contract_date DESC');
    Open;
    if (RecordCount = 0) then
    begin
      DSProviderCommission.AutoEdit := True;
      Append;
      SaveButton.Enabled := True;
      Exit;
    end;
    First;
  end;
end;

//------------------------------------------------------------------------------

procedure TProviderCommissionForm.SaveButtonClick(Sender: TObject);

begin
  if (ContractDate.Text = '') then
  begin
    MessageDlg('Contact date cannot be blank!', mtERROR, [mbOK], 0);
    Exit;
  end;
  if (qProviderCommission.State = dsEdit) or (qProviderCommission.State = dsInsert) then
  begin
    if VarIsNull(qProviderCommission.FieldValues['product_id']) then
      qProviderCommission.FieldValues['product_id'] := ProductID;
    qProviderCommission.Post;
    DSProviderCommission.AutoEdit := False;
    SaveButton.Enabled := False;
  end;
  LoadOldContracts;
end;

//------------------------------------------------------------------------------

procedure TProviderCommissionForm.CloseButtonClick(Sender: TObject);

begin
  ProviderCommissionForm.Close;
end;

//------------------------------------------------------------------------------

procedure TProviderCommissionForm.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  if (qProviderCommission.State = dsEdit) or (qProviderCommission.State = dsInsert) then
  begin
    qProviderCommission.Cancel;
    DSProviderCommission.AutoEdit := False;
    qProviderCommission.Close;
  end;
end;

//------------------------------------------------------------------------------

procedure TProviderCommissionForm.EditButtonClick(Sender: TObject);

begin
  DSProviderCommission.AutoEdit := True;
  qProviderCommission.Edit;
  SaveButton.Enabled := True;
end;

//------------------------------------------------------------------------------

procedure TProviderCommissionForm.FormShow(Sender: TObject);

begin
  LoadCommissions;
  LoadOldContracts;
end;

//------------------------------------------------------------------------------

procedure TProviderCommissionForm.AddContractButtonClick(Sender: TObject);

begin
  DM.DB_POLMAN.Execute('INSERT INTO tbl_product_provider_commission (product_id, contract_date) VALUES('+IntToStr(ProductID)+ ', ' + AnsiQuotedStr(ReturnISODate(Date),'''')+')');
  LoadCommissions;
  LoadOldContracts;
  OldContractList.ItemIndex := OldContractList.IndexOf(DateToStr(Date));
  OldContractListClick(Self);
end;

//------------------------------------------------------------------------------

procedure TProviderCommissionForm.OldContractListClick(Sender: TObject);

begin
  if OldContractList.Count = 0 then Exit;
  qProviderCommission.Locate('contract_date', StrToDate(OldContractList.SelectedItem), []);
end;

//------------------------------------------------------------------------------

end.
