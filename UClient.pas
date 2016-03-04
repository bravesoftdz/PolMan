unit UClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, RzDBCmbo, StdCtrls, Mask, RzEdit, RzDBEdit, ExtCtrls,
  RzPanel, ComCtrls, RzButton, RzRadChk, RzDBChk, DB, {ADODS, }RzLstBox,
  ADODB;

type
  TClientForm = class(TForm)
    ClientPanel: TRzPanel;
    Label19: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    RzDBNumericEdit2: TRzDBNumericEdit;
    RzDBEdit12: TRzDBEdit;
    RzDBEdit13: TRzDBEdit;
    RzDBEdit14: TRzDBEdit;
    RzDBEdit15: TRzDBEdit;
    RzDBEdit16: TRzDBEdit;
    RzDBEdit17: TRzDBEdit;
    RzDBLookupComboBox8: TRzDBLookupComboBox;
    RzDBEdit18: TRzDBEdit;
    RzDBEdit19: TRzDBEdit;
    RzDBEdit20: TRzDBEdit;
    RzDBLookupComboBox9: TRzDBLookupComboBox;
    RzDBLookupComboBox10: TRzDBLookupComboBox;
    RzDBLookupComboBox11: TRzDBLookupComboBox;
    RzDBLookupComboBox12: TRzDBLookupComboBox;
    RzDBEdit21: TRzDBEdit;
    RzDBLookupComboBox13: TRzDBLookupComboBox;
    RzDBLookupComboBox14: TRzDBLookupComboBox;
    RzDBEdit22: TRzDBEdit;
    RzDBCheckBox2: TRzDBCheckBox;
    RzDBRichEdit3: TRzDBRichEdit;
    RzDBRichEdit4: TRzDBRichEdit;
    Label44: TLabel;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBNumericEdit3: TRzDBNumericEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RzDBEdit1: TRzDBEdit;
    Label4: TLabel;
    RzDBEdit2: TRzDBEdit;
    qClientInfo: TADOQuery;
    DSClientInfo: TDataSource;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    Label5: TLabel;
    ClientPolicyList: TRzListBox;
    Label6: TLabel;
    qClientPolicyList: TADOQuery;
    DSClientPolicyList: TDataSource;
    RzButton1: TRzButton;
    EditClientInfoButton: TRzButton;
    SaveClientInfoButton: TRzButton;
    DeleteButton: TRzButton;
    CloseButton: TRzButton;
    procedure LoadPolicy(PolicyNumber : String);
    procedure LoadClientPolicyList(CID : Integer);
    procedure FormShow(Sender: TObject);
    procedure GetClientInfo;
    procedure EditClientInfoButtonClick(Sender: TObject);
    procedure SaveClientInfoButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DeleteButtonClick(Sender: TObject);
    procedure ClientPolicyListDblClick(Sender: TObject);
  private
    { Private declarations }
  public
     NewClient, CallFromPolicyForm, EditClientFromPolicy : Boolean;
     ClientID : Integer;
  end;

var
  ClientForm: TClientForm;



implementation


uses UMain, UPolicy, UDataModule;
{$R *.dfm}

//------------------------------------------------------------------------------

procedure TClientForm.LoadPolicy(PolicyNumber : String);

begin
  Exit; // code below - closing this form while opening another does not work
  with qClientPolicyList do
  begin
    Locate('pol_number', PolicyNumber, []);
    PolicyForm.PolicyID := FieldValues['pol_id'];
  end;
  ClientForm.Close;
  PolicyForm.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TClientForm.LoadClientPolicyList(CID : Integer);

var
SCID : String;

