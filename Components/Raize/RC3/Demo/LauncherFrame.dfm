object FmeLauncher: TFmeLauncher
  Left = 0
  Top = 0
  Width = 574
  Height = 393
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 40
    Width = 349
    Height = 161
    Caption = 'TRzLauncher'
    TabOrder = 0
    Transparent = True
    object RzLabel2: TRzLabel
      Left = 12
      Top = 24
      Width = 56
      Height = 13
      Caption = '&File Name'
      FocusControl = EdtFileName
      Transparent = True
      BevelWidth = 0
    end
    object RzLabel6: TRzLabel
      Left = 12
      Top = 52
      Width = 66
      Height = 13
      Caption = '&Parameters'
      FocusControl = EdtParameters
      Transparent = True
      BevelWidth = 0
    end
    object RzSeparator2: TRzSeparator
      Left = 12
      Top = 120
      Width = 331
      ShowGradient = True
      Color = clBtnFace
      ParentColor = False
    end
    object RzSeparator1: TRzSeparator
      Left = 12
      Top = 80
      Width = 331
      ShowGradient = True
      Color = clBtnFace
      ParentColor = False
    end
    object EdtFileName: TRzButtonEdit
      Left = 85
      Top = 20
      Width = 257
      Height = 21
      FrameVisible = True
      TabOrder = 0
      ButtonKind = bkFolder
      FlatButtons = True
      OnButtonClick = EdtFileNameButtonClick
    end
    object EdtParameters: TRzEdit
      Left = 85
      Top = 48
      Width = 257
      Height = 21
      FrameVisible = True
      TabOrder = 1
    end
    object ChkWait: TRzCheckBox
      Left = 84
      Top = 92
      Width = 133
      Height = 17
      Caption = '&Wait Until Finished'
      HotTrack = True
      State = cbUnchecked
      TabOrder = 2
      Transparent = True
    end
    object BtnLaunch: TRzButton
      Left = 267
      Top = 88
      Caption = 'Launch'
      Color = 15791348
      HotTrack = True
      ParentColor = False
      TabOrder = 3
      OnClick = BtnLaunchClick
    end
    object BtnExecute: TRzButton
      Left = 267
      Top = 128
      Caption = 'Execute'
      Color = 15791348
      HotTrack = True
      ParentColor = False
      TabOrder = 4
      OnClick = BtnExecuteClick
    end
    object ChkIgnoreErrors: TRzCheckBox
      Left = 84
      Top = 132
      Width = 115
      Height = 17
      Caption = '&Ignore Errors'
      Checked = True
      HotTrack = True
      State = cbChecked
      TabOrder = 5
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 8
    Top = 208
    Width = 349
    Height = 85
    Caption = 'TRzURLLabel'
    TabOrder = 1
    Transparent = True
    object RzLabel3: TRzLabel
      Left = 8
      Top = 20
      Width = 119
      Height = 13
      Caption = 'Product Information:'
      Transparent = True
      BevelWidth = 0
    end
    object RzURLLabel4: TRzURLLabel
      Left = 148
      Top = 20
      Width = 144
      Height = 13
      Caption = 'http://www.raize.com'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10040166
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = True
      BevelWidth = 0
      URL = 'http://www.raize.com'
      UnvisitedColor = 10040166
      VisitedColor = clGray
    end
    object RzLabel4: TRzLabel
      Left = 8
      Top = 40
      Width = 107
      Height = 13
      Caption = 'Technical Support:'
      Transparent = True
      BevelWidth = 0
    end
    object RzURLLabel5: TRzURLLabel
      Left = 148
      Top = 40
      Width = 170
      Height = 13
      Caption = 'mailto:support@raize.com'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10040166
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = True
      BevelWidth = 0
      URL = 'mailto:support@raize.com'
      UnvisitedColor = 10040166
      VisitedColor = clGray
    end
    object RzURLLabel6: TRzURLLabel
      Left = 147
      Top = 60
      Width = 189
      Height = 13
      Caption = 'raize.public.rzcomps.support'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10040166
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = True
      BevelWidth = 0
      URL = 'news://news.shoresoft.com/raize.public.rzcomps.support'
      UnvisitedColor = 10040166
      VisitedColor = clGray
    end
    object RzLabel5: TRzLabel
      Left = 8
      Top = 60
      Width = 117
      Height = 13
      Caption = 'Newsgroup Support:'
      Transparent = True
      BevelWidth = 0
    end
  end
  object PnlTitle: TRzPanel
    Left = 0
    Top = 0
    Width = 574
    Height = 30
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = ' Application Launcher Components'
    Color = clBtnShadow
    Font.Charset = ANSI_CHARSET
    Font.Color = clHighlightText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object RzLauncher1: TRzLauncher
    Action = 'Open'
    Timeout = -1
    OnFinished = RzLauncher1Finished
    OnError = RzLauncher1Error
    Left = 12
    Top = 84
  end
  object DlgOpen: TRzOpenDialog
    Options = [osoFileMustExist, osoHideReadOnly, osoPathMustExist, osoAllowTree, osoShowHints, osoOleDrag, osoOleDrop, osoShowHidden]
    Left = 440
    Top = 48
  end
end
