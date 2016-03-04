program PMAN;

uses
  Forms,
  UMain in 'UMain.pas' {MainForm},
  UBroker in 'UBroker.pas' {BrokerForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TBrokerForm, BrokerForm);
  Application.Run;
end.
