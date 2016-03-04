unit UClientOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzRadGrp, RzButton;

type
  TClientOptionForm = class(TForm)
    ClientOptions: TRzRadioGroup;
    CancelButton: TRzButton;
    OKButton: TRzButton;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    CallerID : Byte;
  end;

var
  ClientOptionForm: TClientOptionForm;

implementation

uses UPolicy, UClient, UPicklist;

{$R *.dfm}

//------------------------------------------------------------------------------

procedure TClientOptionForm.OKButtonClick(Sender: TObject);

begin
  case ClientOptions.ItemIndex of
  0:  begin // new client
        PolicyForm.ClientAction := 1;
        ClientForm.NewClient := True;
        ClientForm.CallFromPolicyForm := True;
        ClientForm.ShowModal;
      end;
  1:  begin // existing client
        try
          Screen.Cursor := crSQLWait;
          PolicyForm.ClientAction := 2;
          PickListForm.LoadPickList(16);
          PickListForm.ShowModal;
          Screen.Cursor := crDefault;
        except
          Screen.Cursor := crDefault;
        end;
      end;
  2:  begin // remove client
        PolicyForm.ClientAction := 3;
      end;
  3:  PolicyForm.ClientAction := 4; //edit existing client
  end; // of case
  ClientOptionForm.Close;
end;

//------------------------------------------------------------------------------

procedure TClientOptionForm.CancelButtonClick(Sender: TObject);

begin
  ClientOptionForm.Close;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
end.
