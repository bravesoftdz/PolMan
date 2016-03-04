object ArteInvestPictureForm: TArteInvestPictureForm
  Left = 289
  Top = 213
  Width = 858
  Height = 629
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
  DesignSize = (
    850
    602)
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 850
    Height = 602
    Align = alClient
    BorderOuter = fsFlat
    TabOrder = 4
  end
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 8
    Width = 837
    Height = 557
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Pictures'
    TabOrder = 0
    DesignSize = (
      837
      557)
    object cxGrid1: TcxGrid
      Left = 6
      Top = 16
      Width = 825
      Height = 534
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid1DBTableView1DblClick
        DataController.DataSource = dsPictures
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Editing = False
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1picture_id: TcxGridDBColumn
          Caption = 'Picture ID'
          Width = 40
          DataBinding.FieldName = 'picture_id'
        end
        object cxGrid1DBTableView1artist_name: TcxGridDBColumn
          Caption = 'Artist'
          DataBinding.FieldName = 'artist_name'
        end
        object cxGrid1DBTableView1technique: TcxGridDBColumn
          Caption = 'Technique'
          DataBinding.FieldName = 'technique'
        end
        object cxGrid1DBTableView1picture_title: TcxGridDBColumn
          Caption = 'Title'
          Width = 75
          DataBinding.FieldName = 'picture_title'
        end
        object cxGrid1DBTableView1picture_year: TcxGridDBColumn
          Caption = 'Year'
          DataBinding.FieldName = 'picture_year'
        end
        object cxGrid1DBTableView1picture_width: TcxGridDBColumn
          Caption = 'Width'
          DataBinding.FieldName = 'picture_width'
        end
        object cxGrid1DBTableView1picture_height: TcxGridDBColumn
          Caption = 'Height'
          DataBinding.FieldName = 'picture_height'
        end
        object cxGrid1DBTableView1picture_price: TcxGridDBColumn
          Caption = 'Price'
          DataBinding.FieldName = 'picture_price'
        end
        object cxGrid1DBTableView1reserved_until: TcxGridDBColumn
          Caption = 'Reserved Until'
          DataBinding.FieldName = 'reserved_until'
        end
        object cxGrid1DBTableView1reserved_by: TcxGridDBColumn
          Caption = 'Reserved By'
          DataBinding.FieldName = 'reserved_by'
        end
        object cxGrid1DBTableView1bought_at: TcxGridDBColumn
          Caption = 'Sold'
          DataBinding.FieldName = 'bought_at'
        end
        object cxGrid1DBTableView1bought_by: TcxGridDBColumn
          Caption = 'Sold By'
          DataBinding.FieldName = 'bought_by'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object CloseButton: TNixButton
    Left = 772
    Top = 572
    Background.Gradient.NumberOfColors = 32
    Background.Style = bkGradient
    BorderColors.Brightest = clBtnHighlight
    BorderColors.Bright = 14671839
    BorderColors.Dark = clBtnShadow
    BorderColors.Darkest = clBtnText
    BorderColors.Flat = clBtnShadow
    About = aiAbout
    Caption = 'Close'
    TabOrder = 1
    OnClick = CloseButtonClick
    Anchors = [akRight, akBottom]
  end
  object DeleteButton: TNixButton
    Left = 692
    Top = 572
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
    OnClick = DeleteButtonClick
    Anchors = [akRight, akBottom]
  end
  object EditButton: TNixButton
    Left = 612
    Top = 572
    Background.Gradient.NumberOfColors = 32
    Background.Style = bkGradient
    BorderColors.Brightest = clBtnHighlight
    BorderColors.Bright = 14671839
    BorderColors.Dark = clBtnShadow
    BorderColors.Darkest = clBtnText
    BorderColors.Flat = clBtnShadow
    About = aiAbout
    Caption = 'Edit'
    TabOrder = 3
    OnClick = EditButtonClick
    Anchors = [akRight, akBottom]
  end
  object DB_Arteinvest: TmySQLDatabase
    DatabaseName = 'arteinvest_web'
    UserName = 'root'
    Host = 'localhost'
    ConnectOptions = []
    Params.Strings = (
      'Port=3306'
      'TIMEOUT=30'
      'DatabaseName=arteinvest_web'
      'UID=root'
      'Host=localhost')
    Left = 40
    Top = 72
  end
  object tPictures: TmySQLTable
    Database = DB_Arteinvest
    TableName = 'tbl_pictures'
    Left = 72
    Top = 104
  end
  object dsPictures: TDataSource
    DataSet = qPictures
    Left = 104
    Top = 72
  end
  object qPictures: TmySQLQuery
    Database = DB_Arteinvest
    CachedUpdates = True
    SQL.Strings = (
      
        'SELECT tbl_pictures.picture_id, tbl_artist.artist_name, tbl_tech' +
        'nique.technique, tbl_pictures.picture_title, tbl_pictures.pictur' +
        'e_year, tbl_pictures.picture_width, tbl_pictures.picture_height,' +
        ' tbl_pictures.picture_price,'
      
        'tbl_pictures.reserved_until, tbl_pictures.reserved_by, tbl_pictu' +
        'res.bought_at, tbl_pictures.bought_by'
      'FROM tbl_artist'
      
        'INNER JOIN tbl_pictures ON tbl_artist.artist_id = tbl_pictures.a' +
        'rtist_id INNER JOIN tbl_technique ON tbl_technique.technique_id ' +
        '= tbl_pictures.technique_id ORDER BY tbl_pictures.picture_id ASC')
    UpdateObject = qUpdatePictures
    Left = 72
    Top = 72
  end
  object qUpdatePictures: TmySQLUpdateSQL
    Left = 104
    Top = 104
  end
end
