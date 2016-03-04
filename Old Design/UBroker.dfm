object BrokerForm: TBrokerForm
  Left = 266
  Top = 170
  Width = 679
  Height = 558
  ActiveControl = RzDBButtonEdit1
  Caption = 'Broker'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 671
    Height = 531
    Align = alClient
    BorderOuter = fsFlat
    TabOrder = 0
    DesignSize = (
      671
      531)
    object RzDBStatusPane3: TRzDBStatusPane
      Left = 152
      Top = 104
      Width = 513
      FillColor = clWhite
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      FieldLabel = 'Company:'
    end
    object RzDBStatusPane4: TRzDBStatusPane
      Left = 152
      Top = 128
      Width = 513
      FillColor = clWhite
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      FieldLabel = 'Address:'
    end
    object RzDBStatusPane5: TRzDBStatusPane
      Left = 152
      Top = 152
      Width = 97
      FillColor = clWhite
      ParentShowHint = False
      FieldLabel = 'Zip:'
    end
    object RzDBStatusPane6: TRzDBStatusPane
      Left = 256
      Top = 152
      Width = 233
      FillColor = clWhite
      ParentShowHint = False
      FieldLabel = 'City:'
    end
    object RzDBStatusPane7: TRzDBStatusPane
      Left = 496
      Top = 152
      Width = 169
      FillColor = clWhite
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      FieldLabel = 'Country:'
    end
    object RzDBStatusPane8: TRzDBStatusPane
      Left = 152
      Top = 176
      Width = 161
      FillColor = clWhite
      ParentShowHint = False
      FieldLabel = 'Phone 1:'
    end
    object RzDBStatusPane9: TRzDBStatusPane
      Left = 320
      Top = 176
      Width = 161
      FillColor = clWhite
      ParentShowHint = False
      FieldLabel = 'Phone 2:'
    end
    object RzDBStatusPane10: TRzDBStatusPane
      Left = 488
      Top = 176
      Width = 177
      FillColor = clWhite
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      FieldLabel = 'GSM:'
    end
    object RzDBStatusPane11: TRzDBStatusPane
      Left = 152
      Top = 200
      Width = 161
      FillColor = clWhite
      ParentShowHint = False
      FieldLabel = 'Fax:'
    end
    object RzDBStatusPane12: TRzDBStatusPane
      Left = 320
      Top = 200
      Width = 345
      FillColor = clWhite
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      FieldLabel = 'Email:'
    end
    object RzDBStatusPane13: TRzDBStatusPane
      Left = 152
      Top = 224
      Width = 161
      FillColor = clWhite
      ParentShowHint = False
      FieldLabel = 'Status:'
    end
    object RzDBStatusPane14: TRzDBStatusPane
      Left = 496
      Top = 224
      Width = 169
      FillColor = clWhite
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      FieldLabel = 'Birthday:'
    end
    object RzDBStatusPane15: TRzDBStatusPane
      Left = 320
      Top = 224
      Width = 169
      FillColor = clWhite
      ParentShowHint = False
      FieldLabel = 'Currency:'
    end
    object RzDBStatusPane16: TRzDBStatusPane
      Left = 152
      Top = 248
      Width = 161
      FillColor = clWhite
      ParentShowHint = False
      FieldLabel = 'Contract No:'
    end
    object RzDBStatusPane17: TRzDBStatusPane
      Left = 496
      Top = 248
      Width = 169
      FillColor = clWhite
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      FieldLabel = 'Last Revision:'
    end
    object RzDBStatusPane18: TRzDBStatusPane
      Left = 320
      Top = 248
      Width = 169
      FillColor = clWhite
      ParentShowHint = False
      FieldLabel = 'Start Date:'
    end
    object RzDBStatusPane19: TRzDBStatusPane
      Left = 152
      Top = 272
      Width = 337
      FillColor = clWhite
      ParentShowHint = False
      FieldLabel = 'Bank:'
    end
    object RzDBStatusPane20: TRzDBStatusPane
      Left = 496
      Top = 272
      Width = 169
      FillColor = clWhite
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      FieldLabel = 'BIC:'
    end
    object RzDBStatusPane21: TRzDBStatusPane
      Left = 152
      Top = 296
      Width = 513
      FillColor = clWhite
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      FieldLabel = 'IBAN:'
    end
    object RzDBStatusPane22: TRzDBStatusPane
      Left = 152
      Top = 320
      Width = 513
      Height = 205
      FillColor = clWhite
      Anchors = [akLeft, akTop, akRight, akBottom]
      ParentShowHint = False
    end
    object RzLabel1: TRzLabel
      Left = 152
      Top = 8
      Width = 45
      Height = 13
      Caption = 'Broker ID'
    end
    object RzLabel2: TRzLabel
      Left = 216
      Top = 8
      Width = 28
      Height = 13
      Caption = 'Name'
    end
    object RzLabel3: TRzLabel
      Left = 152
      Top = 48
      Width = 44
      Height = 13
      Caption = 'Company'
    end
    object RzGroupBar1: TRzGroupBar
      Left = 1
      Top = 1
      Width = 144
      Height = 529
      ColorAdjustment = 30
      GroupBorderSize = 8
      UseGradients = True
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
      object RzGroup1: TRzGroup
        Items = <
          item
            Caption = 'Personel Information'
          end
          item
            Caption = 'Compliance'
          end>
        Opened = True
        OpenedHeight = 67
        UseGradients = True
        Caption = 'Broker Details'
        ParentColor = False
      end
      object RzGroup4: TRzGroup
        Items = <
          item
            Caption = 'Product Specific'
          end
          item
            Caption = 'Bonus'
          end>
        Opened = True
        OpenedHeight = 67
        UseGradients = True
        Caption = 'Agreements'
        ParentColor = False
      end
      object RzGroup2: TRzGroup
        Items = <
          item
            Caption = 'All'
          end
          item
            Caption = 'Inforced'
          end
          item
            Caption = 'Pending'
          end
          item
            Caption = 'Item4'
          end
          item
            Caption = 'Item5'
          end
          item
            Caption = 'Item6'
          end
          item
            Caption = 'Item7'
          end
          item
            Caption = 'Item8'
          end>
        Opened = True
        OpenedHeight = 187
        UseGradients = True
        Caption = 'Policies'
        ParentColor = False
      end
      object RzGroup3: TRzGroup
        Items = <
          item
            Caption = 'All'
          end
          item
            Caption = 'Initials'
          end
          item
            Caption = 'Renewals'
          end
          item
            Caption = 'Trail'
          end
          item
            Caption = 'Bonus'
          end
          item
            Caption = 'Marketing'
          end
          item
            Caption = 'Clawback'
          end>
        Opened = True
        OpenedHeight = 167
        UseGradients = True
        Caption = 'Commissions'
        ParentColor = False
      end
    end
    object RzDBButtonEdit1: TRzDBButtonEdit
      Left = 152
      Top = 24
      Width = 57
      Height = 21
      FrameVisible = True
      TabOrder = 1
      ButtonKind = bkFind
      FlatButtons = True
    end
    object RzDBButtonEdit2: TRzDBButtonEdit
      Left = 216
      Top = 24
      Width = 441
      Height = 21
      FrameVisible = True
      TabOrder = 2
      ButtonKind = bkFind
      FlatButtons = True
    end
    object RzDBButtonEdit3: TRzDBButtonEdit
      Left = 152
      Top = 64
      Width = 505
      Height = 21
      FrameVisible = True
      TabOrder = 3
      ButtonKind = bkFind
      FlatButtons = True
    end
  end
end
