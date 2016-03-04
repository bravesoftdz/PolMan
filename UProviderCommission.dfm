object ProviderCommissionForm: TProviderCommissionForm
  Left = 216
  Top = 118
  BorderStyle = bsDialog
  Caption = 'Provider Commission'
  ClientHeight = 254
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 254
    Align = alClient
    BorderOuter = fsFlat
    TabOrder = 0
    object RzLabel6: TRzLabel
      Left = 8
      Top = 80
      Width = 59
      Height = 13
      Caption = 'Renewal (%)'
    end
    object RzLabel7: TRzLabel
      Left = 80
      Top = 80
      Width = 63
      Height = 13
      Caption = 'Additional (%)'
    end
    object RzLabel8: TRzLabel
      Left = 152
      Top = 80
      Width = 64
      Height = 13
      Caption = 'Contract date'
    end
    object RzLabel9: TRzLabel
      Left = 248
      Top = 80
      Width = 45
      Height = 13
      Caption = 'Contracts'
    end
    object RzGroupBox1: TRzGroupBox
      Left = 8
      Top = 8
      Width = 401
      Height = 65
      Caption = 'Initial Commission (%)'
      TabOrder = 0
      object RzLabel1: TRzLabel
        Left = 8
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Year 1'
      end
      object RzLabel2: TRzLabel
        Left = 88
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Year 2'
      end
      object RzLabel3: TRzLabel
        Left = 168
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Year 3'
      end
      object RzLabel4: TRzLabel
        Left = 248
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Year 4'
      end
      object RzLabel5: TRzLabel
        Left = 328
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Year 5'
      end
      object RzDBNumericEdit1: TRzDBNumericEdit
        Left = 8
        Top = 32
        Width = 65
        Height = 21
        DataSource = DSProviderCommission
        DataField = 'y1_rate'
        DragCursor = crHandPoint
        FrameVisible = True
        TabOrder = 0
        IntegersOnly = False
        DisplayFormat = '#,##0.000;(#,##0.000)'
      end
      object RzDBNumericEdit2: TRzDBNumericEdit
        Left = 88
        Top = 32
        Width = 65
        Height = 21
        DataSource = DSProviderCommission
        DataField = 'y2_rate'
        FrameVisible = True
        TabOrder = 1
        IntegersOnly = False
        DisplayFormat = '#,##0.000;(#,##0.000)'
      end
      object RzDBNumericEdit3: TRzDBNumericEdit
        Left = 168
        Top = 32
        Width = 65
        Height = 21
        DataSource = DSProviderCommission
        DataField = 'y3_rate'
        FrameVisible = True
        TabOrder = 2
        IntegersOnly = False
        DisplayFormat = '#,##0.000;(#,##0.000)'
      end
      object RzDBNumericEdit4: TRzDBNumericEdit
        Left = 248
        Top = 32
        Width = 65
        Height = 21
        DataSource = DSProviderCommission
        DataField = 'y4_rate'
        FrameVisible = True
        TabOrder = 3
        IntegersOnly = False
        DisplayFormat = '#,##0.000;(#,##0.000)'
      end
      object RzDBNumericEdit5: TRzDBNumericEdit
        Left = 328
        Top = 32
        Width = 65
        Height = 21
        DataSource = DSProviderCommission
        DataField = 'y5_rate'
        FrameVisible = True
        TabOrder = 4
        IntegersOnly = False
        DisplayFormat = '#,##0.000;(#,##0.000)'
      end
    end
    object RzDBNumericEdit6: TRzDBNumericEdit
      Left = 8
      Top = 96
      Width = 65
      Height = 21
      DataSource = DSProviderCommission
      DataField = 'renewal_rate'
      FrameVisible = True
      TabOrder = 1
      IntegersOnly = False
      DisplayFormat = '#,##0.000;(#,##0.000)'
    end
    object RzDBNumericEdit7: TRzDBNumericEdit
      Left = 80
      Top = 96
      Width = 65
      Height = 21
      DataSource = DSProviderCommission
      DataField = 'other_rate'
      FrameVisible = True
      TabOrder = 2
      IntegersOnly = False
      DisplayFormat = '#,##0.000;(#,##0.000)'
    end
    object ContractDate: TRzDBDateTimeEdit
      Left = 152
      Top = 96
      Width = 89
      Height = 21
      DataSource = DSProviderCommission
      DataField = 'contract_date'
      FrameVisible = True
      TabOrder = 3
      EditType = etDate
      FlatButtons = True
    end
    object OldContractList: TRzListBox
      Left = 248
      Top = 96
      Width = 81
      Height = 153
      FrameVisible = True
      ItemHeight = 13
      TabOrder = 4
      OnClick = OldContractListClick
    end
    object EditButton: TRzButton
      Left = 336
      Top = 96
      Caption = 'Edit'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 5
      OnClick = EditButtonClick
    end
    object SaveButton: TRzButton
      Left = 336
      Top = 128
      Caption = 'Save'
      Color = 15791348
      Enabled = False
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 6
      OnClick = SaveButtonClick
    end
    object AddContractButton: TRzButton
      Left = 336
      Top = 160
      Caption = 'Add'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 7
      OnClick = AddContractButtonClick
    end
    object DeleteButton: TRzButton
      Left = 336
      Top = 192
      Caption = 'Delete'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 8
    end
    object CloseButton: TRzButton
      Left = 336
      Top = 224
      Caption = 'Close'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 9
      OnClick = CloseButtonClick
    end
  end
  object qProviderCommission: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 32
    Top = 24
  end
  object DSProviderCommission: TDataSource
    AutoEdit = False
    DataSet = qProviderCommission
    Left = 72
    Top = 24
  end
  object qOldContracts: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 272
    Top = 120
  end
end
