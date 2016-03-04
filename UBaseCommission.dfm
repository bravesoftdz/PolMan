object BaseCommissionForm: TBaseCommissionForm
  Left = 359
  Top = 283
  Width = 395
  Height = 361
  Caption = 'Base Commission for Brokers'
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
    Width = 379
    Height = 323
    Align = alClient
    BorderOuter = fsFlat
    TabOrder = 0
    object CommScheme: TRzRadioGroup
      Left = 8
      Top = 8
      Width = 185
      Height = 41
      Caption = 'Commission Scheme'
      Columns = 2
      CustomGlyphs.Data = {
        760B0000424D760B00000000000036000000280000004F0000000C0000000100
        180000000000400B000000000000000000000000000000000000008080008080
        0080800080800080808080808080808080808080800080800080800080800080
        8000808000808000808000808000808080808080808080808080808000808000
        8080008080008080008080008080008080008080008080808080808080808080
        8080800080800080800080800080800080800080800080800080800080808080
        8080808080808080808000808000808000808000808000808000808000808000
        8080008080808080808080808080808080008080008080008080008080008080
        0080800080800080800080808080808080808080808080800080800080800080
        80008080008080000000008080008080008080808080808080FFFFFFFFFFFFFF
        FFFFFFFFFF808080808080008080008080008080008080008080808080808080
        FFFFFFFFFFFFFFFFFFFFFFFF8080808080800080800080800080800080800080
        80808080808080FFFFFFFFFFFFFFFFFFFFFFFF80808080808000808000808000
        8080008080008080808080808080FFFFFFFFFFFFFFFFFFFFFFFF808080808080
        008080008080008080008080008080808080808080FFFFFFFFFFFFFFFFFFFFFF
        FF808080808080008080008080008080008080008080808080808080FFFFFFFF
        FFFFFFFFFFFFFFFF808080808080008080008080008080000000008080008080
        808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080800080
        80008080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF808080008080008080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080008080008080008080808080FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080008080008080808080FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080008080
        008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080
        80008080008080000000008080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF808080008080008080008080808080FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080800080800080800080808080
        80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808000808000
        8080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        808080008080008080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF808080008080008080008080808080FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080008080000000008080808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080
        80008080808080FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFF
        FFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFF
        FF000000000000FFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080
        808080FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
        FF808080008080000000008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFF
        000000000000000000000000FFFFFFFFFFFFFFFFFF808080008080808080FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808000
        8080808080FFFFFFFFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFF
        FFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFF00000000
        0000000000000000FFFFFFFFFFFFFFFFFF808080008080000000008080808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080
        80008080808080FFFFFFFFFFFFFFFFFF000000000000000000000000FFFFFFFF
        FFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFF0000
        00000000000000000000FFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080
        808080FFFFFFFFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFF
        FF808080008080000000008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFF
        FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808000
        8080808080FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFF
        FFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFFFFFFF808080008080000000008080008080
        808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080800080
        80008080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF808080008080008080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080008080008080008080808080FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080008080008080808080FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080008080
        008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080
        80008080008080000000008080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF808080008080008080008080808080FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080800080800080800080808080
        80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808000808000
        8080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        808080008080008080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF808080008080008080008080808080FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080008080000000008080008080
        008080808080808080FFFFFFFFFFFFFFFFFFFFFFFF8080808080800080800080
        80008080008080008080808080808080FFFFFFFFFFFFFFFFFFFFFFFF80808080
        8080008080008080008080008080008080808080808080FFFFFFFFFFFFFFFFFF
        FFFFFF808080808080008080008080008080008080008080808080808080FFFF
        FFFFFFFFFFFFFFFFFFFF80808080808000808000808000808000808000808080
        8080808080FFFFFFFFFFFFFFFFFFFFFFFF808080808080008080008080008080
        008080008080808080808080FFFFFFFFFFFFFFFFFFFFFFFF8080808080800080
        8000808000808000000000808000808000808000808000808080808080808080
        8080808080008080008080008080008080008080008080008080008080008080
        8080808080808080808080800080800080800080800080800080800080800080
        8000808000808080808080808080808080808000808000808000808000808000
        8080008080008080008080008080808080808080808080808080008080008080
        0080800080800080800080800080800080800080808080808080808080808080
        8000808000808000808000808000808000808000808000808000808080808080
        8080808080808080008080008080008080008080008080000000}
      Enabled = False
      ItemFrameColor = 8409372
      ItemHotTrack = True
      ItemHighlightColor = 2203937
      ItemHotTrackColor = 3983359
      Items.Strings = (
        'Standard'
        'Volume Based')
      TabOrder = 0
      UseCustomGlyphs = True
      OnChanging = CommSchemeChanging
    end
    object RzGroupBox1: TRzGroupBox
      Left = 200
      Top = 8
      Width = 177
      Height = 41
      Caption = 'Contract Date'
      TabOrder = 1
      object ContractDate: TRzComboBox
        Left = 8
        Top = 16
        Width = 161
        Height = 21
        Ctl3D = False
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 0
        Text = '2008/04/10'
        OnChange = ContractDateChange
      end
    end
    object EditButton: TRzButton
      Left = 304
      Top = 264
      Caption = 'Edit'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 2
      OnClick = EditButtonClick
    end
    object SaveButton: TRzButton
      Left = 303
      Top = 232
      Caption = 'Save'
      Color = 15791348
      Enabled = False
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 3
      OnClick = SaveButtonClick
    end
    object CloseButton: TRzButton
      Left = 304
      Top = 296
      Caption = 'Close'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 4
      OnClick = CloseButtonClick
    end
    object RzGroupBox2: TRzGroupBox
      Left = 200
      Top = 56
      Width = 177
      Height = 41
      Caption = 'Commission Level'
      TabOrder = 5
      object CommLevel: TRzComboBox
        Left = 8
        Top = 16
        Width = 89
        Height = 21
        Style = csDropDownList
        Ctl3D = False
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 0
        OnChange = CommLevelChange
        Items.Strings = (
          'A'
          'B'
          'C'
          'D'
          'E'
          'F'
          'G'
          'H'
          'I'
          'J'
          'K'
          'L'
          'M'
          'N'
          'O'
          'P'
          'Q'
          'R'
          'S'
          'T'
          'U'
          'V'
          'W'
          'X'
          'Y'
          'Z')
      end
      object RzButton5: TRzButton
        Left = 104
        Top = 16
        Width = 65
        Height = 21
        Caption = 'Edit'
        Color = 15791348
        HighlightColor = 16026986
        HotTrack = True
        HotTrackColor = 3983359
        TabOrder = 1
      end
    end
    object RzGroupBox4: TRzGroupBox
      Left = 8
      Top = 104
      Width = 249
      Height = 217
      Caption = 'Rates'
      TabOrder = 6
      object RzLabel1: TRzLabel
        Left = 56
        Top = 16
        Width = 55
        Height = 13
        Caption = 'Commission'
      end
      object RzLabel2: TRzLabel
        Left = 152
        Top = 16
        Width = 40
        Height = 13
        Caption = 'Override'
      end
      object RzLabel4: TRzLabel
        Left = 8
        Top = 40
        Width = 31
        Height = 13
        Caption = 'Year 1'
      end
      object RzLabel5: TRzLabel
        Left = 8
        Top = 64
        Width = 31
        Height = 13
        Caption = 'Year 2'
      end
      object RzLabel6: TRzLabel
        Left = 8
        Top = 88
        Width = 31
        Height = 13
        Caption = 'Year 3'
      end
      object RzLabel7: TRzLabel
        Left = 8
        Top = 112
        Width = 31
        Height = 13
        Caption = 'Year 4'
      end
      object RzLabel8: TRzLabel
        Left = 8
        Top = 136
        Width = 31
        Height = 13
        Caption = 'Year 5'
      end
      object RzLabel9: TRzLabel
        Left = 8
        Top = 160
        Width = 42
        Height = 13
        Caption = 'Renewal'
      end
      object RzLabel10: TRzLabel
        Left = 8
        Top = 184
        Width = 26
        Height = 13
        Caption = 'Other'
      end
      object RzDBNumericEdit1: TRzDBNumericEdit
        Left = 56
        Top = 32
        Width = 81
        Height = 21
        FrameVisible = True
        TabOrder = 0
        DisplayFormat = ',0;(,0)'
      end
      object RzDBNumericEdit2: TRzDBNumericEdit
        Left = 56
        Top = 56
        Width = 81
        Height = 21
        FrameVisible = True
        TabOrder = 1
        DisplayFormat = ',0;(,0)'
      end
      object RzDBNumericEdit3: TRzDBNumericEdit
        Left = 56
        Top = 80
        Width = 81
        Height = 21
        FrameVisible = True
        TabOrder = 2
        DisplayFormat = ',0;(,0)'
      end
      object RzDBNumericEdit4: TRzDBNumericEdit
        Left = 56
        Top = 104
        Width = 81
        Height = 21
        FrameVisible = True
        TabOrder = 3
        DisplayFormat = ',0;(,0)'
      end
      object RzDBNumericEdit5: TRzDBNumericEdit
        Left = 56
        Top = 128
        Width = 81
        Height = 21
        FrameVisible = True
        TabOrder = 4
        DisplayFormat = ',0;(,0)'
      end
      object RzDBNumericEdit6: TRzDBNumericEdit
        Left = 152
        Top = 32
        Width = 81
        Height = 21
        FrameVisible = True
        TabOrder = 5
        DisplayFormat = ',0;(,0)'
      end
      object RzDBNumericEdit7: TRzDBNumericEdit
        Left = 152
        Top = 56
        Width = 81
        Height = 21
        FrameVisible = True
        TabOrder = 6
        DisplayFormat = ',0;(,0)'
      end
      object RzDBNumericEdit8: TRzDBNumericEdit
        Left = 152
        Top = 80
        Width = 81
        Height = 21
        FrameVisible = True
        TabOrder = 7
        DisplayFormat = ',0;(,0)'
      end
      object RzDBNumericEdit9: TRzDBNumericEdit
        Left = 152
        Top = 104
        Width = 81
        Height = 21
        FrameVisible = True
        TabOrder = 8
        DisplayFormat = ',0;(,0)'
      end
      object RzDBNumericEdit10: TRzDBNumericEdit
        Left = 152
        Top = 128
        Width = 81
        Height = 21
        FrameVisible = True
        TabOrder = 9
        DisplayFormat = ',0;(,0)'
      end
      object RzDBNumericEdit11: TRzDBNumericEdit
        Left = 56
        Top = 152
        Width = 81
        Height = 21
        FrameVisible = True
        TabOrder = 10
        DisplayFormat = ',0;(,0)'
      end
      object RzDBNumericEdit12: TRzDBNumericEdit
        Left = 152
        Top = 152
        Width = 81
        Height = 21
        FrameVisible = True
        TabOrder = 11
        DisplayFormat = ',0;(,0)'
      end
      object RzDBNumericEdit13: TRzDBNumericEdit
        Left = 56
        Top = 176
        Width = 81
        Height = 21
        FrameVisible = True
        TabOrder = 12
        DisplayFormat = ',0;(,0)'
      end
      object RzDBNumericEdit14: TRzDBNumericEdit
        Left = 152
        Top = 176
        Width = 81
        Height = 21
        FrameVisible = True
        TabOrder = 13
        DisplayFormat = ',0;(,0)'
      end
    end
    object RzGroupBox5: TRzGroupBox
      Left = 8
      Top = 56
      Width = 185
      Height = 41
      Caption = 'Volume Level'
      TabOrder = 7
      object VolumeLevel: TRzComboBox
        Left = 8
        Top = 16
        Width = 97
        Height = 21
        Ctl3D = False
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 0
      end
      object RzButton6: TRzButton
        Left = 112
        Top = 16
        Width = 65
        Height = 21
        Caption = 'Edit'
        Color = 15791348
        HighlightColor = 16026986
        HotTrack = True
        HotTrackColor = 3983359
        TabOrder = 1
      end
    end
  end
  object qRates: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 320
    Top = 104
  end
  object DSRates: TDataSource
    AutoEdit = False
    DataSet = qRates
    Left = 320
    Top = 136
  end
  object qVolumeLevel: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 8
    Top = 68
  end
  object qRateCheck: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 352
    Top = 104
  end
  object qContractDate: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 288
    Top = 104
  end
end
