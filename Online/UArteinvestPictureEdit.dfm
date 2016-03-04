object ArteInvestPictureEditForm: TArteInvestPictureEditForm
  Left = 265
  Top = 137
  BorderStyle = bsDialog
  Caption = 'Art'#8364'Invest Picture Edit'
  ClientHeight = 226
  ClientWidth = 320
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
    Width = 320
    Height = 226
    Align = alClient
    BorderOuter = fsFlat
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 8
      Top = 8
      Width = 20
      Height = 13
      Caption = 'Title'
    end
    object RzLabel2: TRzLabel
      Left = 8
      Top = 48
      Width = 22
      Height = 13
      Caption = 'Year'
    end
    object RzLabel3: TRzLabel
      Left = 88
      Top = 48
      Width = 28
      Height = 13
      Caption = 'Width'
    end
    object RzLabel4: TRzLabel
      Left = 168
      Top = 48
      Width = 31
      Height = 13
      Caption = 'Height'
    end
    object RzLabel5: TRzLabel
      Left = 248
      Top = 48
      Width = 24
      Height = 13
      Caption = 'Price'
    end
    object RzLabel6: TRzLabel
      Left = 8
      Top = 96
      Width = 70
      Height = 13
      Caption = 'Reserved Until'
    end
    object RzLabel7: TRzLabel
      Left = 192
      Top = 96
      Width = 61
      Height = 13
      Caption = 'Reserved By'
    end
    object RzLabel8: TRzLabel
      Left = 8
      Top = 144
      Width = 34
      Height = 13
      Caption = 'Bought'
    end
    object RzLabel9: TRzLabel
      Left = 192
      Top = 144
      Width = 49
      Height = 13
      Caption = 'Bought By'
    end
    object Title: TRzEdit
      Left = 8
      Top = 24
      Width = 305
      Height = 21
      FrameVisible = True
      TabOrder = 0
    end
    object Year: TRzNumericEdit
      Left = 8
      Top = 64
      Width = 65
      Height = 21
      FrameVisible = True
      TabOrder = 1
      DisplayFormat = '####'
    end
    object Width: TRzNumericEdit
      Left = 88
      Top = 64
      Width = 65
      Height = 21
      Text = '0'
      FrameVisible = True
      TabOrder = 2
      DisplayFormat = ',0;(,0)'
    end
    object Height: TRzNumericEdit
      Left = 168
      Top = 64
      Width = 65
      Height = 21
      Text = '0'
      FrameVisible = True
      TabOrder = 3
      DisplayFormat = ',0;(,0)'
    end
    object Price: TRzNumericEdit
      Left = 248
      Top = 64
      Width = 65
      Height = 21
      Text = '0'
      FrameVisible = True
      TabOrder = 4
      DisplayFormat = ',0;(,0)'
    end
    object ReservedBy: TRzNumericEdit
      Left = 192
      Top = 112
      Width = 121
      Height = 21
      Text = '0'
      FrameVisible = True
      TabOrder = 5
      DisplayFormat = ',0;(,0)'
    end
    object BoughtBy: TRzNumericEdit
      Left = 192
      Top = 160
      Width = 121
      Height = 21
      Text = '0'
      FrameVisible = True
      TabOrder = 6
      DisplayFormat = ',0;(,0)'
    end
    object CloseButton: TNixButton
      Left = 238
      Top = 192
      AlwaysFlat = True
      Background.Gradient.NumberOfColors = 32
      Background.Style = bkGradient
      BorderColors.Brightest = clBtnHighlight
      BorderColors.Bright = 14671839
      BorderColors.Dark = clBtnShadow
      BorderColors.Darkest = clBtnText
      BorderColors.Flat = clBtnShadow
      About = aiAbout
      Caption = 'Close'
      TabOrder = 7
      OnClick = CloseButtonClick
    end
    object SaveButton: TNixButton
      Left = 152
      Top = 192
      AlwaysFlat = True
      Background.Gradient.NumberOfColors = 32
      Background.Style = bkGradient
      BorderColors.Brightest = clBtnHighlight
      BorderColors.Bright = 14671839
      BorderColors.Dark = clBtnShadow
      BorderColors.Darkest = clBtnText
      BorderColors.Flat = clBtnShadow
      About = aiAbout
      Caption = 'Save'
      TabOrder = 8
      OnClick = SaveButtonClick
    end
    object ReservedUntil: TRzEdit
      Left = 8
      Top = 112
      Width = 169
      Height = 21
      FrameVisible = True
      TabOrder = 9
    end
    object Bought: TRzEdit
      Left = 8
      Top = 160
      Width = 169
      Height = 21
      FrameVisible = True
      TabOrder = 10
    end
  end
end
