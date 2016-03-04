object FmeReservations: TFmeReservations
  Left = 0
  Top = 0
  Width = 508
  Height = 403
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object PnlTitle: TRzPanel
    Left = 0
    Top = 0
    Width = 508
    Height = 30
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = ' Data-Aware Components'
    Color = clBtnShadow
    Font.Charset = ANSI_CHARSET
    Font.Color = clHighlightText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 36
    Width = 453
    Height = 301
    BorderOuter = fsNone
    TabOrder = 0
    OnPaint = RzPanel1Paint
    object NavReservations: TRzDBNavigator
      Left = 8
      Top = 4
      Width = 320
      Height = 25
      DataSource = SrcReservations
      TabOrder = 0
    end
    object RzStatusBar1: TRzStatusBar
      Left = 8
      Top = 273
      Width = 433
      Height = 19
      AutoStyle = False
      ShowSizeGrip = False
      Align = alNone
      BorderInner = fsNone
      BorderOuter = fsNone
      BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
      BorderWidth = 0
      TabOrder = 1
      ThemeAware = False
      object RzDBStateStatus1: TRzDBStateStatus
        Left = 158
        Top = 0
        Width = 104
        Height = 19
        Align = alLeft
        DataSource = SrcReservations
      end
      object StsResNo: TRzDBStatusPane
        Left = 0
        Top = 0
        Width = 158
        Height = 19
        Hint = 'ResNo'
        Align = alLeft
        ParentShowHint = False
        ShowHint = False
        DataField = 'ResNo'
        DataSource = SrcReservations
        FieldLabel = 'Order Number'
        Alignment = taRightJustify
      end
      object RzClockStatus: TRzClockStatus
        Left = 262
        Top = 0
        Width = 171
        Height = 19
        Align = alClient
        Format = 'dd mmmm yyyy'
        Alignment = taCenter
      end
    end
    object PnlTicket: TRzPanel
      Left = 8
      Top = 36
      Width = 433
      Height = 225
      BorderOuter = fsNone
      Color = 15919807
      TabOrder = 2
      object RzLabel9: TRzLabel
        Left = 10
        Top = 52
        Width = 46
        Height = 13
        Caption = 'Customer'
        Font.Charset = ANSI_CHARSET
        Font.Color = 11901732
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        BevelWidth = 0
      end
      object RzLabel4: TRzLabel
        Left = 10
        Top = 84
        Width = 48
        Height = 13
        Caption = 'Event No.'
        Font.Charset = ANSI_CHARSET
        Font.Color = 11901732
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        BevelWidth = 0
      end
      object RzLabel1: TRzLabel
        Left = 330
        Top = 84
        Width = 33
        Height = 13
        Caption = 'Tickets'
        Font.Charset = ANSI_CHARSET
        Font.Color = 11901732
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        BevelWidth = 0
      end
      object RzLabel5: TRzLabel
        Left = 130
        Top = 128
        Width = 95
        Height = 13
        Caption = 'Credit Card Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = 11901732
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        BevelWidth = 0
      end
      object RzLabel6: TRzLabel
        Left = 10
        Top = 128
        Width = 94
        Height = 13
        Caption = 'Method of Payment'
        Font.Charset = ANSI_CHARSET
        Font.Color = 11901732
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        BevelWidth = 0
      end
      object RzLabel10: TRzLabel
        Left = 302
        Top = 128
        Width = 74
        Height = 13
        Caption = 'Expiration Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = 11901732
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        BevelWidth = 0
      end
      object RzLabel11: TRzLabel
        Left = 10
        Top = 172
        Width = 60
        Height = 13
        Caption = 'Amount Paid'
        Font.Charset = ANSI_CHARSET
        Font.Color = 11901732
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        BevelWidth = 0
      end
      object RzLabel12: TRzLabel
        Left = 130
        Top = 200
        Width = 73
        Height = 13
        Caption = 'Payment Notes'
        Font.Charset = ANSI_CHARSET
        Font.Color = 11901732
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        BevelWidth = 0
      end
      object StsEventName: TRzDBStatusPane
        Left = 80
        Top = 64
        Width = 229
        Height = 22
        Hint = 'EventName'
        FillColor = 15919807
        FlatColor = 11901732
        ParentShowHint = False
        DataField = 'EventName'
        DataSource = SrcReservations
      end
      object RzLabel2: TRzLabel
        Left = 8
        Top = 4
        Width = 189
        Height = 25
        Caption = 'Ticket Order Form'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtCustomer: TRzDBButtonEdit
        Left = 8
        Top = 32
        Width = 397
        Height = 21
        DataSource = SrcReservations
        DataField = 'CustName'
        Ctl3D = True
        FrameController = RzFrameController1
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOrder = 0
        ButtonKind = bkFind
        OnButtonClick = EdtCustomerButtonClick
      end
      object SpnTickets: TRzDBSpinEdit
        Left = 328
        Top = 61
        Width = 77
        Height = 21
        DataSource = SrcReservations
        DataField = 'NumTickets'
        Alignment = taRightJustify
        Ctl3D = True
        FrameController = RzFrameController1
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOrder = 2
      end
      object EdtEvent: TRzDBButtonEdit
        Left = 8
        Top = 64
        Width = 65
        Height = 21
        DataSource = SrcReservations
        DataField = 'EventNo'
        Alignment = taRightJustify
        Ctl3D = True
        FrameController = RzFrameController1
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ButtonHint = 'Search by Name'
        ButtonKind = bkFind
        OnButtonClick = EdtEventButtonClick
      end
      object EdtNotes: TRzDBMemo
        Left = 128
        Top = 152
        Width = 277
        Height = 49
        Color = 15919807
        Ctl3D = True
        DataField = 'Pay_Notes'
        DataSource = SrcReservations
        ParentCtl3D = False
        TabOrder = 8
        FocusColor = 16249298
        FrameColor = 11901732
        FrameHotStyle = fsGroove
        FrameSides = [sdLeft, sdBottom]
        FrameVisible = True
        FramingPreference = fpCustomFraming
      end
      object EdtAmount: TRzDBEdit
        Left = 8
        Top = 152
        Width = 109
        Height = 21
        DataSource = SrcReservations
        DataField = 'Amt_Paid'
        Alignment = taRightJustify
        Ctl3D = True
        FrameController = RzFrameController1
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOrder = 6
      end
      object ChkPaid: TRzDBCheckBox
        Left = 8
        Top = 198
        Width = 117
        Height = 19
        DataField = 'Paid'
        DataSource = SrcReservations
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        Caption = 'Payment Received'
        FrameColor = 11901732
        Font.Charset = ANSI_CHARSET
        Font.Color = 11901732
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HotTrack = True
        ParentFont = False
        TabOrder = 7
      end
      object EdtCardNumber: TRzDBEdit
        Left = 128
        Top = 108
        Width = 161
        Height = 21
        DataSource = SrcReservations
        DataField = 'Card_No'
        Ctl3D = True
        FrameController = RzFrameController1
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOrder = 4
      end
      object CbxMethod: TRzDBComboBox
        Left = 8
        Top = 108
        Width = 109
        Height = 21
        DataField = 'Pay_Method'
        DataSource = SrcReservations
        Ctl3D = False
        FrameController = RzFrameController1
        FramingPreference = fpCustomFraming
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 3
        Items.Strings = (
          'AmEx'
          'Cash/Ck'
          'Diners'
          'MC'
          'VISA'
          'Will Call')
      end
      object RzDBDateTimeEdit1: TRzDBDateTimeEdit
        Left = 300
        Top = 108
        Width = 105
        Height = 21
        DataSource = SrcReservations
        DataField = 'Card_Exp'
        FrameController = RzFrameController1
        FramingPreference = fpCustomFraming
        TabOrder = 5
        CalendarColors.Days = clWindowText
        CalendarColors.FillDays = clBtnShadow
        CalendarColors.DaysOfWeek = clWindowText
        CalendarColors.Lines = clBtnShadow
        CalendarColors.SelectedDateBack = clHighlight
        CalendarColors.SelectedDateFore = clHighlightText
        CalendarColors.TodaysDateFrame = clMaroon
        ClockFaceColors.Face = clBtnFace
        ClockFaceColors.Hands = clWindowText
        ClockFaceColors.Numbers = clWindowText
        ClockFaceColors.HourTicks = clBtnShadow
        ClockFaceColors.MinuteTicks = clWindowText
        EditType = etDate
      end
    end
  end
  object SrcReservations: TDataSource
    DataSet = CdsReservations
    Left = 40
    Top = 360
  end
  object SrcEvents: TDataSource
    DataSet = CdsEvents
    Left = 116
    Top = 360
  end
  object SrcCustomers: TDataSource
    DataSet = CdsCustomers
    Left = 184
    Top = 360
  end
  object DlgLookupEvent: TRzDBLookupDialog
    Dataset = CdsEventLookup
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    KeyField = 'EventNo'
    SearchEdit = EdtEvent
    SearchField = 'Event_Name'
    ShowNavigatorHints = True
    UpdateSearchEdit = True
    OnDrawDataCell = DlgLookupEventDrawDataCell
    Caption = 'Select an Event'
    CaptionOK = 'OK'
    CaptionCancel = 'Cancel'
    CaptionHelp = '&Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Height = 303
    Width = 558
    Left = 236
    Top = 360
  end
  object RzFrameController1: TRzFrameController
    Color = 15919807
    FocusColor = 16249298
    FrameColor = 11901732
    FrameHotStyle = fsGroove
    FrameSides = [sdBottom]
    FrameVisible = True
    FramingPreference = fpCustomFraming
    Left = 320
    Top = 360
  end
  object CdsReservations: TClientDataSet
    Aggregates = <>
    FileName = 'Reservations.cds'
    Params = <>
    OnCalcFields = CdsReservationsCalcFields
    Left = 12
    Top = 360
    object CdsReservationsResNo: TAutoIncField
      FieldName = 'ResNo'
      ReadOnly = True
    end
    object CdsReservationsEventNo: TIntegerField
      FieldName = 'EventNo'
    end
    object CdsReservationsCustNo: TIntegerField
      FieldName = 'CustNo'
    end
    object CdsReservationsNumTickets: TIntegerField
      FieldName = 'NumTickets'
    end
    object CdsReservationsAmt_Paid: TCurrencyField
      FieldName = 'Amt_Paid'
    end
    object CdsReservationsPay_Method: TStringField
      FieldName = 'Pay_Method'
      Size = 10
    end
    object CdsReservationsCard_No: TStringField
      FieldName = 'Card_No'
    end
    object CdsReservationsCard_Exp: TDateField
      FieldName = 'Card_Exp'
    end
    object CdsReservationsPay_Notes: TMemoField
      FieldName = 'Pay_Notes'
      BlobType = ftMemo
      Size = 30
    end
    object CdsReservationsPurge_Date: TDateField
      FieldName = 'Purge_Date'
    end
    object CdsReservationsPaid: TBooleanField
      FieldName = 'Paid'
    end
    object CdsReservationsCustName: TStringField
      FieldKind = fkCalculated
      FieldName = 'CustName'
      ProviderFlags = []
      Size = 40
      Calculated = True
    end
    object CdsReservationsEventName: TStringField
      FieldKind = fkCalculated
      FieldName = 'EventName'
      ProviderFlags = []
      Size = 40
      Calculated = True
    end
  end
  object CdsEvents: TClientDataSet
    Aggregates = <>
    FileName = 'Events.cds'
    Params = <>
    Left = 88
    Top = 360
  end
  object CdsCustomers: TClientDataSet
    Aggregates = <>
    FileName = 'Customers.cds'
    Params = <>
    Left = 156
    Top = 360
  end
  object CdsEventLookup: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 264
    Top = 360
    object CdsEventLookupEventNo: TAutoIncField
      FieldName = 'EventNo'
      ReadOnly = True
    end
    object CdsEventLookupVenueNo: TIntegerField
      FieldName = 'VenueNo'
    end
    object CdsEventLookupEvent_Name: TStringField
      FieldName = 'Event_Name'
      Size = 30
    end
    object CdsEventLookupEvent_Date: TDateField
      FieldName = 'Event_Date'
    end
    object CdsEventLookupEvent_Time: TTimeField
      FieldName = 'Event_Time'
    end
    object CdsEventLookupTicket_price: TCurrencyField
      FieldName = 'Ticket_price'
    end
  end
end
