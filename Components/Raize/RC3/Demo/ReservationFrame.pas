{=======================================================================================================================
  ReservationFrame Unit

  Raize Components - Demo Program Source Unit

  Copyright © 1995-2002 by Raize Software, Inc.  All Rights Reserved.
=======================================================================================================================}

{$I RC3Demo.inc}

unit ReservationFrame;

interface

uses
  Forms,
  Windows,
  DB,
  DBClient,
  RzCommon,
  RzDBLook,
  DBCtrls,
  RzDBNav,
  RzDBEdit,
  Controls,
  StdCtrls,
  RzCmboBx,
  RzDBCmbo,
  RzButton,
  RzRadChk,
  RzDBChk,
  RzDBSpin,
  Mask,
  RzEdit,
  RzDBBnEd,
  RzLabel,
  RzPanel,
  RzStatus,
  RzDBStat,
  Classes,
  ExtCtrls,
  Grids,
  DBGrids;

type
  TFmeReservations = class(TFrame)
    SrcReservations: TDataSource;
    SrcEvents: TDataSource;
    RzStatusBar1: TRzStatusBar;
    RzDBStateStatus1: TRzDBStateStatus;
    SrcCustomers: TDataSource;
    DlgLookupEvent: TRzDBLookupDialog;
    StsResNo: TRzDBStatusPane;
    RzFrameController1: TRzFrameController;
    PnlTicket: TRzPanel;
    RzLabel9: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel1: TRzLabel;
    EdtCustomer: TRzDBButtonEdit;
    SpnTickets: TRzDBSpinEdit;
    EdtEvent: TRzDBButtonEdit;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    EdtNotes: TRzDBMemo;
    EdtAmount: TRzDBEdit;
    ChkPaid: TRzDBCheckBox;
    EdtCardNumber: TRzDBEdit;
    CbxMethod: TRzDBComboBox;
    StsEventName: TRzDBStatusPane;
    RzClockStatus: TRzClockStatus;
    RzLabel2: TRzLabel;
    NavReservations: TRzDBNavigator;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    CdsReservations: TClientDataSet;
    CdsEvents: TClientDataSet;
    CdsCustomers: TClientDataSet;
    CdsEventLookup: TClientDataSet;
    CdsReservationsResNo: TAutoIncField;
    CdsReservationsEventNo: TIntegerField;
    CdsReservationsCustNo: TIntegerField;
    CdsReservationsNumTickets: TIntegerField;
    CdsReservationsAmt_Paid: TCurrencyField;
    CdsReservationsPay_Method: TStringField;
    CdsReservationsCard_No: TStringField;
    CdsReservationsCard_Exp: TDateField;
    CdsReservationsPay_Notes: TMemoField;
    CdsReservationsPurge_Date: TDateField;
    CdsReservationsPaid: TBooleanField;
    CdsReservationsCustName: TStringField;
    CdsReservationsEventName: TStringField;
    CdsEventLookupEventNo: TAutoIncField;
    CdsEventLookupVenueNo: TIntegerField;
    CdsEventLookupEvent_Name: TStringField;
    CdsEventLookupEvent_Date: TDateField;
    CdsEventLookupEvent_Time: TTimeField;
    CdsEventLookupTicket_price: TCurrencyField;
    RzPanel1: TRzPanel;
    PnlTitle: TRzPanel;
    procedure EdtEventButtonClick(Sender: TObject);
    procedure EdtCustomerButtonClick(Sender: TObject);
    procedure DlgLookupEventDrawDataCell(Grid: TDBGrid; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure CdsReservationsCalcFields(DataSet: TDataSet);
    procedure RzPanel1Paint(Sender: TObject);
  private
  published
    procedure Init;
  end;


implementation

{$R *.dfm}

uses
  Graphics,
  MainForm,
  CustomerForm;


procedure TFmeReservations.Init;
begin
  {$IFDEF VCL70_OR_HIGHER}
  ParentBackground := False;
  {$ENDIF}
  CdsEvents.Open;
  CdsEventLookup.LoadFromFile( 'Events.cds' );   // Load from file b/c do not want changes to be persistent
  CdsEventLookup.Open;
  CdsCustomers.Open;
  CdsReservations.Open;  // Must open last b/c of calculated fields
end;


procedure TFmeReservations.CdsReservationsCalcFields(DataSet: TDataSet);
begin
  CdsCustomers.Locate( 'CustNo', CdsReservationsCustNo.Value, [] );
  CdsReservationsCustName.Value := CdsCustomers.FieldByName( 'First_Name' ).AsString + ' ' +
                                   CdsCustomers.FieldByName( 'Last_Name' ).AsString;

  CdsEvents.Locate( 'EventNo', CdsReservationsEventNo.Value, [] );
  CdsReservationsEventName.Value := CdsEvents.FieldByName( 'Event_Name' ).AsString;
end;



procedure TFmeReservations.EdtEventButtonClick(Sender: TObject);
begin
  DlgLookupEvent.Execute;
end;


procedure TFmeReservations.EdtCustomerButtonClick(Sender: TObject);
var
  F: TFrmCustomer;
begin
  F := TFrmCustomer.Create( Application );
  try
    F.CdsCustomers.Locate( 'CustNo', CdsReservationsCustNo.Value, [] );

    if F.ShowModal = mrOK then
    begin
      if not ( CdsReservations.State in dsEditModes ) then
        CdsReservations.Edit;
      CdsReservationsCustNo.Value := F.CdsCustomers.FieldByName( 'CustNo' ).AsInteger;
    end;
  finally
    F.Free;
    FrmMain.LoadNotes( 'Reservation' );
  end;
end;


procedure TFmeReservations.DlgLookupEventDrawDataCell(Grid: TDBGrid;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if Field.Dataset.FieldByName( 'Ticket_price' ).AsFloat > 10.00 then
    Grid.Canvas.Font.Color := clRed;
  Grid.DefaultDrawDataCell( Rect, Field, State );
end;


procedure TFmeReservations.RzPanel1Paint(Sender: TObject);
begin
  DrawDropShadow( RzPanel1.Canvas, PnlTicket.BoundsRect, 6 );
end;

end.
