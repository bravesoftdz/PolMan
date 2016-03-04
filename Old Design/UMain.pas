unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, ExtCtrls, jpeg, ComCtrls, ToolWin, Menus, ImgList;

type
  TMainForm = class(TForm)
    TopPanel: TRzPanel;
    MainPanel: TRzPanel;
    MainStatusBar: TRzStatusBar;
    Logo: TImage;
    MenuBar: TToolBar;
    BrokerToolButton: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolBarImages: TImageList;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    procedure BrokerToolButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses UBroker;

{$R *.dfm}

procedure TMainForm.BrokerToolButtonClick(Sender: TObject);
begin
  BrokerForm.ShowModal;
end;

end.
