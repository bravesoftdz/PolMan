unit UArteinvestPicture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NixButton, ExtCtrls, RzPanel, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, mySQLDbTables, Registry;

type
  TArteInvestPictureForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    CloseButton: TNixButton;
    DeleteButton: TNixButton;
    EditButton: TNixButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DB_Arteinvest: TmySQLDatabase;
    tPictures: TmySQLTable;
    dsPictures: TDataSource;
    RzPanel1: TRzPanel;
    qPictures: TmySQLQuery;
    cxGrid1DBTableView1picture_id: TcxGridDBColumn;
    cxGrid1DBTableView1artist_name: TcxGridDBColumn;
    cxGrid1DBTableView1technique: TcxGridDBColumn;
    cxGrid1DBTableView1picture_title: TcxGridDBColumn;
    cxGrid1DBTableView1picture_year: TcxGridDBColumn;
    cxGrid1DBTableView1picture_width: TcxGridDBColumn;
    cxGrid1DBTableView1picture_height: TcxGridDBColumn;
    cxGrid1DBTableView1picture_price: TcxGridDBColumn;
    cxGrid1DBTableView1reserved_until: TcxGridDBColumn;
    cxGrid1DBTableView1reserved_by: TcxGridDBColumn;
    cxGrid1DBTableView1bought_at: TcxGridDBColumn;
    cxGrid1DBTableView1bought_by: TcxGridDBColumn;
    qUpdatePictures: TmySQLUpdateSQL;
    function ConnectDatabase : Boolean;
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ArteInvestPictureForm: TArteInvestPictureForm;

implementation

uses UArteinvestPictureEdit;

{$R *.dfm}

//------------------------------------------------------------------------------

function TArteinvestPictureForm.ConnectDatabase : Boolean;

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

procedure TArteInvestPictureForm.FormShow(Sender: TObject);
begin
  if not ConnectDatabase then
  begin
    MessageDlg('Unable to connect to database!', mtERROR, [mbOK], 0);
    Exit;
  end;
  qPictures.Open;
  tPictures.Open;
end;

//------------------------------------------------------------------------------

procedure TArteInvestPictureForm.cxGrid1DBTableView1DblClick(Sender: TObject);

begin
  ArteInvestPictureEditForm.Title.Text := qPictures.FieldValues['picture_title'];
  ArteInvestPictureEditForm.Year.Value := qPictures.FieldValues['picture_year'];
  ArteInvestPictureEditForm.Width.Value := qPictures.FieldValues['picture_width'];
  ArteInvestPictureEditForm.Height.Value := qPictures.FieldValues['picture_height'];
  ArteInvestPictureEditForm.Price.Value := qPictures.FieldValues['picture_price'];
  if (qPictures.FieldValues['reserved_until'] <> NULL) then
    ArteInvestPictureEditForm.ReservedUntil.Text := DateTimeToStr(qPictures.FieldValues['reserved_until']);
  if (qPictures.FieldValues['reserved_by'] <> NULL) then
  ArteInvestPictureEditForm.ReservedBy.Value := qPictures.FieldValues['reserved_by'];
  if (qPictures.FieldValues['bought_at'] <> NULL) then
    ArteInvestPictureEditForm.Bought.Text := DateTimeToStr(qPictures.FieldValues['bought_at']);
  if (qPictures.FieldValues['bought_by'] <> NULL) then
    ArteInvestPictureEditForm.BoughtBy.Value := qPictures.FieldValues['bought_by'];
  ArteInvestPictureEditForm.Caption := 'Art€Invest Picture ID ' + IntToStr(qPictures.FieldValues['picture_id']);
  ArteInvestPictureEditForm.PictureID := qPictures.FieldValues['picture_id'];
  ArteInvestPictureEditForm.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TArteInvestPictureForm.CloseButtonClick(Sender: TObject);

begin
  ArteInvestPictureForm.Close;
end;

//------------------------------------------------------------------------------

procedure TArteInvestPictureForm.EditButtonClick(Sender: TObject);

begin
  cxGrid1DBTableView1DblClick(Self);
end;

//------------------------------------------------------------------------------

procedure TArteInvestPictureForm.DeleteButtonClick(Sender: TObject);

begin
  if (tPictures.RecordCount = 0) then Exit;
  if (MessageDlg('This will delete the currect selected picture! Continue?',  mtCONFIRMATION, [mbYes, mbNo], 0) = mrYes) then
  begin
    tPictures.Delete;
    tPictures.Refresh;
  end;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
end.
