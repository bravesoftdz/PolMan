object FmeListBoxes: TFmeListBoxes
  Left = 0
  Top = 0
  Width = 612
  Height = 458
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  ParentFont = False
  ParentShowHint = False
  ShowHint = True
  TabOrder = 0
  object PnlTitle: TRzPanel
    Left = 0
    Top = 0
    Width = 612
    Height = 30
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = ' List Box Controls'
    Color = clBtnShadow
    Font.Charset = ANSI_CHARSET
    Font.Color = clHighlightText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object GrpListBox: TRzGroupBox
    Left = 8
    Top = 40
    Width = 177
    Height = 133
    BorderOuter = fsFlat
    Caption = 'TRzListBox'
    GroupStyle = gsTopLine
    TabOrder = 0
    ThemeAware = False
    object LstTitles: TRzListBox
      Left = 2
      Top = 15
      Width = 173
      Height = 116
      Align = alClient
      FrameVisible = True
      ItemHeight = 13
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
      TabOrder = 0
    end
  end
  object GrpTRzTabbedListBox: TRzGroupBox
    Left = 196
    Top = 40
    Width = 353
    Height = 133
    BorderOuter = fsFlat
    Caption = 'TRzTabbedListBox'
    GroupStyle = gsTopLine
    TabOrder = 1
    ThemeAware = False
    object LstTimes: TRzTabbedListBox
      Left = 2
      Top = 34
      Width = 349
      Height = 97
      TabStops.Min = -2147483647
      TabStops.Max = 2147483647
      TabStops.Integers = (
        26
        40)
      Align = alClient
      FrameSides = [sdLeft, sdRight, sdBottom]
      FrameVisible = True
      ItemHeight = 13
      Items.Strings = (
        'Action'#9'RetroActive'#9'3:41'
        'All I Want Is Everything'#9'Slang'#9'3:23'
        'Animal'#9'Hysteria'#9'4:02'
        'Another Hit and Run'#9'High '#39'n'#39' Dry'#9'4:59'
        'Armageddon It'#9'Hysteria'#9'5:21'
        'Blood Runs Cold'#9'Slang'#9'3:35'
        'Bringing on the Heartbreak'#9'High '#39'n'#39' Dry'#9'4:34'
        'Foolin'#39#9'Pyromania'#9'4:32'
        'From The Inside'#9'RetroActive'#9'4:13'
        'Hello America'#9'On Through the Night'#9'3:27'
        'Hysteria'#9'Hysteria'#9'5:49'
        'Let'#39's Get Rocked'#9'Adrenalize'#9'4:56'
        'Miss You In A Heartbeat'#9'RetroActive'#9'4:04'
        'Personal Property'#9'Adrenalize'#9'4:20'
        'Photograph'#9'Pyromania'#9'4:12'
        'Pour Some Sugar On Me'#9'Hysteria'#9'4:25'
        'Ride Into The Sun'#9'RetroActive'#9'3:12'
        'Ring Of Fire'#9'RetroActive'#9'4:42'
        'Rock Of Ages'#9'Pyromania'#9'4:09'
        'Rock Rock (Till You Drop)'#9'Pyromania'#9'3:52'
        'Rocket'#9'Hysteria'#9'6:34'
        'Run Riot'#9'Hysteria'#9'4:38'
        'Slang'#9'Slang'#9'3:48'
        'Stand Up'#9'Adrenalize'#9'4:31'
        'Switch 625'#9'High '#39'n'#39' Dry'#9'3:03'
        'Tear It Down'#9'Adrenalize'#9'3:38'
        'Tonight'#9'Adrenalize'#9'4:03'
        'Too Late For Love'#9'Pyromania'#9'4:30'
        'Two Steps Behind'#9'RetroActive'#9'4:16')
      TabOrder = 0
    end
    object RzPanel1: TRzPanel
      Left = 2
      Top = 15
      Width = 349
      Height = 19
      Align = alTop
      BorderOuter = fsStatus
      BorderSides = [sdLeft, sdTop]
      TabOrder = 1
      object HdrTimes: THeader
        Left = 1
        Top = 1
        Width = 348
        Height = 18
        Align = alClient
        BorderStyle = bsNone
        Sections.Sections = (
          #0'178'#0'Title'
          #0'97'#0'Album'
          #0'48'#0'Duration')
        TabOrder = 0
        OnSized = HdrTimesSized
      end
    end
  end
  object GrpTRzCheckList: TRzGroupBox
    Left = 8
    Top = 184
    Width = 337
    Height = 209
    BorderOuter = fsFlat
    Caption = 'TRzCheckList'
    GroupStyle = gsTopLine
    TabOrder = 2
    ThemeAware = False
    object LstVersions: TRzCheckList
      Left = 2
      Top = 15
      Width = 333
      Height = 192
      TabStops.Min = -2147483647
      TabStops.Max = 2147483647
      TabStops.Integers = (
        -34
        41)
      Align = alClient
      FrameVisible = True
      ItemHeight = 17
      Items.Strings = (
        '//Infielders'
        'Mark Grace'#9'First Base'#9'0.315'
        'Cal Ripken Jr.'#9'Short Stop'#9'0.325'
        'Bill Mueller'#9'Third Base'#9'0.302'
        '//Outfielders'
        'Sammy Sosa'#9'Right Field'#9'0.295'
        'Corey Patterson'#9'Center Field'#9'0.298'
        '//Pitchers'
        'Randy Johnson'#9'LH'#9'0.187'
        'Curt Schilling'#9'RH'#9'0.186'
        'Kerry Wood'#9'RH'#9'0.194')
      Items.ItemEnabled = (
        True
        True
        False
        True
        True
        True
        True
        True
        True
        True
        False)
      Items.ItemState = (
        0
        1
        0
        0
        0
        1
        0
        0
        1
        0
        0)
      TabOrder = 0
    end
  end
  object GrpTRzEditListBox: TRzGroupBox
    Left = 356
    Top = 184
    Width = 193
    Height = 209
    BorderOuter = fsFlat
    Caption = 'TRzEditListBox'
    GroupStyle = gsTopLine
    TabOrder = 3
    ThemeAware = False
    object LstEditTitles: TRzEditListBox
      Left = 2
      Top = 15
      Width = 189
      Height = 192
      Align = alClient
      FrameVisible = True
      ItemHeight = 13
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
      MultiSelect = True
      TabOrder = 0
      AllowDeleteByKbd = True
      OnSizeEditRect = LstEditTitlesSizeEditRect
    end
  end
end
