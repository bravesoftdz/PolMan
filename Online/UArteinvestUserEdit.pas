unit UArteinvestUserEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, ExtCtrls, RzPanel, RzLabel, NixButton,
  NixLabel, NixCheckBox, DB, mySQLDbTables;

type
  TArteinvestUserEditForm = class(TForm)
    RzPanel1: TRzPanel;
    BrokerID: TRzNumericEdit;
    WebLogin: TRzEdit;
    WebPassword: TRzEdit;
    CompanyName: TRzEdit;
    FirstName: TRzEdit;
    LastName: TRzEdit;
    Address: TRzEdit;
    ZIP: TRzEdit;
    City: TRzEdit;
    Country: TRzEdit;
    Email: TRzEdit;
    Phone: TRzEdit;
    GSM: TRzEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
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
    CloseButton: TNixButton;
    SaveButton: TNixButton;
    CanBuyArt: TNixCheckBox;
    NixLabel1: TNixLabel;
    qGetPassword: TmySQLQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function DataOK : Byte;
    procedure GetPassword;
    procedure SaveButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    NewUser, AddingUser : Boolean;

    UserID : Integer;
    ThePassword : String;
  end;


var
ArteinvestUserEditForm: TArteinvestUserEditForm;

implementation

{$R *.dfm}

uses
UArteinvestUser;

//------------------------------------------------------------------------------

procedure TArteinvestUserEditForm.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  BrokerID.Value := 0;
  WebLogin.Text := '';
  WebPassword.Text := '';
  CompanyName.Text := '';
  FirstName.Text := '';
  LastName.Text := '';
  Address.Text := '';
  Zip.Text := '';
  City.Text := '';
  Country.Text := '';
  EMail.Text := '';
  Phone.Text := '';
  GSM.Text := '';
  CanBuyArt.Checked := False;
end;

//------------------------------------------------------------------------------

function TArteinvestUserEditForm.DataOK : Byte;

begin
  Result := 0;
  if (BrokerID.Text = '') then begin Result := 1; Exit; end;
  if (WebLogin.Text = '') then begin Result := 1; Exit; end;
  if (FirstName.Text = '') then begin Result := 1; Exit; end;
  if (LastName.Text = '') then begin Result := 1; Exit; end;
  if (Address.Text = '') then begin Result := 1; Exit; end;
  if (Zip.Text = '') then begin Result := 1; Exit; end;
  if (City.Text = '') then begin Result := 1; Exit; end;
  if (Country.Text = '') then begin Result := 1; Exit; end;
  if (EMail.Text = '') then begin Result := 1; Exit; end;
  if (Phone.Text = '') then begin Result := 1; Exit; end;
  if NewUser and not CanBuyArt.Checked then begin Result := 2; Exit; end;
  if AddingUser and (WebPassword.Text = '') then begin Result := 3; Exit; end;
end;

//------------------------------------------------------------------------------

procedure TArteinvestUserEditForm.GetPassword;

begin
  with qGetPassword do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT PASSWORD("' + ThePassword + '") as password_password');
    Open;
    ThePassword := FieldValues['password_password'];
    Close;
  end;
end;

//------------------------------------------------------------------------------

procedure TArteinvestUserEditForm.SaveButtonClick(Sender: TObject);

var
DataOKReturnCode : Byte;
ErrorMessage : String;

begin
  DataOKReturnCode := DataOK;
  if (DataOKReturnCode = 0) then
  begin
    if NewUser or AddingUser then ArteInvestUserForm.tExistingUser.Append
      else ArteInvestUserForm.tExistingUser.Edit;
    ArteInvestUserForm.tExistingUser.FieldValues['broker_id'] := BrokerID.Value;
    ArteInvestUserForm.tExistingUser.FieldValues['usr_login_name'] := WebLogin.Text;
    if NewUser then
    begin
      GetPassword;
      ArteInvestUserForm.tExistingUser.FieldValues['usr_pwd'] := ThePassword;
    end;
    if AddingUser or (WebPassword.Text <> '') then
    begin
      ThePassword := WebPassword.Text;
      GetPassword;
      ArteInvestUserForm.tExistingUser.FieldValues['usr_pwd'] := ThePassword;
    end;
     ArteInvestUserForm.tExistingUser.FieldValues['company'] := CompanyName.Text;
    ArteInvestUserForm.tExistingUser.FieldValues['first_name'] := FirstName.Text;
    ArteInvestUserForm.tExistingUser.FieldValues['last_name'] := LastName.Text;
    ArteInvestUserForm.tExistingUser.FieldValues['address'] := Address.Text;
    ArteInvestUserForm.tExistingUser.FieldValues['zip'] := ZIP.Text;
    ArteInvestUserForm.tExistingUser.FieldValues['city'] := City.Text;
    ArteInvestUserForm.tExistingUser.FieldValues['country'] := Country.Text;
    ArteInvestUserForm.tExistingUser.FieldValues['telephone'] := Phone.Text;
    ArteInvestUserForm.tExistingUser.FieldValues['email'] := EMail.Text;
    ArteInvestUserForm.tExistingUser.FieldValues['mobile'] := GSM.Text;
    if CanBuyArt.Checked then
      ArteInvestUserForm.tExistingUser.FieldValues['security_level'] := 1
    else
      ArteInvestUserForm.tExistingUser.FieldValues['security_level'] := 0;
    ArteInvestUserForm.tExistingUser.Post;
    ArteInvestUserForm.tExistingUser.Refresh;
    // then remove info from temp table for new users (if new user)
    if NewUser then
    begin
      ArteInvestUserForm.DB_Arteinvest.Execute('DELETE FROM tbl_new_user_request WHERE usr_id = ' + IntToStr(UserID));
      ArteInvestUserForm.tNewUser.Refresh;
    end;
  end
  else
  begin
    case DataOKReturnCode of
      1: ErrorMessage := 'Only Company and GSM can be left empty - all other fields are mandatory!';
      2: ErrorMessage := 'You can only edit new users if they are allowed access to buying art!';
      3: ErrorMessage := 'You must supply a password when creating a new user!';
    end;  //of case
    MessageDlg(ErrorMessage, mtINFORMATION, [mbOK], 0);
  end;
end;

//------------------------------------------------------------------------------

procedure TArteinvestUserEditForm.CloseButtonClick(Sender: TObject);

begin
  ArteinvestUserEditForm.Close;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
end.
