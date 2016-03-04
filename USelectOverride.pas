unit USelectOverride;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzButton, StdCtrls, RzCmboBx, RzDBCmbo, DB,
  {ADODS,} ADODB, UDataModule;

type
  TSelectOverrideForm = class(TForm)
    RzPanel1: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    OverrideSelect: TRzDBComboBox;
    OKButton: TRzButton;
    CancelButton: TRzButton;
    NoneButton: TRzButton;
    qOverride: TADOQuery;
    DSOverride: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectOverrideForm: TSelectOverrideForm;

implementation

{$R *.dfm}

end.
