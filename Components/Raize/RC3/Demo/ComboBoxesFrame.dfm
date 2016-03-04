object FmeComboBoxes: TFmeComboBoxes
  Left = 0
  Top = 0
  Width = 511
  Height = 367
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
    Width = 511
    Height = 30
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = ' Combo Box Controls'
    Color = clBtnShadow
    Font.Charset = ANSI_CHARSET
    Font.Color = clHighlightText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 40
    Width = 225
    Height = 93
    Caption = 'TRzComboBox'
    TabOrder = 0
    object CbxStandard: TRzComboBox
      Left = 8
      Top = 64
      Width = 205
      Height = 21
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FlatButtons = True
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      Items.Strings = (
        'Action'
        'All I Want Is Everything'
        'Animal'
        'Another Hit and Run'
        'Armageddon It'
        'Blood Runs Cold'
        'Bringing on the Heartbreak'
        'Foolin'#39
        'From The Inside'
        'Hello America'
        'Hysteria'
        'Let'#39's Get Rocked'
        'Miss You In A Heartbeat'
        'Personal Property'
        'Photograph'
        'Pour Some Sugar On Me'
        'Ride Into The Sun'
        'Ring Of Fire'
        'Rock Of Ages'
        'Rock Rock (Till You Drop)'
        'Rocket'
        'Run Riot'
        'Slang'
        'Stand Up'
        'Switch 625'
        'Tear It Down'
        'Tonight'
        'Too Late For Love'
        'Two Steps Behind')
    end
    object OptDropDown: TRzRadioButton
      Left = 8
      Top = 16
      Width = 97
      Height = 17
      Caption = 'csDropDown'
      Checked = True
      HotTrack = True
      TabOrder = 0
      TabStop = True
      OnClick = ComboStyleChange
    end
    object OptDropDownList: TRzRadioButton
      Left = 108
      Top = 16
      Width = 113
      Height = 17
      Caption = 'csDropDownList'
      HotTrack = True
      TabOrder = 1
      OnClick = ComboStyleChange
    end
    object ChkAllowEdit: TRzCheckBox
      Left = 8
      Top = 40
      Width = 89
      Height = 17
      Caption = 'Allow Edit'
      Checked = True
      HotTrack = True
      State = cbChecked
      TabOrder = 3
      OnClick = ChkAllowEditClick
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 8
    Top = 140
    Width = 225
    Height = 53
    Caption = 'TRzMRUComboBox'
    TabOrder = 1
    object CbxMRU: TRzMRUComboBox
      Left = 8
      Top = 20
      Width = 205
      Height = 21
      MruSection = 'Demo'
      MruID = 'History'
      RemoveItemCaption = '&Remove item from history list'
      Ctl3D = False
      FlatButtons = True
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object RzGroupBox3: TRzGroupBox
    Left = 8
    Top = 200
    Width = 225
    Height = 109
    Caption = 'TRzColorComboBox'
    TabOrder = 2
    object RzLabel1: TRzLabel
      Left = 12
      Top = 16
      Width = 41
      Height = 13
      AutoSize = False
      Caption = 'Show'
      BevelWidth = 0
    end
    object CbxColors: TRzColorComboBox
      Left = 8
      Top = 76
      Width = 205
      Height = 22
      ColorNames.Default = 'Default'
      ColorNames.Black = 'Black'
      ColorNames.Maroon = 'Maroon'
      ColorNames.Green = 'Green'
      ColorNames.Olive = 'Olive'
      ColorNames.Navy = 'Navy'
      ColorNames.Purple = 'Purple'
      ColorNames.Teal = 'Teal'
      ColorNames.Gray = 'Gray'
      ColorNames.Silver = 'Silver'
      ColorNames.Red = 'Red'
      ColorNames.Lime = 'Lime'
      ColorNames.Yellow = 'Yellow'
      ColorNames.Blue = 'Blue'
      ColorNames.Fuchsia = 'Fuchsia'
      ColorNames.Aqua = 'Aqua'
      ColorNames.White = 'White'
      ColorNames.ScrollBar = 'ScrollBar'
      ColorNames.Background = 'Background'
      ColorNames.ActiveCaption = 'ActiveCaption'
      ColorNames.InactiveCaption = 'InactiveCaption'
      ColorNames.Menu = 'Menu'
      ColorNames.Window = 'Window'
      ColorNames.WindowFrame = 'WindowFrame'
      ColorNames.MenuText = 'MenuText'
      ColorNames.WindowText = 'WindowText'
      ColorNames.CaptionText = 'CaptionText'
      ColorNames.ActiveBorder = 'ActiveBorder'
      ColorNames.InactiveBorder = 'InactiveBorder'
      ColorNames.AppWorkSpace = 'AppWorkSpace'
      ColorNames.Highlight = 'Highlight'
      ColorNames.HighlightText = 'HighlightText'
      ColorNames.BtnFace = 'BtnFace'
      ColorNames.BtnShadow = 'BtnShadow'
      ColorNames.GrayText = 'GrayText'
      ColorNames.BtnText = 'BtnText'
      ColorNames.InactiveCaptionText = 'InactiveCaptionText'
      ColorNames.BtnHighlight = 'BtnHighlight'
      ColorNames.DkShadow3D = '3DDkShadow'
      ColorNames.Light3D = '3DLight'
      ColorNames.InfoText = 'InfoText'
      ColorNames.InfoBk = 'InfoBk'
      ColorNames.Custom = 'Custom'
      DefaultColor = clBtnFace
      SelectedColor = clBtnFace
      Ctl3D = False
      FlatButtons = True
      FrameVisible = True
      ItemHeight = 16
      ParentCtl3D = False
      TabOrder = 4
      OnChange = CbxColorsChange
    end
    object OptShowSysColors: TRzCheckBox
      Left = 12
      Top = 32
      Width = 109
      Height = 17
      Caption = 'System Colors'
      Checked = True
      HotTrack = True
      State = cbChecked
      TabOrder = 0
      OnClick = OptShowSysColorsClick
    end
    object OptShowColorNames: TRzCheckBox
      Left = 12
      Top = 52
      Width = 97
      Height = 17
      Caption = 'Color Names'
      Checked = True
      HotTrack = True
      State = cbChecked
      TabOrder = 2
      OnClick = OptShowColorNamesClick
    end
    object OptShowDefault: TRzCheckBox
      Left = 124
      Top = 32
      Width = 61
      Height = 17
      Caption = 'Default'
      Checked = True
      HotTrack = True
      State = cbChecked
      TabOrder = 1
      OnClick = OptShowDefaultClick
    end
    object OptShowCustom: TRzCheckBox
      Left = 124
      Top = 52
      Width = 69
      Height = 17
      Caption = 'Custom'
      Checked = True
      HotTrack = True
      State = cbChecked
      TabOrder = 3
      OnClick = OptShowCustomClick
    end
  end
  object RzGroupBox4: TRzGroupBox
    Left = 244
    Top = 40
    Width = 253
    Height = 201
    Caption = 'TRzFontComboBox'
    TabOrder = 3
    object CbxFonts: TRzFontComboBox
      Left = 8
      Top = 172
      Width = 233
      Height = 22
      Ctl3D = False
      FlatButtons = True
      FrameVisible = True
      ItemHeight = 16
      ParentCtl3D = False
      TabOrder = 3
      OnChange = CbxFontsChange
    end
    object GrpFontDevice: TRzRadioGroup
      Left = 8
      Top = 16
      Width = 241
      Height = 35
      Caption = 'Font Device'
      Columns = 2
      GroupStyle = gsCustom
      ItemHotTrack = True
      ItemIndex = 0
      Items.Strings = (
        'Screen'
        'Printer')
      SpaceEvenly = True
      StartYPos = 0
      TabOrder = 0
      ThemeAware = False
      OnClick = GrpFontDeviceClick
    end
    object GrpFontType: TRzRadioGroup
      Left = 8
      Top = 56
      Width = 241
      Height = 51
      Caption = 'Font Type'
      Columns = 2
      GroupStyle = gsCustom
      ItemHotTrack = True
      ItemIndex = 0
      Items.Strings = (
        'All'
        'TrueType'
        'Fixed Pitch'
        'Printer')
      SpaceEvenly = True
      StartYPos = 0
      TabOrder = 1
      ThemeAware = False
      VerticalSpacing = 0
      OnClick = GrpFontTypeClick
    end
    object GrpShowStyle: TRzRadioGroup
      Left = 8
      Top = 112
      Width = 241
      Height = 51
      Caption = 'Show Style'
      Columns = 2
      GroupStyle = gsCustom
      ItemHotTrack = True
      ItemIndex = 0
      Items.Strings = (
        'Font Name'
        'Font Sample'
        'Name && Sample'
        'Font Preview')
      SpaceEvenly = True
      StartYPos = 0
      TabOrder = 2
      ThemeAware = False
      VerticalSpacing = 0
      OnClick = GrpShowStyleClick
    end
  end
  object RzGroupBox5: TRzGroupBox
    Left = 244
    Top = 248
    Width = 253
    Height = 61
    TabOrder = 6
    object PnlPreview: TRzPanel
      Left = 4
      Top = 8
      Width = 245
      Height = 49
      BorderOuter = fsNone
      Caption = 'Raize Components'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
end
