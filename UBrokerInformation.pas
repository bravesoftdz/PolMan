unit UBrokerInformation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, DBCtrls, RzDBEdit, RzDBCmbo, Mask, RzEdit, RzCommon,
  RzButton, RzRadChk, RzDBChk, NixRadioButton, ExtCtrls, RzPanel, RzRadGrp,
  RzDBRGrp, NixCheckBox;

type
  TFrameBrokerInformation = class(TFrame)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
uses UBroker, UMain;

end.
