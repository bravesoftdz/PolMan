object ClientOptionForm: TClientOptionForm
  Left = 658
  Top = 248
  BorderStyle = bsDialog
  Caption = 'Client Options'
  ClientHeight = 143
  ClientWidth = 177
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ClientOptions: TRzRadioGroup
    Left = 8
    Top = 8
    Width = 161
    Height = 97
    Caption = 'Choose Option'
    ItemIndex = 0
    Items.Strings = (
      'Add New Client to Policy'
      'Add Existing Client to Policy'
      'Remove Client from Policy'
      'Edit Client Information')
    TabOrder = 0
  end
  object CancelButton: TRzButton
    Left = 8
    Top = 112
    Caption = 'Cancel'
    Color = 15791348
    HighlightColor = 16026986
    HotTrack = True
    HotTrackColor = 3983359
    ParentColor = False
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object OKButton: TRzButton
    Left = 96
    Top = 112
    Caption = 'OK'
    Color = 15791348
    HighlightColor = 16026986
    HotTrack = True
    HotTrackColor = 3983359
    ParentColor = False
    TabOrder = 2
    OnClick = OKButtonClick
  end
end
