object ClientForm: TClientForm
  Left = 221
  Top = 118
  Width = 855
  Height = 559
  Caption = 'ClientForm'
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
  object ClientPanel: TRzPanel
    Left = 0
    Top = 0
    Width = 839
    Height = 521
    Align = alClient
    BorderOuter = fsFlat
    TabOrder = 0
    DesignSize = (
      839
      521)
    object Label19: TLabel
      Left = 8
      Top = 8
      Width = 40
      Height = 13
      Caption = 'Client ID'
    end
    object Label24: TLabel
      Left = 504
      Top = 8
      Width = 75
      Height = 13
      Caption = 'Company Name'
    end
    object Label25: TLabel
      Left = 8
      Top = 48
      Width = 50
      Height = 13
      Caption = 'First Name'
    end
    object Label26: TLabel
      Left = 216
      Top = 48
      Width = 51
      Height = 13
      Caption = 'Last Name'
    end
    object Label27: TLabel
      Left = 8
      Top = 88
      Width = 38
      Height = 13
      Caption = 'Address'
    end
    object Label28: TLabel
      Left = 264
      Top = 88
      Width = 49
      Height = 13
      Caption = 'Post Code'
    end
    object Label29: TLabel
      Left = 344
      Top = 88
      Width = 17
      Height = 13
      Caption = 'City'
    end
    object Label30: TLabel
      Left = 560
      Top = 88
      Width = 36
      Height = 13
      Caption = 'Country'
    end
    object Label31: TLabel
      Left = 8
      Top = 128
      Width = 31
      Height = 13
      Caption = 'Phone'
    end
    object Label32: TLabel
      Left = 144
      Top = 128
      Width = 17
      Height = 13
      Caption = 'Fax'
    end
    object Label33: TLabel
      Left = 312
      Top = 24
      Width = 25
      Height = 13
      Caption = 'Email'
      Color = clBtnFace
      ParentColor = False
      Transparent = True
    end
    object Label34: TLabel
      Left = 80
      Top = 8
      Width = 29
      Height = 13
      Caption = 'Title 1'
    end
    object Label35: TLabel
      Left = 224
      Top = 8
      Width = 29
      Height = 13
      Caption = 'Title 2'
    end
    object Label36: TLabel
      Left = 456
      Top = 128
      Width = 18
      Height = 13
      Caption = 'Sex'
    end
    object Label37: TLabel
      Left = 560
      Top = 128
      Width = 49
      Height = 13
      Caption = 'Nationality'
    end
    object Label38: TLabel
      Left = 600
      Top = 48
      Width = 92
      Height = 13
      Caption = 'Job Title or Industry'
    end
    object Label39: TLabel
      Left = 440
      Top = 48
      Width = 90
      Height = 13
      Caption = 'Professional Status'
    end
    object Label40: TLabel
      Left = 280
      Top = 128
      Width = 25
      Height = 13
      Caption = 'Email'
    end
    object Label41: TLabel
      Left = 144
      Top = 168
      Width = 63
      Height = 13
      Caption = 'ID Card Type'
    end
    object Label42: TLabel
      Left = 320
      Top = 168
      Width = 76
      Height = 13
      Caption = 'ID Card Number'
    end
    object Label43: TLabel
      Left = 8
      Top = 288
      Width = 142
      Height = 13
      Caption = 'Internal Comments (EBN Only)'
    end
    object Label44: TLabel
      Left = 456
      Top = 288
      Width = 218
      Height = 13
      Caption = 'External Comments (Can be viewed by Broker)'
    end
    object Label1: TLabel
      Left = 8
      Top = 208
      Width = 95
      Height = 13
      Caption = 'Height (Centimeters)'
    end
    object Label2: TLabel
      Left = 112
      Top = 208
      Width = 88
      Height = 13
      Caption = 'Weight (Kilograms)'
    end
    object Label3: TLabel
      Left = 216
      Top = 208
      Width = 68
      Height = 13
      Caption = 'Doctors Name'
    end
    object Label4: TLabel
      Left = 8
      Top = 248
      Width = 111
      Height = 13
      Caption = 'Additional Health Notes'
    end
    object Label5: TLabel
      Left = 8
      Top = 168
      Width = 38
      Height = 13
      Caption = 'Birthday'
    end
    object Label6: TLabel
      Left = 648
      Top = 168
      Width = 36
      Height = 13
      Caption = 'Policies'
    end
    object RzDBNumericEdit2: TRzDBNumericEdit
      Left = 8
      Top = 24
      Width = 65
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_id'
      ReadOnly = True
      Color = clBtnFace
      FrameVisible = True
      TabOrder = 0
      DisplayFormat = '#########'
    end
    object RzDBEdit12: TRzDBEdit
      Left = 504
      Top = 24
      Width = 337
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_company'
      Anchors = [akLeft, akTop, akRight]
      FrameVisible = True
      TabOrder = 1
    end
    object RzDBEdit13: TRzDBEdit
      Left = 8
      Top = 64
      Width = 201
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_firstname'
      FrameVisible = True
      TabOrder = 2
    end
    object RzDBEdit14: TRzDBEdit
      Left = 216
      Top = 64
      Width = 217
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_lastname'
      FrameVisible = True
      TabOrder = 3
    end
    object RzDBEdit15: TRzDBEdit
      Left = 8
      Top = 104
      Width = 249
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_address'
      FrameVisible = True
      TabOrder = 4
    end
    object RzDBEdit16: TRzDBEdit
      Left = 264
      Top = 104
      Width = 73
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_zip'
      FrameVisible = True
      TabOrder = 5
    end
    object RzDBEdit17: TRzDBEdit
      Left = 344
      Top = 104
      Width = 209
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_city'
      FrameVisible = True
      TabOrder = 6
    end
    object RzDBLookupComboBox8: TRzDBLookupComboBox
      Left = 560
      Top = 104
      Width = 281
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = False
      DataField = 'client_country'
      DataSource = DSClientInfo
      KeyField = 'country_id'
      ListField = 'country_name'
      ListSource = MainForm.DSCountries
      ParentCtl3D = False
      TabOrder = 7
      FlatButtonColor = clWindow
      FrameVisible = True
    end
    object RzDBEdit18: TRzDBEdit
      Left = 8
      Top = 144
      Width = 129
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_telephone'
      FrameVisible = True
      TabOrder = 8
    end
    object RzDBEdit19: TRzDBEdit
      Left = 144
      Top = 144
      Width = 129
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_fax'
      FrameVisible = True
      TabOrder = 9
    end
    object RzDBEdit20: TRzDBEdit
      Left = 280
      Top = 144
      Width = 169
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_email'
      FrameVisible = True
      TabOrder = 10
    end
    object RzDBLookupComboBox9: TRzDBLookupComboBox
      Left = 80
      Top = 24
      Width = 137
      Height = 21
      Ctl3D = False
      DataField = 'client_title1'
      DataSource = DSClientInfo
      KeyField = 'title_id'
      ListField = 'title'
      ListSource = MainForm.DSTitle1
      ParentCtl3D = False
      TabOrder = 11
      FlatButtonColor = clWindow
      FrameVisible = True
    end
    object RzDBLookupComboBox10: TRzDBLookupComboBox
      Left = 224
      Top = 24
      Width = 273
      Height = 21
      Ctl3D = False
      DataField = 'client_title2'
      DataSource = DSClientInfo
      KeyField = 'title_id'
      ListField = 'title'
      ListSource = MainForm.DSTitle2
      ParentCtl3D = False
      TabOrder = 12
      FlatButtonColor = clWindow
      FrameVisible = True
    end
    object RzDBLookupComboBox11: TRzDBLookupComboBox
      Left = 456
      Top = 144
      Width = 97
      Height = 21
      Ctl3D = False
      DataField = 'client_sex'
      DataSource = DSClientInfo
      KeyField = 'sex_id'
      ListField = 'sex_desc'
      ListSource = MainForm.DSSex
      ParentCtl3D = False
      TabOrder = 13
      FlatButtonColor = clWindow
      FrameVisible = True
    end
    object RzDBLookupComboBox12: TRzDBLookupComboBox
      Left = 560
      Top = 144
      Width = 281
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = False
      DataField = 'client_nationality'
      DataSource = DSClientInfo
      KeyField = 'country_id'
      ListField = 'country_name'
      ListSource = MainForm.DSCountries
      ParentCtl3D = False
      TabOrder = 14
      FlatButtonColor = clWindow
      FrameVisible = True
    end
    object RzDBEdit21: TRzDBEdit
      Left = 600
      Top = 64
      Width = 241
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_job_title'
      Anchors = [akLeft, akTop, akRight]
      FrameVisible = True
      TabOrder = 15
    end
    object RzDBLookupComboBox13: TRzDBLookupComboBox
      Left = 440
      Top = 64
      Width = 153
      Height = 21
      Ctl3D = False
      DataField = 'client_prof_status'
      DataSource = DSClientInfo
      KeyField = 'prof_status_id'
      ListField = 'status_desc'
      ListSource = MainForm.DSProfStatus
      ParentCtl3D = False
      TabOrder = 16
      FlatButtonColor = clWindow
      FrameVisible = True
    end
    object RzDBLookupComboBox14: TRzDBLookupComboBox
      Left = 144
      Top = 184
      Width = 169
      Height = 21
      Ctl3D = False
      DataField = 'client_id_type'
      DataSource = DSClientInfo
      KeyField = 'idcard_id'
      ListField = 'idcard_type'
      ListSource = MainForm.DSIDCard
      ParentCtl3D = False
      TabOrder = 17
      FlatButtonColor = clWindow
      FrameVisible = True
    end
    object RzDBEdit22: TRzDBEdit
      Left = 320
      Top = 184
      Width = 169
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_id_number'
      FrameVisible = True
      TabOrder = 18
    end
    object RzDBCheckBox2: TRzDBCheckBox
      Left = 496
      Top = 184
      Width = 137
      Height = 17
      DataField = 'client_copy_id'
      DataSource = DSClientInfo
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Caption = 'Copy of ID Card at EBN'
      CustomGlyphs.Data = {
        B6130000424DB61300000000000036000000280000007F0000000D0000000100
        1800000000008013000000000000000000000000000000000000008080808080
        8080808080808080808080808080808080808080808080808080808080808080
        8080808000808080808080808080808080808080808080808080808080808080
        8080808080808080808080808080008080808080808080808080808080808080
        8080808080808080808080808080808080808080808080800080808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        8080008080808080808080808080808080808080808080808080808080808080
        8080808080808080808080800080808080808080808080808080808080808080
        8080808080808080808080808080808080808080808000808080808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        0080808080808080808080808080808080808080808080808080808080808080
        8080808080808080808000808080808080808080808080808080808080808080
        8080808080808080808080808080808080808080008080000000008080808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
        8080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080
        008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080000000008080808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
        8080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080
        008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080000000008080808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
        8080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFF0000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080
        008080808080FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080000000008080808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080008080808080FFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFF
        FFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
        8080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFF0000000000
        00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080
        008080808080FFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080000000008080808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080008080808080FFFFFFFFFFFF000000000000000000000000000000FF
        FFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFF
        FFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF80
        8080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFF0000000000000000
        00000000000000FFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080
        008080808080FFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFF
        FFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080000000008080808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080008080808080FFFFFFFFFFFF000000000000FFFFFF00000000000000
        0000FFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFF
        FFFFFFFF000000000000FFFFFF000000000000000000FFFFFFFFFFFFFFFFFF80
        8080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFF000000000000FFFF
        FF000000000000000000FFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080
        008080808080FFFFFFFFFFFF000000000000FFFFFF000000000000000000FFFF
        FFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080000000008080808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080008080808080FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00000000
        0000000000FFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFF
        FFFFFFFF000000FFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFF80
        8080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFF000000FFFFFFFFFF
        FFFFFFFF000000000000000000FFFFFFFFFFFF808080008080808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080
        008080808080FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000000000000000
        00FFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080000000008080808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF80
        8080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000000000FFFFFFFFFFFF808080008080808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080
        008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
        00FFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080000000008080808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF80
        8080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF808080008080808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080
        008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00FFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080000000008080808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
        8080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080
        008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080000000008080808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
        8080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080
        008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF808080008080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080000000008080808080
        8080808080808080808080808080808080808080808080808080808080808080
        8080808000808080808080808080808080808080808080808080808080808080
        8080808080808080808080808080008080808080808080808080808080808080
        8080808080808080808080808080808080808080808080800080808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        8080008080808080808080808080808080808080808080808080808080808080
        8080808080808080808080800080808080808080808080808080808080808080
        8080808080808080808080808080808080808080808000808080808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        0080808080808080808080808080808080808080808080808080808080808080
        8080808080808080808000808080808080808080808080808080808080808080
        8080808080808080808080808080808080808080008080000000}
      TabOrder = 19
      UseCustomGlyphs = True
    end
    object RzDBRichEdit3: TRzDBRichEdit
      Left = 8
      Top = 304
      Width = 385
      Height = 189
      Anchors = [akLeft, akTop, akBottom]
      DataField = 'client_private_comments'
      DataSource = DSClientInfo
      TabOrder = 20
      FrameVisible = True
    end
    object RzDBRichEdit4: TRzDBRichEdit
      Left = 456
      Top = 304
      Width = 385
      Height = 189
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataField = 'client_public_comments'
      DataSource = DSClientInfo
      TabOrder = 21
      FrameVisible = True
    end
    object RzDBNumericEdit1: TRzDBNumericEdit
      Left = 8
      Top = 224
      Width = 97
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_height'
      FrameVisible = True
      TabOrder = 22
      DisplayFormat = ',0;(,0)'
    end
    object RzDBNumericEdit3: TRzDBNumericEdit
      Left = 112
      Top = 224
      Width = 97
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_weight'
      FrameVisible = True
      TabOrder = 23
      DisplayFormat = ',0;(,0)'
    end
    object RzDBEdit1: TRzDBEdit
      Left = 216
      Top = 224
      Width = 425
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_doctor'
      Anchors = [akLeft, akTop, akRight]
      FrameVisible = True
      TabOrder = 24
    end
    object RzDBEdit2: TRzDBEdit
      Left = 8
      Top = 264
      Width = 633
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_health_notes'
      Anchors = [akLeft, akTop, akRight]
      FrameVisible = True
      TabOrder = 25
    end
    object RzDBDateTimeEdit1: TRzDBDateTimeEdit
      Left = 8
      Top = 184
      Width = 129
      Height = 21
      DataSource = DSClientInfo
      DataField = 'client_birthdate'
      FrameVisible = True
      TabOrder = 26
      EditType = etDate
      FlatButtons = True
    end
    object ClientPolicyList: TRzListBox
      Left = 648
      Top = 184
      Width = 193
      Height = 101
      FrameVisible = True
      ItemHeight = 13
      TabOrder = 27
      OnDblClick = ClientPolicyListDblClick
    end
    object RzButton1: TRzButton
      Left = 400
      Top = 376
      Width = 51
      Caption = '>>'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 28
    end
    object EditClientInfoButton: TRzButton
      Left = 520
      Top = 496
      Anchors = [akRight, akBottom]
      Caption = 'Edit'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 29
      OnClick = EditClientInfoButtonClick
    end
    object SaveClientInfoButton: TRzButton
      Left = 600
      Top = 496
      Anchors = [akRight, akBottom]
      Caption = 'Save'
      Color = 15791348
      Enabled = False
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 30
      OnClick = SaveClientInfoButtonClick
    end
    object DeleteButton: TRzButton
      Left = 680
      Top = 496
      Anchors = [akRight, akBottom]
      Caption = 'Delete'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 31
      OnClick = DeleteButtonClick
    end
    object CloseButton: TRzButton
      Left = 760
      Top = 496
      Anchors = [akRight, akBottom]
      Caption = 'Close'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 32
      OnClick = CloseButtonClick
    end
  end
  object qClientInfo: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 32
    Top = 416
  end
  object DSClientInfo: TDataSource
    AutoEdit = False
    DataSet = qClientInfo
    Left = 64
    Top = 416
  end
  object qClientPolicyList: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 488
    Top = 344
  end
  object DSClientPolicyList: TDataSource
    DataSet = qClientPolicyList
    Left = 520
    Top = 344
  end
end
