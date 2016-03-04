object ArteinvestUserEditForm: TArteinvestUserEditForm
  Left = 743
  Top = 141
  Width = 486
  Height = 416
  Caption = 'Art'#8364'Invest User Edit'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 478
    Height = 389
    Align = alClient
    BorderOuter = fsFlat
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 16
      Top = 8
      Width = 60
      Height = 13
      Caption = 'Broker ID (1)'
    end
    object RzLabel2: TRzLabel
      Left = 128
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Web Login'
    end
    object RzLabel3: TRzLabel
      Left = 304
      Top = 8
      Width = 87
      Height = 13
      Caption = 'Web Password (2)'
    end
    object RzLabel4: TRzLabel
      Left = 16
      Top = 48
      Width = 44
      Height = 13
      Caption = 'Company'
    end
    object RzLabel5: TRzLabel
      Left = 16
      Top = 88
      Width = 50
      Height = 13
      Caption = 'First Name'
    end
    object RzLabel6: TRzLabel
      Left = 248
      Top = 88
      Width = 51
      Height = 13
      Caption = 'Last Name'
    end
    object RzLabel7: TRzLabel
      Left = 16
      Top = 128
      Width = 38
      Height = 13
      Caption = 'Address'
    end
    object RzLabel8: TRzLabel
      Left = 16
      Top = 168
      Width = 17
      Height = 13
      Caption = 'ZIP'
    end
    object RzLabel9: TRzLabel
      Left = 152
      Top = 168
      Width = 17
      Height = 13
      Caption = 'City'
    end
    object RzLabel10: TRzLabel
      Left = 304
      Top = 168
      Width = 36
      Height = 13
      Caption = 'Country'
    end
    object RzLabel11: TRzLabel
      Left = 16
      Top = 208
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object RzLabel12: TRzLabel
      Left = 336
      Top = 208
      Width = 24
      Height = 13
      Caption = 'GSM'
    end
    object RzLabel13: TRzLabel
      Left = 192
      Top = 208
      Width = 31
      Height = 13
      Caption = 'Phone'
    end
    object RzLabel14: TRzLabel
      Left = 16
      Top = 280
      Width = 449
      Height = 26
      Caption = 
        '(1) This MUST be the Broker ID used by us in Policy Manager. If ' +
        'the broker is not in the system,'#13#10'please use a 0 (zero).'
    end
    object NixLabel1: TNixLabel
      Left = 16
      Top = 312
      Width = 440
      Height = 39
      Caption = 
        '(2) Only change this field if the user needs a new password. You' +
        ' cannot see the password as'#13#10'it is stored encrypted in the datab' +
        'ase and therefore not shown. If you fill it out, you must inform' +
        #13#10'the user about this new password.'
      HoverStyle.Enabled = False
      HoverStyle.HoverFont.Charset = DEFAULT_CHARSET
      HoverStyle.HoverFont.Color = clMaroon
      HoverStyle.HoverFont.Height = -11
      HoverStyle.HoverFont.Name = 'MS Sans Serif'
      HoverStyle.HoverFont.Style = [fsUnderline]
      HotImage.ImageIndex = 0
      About = aiAbout
    end
    object BrokerID: TRzNumericEdit
      Left = 16
      Top = 24
      Width = 97
      Height = 21
      Text = '0'
      FrameVisible = True
      TabOrder = 0
      DisplayFormat = ',0;(,0)'
    end
    object WebLogin: TRzEdit
      Left = 128
      Top = 24
      Width = 161
      Height = 21
      FrameVisible = True
      TabOrder = 1
    end
    object WebPassword: TRzEdit
      Left = 304
      Top = 24
      Width = 161
      Height = 21
      FrameVisible = True
      TabOrder = 2
    end
    object CompanyName: TRzEdit
      Left = 16
      Top = 64
      Width = 449
      Height = 21
      FrameVisible = True
      TabOrder = 3
    end
    object FirstName: TRzEdit
      Left = 16
      Top = 104
      Width = 217
      Height = 21
      FrameVisible = True
      TabOrder = 4
    end
    object LastName: TRzEdit
      Left = 248
      Top = 104
      Width = 217
      Height = 21
      FrameVisible = True
      TabOrder = 5
    end
    object Address: TRzEdit
      Left = 16
      Top = 144
      Width = 449
      Height = 21
      FrameVisible = True
      TabOrder = 6
    end
    object ZIP: TRzEdit
      Left = 16
      Top = 184
      Width = 121
      Height = 21
      FrameVisible = True
      TabOrder = 7
    end
    object City: TRzEdit
      Left = 152
      Top = 184
      Width = 137
      Height = 21
      FrameVisible = True
      TabOrder = 8
    end
    object Country: TRzEdit
      Left = 304
      Top = 184
      Width = 161
      Height = 21
      FrameVisible = True
      TabOrder = 9
    end
    object Email: TRzEdit
      Left = 16
      Top = 224
      Width = 161
      Height = 21
      FrameVisible = True
      TabOrder = 10
    end
    object Phone: TRzEdit
      Left = 192
      Top = 224
      Width = 129
      Height = 21
      FrameVisible = True
      TabOrder = 11
    end
    object GSM: TRzEdit
      Left = 336
      Top = 224
      Width = 129
      Height = 21
      FrameVisible = True
      TabOrder = 12
    end
    object CloseButton: TNixButton
      Left = 392
      Top = 360
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
      TabOrder = 13
      OnClick = CloseButtonClick
    end
    object SaveButton: TNixButton
      Left = 312
      Top = 360
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
      TabOrder = 14
      OnClick = SaveButtonClick
    end
    object CanBuyArt: TNixCheckBox
      Left = 16
      Top = 256
      Width = 76
      AutoContents.Enabled = False
      AutoContents.RootKey = rtHKEY_CURRENT_USER
      AutoContents.Path = '\Software\MyCompany\MyApplication'
      BoxBorder.Colors.Brightest = clBtnHighlight
      BoxBorder.Colors.Bright = 14671839
      BoxBorder.Colors.Dark = clBtnShadow
      BoxBorder.Colors.Darkest = clBtnText
      BoxBorder.Colors.Flat = clBtnShadow
      BoxBorder.Enabled = True
      BoxBorder.Sides = [bsLeft, bsRight, bsTop, bsBottom]
      BoxBorder.Style = bsFlat
      BoxColors.BackgroundDark = clBtnFace
      BoxColors.BackgroundBright = clWindow
      BoxColors.BackgroundMedium = 14671839
      BoxColors.Checkmark = clWindowText
      BoxColors.GrayedCheckmark = clBtnShadow
      BoxHoverBorder.Colors.Brightest = clBtnHighlight
      BoxHoverBorder.Colors.Bright = 14671839
      BoxHoverBorder.Colors.Dark = clBtnShadow
      BoxHoverBorder.Colors.Darkest = clBtnText
      BoxHoverBorder.Colors.Flat = clBtnShadow
      BoxHoverBorder.Enabled = True
      BoxHoverBorder.Sides = [bsLeft, bsRight, bsTop, bsBottom]
      BoxHoverBorder.Style = bsFlat
      About = aiAbout
      Caption = 'Can Buy Art'
      TabOrder = 15
    end
  end
  object qGetPassword: TmySQLQuery
    Database = ArteinvestUserForm.DB_Arteinvest
    Left = 24
    Top = 320
  end
end
