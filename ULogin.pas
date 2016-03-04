unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, ExtCtrls, RzPanel, RzButton, RzRadChk,
  RzLabel, RzCmboBx, Settings;

type
  TLoginForm = class(TForm)
    pnlClient: TPanel;
    cbConnect: TRzComboBox;
    lblConnectTo: TRzLabel;
    chUseWindowsAuth: TRzCheckBox;
    pnlUserPassword: TRzPanel;
    lblLogin: TRzLabel;
    RzLabel2: TRzLabel;
    edLogin: TRzEdit;
    edPassword: TRzEdit;
    chSavePassword: TRzCheckBox;
    pnlButtons: TRzPanel;
    btnCancel: TRzBitBtn;
    btnOk: TRzBitBtn;
    chAutoLogin: TRzCheckBox;
    procedure chUseWindowsAuthClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbConnectChange(Sender: TObject);
  private
    { Private declarations }

    FConnectionCount: Integer;
    FDatabase: String;
    FServer: String;
    FName: String;
    FList: TStringList;
    FDefaultIndex: Integer;
    FAutoLogin: Boolean;
  public
    { Public declarations }
    property ConnectionCount: Integer read FConnectionCount write FConnectionCount;
    property Database: String read FDatabase write FDatabase;
    property Server: String read FServer write FServer;
    property Name: String read FName write FName;
    property DefaultIndex: Integer read FDefaultIndex write FDefaultIndex;
    property AutoLogin: Boolean read FAutoLogin write FAutoLogin;
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.dfm}

uses tbj_utils, UDataModule{, IniFiles,};

procedure TLoginForm.chUseWindowsAuthClick(Sender: TObject);
begin
  pnlUserPassword.Enabled := not chUseWindowsAuth.Checked;
end;

procedure TLoginForm.btnOkClick(Sender: TObject);
//  var
//    IniFile : TIniFile;
begin
  try

    if cbConnect.ItemIndex = -1 then
    begin
      MessageDlg('Select connection, please.', mtERROR, [mbOK], 0);
      cbConnect.SetFocus;
      Exit;
    end;

    if not chUseWindowsAuth.Checked then
      DM.DB_POLMAN.ConnectionString := 'Provider=SQLOLEDB.1;Password=' + edPassword.Text + ';Persist Security Info=True;User ID=' + edLogin.Text + ';Initial Catalog=' + FDatabase +';Data Source=' + FServer +';Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False'
    else
      DM.DB_POLMAN.ConnectionString := 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=' + FDatabase +';Data Source=' + FServer;

    DM.DB_POLMAN.Connected := True;

//    IniFile :=  TIniFile.Create( IncludeTrailingPathDelimiter( ExtractFilePath(ParamStr(0))) + 'PolMan.ini' );
    try

//      IniFile.WriteInteger('Connection','DefaultConnection',cbConnect.ItemIndex);
//      IniFile.WriteInteger('Connection','WindowsAuthentication',Integer(chUseWindowsAuth.Checked));
//      IniFile.WriteString('Connection','Login',edLogin.Text);
//      IniFile.WriteInteger('Connection','AutoLogin',Integer(chAutoLogin.Checked));

      DM.Settings.Connections.DefaultConnection := cbConnect.ItemIndex;
      DM.Settings.WindowsAuthentication := chUseWindowsAuth.Checked;
      DM.Settings.Login := edLogin.Text;
      DM.Settings.AutoLogin := chAutoLogin.Checked;

      FName := DM.Settings.Connections.Connection[cbConnect.ItemIndex].Name;

      FAutoLogin := chAutoLogin.Checked;
      
      if chSavePassword.Checked then
//        IniFile.WriteString('Connection','Password', ConvertConvert(edPassword.Text));
      DM.Settings.Password := ConvertConvert(edPassword.Text);

    finally
//      IniFile.Free;
    end;

    ModalResult := mrOk;

  except
    on E: Exception do
    begin
      pnlClient.Enabled := True;
      if not pnlUserPassword.Visible then
      begin
        chUseWindowsAuth.Visible := True;
        pnlUserPassword.Visible := True;
        MessageDlg('An error occured while trying to connect to the Connection! Try to authenticate...', mtERROR, [mbOK], 0);
      end
      else
      begin
        MessageDlg('An error occured while trying to connect to the Connection! Reason: ' + E.Message, mtERROR, [mbOK], 0);      
      end;
    end;
  end;
end;

procedure TLoginForm.FormCreate(Sender: TObject);
  var
//    IniFile : TIniFile;
    pass: String;
    i: Integer;
    s: String;
begin
  FList := TStringList.Create;
  FServer := '';
  FDatabase := '';
  FConnectionCount := 0;

//  IniFile :=  TIniFile.Create( IncludeTrailingPathDelimiter( ExtractFilePath(ParamStr(0))) + 'PolMan.ini' );
  try

//    FConnectionCount := IniFile.ReadInteger('ConnectionList','ItemCount',0);
    FConnectionCount := DM.Settings.Connections.Count;
    if FConnectionCount = 0 then Exit;

//    Split(';', FConnectionString, FList);
//    for i := 0 to FList.Count - 1 do
    for i := 0 to FConnectionCount - 1 do
    begin
//      s := IniFile.ReadString('ConnectionList','Item' + IntToStr(i),'');
      s := DM.Settings.Connections.Connection[i].Server + '|' +
           DM.Settings.Connections.Connection[i].Database;
      if s <> '' then
        cbConnect.Items.Add(s);
    end;

//    cbConnect.ItemIndex := IniFile.ReadInteger('Connection','DefaultConnection',-1);;
    cbConnect.ItemIndex := DM.Settings.Connections.DefaultConnection;
    cbConnectChange(nil);

//    chUseWindowsAuth.Checked := Boolean(IniFile.ReadInteger('Connection','WindowsAuthentication',0));
    chUseWindowsAuth.Checked := DM.Settings.WindowsAuthentication;

//    edLogin.Text := IniFile.ReadString('Connection','Login','db_user');
    edLogin.Text := DM.Settings.Login;

//    pass := IniFile.ReadString('Connection','Password','');
    pass := DM.Settings.Password;

    if pass = '' then
      edPassword.Text := 'labello'
    else
      edPassword.Text := ReConvertConvert(pass);

//    chAutoLogin.Checked := Boolean(IniFile.ReadInteger('Connection','AutoLogin',0));
    chAutoLogin.Checked := DM.Settings.AutoLogin;

  finally
//    IniFile.Free;
  end;

end;

procedure TLoginForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FList);
end;

procedure TLoginForm.cbConnectChange(Sender: TObject);
begin
  FList.Clear;
  FServer := '';
  FDatabase := '';
  if Trim(cbConnect.Text) <> '' then
  begin
    try
      Split('|', cbConnect.Text, FList);
      FServer := FList[0];
      FDatabase := FList[1];
    except
    end;
  end;
end;

end.
