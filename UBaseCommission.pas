unit UBaseCommission;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzTabs, ExtCtrls, RzPanel, DBCtrls, RzDBCmbo, StdCtrls, RzLabel,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, DB,
  cxDBData, {ADODS,} RzCmboBx, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, RzRadGrp, RzEdit, RzButton, Mask, RzDBEdit, ADODB;

type
  TBaseCommissionForm = class(TForm)
    RzPanel1: TRzPanel;
    qRates: TADOQuery;
    DSRates: TDataSource;
    CommScheme: TRzRadioGroup;
    qVolumeLevel: TADOQuery;
    qRateCheck: TADOQuery;
    RzGroupBox1: TRzGroupBox;
    qContractDate: TADOQuery;
    ContractDate: TRzComboBox;
    EditButton: TRzButton;
    SaveButton: TRzButton;
    CloseButton: TRzButton;
    RzGroupBox2: TRzGroupBox;
    CommLevel: TRzComboBox;
    RzGroupBox4: TRzGroupBox;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBNumericEdit2: TRzDBNumericEdit;
    RzDBNumericEdit3: TRzDBNumericEdit;
    RzDBNumericEdit4: TRzDBNumericEdit;
    RzDBNumericEdit5: TRzDBNumericEdit;
    RzDBNumericEdit6: TRzDBNumericEdit;
    RzDBNumericEdit7: TRzDBNumericEdit;
    RzDBNumericEdit8: TRzDBNumericEdit;
    RzDBNumericEdit9: TRzDBNumericEdit;
    RzDBNumericEdit10: TRzDBNumericEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzDBNumericEdit11: TRzDBNumericEdit;
    RzDBNumericEdit12: TRzDBNumericEdit;
    RzDBNumericEdit13: TRzDBNumericEdit;
    RzDBNumericEdit14: TRzDBNumericEdit;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzGroupBox5: TRzGroupBox;
    VolumeLevel: TRzComboBox;
    RzButton5: TRzButton;
    RzButton6: TRzButton;
    procedure LoadVolumeLevels;
    procedure AddVolumeLevel;
    procedure RemoveVolumeLevel;
    function CheckRates : Byte;
    function LoadRates : Boolean;
    procedure VolumeLevelCloseUp(Sender: TObject);
    procedure CommSchemeChanging(Sender: TObject; NewIndex: Integer; var AllowChange: Boolean);
    procedure CommLevelChanging(Sender: TObject; NewIndex: Integer; var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
    procedure AddLevelButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    function LoadContractDates : Boolean;
    procedure ContractDateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CommLevelChange(Sender: TObject);
  private
    { Private declarations }
  public
    ProductID : Integer;
  end;

var
  BaseCommissionForm: TBaseCommissionForm;
  VLevel, CLevel : Integer;
  CScheme : Byte;
  FormShowing : Boolean;

implementation

{$R *.dfm}
uses
UMain, tbj_utils, UDataModule;

//------------------------------------------------------------------------------

procedure TBaseCommissionForm.LoadVolumeLevels;

begin
  VolumeLevel.Clear;
  with qVolumeLevel do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT volume_level FROM tbl_broker_base_commission WHERE product_id = ' + IntToStr(ProductID) + ' ORDER BY volume_level');
    Open;
    if (RecordCount > 0) then
    begin
      First;
      while not EOF do
      begin
        VolumeLevel.Add(IntToStr(FieldValues['volume_level']));
        Next;
      end;
    end;
  end;

end;

//------------------------------------------------------------------------------

procedure TBaseCommissionForm.AddVolumeLevel;

var
IntLevel, i : Integer;
NewLevel : String;

begin
  if InputQuery('Add Volume Level', 'Enter new Level', NewLevel) then
  begin
    try
      IntLevel := StrToInt(NewLevel);
    except
      MessageDlg('Not a valid Integer!', mtERROR, [mbOK], 0);
      Exit;
    end;
    if VolumeLevel.FindItem(NewLevel) then
    begin
      MessageDlg('This level already exists!', mtERROR, [mbOK], 0);
      Exit;
    end;
    //for i := 1 to 5 do
    //  MainForm.DB_POLMAN.ExecSQL('INSERT INTO tbl_broker_base_commission (comm_level, product_id, volume_level, comm_year) VALUES('+ IntToStr(CLevel) + ',' + IntToStr(ProductID) + ',' + NewLevel + ',' + IntToStr(i) + ')');
    VolumeLevel.Add(NewLevel);
  end;
end;

//------------------------------------------------------------------------------

procedure TBaseCommissionForm.RemoveVolumeLevel;

begin

end;

//------------------------------------------------------------------------------

function TBaseCommissionForm.CheckRates : Byte;

begin
  with qRateCheck do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT count(comm_id) AS countrec FROM tbl_broker_base_commission WHERE product_id = ' + IntToStr(ProductID));
    Open;
    if FieldValues['countrec'] = 0 then
    begin
      Close;
      Result := 0; //new
      Exit;
    end;
    Close;
    SQL.Clear;
    SQL.Add('SELECT max(volume_level) AS maxvol FROM tbl_broker_base_commission WHERE product_id = ' + IntToStr(ProductID));
    Open;
    if FieldValues['maxvol'] = 0 then
      Result := 1 //simple scheme
    else
      Result := 2; //volume based scheme
    Close;
  end;
end;

//------------------------------------------------------------------------------

function TBaseCommissionForm.LoadRates : Boolean;

begin
  Result := True;
  with qRates do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tbl_broker_base_commission WHERE product_id = ' + IntToStr(ProductID));
    SQL.Add('AND comm_level = ' + IntToStr(CLevel) + ' AND volume_level = ' + IntToStr(VLevel) + ' AND contract_date = convert(datetime, ' + AnsiQuotedStr(Contractdate.Text,'''') + ', 103)');
    Open;
    Result := (RecordCount <> 0);
  end;
end;

//------------------------------------------------------------------------------

procedure TBaseCommissionForm.VolumeLevelCloseUp(Sender: TObject);

begin
  if VolumeLevel.Count = 0 then Exit;
  VLevel := StrToInt(VolumeLevel.Items[VolumeLevel.ItemIndex]);
  if ContractDate.Text <> '' then
    LoadRates;
end;

//------------------------------------------------------------------------------

procedure TBaseCommissionForm.CommSchemeChanging(Sender: TObject; NewIndex: Integer; var AllowChange: Boolean);

begin
  if not FormShowing then
  begin
    if (CScheme <> NewIndex) then  //check if we already have added values in another scheme
      if not (CheckRates = 0) then   //before allowing/warning the user about that
      begin
        if (MessageDlg('Data exists for another commission scheme! If you continue these will be deleted. Continue?', mtCONFIRMATION, [mbYes, mbNo], 0) = mrYes) then
          DM.DB_POLMAN.Execute('DELETE FROM tbl_broker_base_commission WHERE product_id = ' + IntToStr(ProductID))
        else
        begin
          AllowChange := False;
          Exit;
        end;
      end;
  end;
  CScheme := NewIndex;
  //LevelPanel.Enabled := CScheme = 1;
  if ContractDate.Text <> '' then
    LoadRates;
end;

//------------------------------------------------------------------------------

procedure TBaseCommissionForm.CommLevelChanging(Sender: TObject; NewIndex: Integer; var AllowChange: Boolean);

begin
  CLevel := NewIndex + 1;
  LoadRates;
end;

//------------------------------------------------------------------------------

procedure TBaseCommissionForm.FormShow(Sender: TObject);

var
RateCheck : Byte;

begin
  FormShowing := True;
  RateCheck := CheckRates;
  case RateCheck of
    0: begin CommScheme.ItemIndex := -1; CommLevel.ItemIndex := -1; end;
    1: begin CommScheme.ItemIndex := 0; CommLevel.ItemIndex := 0; end;
    2: begin CommScheme.ItemIndex := 1; CommLevel.ItemIndex := 0; LoadVolumeLevels; VolumeLevel.ItemIndex := 1; end; //of case
  end;
  if (RateCheck = 0) then
    CommScheme.Enabled := True
  else
  LoadRates;
  FormShowing := False;

  if VolumeLevel.Count > 0 then
  begin
    VolumeLevel.ItemIndex := 0;
    VolumeLevel.OnCloseUp(Self);
  end;
end;

//------------------------------------------------------------------------------

procedure TBaseCommissionForm.AddLevelButtonClick(Sender: TObject);

begin
  AddVolumeLevel;
end;

//------------------------------------------------------------------------------

procedure TBaseCommissionForm.CloseButtonClick(Sender: TObject);

begin
  SaveButton.Enabled := False;
  if (qRates.State = dsEdit) or (qRates.State = dsInsert) then
    qRates.Cancel;
  qRates.Close;
  BaseCommissionForm.Close;
end;

//------------------------------------------------------------------------------

procedure TBaseCommissionForm.EditButtonClick(Sender: TObject);

var
i : Integer;

begin
  if (CommScheme.ItemIndex = -1) or (CommLevel.ItemIndex = -1) or (ContractDate.Text = '') then
  begin
    MessageDlg('Commission Scheme, Level and Contract must be selected before editing!', mtINFORMATION, [mbOK], 0);
    Exit;
  end;
  if (qRates.RecordCount = 0) then //new
  begin
    case CScheme of
      0 : for i := 1 to 5 do DM.DB_POLMAN.Execute('INSERT INTO tbl_broker_base_commission (comm_level, product_id, volume_level, comm_year, contract_date) VALUES('+ IntToStr(CLevel) + ',' + IntToStr(ProductID) + ',0 ,' + IntToStr(i) + ',' + AnsiQuotedStr(ReturnISODate(StrToDate(ContractDate.Text)),'''') + ')');
      1 : begin
            if VolumeLevel.Text = '' then
            begin
              MessageDlg('Please select (or add a new) volume level first!', mtINFORMATION, [mbOK], 0);
              Exit;
            end;
            for i := 1 to 5 do DM.DB_POLMAN.Execute('INSERT INTO tbl_broker_base_commission (comm_level, product_id, volume_level, comm_year, contract_date) VALUES('+ IntToStr(CLevel) + ',' + IntToStr(ProductID) + ',' + VolumeLevel.Text + ',' + IntToStr(i) + ',' + AnsiQuotedStr(ReturnISODate(StrToDate(ContractDate.Text)),'''') + ')');
          end;
    end; //of case
    LoadRates;
  end;
  //MainForm.DB_POLMAN.ExecSQL('BEGIN TRANSACTION');
  qRates.Edit;
  DSRates.AutoEdit := True;
  SaveButton.Enabled := True;
  CommScheme.Enabled := True;
  //CommLevel.Enabled := True;
end;

//------------------------------------------------------------------------------

procedure TBaseCommissionForm.SaveButtonClick(Sender: TObject);

begin
  //MainForm.DB_POLMAN.ExecSQL('COMMIT TRANSACTION');
  if (qRates.State = dsEdit) or (qRates.State = dsInsert) then
    qRates.Post;
  SaveButton.Enabled := False;
  DSRates.AutoEdit := False;
  CommScheme.Enabled := False;
  //CommLevel.Enabled := False;
end;

//------------------------------------------------------------------------------

function TBaseCommissionForm.LoadContractDates : Boolean;

begin
  Result := True;
  ContractDate.Items.Clear;
  with qContractDate do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT contract_date from tbl_product_provider_commission WHERE product_id = ' + IntToStr(ProductID));
    SQL.Add('ORDER BY contract_date DESC');
    Open;
    if (RecordCount = 0) then
    begin
      Result := False;
      Close;
      Exit;
    end;
    First;
    while not EOF do
    begin
      ContractDate.Items.Add(DateToStr(FieldValues['contract_date']));
      Next;
    end;
  end;
  ContractDate.ItemIndex := 0;
end;

//------------------------------------------------------------------------------

procedure TBaseCommissionForm.ContractDateChange(Sender: TObject);

begin
  LoadRates;
end;

//------------------------------------------------------------------------------

procedure TBaseCommissionForm.FormClose(Sender: TObject; var Action: TCloseAction);

begin

end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TBaseCommissionForm.CommLevelChange(Sender: TObject);

begin
  //showmessage(inttostr(CommLevel.ItemIndex));
  CLevel := CommLevel.ItemIndex + 1;
  LoadRates;
end;

end.