begin
  ClientPolicyList.Clear;
  SCID := IntToStr(CID);
  with qClientPolicyList do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT pol_id, pol_number, pol_date_begin FROM tbl_policy WHERE pol_client1_id = ' + SCID +
            ' OR pol_client2_id = ' + SCID + ' OR pol_life1_insured = '  + SCID + ' OR pol_life2_insured = '  + SCID +
            ' OR pol_life3_insured = '  + SCID + ' OR pol_life4_insured = '  + SCID +
            ' OR pol_life5_insured = '  + SCID + ' ORDER BY pol_date_begin DESC');
    Open;
    if (RecordCount = 0) then Exit;
    First;
    while not EOF do
    begin
      ClientPolicyList.Items.Add(FieldValues['pol_number']);
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TClientForm.FormShow(Sender: TObject);

begin
  if NewClient then
  begin
    ClientID := 0;  //appends a new record via GetClientInfo
    SaveClientInfoButton.Enabled := True;
  end
  else if not EditClientFromPolicy then
    ClientID := MainForm.qResult.FieldValues['client_id'];
  MainForm.qCountryNames.Open;
  MainForm.qProfStatus.Open;
  MainForm.qTitle1.Open;
  MainForm.qTitle2.Open;
  MainForm.qSex.Open;
  MainForm.qIDCard.Open;
  GetClientInfo;
  LoadClientPolicyList(ClientID);
end;

//------------------------------------------------------------------------------

procedure TClientForm.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  MainForm.qCountryNames.Close;
  MainForm.qProfStatus.Close;
  MainForm.qTitle1.Close;
  MainForm.qTitle2.Close;
  MainForm.qSex.Close;
  MainForm.qIDCard.Close;
  qClientInfo.Close;
  qClientPolicyList.Close;
  SaveClientInfoButton.Enabled := False;
  EditClientFromPolicy := False;
end;

//------------------------------------------------------------------------------

procedure TClientForm.GetClientInfo;

begin
  with qClientInfo do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_client WHERE client_id = ' + IntToStr(ClientID));
    Open;
    if (Recordcount = 0) then
    begin
      Append;
      Post;
      Edit;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TClientForm.EditClientInfoButtonClick(Sender: TObject);

begin
  DSClientInfo.AutoEdit := True;
  SaveClientInfoButton.Enabled := True;
end;

//------------------------------------------------------------------------------

procedure TClientForm.SaveClientInfoButtonClick(Sender: TObject);

begin
  if (qClientInfo.State = dsEdit) or (qClientInfo.State = dsInsert) then
  begin
    qClientInfo.FieldValues['last_edit'] := Now;
    qClientInfo.Post;
    if CallFromPolicyForm then
    begin
      PolicyForm.NewClientID := qClientInfo.FieldValues['client_id'];
      CallFromPolicyForm := False;
    end;
    DSClientInfo.AutoEdit := False;
    ClientForm.Close;
  end
  else MessageDlg('Nothing to Save!', mtINFORMATION, [mbOK], 0);
  SaveClientInfoButton.Enabled := False;
end;

//------------------------------------------------------------------------------

procedure TClientForm.DeleteButtonClick(Sender: TObject);

begin
  if (qClientPolicyList.RecordCount > 0) then
  begin
    MessageDlg('There are policies associated with this client! You cannot delete the client as long as these policies exist in the system!', mtINFORMATION, [mbok], 0);
    Exit;    
  end;
  if (MessageDlg('This will delete the current selected client! Continue?', mtWARNING, [mbYes, mbNo], 0) = mrNo) then Exit;
  qClientInfo.Delete;
  MainForm.qResult.Refresh;
  MainForm.HeaderLabel.Caption := 'Clients [Current Selection = ' +IntToStr(MainForm.qResult.RecordCount)+ ']';
  ClientForm.Close;
end;

//------------------------------------------------------------------------------

procedure TClientForm.CloseButtonClick(Sender: TObject);

begin
  qClientInfo.Close;
  ClientForm.Close;
end;

//------------------------------------------------------------------------------

procedure TClientForm.ClientPolicyListDblClick(Sender: TObject);

begin
  LoadPolicy(ClientPolicyList.SelectedItem);
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
end.
