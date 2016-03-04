object ProductProviderForm: TProductProviderForm
  Left = 354
  Top = 125
  Width = 497
  Height = 609
  Caption = 'Product Provider'
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
  object BackPanel: TRzPanel
    Left = 0
    Top = 0
    Width = 481
    Height = 571
    Align = alClient
    BorderOuter = fsFlat
    TabOrder = 0
    object RzGroupBox1: TRzGroupBox
      Left = 8
      Top = 8
      Width = 473
      Height = 289
      Caption = 'Company Details'
      TabOrder = 0
      object RzLabel1: TRzLabel
        Left = 8
        Top = 16
        Width = 75
        Height = 13
        Caption = 'Company Name'
      end
      object RzLabel2: TRzLabel
        Left = 8
        Top = 64
        Width = 38
        Height = 13
        Caption = 'Address'
      end
      object RzLabel3: TRzLabel
        Left = 8
        Top = 112
        Width = 49
        Height = 13
        Caption = 'Post Code'
      end
      object RzLabel4: TRzLabel
        Left = 112
        Top = 112
        Width = 17
        Height = 13
        Caption = 'City'
      end
      object RzLabel5: TRzLabel
        Left = 288
        Top = 112
        Width = 36
        Height = 13
        Caption = 'Country'
      end
      object RzLabel6: TRzLabel
        Left = 8
        Top = 208
        Width = 39
        Height = 13
        Caption = 'Website'
      end
      object RzLabel7: TRzLabel
        Left = 240
        Top = 208
        Width = 72
        Height = 13
        Caption = 'Company Email'
      end
      object RzLabel13: TRzLabel
        Left = 8
        Top = 160
        Width = 51
        Height = 13
        Caption = 'Telephone'
      end
      object RzLabel14: TRzLabel
        Left = 240
        Top = 160
        Width = 17
        Height = 13
        Caption = 'Fax'
      end
      object ProductProviderCompanyName: TRzDBEdit
        Left = 8
        Top = 32
        Width = 449
        Height = 21
        DataSource = DSProductProviderInfo
        DataField = 'product_provider_company'
        FrameVisible = True
        TabOrder = 0
      end
      object RzDBEdit2: TRzDBEdit
        Left = 8
        Top = 80
        Width = 449
        Height = 21
        DataSource = DSProductProviderInfo
        DataField = 'product_provider_address'
        FrameVisible = True
        TabOrder = 1
      end
      object RzDBEdit3: TRzDBEdit
        Left = 8
        Top = 128
        Width = 89
        Height = 21
        DataSource = DSProductProviderInfo
        DataField = 'product_provider_zip'
        FrameVisible = True
        TabOrder = 2
      end
      object RzDBEdit4: TRzDBEdit
        Left = 112
        Top = 128
        Width = 161
        Height = 21
        DataSource = DSProductProviderInfo
        DataField = 'product_provider_city'
        FrameVisible = True
        TabOrder = 3
      end
      object RzDBLookupComboBox1: TRzDBLookupComboBox
        Left = 288
        Top = 128
        Width = 169
        Height = 21
        Ctl3D = False
        DataField = 'product_provider_country'
        DataSource = DSProductProviderInfo
        KeyField = 'country_id'
        ListField = 'country_name'
        ListSource = MainForm.DSCountries
        ParentCtl3D = False
        TabOrder = 4
        FrameVisible = True
      end
      object RzDBEdit5: TRzDBEdit
        Left = 8
        Top = 224
        Width = 217
        Height = 21
        DataSource = DSProductProviderInfo
        DataField = 'product_provider_website'
        FrameVisible = True
        TabOrder = 7
      end
      object RzDBEdit6: TRzDBEdit
        Left = 240
        Top = 224
        Width = 217
        Height = 21
        DataSource = DSProductProviderInfo
        DataField = 'product_provider_email'
        FrameVisible = True
        TabOrder = 8
      end
      object RzDBEdit11: TRzDBEdit
        Left = 8
        Top = 176
        Width = 217
        Height = 21
        DataSource = DSProductProviderInfo
        DataField = 'product_provider_telephone'
        FrameVisible = True
        TabOrder = 5
      end
      object RzDBEdit12: TRzDBEdit
        Left = 240
        Top = 176
        Width = 217
        Height = 21
        DataSource = DSProductProviderInfo
        DataField = 'product_provider_fax'
        FrameVisible = True
        TabOrder = 6
      end
      object DeleteCompanyButton: TRzButton
        Left = 208
        Top = 256
        Caption = 'Delete'
        Color = 15791348
        HighlightColor = 16026986
        HotTrack = True
        HotTrackColor = 3983359
        TabOrder = 9
      end
      object EditCompanyButton: TRzButton
        Left = 296
        Top = 256
        Caption = 'Edit'
        Color = 15791348
        HighlightColor = 16026986
        HotTrack = True
        HotTrackColor = 3983359
        TabOrder = 10
        OnClick = EditCompanyButtonClick
      end
      object SaveCompanyButton: TRzButton
        Left = 384
        Top = 256
        Caption = 'Save'
        Color = 15791348
        Enabled = False
        HighlightColor = 16026986
        HotTrack = True
        HotTrackColor = 3983359
        TabOrder = 11
        OnClick = SaveCompanyButtonClick
      end
    end
    object RzGroupBox2: TRzGroupBox
      Left = 8
      Top = 304
      Width = 473
      Height = 233
      Caption = 'Contacts'
      TabOrder = 1
      object RzLabel8: TRzLabel
        Left = 8
        Top = 128
        Width = 78
        Height = 13
        Caption = 'Contact Persons'
      end
      object RzLabel9: TRzLabel
        Left = 248
        Top = 16
        Width = 62
        Height = 13
        Caption = 'Busines Area'
      end
      object RzLabel10: TRzLabel
        Left = 248
        Top = 60
        Width = 51
        Height = 13
        Caption = 'Telephone'
      end
      object RzLabel11: TRzLabel
        Left = 248
        Top = 108
        Width = 17
        Height = 13
        Caption = 'Fax'
      end
      object RzLabel12: TRzLabel
        Left = 248
        Top = 156
        Width = 26
        Height = 13
        Caption = 'EMail'
      end
      object RzLabel15: TRzLabel
        Left = 8
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Name'
      end
      object RzLabel16: TRzLabel
        Left = 8
        Top = 60
        Width = 85
        Height = 13
        Caption = 'List of all contacts'
      end
      object ContactList: TRzListBox
        Left = 8
        Top = 76
        Width = 217
        Height = 117
        FrameVisible = True
        ItemHeight = 13
        TabOrder = 0
        OnClick = ContactListClick
      end
      object RzDBEdit7: TRzDBEdit
        Left = 248
        Top = 32
        Width = 217
        Height = 21
        DataSource = DSProductProviderContacts
        DataField = 'contact_business_area'
        FrameVisible = True
        TabOrder = 2
      end
      object RzDBEdit8: TRzDBEdit
        Left = 248
        Top = 172
        Width = 217
        Height = 21
        DataSource = DSProductProviderContacts
        DataField = 'contact_email'
        FrameVisible = True
        TabOrder = 5
      end
      object RzDBEdit9: TRzDBEdit
        Left = 248
        Top = 124
        Width = 217
        Height = 21
        DataSource = DSProductProviderContacts
        DataField = 'contact_fax'
        FrameVisible = True
        TabOrder = 4
      end
      object RzDBEdit10: TRzDBEdit
        Left = 248
        Top = 76
        Width = 217
        Height = 21
        DataSource = DSProductProviderContacts
        DataField = 'contact_telephone'
        FrameVisible = True
        TabOrder = 3
      end
      object RzDBEdit1: TRzDBEdit
        Left = 8
        Top = 32
        Width = 217
        Height = 21
        DataSource = DSProductProviderContacts
        DataField = 'contact_name'
        FrameVisible = True
        TabOrder = 1
      end
      object DeleteContactButton: TRzButton
        Left = 128
        Top = 200
        Caption = 'Delete'
        Color = 15791348
        HighlightColor = 16026986
        HotTrack = True
        HotTrackColor = 3983359
        TabOrder = 6
        OnClick = DeleteContactButtonClick
      end
      object AddContactButton: TRzButton
        Left = 216
        Top = 200
        Caption = 'Add'
        Color = 15791348
        HighlightColor = 16026986
        HotTrack = True
        HotTrackColor = 3983359
        TabOrder = 7
        OnClick = AddContactButtonClick
      end
      object EditContactButton: TRzButton
        Left = 304
        Top = 200
        Caption = 'Edit'
        Color = 15791348
        HighlightColor = 16026986
        HotTrack = True
        HotTrackColor = 3983359
        TabOrder = 8
        OnClick = EditContactButtonClick
      end
      object SaveContactButton: TRzButton
        Left = 392
        Top = 200
        Caption = 'Save'
        Color = 15791348
        Enabled = False
        HighlightColor = 16026986
        HotTrack = True
        HotTrackColor = 3983359
        TabOrder = 9
        OnClick = SaveContactButtonClick
      end
    end
    object CloseButton: TRzButton
      Left = 408
      Top = 544
      Caption = 'Close'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 2
      OnClick = CloseButtonClick
    end
  end
  object qProductProviderInfo: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 80
    Top = 40
  end
  object qProductProviderContacts: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 24
    Top = 408
  end
  object DSProductProviderInfo: TDataSource
    AutoEdit = False
    DataSet = qProductProviderInfo
    Left = 112
    Top = 40
  end
  object DSProductProviderContacts: TDataSource
    AutoEdit = False
    DataSet = qProductProviderContacts
    Left = 56
    Top = 408
  end
  object qMaxID: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    SQL.Strings = (
      
        'SELECT MAX(product_provider_id) AS max_id FROM tbl_product_provi' +
        'der')
    Left = 152
    Top = 40
  end
end
