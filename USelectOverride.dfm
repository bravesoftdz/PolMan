object SelectOverrideForm: TSelectOverrideForm
  Left = 242
  Top = 150
  Width = 465
  Height = 139
  Caption = 'Override Broker'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 449
    Height = 101
    Align = alClient
    BorderOuter = fsFlat
    TabOrder = 0
    object RzGroupBox1: TRzGroupBox
      Left = 8
      Top = 8
      Width = 441
      Height = 57
      Caption = 'Select Override Broker'
      TabOrder = 0
      object OverrideSelect: TRzDBComboBox
        Left = 8
        Top = 24
        Width = 425
        Height = 21
        Ctl3D = False
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 0
      end
    end
    object OKButton: TRzButton
      Left = 376
      Top = 72
      Caption = 'OK'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 1
    end
    object CancelButton: TRzButton
      Left = 296
      Top = 72
      Caption = 'Cancel'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 2
    end
    object NoneButton: TRzButton
      Left = 8
      Top = 72
      Caption = 'None'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 3
    end
  end
  object qOverride: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 168
    Top = 72
  end
  object DSOverride: TDataSource
    DataSet = qOverride
    Left = 208
    Top = 72
  end
end
