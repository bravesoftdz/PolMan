unit UArteinvestUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  ADODS, NixButton, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, RzPanel, ExtCtrls, mySQLDbTables, Registry;

type
  TArteinvestUserForm = class(TForm)
    RzPanel1: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    NewUserGridDBTableView1: TcxGridDBTableView;
    NewUserGridLevel1: TcxGridLevel;
    NewUserGrid: TcxGrid;
    RzGroupBox2: TRzGroupBox;
    ExistingUserGridDBTableView1: TcxGridDBTableView;
    ExistingUserGridLevel1: TcxGridLevel;
    ExistingUserGrid: TcxGrid;
    EditNewUserButton: TNixButton;
    DeleteNewUserButton: TNixButton;
    EditExistingUserButton: TNixButton;
    DeleteExistingUserButton: TNixButton;
    CloseButton: TNixButton;
    NewButton: TNixButton;
    dsNewUser: TDataSource;
    dsExistingUser: TDataSource;
    NewUserGridDBTableView1usr_login_name: TcxGridDBColumn;
    NewUserGridDBTableView1company: TcxGridDBColumn;
    NewUserGridDBTableView1first_name: TcxGridDBColumn;
    NewUserGridDBTableView1last_name: TcxGridDBColumn;
    NewUserGridDBTableView1address: TcxGridDBColumn;
    NewUserGridDBTableView1zip: TcxGridDBColumn;
    NewUserGridDBTableView1city: TcxGridDBColumn;
    NewUserGridDBTableView1country: TcxGridDBColumn;
    NewUserGridDBTableView1telephone: TcxGridDBColumn;
    NewUserGridDBTableView1email: TcxGridDBColumn;
    NewUserGridDBTableView1mobile: TcxGridDBColumn;
    ExistingUserGridDBTableView1usr_login_name: TcxGridDBColumn;
    ExistingUserGridDBTableView1broker_id: TcxGridDBColumn;
    ExistingUserGridDBTableView1last_login: TcxGridDBColumn;
    ExistingUserGridDBTableView1company: TcxGridDBColumn;
    ExistingUserGridDBTableView1first_name: TcxGridDBColumn;
    ExistingUserGridDBTableView1last_name: TcxGridDBColumn;
    ExistingUserGridDBTableView1address: TcxGridDBColumn;
    ExistingUserGridDBTableView1zip: TcxGridDBColumn;
    ExistingUserGridDBTableView1city: TcxGridDBColumn;
    ExistingUserGridDBTableView1country: TcxGridDBColumn;
    ExistingUserGridDBTableView1telephone: TcxGridDBColumn;
    ExistingUserGridDBTableView1email: TcxGridDBColumn;
    DB_Arteinvest: TmySQLDatabase;
    tNewUser: TmySQLTable;
    tExistingUser: TmySQLTable;
    function ConnectDatabase : Boolean;
    procedure FormShow(Sender: TObject);
    procedure NewUserGridDBTableView1DblClick(Sender: TObject);
    procedure ExistingUserGridDBTableView1DblClick(Sender: TObject);
    procedure DeleteNewUserButtonClick(Sender: TObject);
    procedure DeleteExistingUserButtonClick(Sender: TObject);
    procedure EditExistingUserButtonClick(Sender: TObject);
    procedure EditNewUserButtonClick(Sender: TObject);
    procedure NewButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ArteinvestUserForm: TArteinvestUserForm;

implementation

uses
UArteInvestUserEdit;
{$R *.dfm}

//------------------------------------------------------------------------------

function TArteinvestUserForm.ConnectDatabase : Boolean;

var
EBNReg : TRegistry;
CatStr, DBStr, UserStr, PwdStr : String;

