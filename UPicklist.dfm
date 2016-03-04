object PicklistForm: TPicklistForm
  Left = 701
  Top = 201
  Width = 328
  Height = 481
  Caption = 'Picklist'
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
    Width = 312
    Height = 443
    Align = alClient
    BorderOuter = fsFlat
    TabOrder = 0
    DesignSize = (
      312
      443)
    object PicklistFramer: TRzGroupBox
      Left = 8
      Top = 8
      Width = 305
      Height = 401
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Picklist'
      TabOrder = 0
      DesignSize = (
        305
        401)
      object PicklistBox: TRzListBox
        Left = 8
        Top = 16
        Width = 289
        Height = 377
        Anchors = [akLeft, akTop, akRight, akBottom]
        FrameVisible = True
        ItemHeight = 13
        TabOrder = 0
        OnDblClick = PicklistBoxDblClick
        OnKeyUp = PicklistBoxKeyUp
      end
    end
    object CancelButton: TRzButton
      Left = 152
      Top = 417
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 1
      OnClick = CancelButtonClick
    end
    object OKButton: TRzButton
      Left = 240
      Top = 417
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 2
      OnClick = OKButtonClick
    end
  end
  object qPickList: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 676
    Top = 129
  end
end
