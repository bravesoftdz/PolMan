{=======================================================================================================================
  WidgetForm Unit

  Raize Components - Demo Program Source Unit

  Copyright © 1995-2002 by Raize Software, Inc.  All Rights Reserved.
=======================================================================================================================}

{$I RC3Demo.inc}

unit WidgetForm;

interface

uses
  Forms,
  RzPopups,
  Controls,
  ExtCtrls,
  RzPanel,
  RzBorder,
  Graphics,
  Classes,
  RzForms;

type
  TFrmWidgets = class(TForm)
    RzCalendar1: TRzCalendar;
    RzTimePicker1: TRzTimePicker;
    RzColorPicker1: TRzColorPicker;
    RzFormShape1: TRzFormShape;
    RzBorder1: TRzBorder;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBorder1Click(Sender: TObject);
    procedure RzCalendar1GetBoldDays(Sender: TObject; Year, Month: Word;
      var Bitmask: Cardinal);
  private
  end;


implementation

{$R *.dfm}

uses
  RzCommon,
  MainForm;

procedure TFrmWidgets.FormClose( Sender: TObject; var Action: TCloseAction );
begin
  FrmMain.ClearWidgetRef;
  Action := caFree;
end;


procedure TFrmWidgets.RzBorder1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmWidgets.RzCalendar1GetBoldDays(Sender: TObject; Year, Month: Word; var Bitmask: Cardinal);
begin
  if Month mod 2 = 0 then
    Bitmask := RzCalendar1.DaysToBitmask( [ 5, 6, 15, 25 ] )
  else
    Bitmask := RzCalendar1.DaysToBitmask( [ 9, 12, 21, 26 ] );
end;

end.