begin
  Result := True;
  try
    EBNReg :=  TRegistry.Create;
    with EBNReg do
    begin
      RootKey := HKEY_LOCAL_MACHINE;
      if not KeyExists('SOFTWARE\EBN\POLICY MANAGER\Arteinvest Online') then
      begin
        MessageDlg('Registry Entry for Arteinvest Online is missing! Terminating...', mtERROR, [mbOK], 0);
        Result := False;
        Exit;
      end;
      OpenKeyReadOnly('SOFTWARE\EBN\POLICY MANAGER\Arteinvest Online');
      CatStr := ReadString('Catalog');
      if (CatStr = '') then
      begin
        MessageDlg('Registry Entry for Arteinvest Catalog is wrong! Terminating...', mtERROR, [mbOK], 0);
        Result := False;
        Exit;
      end;
      DBStr := ReadString('DB Server');
      if (DBStr = '') then
      begin
        MessageDlg('Registry Entry for Arteinvest DB Server is wrong! Terminating...', mtERROR, [mbOK], 0);
        Result := False;
        Exit;
      end;
      UserStr := ReadString('DB User');
      if (UserStr = '') then
      begin
        MessageDlg('Registry Entry for Arteinvest DB User is wrong! Terminating...', mtERROR, [mbOK], 0);
        Result := False;
        Exit;
      end;
      PwdStr := ReadString('DB User Password');
      //if (PwdStr = '') then
      //begin
        //MessageDlg('Registry Entry for Arteinvest DB User Password is wrong! Terminating...', mtERROR, [mbOK], 0);
        //Result := False;
        //Exit;
      //end;
    end;
  finally
    EBNReg.Free;
  end;
  // try connect db
  try
    Screen.Cursor := crsqlWait;
    DB_ArteInvest.DatabaseName := CatStr;
    DB_ArteInvest.Host := DBStr;
    DB_ArteInvest.UserName := UserStr;
    DB_ArteInvest.UserPassword := PwdStr;
    DB_ArteInvest.Connected := True;
  except
    MessageDlg('An error occured while trying to connect to the database! Terminating...', mtERROR, [mbOK], 0);
    Application.Terminate;
    Screen.Cursor := crDefault;
    Result := False;
  end;
  Screen.Cursor := crDefault;
end;

//------------------------------------------------------------------------------

procedure TArteinvestUserForm.FormShow(Sender: TObject);

begin
  if not ConnectDatabase then
  begin
    MessageDlg('Unable to connect to database!', mtERROR, [mbOK], 0);
    Exit;
  end;
  tNewUser.Open;
  tExistingUser.Open;
end;

//------------------------------------------------------------------------------

procedure TArteinvestUserForm.NewUserGridDBTableView1DblClick(Sender: TObject);

begin
  ArteInvestUserEditForm.BrokerID.Value := 0;
  ArteInvestUserEditForm.WebLogin.Text := tNewUser.FieldValues['usr_login_name'];
  ArteInvestUserEditForm.CompanyName.Text := tNewUser.FieldValues['company'];
  ArteInvestUserEditForm.FirstName.Text := tNewUser.FieldValues['first_name'];
  ArteInvestUserEditForm.LastName.Text := tNewUser.FieldValues['last_name'];
  ArteInvestUserEditForm.Address.Text := tNewUser.FieldValues['address'];
  ArteInvestUserEditForm.Zip.Text := tNewUser.FieldValues['zip'];
  ArteInvestUserEditForm.City.Text := tNewUser.FieldValues['city'];
  ArteInvestUserEditForm.Country.Text := tNewUser.FieldValues['country'];
  ArteInvestUserEditForm.EMail.Text := tNewUser.FieldValues['email'];
  ArteInvestUserEditForm.Phone.Text := tNewUser.FieldValues['telephone'];
  ArteInvestUserEditForm.GSM.Text := tNewUser.FieldValues['mobile'];
  ArteInvestUserEditForm.UserID :=  tNewUser.FieldValues['usr_id'];
  ArteInvestUserEditForm.ThePassword := tNewUser.FieldValues['usr_pwd'];
  ArteInvestUserEditForm.NewUser := True;
  ArteInvestUserEditForm.AddingUser := False;
  ArteInvestUserEditForm.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TArteinvestUserForm.ExistingUserGridDBTableView1DblClick(Sender: TObject);

