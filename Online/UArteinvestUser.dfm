object ArteinvestUserForm: TArteinvestUserForm
  Left = 363
  Top = 174
  Width = 872
  Height = 644
  Caption = 'Art'#8364'Invest Website Administration'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 864
    Height = 617
    Align = alClient
    BorderOuter = fsFlat
    TabOrder = 0
    DesignSize = (
      864
      617)
    object RzGroupBox1: TRzGroupBox
      Left = 8
      Top = 8
      Width = 849
      Height = 225
      Anchors = [akLeft, akTop, akRight]
      Caption = 'New User Requests From Web'
      TabOrder = 0
      DesignSize = (
        849
        225)
      object NewUserGrid: TcxGrid
        Left = 8
        Top = 16
        Width = 753
        Height = 200
        Anchors = [akLeft, akTop, akRight]
        BevelInner = bvNone
        BevelOuter = bvNone
        TabOrder = 0
        object NewUserGridDBTableView1: TcxGridDBTableView
          OnDblClick = NewUserGridDBTableView1DblClick
          DataController.DataSource = dsNewUser
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object NewUserGridDBTableView1usr_login_name: TcxGridDBColumn
            Caption = 'Login'
            MinWidth = 0
            Width = 100
            DataBinding.FieldName = 'usr_login_name'
          end
          object NewUserGridDBTableView1company: TcxGridDBColumn
            Caption = 'Company'
            SortOrder = soAscending
            Width = 150
            DataBinding.FieldName = 'company'
          end
          object NewUserGridDBTableView1first_name: TcxGridDBColumn
            Caption = 'First Name'
            Width = 150
            DataBinding.FieldName = 'first_name'
          end
          object NewUserGridDBTableView1last_name: TcxGridDBColumn
            Caption = 'Last Name'
            Width = 150
            DataBinding.FieldName = 'last_name'
          end
          object NewUserGridDBTableView1address: TcxGridDBColumn
            Caption = 'Address'
            Width = 200
            DataBinding.FieldName = 'address'
          end
          object NewUserGridDBTableView1zip: TcxGridDBColumn
            Caption = 'ZIP'
            Width = 50
            DataBinding.FieldName = 'zip'
          end
          object NewUserGridDBTableView1city: TcxGridDBColumn
            Caption = 'City'
            Width = 100
            DataBinding.FieldName = 'city'
          end
          object NewUserGridDBTableView1country: TcxGridDBColumn
            Caption = 'Country'
            Width = 100
            DataBinding.FieldName = 'country'
          end
          object NewUserGridDBTableView1telephone: TcxGridDBColumn
            Caption = 'Telephone'
            Width = 80
            DataBinding.FieldName = 'telephone'
          end
          object NewUserGridDBTableView1email: TcxGridDBColumn
            Caption = 'E-mail'
            Width = 80
            DataBinding.FieldName = 'email'
          end
          object NewUserGridDBTableView1mobile: TcxGridDBColumn
            Caption = 'GSM'
            Width = 80
            DataBinding.FieldName = 'mobile'
          end
        end
        object NewUserGridLevel1: TcxGridLevel
          GridView = NewUserGridDBTableView1
        end
      end
      object EditNewUserButton: TNixButton
        Left = 768
        Top = 191
        AlwaysFlat = True
        Background.Gradient.NumberOfColors = 32
        Background.Style = bkGradient
        BorderColors.Brightest = clBtnHighlight
        BorderColors.Bright = 14671839
        BorderColors.Dark = clBtnShadow
        BorderColors.Darkest = clBtnText
        BorderColors.Flat = clBtnShadow
        About = aiAbout
        Caption = 'Edit'
        TabOrder = 1
        OnClick = EditNewUserButtonClick
        Anchors = [akTop, akRight]
      end
      object DeleteNewUserButton: TNixButton
        Left = 768
        Top = 160
        AlwaysFlat = True
        Background.Gradient.NumberOfColors = 32
        Background.Style = bkGradient
        BorderColors.Brightest = clBtnHighlight
        BorderColors.Bright = 14671839
        BorderColors.Dark = clBtnShadow
        BorderColors.Darkest = clBtnText
        BorderColors.Flat = clBtnShadow
        About = aiAbout
        Caption = 'Delete'
        TabOrder = 2
        OnClick = DeleteNewUserButtonClick
        Anchors = [akTop, akRight]
      end
    end
    object RzGroupBox2: TRzGroupBox
      Left = 8
      Top = 240
      Width = 849
      Height = 337
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Existing Users'
      TabOrder = 1
      DesignSize = (
        849
        337)
      object ExistingUserGrid: TcxGrid
        Left = 8
        Top = 16
        Width = 753
        Height = 313
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelInner = bvNone
        BevelOuter = bvNone
        TabOrder = 0
        object ExistingUserGridDBTableView1: TcxGridDBTableView
          OnDblClick = ExistingUserGridDBTableView1DblClick
          DataController.DataSource = dsExistingUser
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object ExistingUserGridDBTableView1usr_login_name: TcxGridDBColumn
            Caption = 'Login'
            SortOrder = soAscending
            Width = 100
            DataBinding.FieldName = 'usr_login_name'
          end
          object ExistingUserGridDBTableView1broker_id: TcxGridDBColumn
            Caption = 'Broker ID'
            Width = 50
            DataBinding.FieldName = 'broker_id'
          end
          object ExistingUserGridDBTableView1last_login: TcxGridDBColumn
            Caption = 'Last Login'
            DataBinding.FieldName = 'last_login'
          end
          object ExistingUserGridDBTableView1company: TcxGridDBColumn
            Caption = 'Company'
            Width = 150
            DataBinding.FieldName = 'company'
          end
          object ExistingUserGridDBTableView1first_name: TcxGridDBColumn
            Caption = 'First Name'
            Width = 150
            DataBinding.FieldName = 'first_name'
          end
          object ExistingUserGridDBTableView1last_name: TcxGridDBColumn
            Caption = 'Last Name'
            Width = 150
            DataBinding.FieldName = 'last_name'
          end
          object ExistingUserGridDBTableView1address: TcxGridDBColumn
            Caption = 'Address'
            Width = 200
            DataBinding.FieldName = 'address'
          end
          object ExistingUserGridDBTableView1zip: TcxGridDBColumn
            Caption = 'ZIP'
            Width = 50
            DataBinding.FieldName = 'zip'
          end
          object ExistingUserGridDBTableView1city: TcxGridDBColumn
            Caption = 'City'
            Width = 100
            DataBinding.FieldName = 'city'
          end
          object ExistingUserGridDBTableView1country: TcxGridDBColumn
            Caption = 'Country'
            Width = 100
            DataBinding.FieldName = 'country'
          end
          object ExistingUserGridDBTableView1telephone: TcxGridDBColumn
            Caption = 'Telephone'
            Width = 80
            DataBinding.FieldName = 'telephone'
          end
          object ExistingUserGridDBTableView1email: TcxGridDBColumn
            Caption = 'E-mail'
            Width = 80
            DataBinding.FieldName = 'email'
          end
        end
        object ExistingUserGridLevel1: TcxGridLevel
          GridView = ExistingUserGridDBTableView1
        end
      end
      object EditExistingUserButton: TNixButton
        Left = 768
        Top = 304
        AlwaysFlat = True
        Background.Gradient.NumberOfColors = 32
        Background.Style = bkGradient
        BorderColors.Brightest = clBtnHighlight
        BorderColors.Bright = 14671839
        BorderColors.Dark = clBtnShadow
        BorderColors.Darkest = clBtnText
        BorderColors.Flat = clBtnShadow
        About = aiAbout
        Caption = 'Edit'
        TabOrder = 1
        OnClick = EditExistingUserButtonClick
        Anchors = [akRight, akBottom]
      end
      object DeleteExistingUserButton: TNixButton
        Left = 768
        Top = 240
        AlwaysFlat = True
        Background.Gradient.NumberOfColors = 32
        Background.Style = bkGradient
        BorderColors.Brightest = clBtnHighlight
        BorderColors.Bright = 14671839
        BorderColors.Dark = clBtnShadow
        BorderColors.Darkest = clBtnText
        BorderColors.Flat = clBtnShadow
        About = aiAbout
        Caption = 'Delete'
        TabOrder = 2
        OnClick = DeleteExistingUserButtonClick
        Anchors = [akRight, akBottom]
      end
      object NewButton: TNixButton
        Left = 768
        Top = 272
        AlwaysFlat = True
        Background.Gradient.NumberOfColors = 32
        Background.Style = bkGradient
        BorderColors.Brightest = clBtnHighlight
        BorderColors.Bright = 14671839
        BorderColors.Dark = clBtnShadow
        BorderColors.Darkest = clBtnText
        BorderColors.Flat = clBtnShadow
        About = aiAbout
        Caption = 'New'
        TabOrder = 3
        OnClick = NewButtonClick
        Anchors = [akRight, akBottom]
      end
    end
    object CloseButton: TNixButton
      Left = 776
      Top = 584
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
      TabOrder = 2
      OnClick = CloseButtonClick
      Anchors = [akRight, akBottom]
    end
  end
  object dsNewUser: TDataSource
    AutoEdit = False
    DataSet = tNewUser
    Left = 88
    Top = 64
  end
  object dsExistingUser: TDataSource
    DataSet = tExistingUser
    Left = 56
    Top = 296
  end
  object DB_Arteinvest: TmySQLDatabase
    ConnectOptions = []
    ConnectionTimeout = 6000
    Params.Strings = (
      'Port=3306'
      'TIMEOUT=6000')
    Left = 24
    Top = 64
  end
  object tNewUser: TmySQLTable
    Database = DB_Arteinvest
    TableName = ' tbl_new_user_request'
    Left = 56
    Top = 64
  end
  object tExistingUser: TmySQLTable
    Database = DB_Arteinvest
    FieldDefs = <
      item
        Name = 'tExistingUserField1'
      end>
    StoreDefs = True
    TableName = ' tbl_webusers'
    Left = 24
    Top = 296
  end
end
