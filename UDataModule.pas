unit UDataModule;

interface

uses
  SysUtils, Classes, DB, ADODB, Settings;

type
  TDM = class(TDataModule)
    DB_POLMAN: TADOConnection;
  private
    { Private declarations }
    FSettings: IXMLSettingsType;
  public
    { Public declarations }
    property Settings: IXMLSettingsType read FSettings write FSettings;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