begin
  ArteInvestUserEditForm.BrokerID.Value := tExistingUser.FieldValues['broker_id'];
  ArteInvestUserEditForm.WebLogin.Text := tExistingUser.FieldValues['usr_login_name'];
  if (tExistingUser.FieldValues['company'] <> NULL) then
    ArteInvestUserEditForm.CompanyName.Text := tExistingUser.FieldValues['company'];
  ArteInvestUserEditForm.FirstName.Text := tExistingUser.FieldValues['first_name'];
  ArteInvestUserEditForm.LastName.Text := tExistingUser.FieldValues['last_name'];
  ArteInvestUserEditForm.Address.Text := tExistingUser.FieldValues['address'];
  ArteInvestUserEditForm.Zip.Text := tExistingUser.FieldValues['zip'];
  ArteInvestUserEditForm.City.Text := tExistingUser.FieldValues['city'];
  ArteInvestUserEditForm.Country.Text := tExistingUser.FieldValues['country'];
  ArteInvestUserEditForm.EMail.Text := tExistingUser.FieldValues['email'];
  ArteInvestUserEditForm.Phone.Text := tExistingUser.FieldValues['telephone'];
  if (tExistingUser.FieldValues['mobile'] <> NULL) then
    ArteInvestUserEditForm.GSM.Text := tExistingUser.FieldValues['mobile'];
  ArteInvestUserEditForm.CanBuyArt.Checked := (tExistingUser.FieldValues['security_level'] = 1);
  ArteInvestUserEditForm.UserID :=  tExistingUser.FieldValues['usr_id'];
  ArteInvestUserEditForm.ThePassword := tExistingUser.FieldValues['usr_pwd'];
  ArteInvestUserEditForm.NewUser := False;
  ArteInvestUserEditForm.AddingUser := False;
  ArteInvestUserEditForm.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TArteinvestUserForm.DeleteNewUserButtonClick(Sender: TObject);

begin
  if (tNewUser.RecordCount = 0) then Exit;
  if (MessageDlg('This will delete the currect selected user! Continue?',  mtCONFIRMATION, [mbYes, mbNo], 0) = mrYes) then
  begin
    tNewUser.Delete;
    tNewUser.Refresh;
  end;
end;

//------------------------------------------------------------------------------

procedure TArteinvestUserForm.DeleteExistingUserButtonClick(Sender: TObject);

begin
  if (tExistingUser.RecordCount = 0) then Exit;
  if (MessageDlg('This will delete the currect selected user! Continue?',  mtCONFIRMATION, [mbYes, mbNo], 0) = mrYes) then
  begin
    tExistingUser.Delete;
    tExistingUser.Refresh;
  end;
end;

//------------------------------------------------------------------------------

procedure TArteinvestUserForm.EditExistingUserButtonClick(Sender: TObject);

begin
  if (tExistingUser.RecordCount = 0) then Exit;
  ExistingUserGridDBTableView1DblClick(Self);
end;

//------------------------------------------------------------------------------

procedure TArteinvestUserForm.EditNewUserButtonClick(Sender: TObject);

begin
  if (tNewUser.RecordCount = 0) then Exit;
  NewUserGridDBTableView1DblClick(Self);
end;

//------------------------------------------------------------------------------

procedure TArteinvestUserForm.NewButtonClick(Sender: TObject);

begin
  ArteInvestUserEditForm.AddingUser := True;
  ArteInvestUserEditForm.NewUser := False;
  ArteInvestUserEditForm.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TArteinvestUserForm.CloseButtonClick(Sender: TObject);

begin
  ArteinvestUserForm.Close;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

end.
