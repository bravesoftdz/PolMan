program PolMan;

uses
  Forms,
  UMain in 'UMain.pas' {MainForm},
  UBroker in 'UBroker.pas' {BrokerForm},
  UClient in 'UClient.pas' {ClientForm},
  UPicklist in 'UPicklist.pas' {PicklistForm},
  UPolicy in 'UPolicy.pas' {PolicyForm},
  UClientOption in 'UClientOption.pas' {ClientOptionForm},
  UProductProvider in 'UProductProvider.pas' {ProductProviderForm},
  UProduct in 'UProduct.pas' {ProductForm},
  UProviderCommission in 'UProviderCommission.pas' {ProviderCommissionForm},
  UBaseCommission in 'UBaseCommission.pas' {BaseCommissionForm},
  USelectOverride in 'USelectOverride.pas' {SelectOverrideForm},
  UCalcSingle in 'UCalcSingle.pas' {CalcSingleForm},
  tbj_utils in 'tbj_utils.pas',
  ULogin in 'ULogin.pas' {LoginForm},
  UDataModule in 'UDataModule.pas' {DM: TDataModule},
  Settings in 'Settings.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'EBN Policy Manager';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TBrokerForm, BrokerForm);
  Application.CreateForm(TClientForm, ClientForm);
  Application.CreateForm(TPicklistForm, PicklistForm);
  Application.CreateForm(TPolicyForm, PolicyForm);
  Application.CreateForm(TClientOptionForm, ClientOptionForm);
  Application.CreateForm(TProductProviderForm, ProductProviderForm);
  Application.CreateForm(TProductForm, ProductForm);
  Application.CreateForm(TProviderCommissionForm, ProviderCommissionForm);
  Application.CreateForm(TBaseCommissionForm, BaseCommissionForm);
  Application.CreateForm(TSelectOverrideForm, SelectOverrideForm);
  Application.CreateForm(TCalcSingleForm, CalcSingleForm);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
