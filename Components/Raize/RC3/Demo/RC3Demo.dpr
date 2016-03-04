program RC3Demo;

uses
  Forms,
  MainForm in 'MainForm.pas' {FrmMain};

{$R *.res}

begin
  Application.Title := 'Raize Components 3.0 Demo';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
