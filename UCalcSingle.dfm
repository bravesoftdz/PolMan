object CalcSingleForm: TCalcSingleForm
  Left = 343
  Top = 357
  Width = 870
  Height = 640
  Caption = 'CalcSingleForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 854
    Height = 561
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 561
    Width = 854
    Height = 41
    Align = alBottom
    BorderOuter = fsFlat
    BorderSides = [sdLeft, sdRight, sdBottom]
    TabOrder = 1
    object CloseButton: TRzButton
      Left = 776
      Top = 8
      Caption = 'Close'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 0
    end
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Test'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object qPolicyData: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 16
    Top = 48
  end
  object qCommission: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 16
    Top = 80
  end
  object qProductSpecifics: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 16
    Top = 112
  end
  object qAddPayment: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 16
    Top = 144
  end
  object qSalesVol: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 16
    Top = 176
  end
  object qEBNPayments: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 16
    Top = 208
  end
end
