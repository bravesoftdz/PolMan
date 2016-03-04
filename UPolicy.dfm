object PolicyForm: TPolicyForm
  Left = 395
  Top = 262
  Width = 736
  Height = 698
  BorderIcons = [biSystemMenu]
  Caption = 'Policy'
  Color = clBtnFace
  Constraints.MaxWidth = 736
  Constraints.MinHeight = 698
  Constraints.MinWidth = 736
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainPolicyPanel: TRzPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 660
    Align = alClient
    BorderOuter = fsFlat
    TabOrder = 0
    DesignSize = (
      720
      660)
    object RzLabel22: TRzLabel
      Left = 8
      Top = 184
      Width = 40
      Height = 13
      Caption = 'Owner 1'
    end
    object RzLabel23: TRzLabel
      Left = 8
      Top = 232
      Width = 64
      Height = 13
      Caption = 'Insured Life 1'
    end
    object RzLabel24: TRzLabel
      Left = 248
      Top = 232
      Width = 64
      Height = 13
      Caption = 'Insured Life 2'
    end
    object RzLabel25: TRzLabel
      Left = 488
      Top = 232
      Width = 64
      Height = 13
      Caption = 'Insured Life 3'
    end
    object RzLabel26: TRzLabel
      Left = 8
      Top = 280
      Width = 64
      Height = 13
      Caption = 'Insured Life 4'
    end
    object RzLabel27: TRzLabel
      Left = 248
      Top = 280
      Width = 64
      Height = 13
      Caption = 'Insured Life 5'
    end
    object RzLabel1: TRzLabel
      Left = 8
      Top = 8
      Width = 42
      Height = 13
      Caption = 'Policy ID'
    end
    object RzLabel2: TRzLabel
      Left = 80
      Top = 8
      Width = 68
      Height = 13
      Caption = 'Policy Number'
    end
    object RzLabel4: TRzLabel
      Left = 240
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Product'
    end
    object RzLabel5: TRzLabel
      Left = 496
      Top = 8
      Width = 64
      Height = 13
      Caption = 'Product Type'
    end
    object RzLabel6: TRzLabel
      Left = 8
      Top = 48
      Width = 80
      Height = 13
      Caption = 'Regular Premium'
    end
    object RzLabel7: TRzLabel
      Left = 112
      Top = 48
      Width = 73
      Height = 13
      Caption = 'Single Payment'
    end
    object RzLabel8: TRzLabel
      Left = 656
      Top = 8
      Width = 42
      Height = 13
      Caption = 'Currency'
    end
    object RzLabel9: TRzLabel
      Left = 368
      Top = 48
      Width = 50
      Height = 13
      Caption = 'Frequency'
    end
    object RzLabel10: TRzLabel
      Left = 488
      Top = 48
      Width = 67
      Height = 13
      Caption = 'Dynamic Rate'
    end
    object RzLabel11: TRzLabel
      Left = 576
      Top = 48
      Width = 51
      Height = 13
      Caption = 'Policy Link'
    end
    object RzLabel12: TRzLabel
      Left = 368
      Top = 96
      Width = 48
      Height = 13
      Caption = 'Start Date'
    end
    object RzLabel13: TRzLabel
      Left = 488
      Top = 96
      Width = 63
      Height = 13
      Caption = 'Maturity Date'
    end
    object RzLabel14: TRzLabel
      Left = 600
      Top = 140
      Width = 61
      Height = 13
      Caption = 'Policy Status'
    end
    object RzLabel15: TRzLabel
      Left = 8
      Top = 96
      Width = 72
      Height = 13
      Caption = 'Date Received'
    end
    object RzLabel16: TRzLabel
      Left = 128
      Top = 96
      Width = 59
      Height = 13
      Caption = 'Date Signed'
    end
    object RzLabel17: TRzLabel
      Left = 288
      Top = 48
      Width = 68
      Height = 13
      Caption = 'Payment Term'
    end
    object RzLabel18: TRzLabel
      Left = 216
      Top = 48
      Width = 55
      Height = 13
      Caption = 'Policy Term'
    end
    object RzLabel19: TRzLabel
      Left = 248
      Top = 96
      Width = 100
      Height = 13
      Caption = 'App Send to Supplier'
    end
    object RzLabel3: TRzLabel
      Left = 8
      Top = 140
      Width = 31
      Height = 13
      Caption = 'Broker'
    end
    object RzLabel20: TRzLabel
      Left = 368
      Top = 140
      Width = 26
      Height = 13
      Caption = 'Level'
    end
    object RzLabel21: TRzLabel
      Left = 448
      Top = 140
      Width = 67
      Height = 13
      Caption = 'Business Area'
    end
    object RzLabel28: TRzLabel
      Left = 8
      Top = 456
      Width = 46
      Height = 13
      Caption = 'Payments'
    end
    object RzLabel29: TRzLabel
      Left = 608
      Top = 96
      Width = 99
      Height = 13
      Caption = 'Policy Sent to Broker'
    end
    object RzLabel30: TRzLabel
      Left = 8
      Top = 328
      Width = 28
      Height = 13
      Caption = 'Notes'
    end
    object RzLabel31: TRzLabel
      Left = 368
      Top = 184
      Width = 40
      Height = 13
      Caption = 'Owner 2'
    end
    object RzLabel32: TRzLabel
      Left = 488
      Top = 280
      Width = 24
      Height = 13
      Caption = 'Fund'
    end
    object RzDBNumericEdit1: TRzDBNumericEdit
      Left = 8
      Top = 24
      Width = 65
      Height = 21
      DataSource = DSPolicyInfo
      DataField = 'pol_id'
      ReadOnly = True
      Color = clBtnFace
      FrameVisible = True
      TabOrder = 0
      DisplayFormat = ',0;(,0)'
    end
    object RzDBEdit1: TRzDBEdit
      Left = 80
      Top = 24
      Width = 153
      Height = 21
      DataSource = DSPolicyInfo
      DataField = 'pol_number'
      FrameVisible = True
      TabOrder = 1
    end
    object ProductSelect: TRzDBLookupComboBox
      Left = 240
      Top = 24
      Width = 249
      Height = 21
      Ctl3D = False
      DataField = 'pol_product_id'
      DataSource = DSPolicyInfo
      KeyField = 'product_id'
      ListField = 'product_name'
      ListSource = MainForm.DSProductName
      ParentCtl3D = False
      TabOrder = 2
      OnCloseUp = ProductSelectCloseUp
      OnKeyUp = ProductSelectKeyUp
      FrameVisible = True
    end
    object RzDBNumericEdit2: TRzDBNumericEdit
      Left = 8
      Top = 64
      Width = 97
      Height = 21
      DataSource = DSPolicyInfo
      DataField = 'pol_regular_premium'
      FrameVisible = True
      TabOrder = 3
      IntegersOnly = False
      DisplayFormat = ',0.00;(,0.00)'
    end
    object RzDBNumericEdit3: TRzDBNumericEdit
      Left = 112
      Top = 64
      Width = 97
      Height = 21
      DataSource = DSPolicyInfo
      DataField = 'pol_single_premium'
      FrameVisible = True
      TabOrder = 4
      IntegersOnly = False
      DisplayFormat = ',0.00;(,0.00)'
    end
    object RzDBLookupComboBox5: TRzDBLookupComboBox
      Left = 368
      Top = 64
      Width = 113
      Height = 21
      Ctl3D = False
      DataField = 'pol_frequency'
      DataSource = DSPolicyInfo
      KeyField = 'frequency_id'
      ListField = 'frequency_desc'
      ListSource = MainForm.DSFrequency
      ParentCtl3D = False
      TabOrder = 5
      FrameVisible = True
    end
    object PolicyStartDate: TRzDBDateTimeEdit
      Left = 368
      Top = 112
      Width = 113
      Height = 21
      DataSource = DSPolicyInfo
      DataField = 'pol_date_begin'
      FrameVisible = True
      TabOrder = 6
      OnChange = PolicyStartDateChange
      EditType = etDate
      FlatButtons = True
    end
    object PolicyEndDate: TRzDBDateTimeEdit
      Left = 488
      Top = 112
      Width = 113
      Height = 21
      DataSource = DSPolicyInfo
      DataField = 'pol_date_end'
      FrameVisible = True
      TabOrder = 7
      EditType = etDate
      FlatButtons = True
    end
    object RzDBDateTimeEdit4: TRzDBDateTimeEdit
      Left = 8
      Top = 112
      Width = 113
      Height = 21
      DataSource = DSPolicyInfo
      DataField = 'pol_date_received'
      FrameVisible = True
      TabOrder = 8
      EditType = etDate
      FlatButtons = True
    end
    object RzDBDateTimeEdit5: TRzDBDateTimeEdit
      Left = 128
      Top = 112
      Width = 113
      Height = 21
      DataSource = DSPolicyInfo
      DataField = 'pol_date_signed'
      FrameVisible = True
      TabOrder = 9
      EditType = etDate
      FlatButtons = True
    end
    object PolicyTerm: TRzDBNumericEdit
      Left = 216
      Top = 64
      Width = 65
      Height = 21
      DataSource = DSPolicyInfo
      DataField = 'pol_term'
      FrameVisible = True
      TabOrder = 10
      DisplayFormat = ',0;(,0)'
    end
    object RzDBLookupComboBox7: TRzDBLookupComboBox
      Left = 600
      Top = 156
      Width = 121
      Height = 21
      Ctl3D = False
      DataField = 'pol_status_id'
      DataSource = DSPolicyInfo
      KeyField = 'policy_status_id'
      ListField = 'policy_status_desc'
      ListSource = MainForm.DSStatus
      ParentCtl3D = False
      TabOrder = 11
      FrameVisible = True
    end
    object BrokerSelect: TRzDBLookupComboBox
      Left = 8
      Top = 156
      Width = 353
      Height = 21
      Ctl3D = False
      DataField = 'pol_broker_id'
      DataSource = DSPolicyInfo
      KeyField = 'broker_id'
      ListField = 'broker_full_name'
      ListSource = DSBroker
      ParentCtl3D = False
      TabOrder = 12
      OnCloseUp = BrokerSelectCloseUp
      OnExit = BrokerSelectCloseUp
      AllowNull = True
      FrameVisible = True
    end
    object RzDBLookupComboBox8: TRzDBLookupComboBox
      Left = 448
      Top = 156
      Width = 145
      Height = 21
      Ctl3D = False
      DataField = 'pol_business_id'
      DataSource = DSPolicyInfo
      KeyField = 'business_area_id'
      ListField = 'business_desc'
      ListSource = MainForm.DSBusinessArea
      ParentCtl3D = False
      TabOrder = 13
      FrameVisible = True
    end
    object Client1Edit: TRzDBButtonEdit
      Left = 8
      Top = 200
      Width = 353
      Height = 21
      DataSource = DSClient1
      DataField = 'client1_full_name'
      ReadOnly = True
      FrameVisible = True
      TabOrder = 14
      ButtonKind = bkAccept
      OnButtonClick = Client1EditButtonClick
      FlatButtons = True
    end
    object InsuredLife1Edit: TRzDBButtonEdit
      Left = 8
      Top = 248
      Width = 233
      Height = 21
      DataSource = DSLife1
      DataField = 'client_full_name'
      ReadOnly = True
      FrameVisible = True
      TabOrder = 15
      ButtonKind = bkAccept
      OnButtonClick = InsuredLife1EditButtonClick
      FlatButtons = True
    end
    object InsuredLife2Edit: TRzDBButtonEdit
      Left = 248
      Top = 248
      Width = 233
      Height = 21
      DataSource = DSLife2
      DataField = 'client_full_name'
      ReadOnly = True
      FrameVisible = True
      TabOrder = 16
      ButtonKind = bkAccept
      OnButtonClick = InsuredLife2EditButtonClick
      FlatButtons = True
    end
    object InsuredLife3Edit: TRzDBButtonEdit
      Left = 488
      Top = 248
      Width = 233
      Height = 21
      DataSource = DSLife3
      DataField = 'client_full_name'
      ReadOnly = True
      FrameVisible = True
      TabOrder = 17
      ButtonKind = bkAccept
      OnButtonClick = InsuredLife3EditButtonClick
      FlatButtons = True
    end
    object InsuredLife4Edit: TRzDBButtonEdit
      Left = 8
      Top = 296
      Width = 233
      Height = 21
      DataSource = DSLife4
      DataField = 'client_full_name'
      ReadOnly = True
      FrameVisible = True
      TabOrder = 18
      ButtonKind = bkAccept
      OnButtonClick = InsuredLife4EditButtonClick
      FlatButtons = True
    end
    object InsuredLife5Edit: TRzDBButtonEdit
      Left = 248
      Top = 296
      Width = 233
      Height = 21
      DataSource = DSLife5
      DataField = 'client_full_name'
      ReadOnly = True
      FrameVisible = True
      TabOrder = 19
      ButtonKind = bkAccept
      OnButtonClick = InsuredLife5EditButtonClick
      FlatButtons = True
    end
    object cxGrid1: TcxGrid
      Left = 8
      Top = 473
      Width = 713
      Height = 159
      Anchors = [akLeft, akTop, akBottom]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 20
      object cxGrid1DBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object RzDBNumericEdit6: TRzDBNumericEdit
      Left = 288
      Top = 64
      Width = 73
      Height = 21
      DataSource = DSPolicyInfo
      DataField = 'pol_payment_term'
      FrameVisible = True
      TabOrder = 21
      DisplayFormat = ',0;(,0)'
    end
    object RzDBDateTimeEdit3: TRzDBDateTimeEdit
      Left = 608
      Top = 112
      Width = 113
      Height = 21
      DataSource = DSPolicyInfo
      DataField = 'pol_date_send_to_broker'
      FrameVisible = True
      TabOrder = 22
      EditType = etDate
      FlatButtons = True
    end
    object RzDBEdit2: TRzDBEdit
      Left = 576
      Top = 64
      Width = 145
      Height = 21
      DataSource = DSPolicyInfo
      DataField = 'pol_link'
      FrameVisible = True
      TabOrder = 23
    end
    object RzDBDateTimeEdit6: TRzDBDateTimeEdit
      Left = 248
      Top = 112
      Width = 113
      Height = 21
      DataSource = DSPolicyInfo
      DataField = 'pol_date_send_to_supplier'
      FrameVisible = True
      TabOrder = 24
      EditType = etDate
      FlatButtons = True
    end
    object RzDBLookupComboBox6: TRzDBLookupComboBox
      Left = 488
      Top = 64
      Width = 81
      Height = 21
      Ctl3D = False
      DataField = 'pol_dynamic_rate'
      DataSource = DSPolicyInfo
      KeyField = 'dynrate'
      ListField = 'dynrate'
      ListSource = DSDynamicRate
      ParentCtl3D = False
      TabOrder = 25
      FlatButtonColor = clWindow
      FrameVisible = True
    end
    object DeletePolicyButton: TRzButton
      Left = 384
      Top = 634
      Anchors = [akLeft, akBottom]
      Caption = 'Delete'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 26
      OnClick = DeletePolicyButtonClick
    end
    object EditPolicyInfoButton: TRzButton
      Left = 471
      Top = 634
      Anchors = [akLeft, akBottom]
      Caption = 'Edit'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 27
      OnClick = EditPolicyInfoButtonClick
    end
    object SavePolicyInfoButton: TRzButton
      Left = 558
      Top = 634
      Anchors = [akLeft, akBottom]
      Caption = 'Save'
      Color = 15791348
      Enabled = False
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 28
      OnClick = SavePolicyInfoButtonClick
    end
    object ClosePolicyInfoButton: TRzButton
      Left = 646
      Top = 634
      Anchors = [akLeft, akBottom]
      Caption = 'Close'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 29
      OnClick = CloseButtonClick
    end
    object TestPaymentsButton: TRzButton
      Left = 8
      Top = 634
      Width = 89
      Anchors = [akLeft, akBottom]
      Caption = 'Test Payments'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 30
    end
    object RzDBMemo1: TRzDBMemo
      Left = 8
      Top = 345
      Width = 713
      Height = 105
      DataField = 'pol_notes'
      DataSource = DSPolicyInfo
      TabOrder = 31
      FrameVisible = True
    end
    object Client2Edit: TRzDBButtonEdit
      Left = 368
      Top = 200
      Width = 353
      Height = 21
      DataSource = DSClient2
      DataField = 'client2_full_name'
      ReadOnly = True
      FrameVisible = True
      TabOrder = 32
      ButtonKind = bkAccept
      OnButtonClick = Client2EditButtonClick
      FlatButtons = True
    end
    object PrintSummarySheetButton: TRzButton
      Left = 104
      Top = 634
      Width = 89
      Anchors = [akLeft, akBottom]
      Caption = 'Print Summary'
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 33
      OnClick = PrintSummarySheetButtonClick
    end
    object RzDBEdit3: TRzDBEdit
      Left = 496
      Top = 24
      Width = 153
      Height = 21
      DataSource = DSPolicyInfo
      DataField = 'product_type_desc'
      ReadOnly = True
      FrameVisible = True
      TabOrder = 34
    end
    object RzDBEdit4: TRzDBEdit
      Left = 368
      Top = 156
      Width = 73
      Height = 21
      DataSource = DSPolicyInfo
      DataField = 'level_letter'
      ReadOnly = True
      FrameVisible = True
      TabOrder = 35
    end
    object RzDBEdit5: TRzDBEdit
      Left = 656
      Top = 24
      Width = 65
      Height = 21
      DataSource = DSPolicyInfo
      DataField = 'currency_tag'
      ReadOnly = True
      FrameVisible = True
      TabOrder = 36
    end
    object RzDBCheckBox1: TRzDBCheckBox
      Left = 72
      Top = 453
      Width = 209
      Height = 17
      DataField = 'additional_comm'
      DataSource = DSPolicyInfo
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Caption = 'Enable Additional Commission (if any)'
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
      TabOrder = 37
      UseCustomGlyphs = True
    end
    object RzDBLookupComboBox1: TRzDBLookupComboBox
      Left = 488
      Top = 296
      Width = 233
      Height = 21
      Ctl3D = False
      DataField = 'pol_fund'
      DataSource = DSPolicyInfo
      KeyField = 'fund_id'
      ListField = 'fund_name'
      ListSource = DSFund
      ParentCtl3D = False
      TabOrder = 38
      FrameVisible = True
    end
  end
  object qPolicyInfo: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 296
    Top = 352
  end
  object DSPolicyInfo: TDataSource
    AutoEdit = False
    DataSet = qPolicyInfo
    Left = 328
    Top = 352
  end
  object qBroker: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    SQL.Strings = (
      'set CONCAT_NULL_YIELDS_NULL OFF '
      
        'SELECT broker_id, ltrim(broker_company + '#39' '#39'+ broker_firstname +' +
        ' '#39' '#39' + broker_lastname) as broker_full_name'
      'FROM tbl_broker'
      'order by broker_full_name')
    Left = 296
    Top = 384
  end
  object DSBroker: TDataSource
    DataSet = qBroker
    Left = 328
    Top = 384
  end
  object qClient1Info: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 296
    Top = 416
  end
  object DSClient1: TDataSource
    DataSet = qClient1Info
    Left = 328
    Top = 416
  end
  object qLife1: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 368
    Top = 352
  end
  object DSLife1: TDataSource
    DataSet = qLife1
    Left = 400
    Top = 352
  end
  object DSLife2: TDataSource
    DataSet = qLife2
    Left = 400
    Top = 384
  end
  object DSLife3: TDataSource
    DataSet = qLife3
    Left = 400
    Top = 416
  end
  object DSLife4: TDataSource
    DataSet = qLife4
    Left = 400
    Top = 448
  end
  object DSLife5: TDataSource
    DataSet = qLife5
    Left = 400
    Top = 480
  end
  object qLife2: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 368
    Top = 384
  end
  object qLife3: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 368
    Top = 416
  end
  object qLife4: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 368
    Top = 448
  end
  object qLife5: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 368
    Top = 480
  end
  object qDynamicRate: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 496
    Top = 56
  end
  object DSDynamicRate: TDataSource
    DataSet = qDynamicRate
    Left = 528
    Top = 56
  end
  object qClient2Info: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 296
    Top = 448
  end
  object DSClient2: TDataSource
    DataSet = qClient2Info
    Left = 328
    Top = 448
  end
  object qPrintSummary: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 592
    Top = 392
  end
  object qBrokerLevel: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 296
    Top = 592
  end
  object DSProductTypes: TDataSource
    Left = 400
    Top = 528
  end
  object qProductTypes: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 368
    Top = 528
  end
  object qProductFields: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 328
    Top = 592
  end
  object qAgreementID: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 360
    Top = 592
  end
  object qFund: TADOQuery
    Connection = DM.DB_POLMAN
    Parameters = <>
    Left = 656
    Top = 288
  end
  object DSFund: TDataSource
    DataSet = qFund
    Left = 688
    Top = 288
  end
end
