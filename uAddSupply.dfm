object frmAddSupply: TfrmAddSupply
  Left = 0
  Top = 0
  Caption = #1053#1086#1074#1072#1103' '#1087#1086#1089#1090#1072#1074#1082#1072
  ClientHeight = 483
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 410
    Height = 73
    Align = alTop
    TabOrder = 0
    object lblDt: TLabel
      Left = 16
      Top = 8
      Width = 76
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1074#1082#1080
    end
    object lblProvider: TLabel
      Left = 35
      Top = 35
      Width = 57
      Height = 13
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
    end
    object lcbProvider: TcxLookupComboBox
      Left = 98
      Top = 32
      Enabled = False
      Properties.KeyFieldNames = 'id_provider'
      Properties.ListColumns = <
        item
          FieldName = 'name'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsProviders
      Properties.OnEditValueChanged = lcbProviderPropertiesEditValueChanged
      TabOrder = 0
      Width = 304
    end
    object deDt: TcxDateEdit
      Left = 98
      Top = 5
      Properties.ImmediatePost = True
      Properties.OnEditValueChanged = deDtPropertiesEditValueChanged
      TabOrder = 1
      Width = 304
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 432
    Width = 410
    Height = 51
    Align = alBottom
    TabOrder = 1
    object btnCancel: TButton
      Left = 88
      Top = 16
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnAdd: TButton
      Left = 232
      Top = 16
      Width = 75
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100
      Enabled = False
      TabOrder = 1
      OnClick = btnAddClick
    end
  end
  object grdProducts: TcxGrid
    Left = 0
    Top = 73
    Width = 410
    Height = 359
    Align = alClient
    Enabled = False
    TabOrder = 2
    object vwProducts: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Visible = False
      Navigator.Buttons.Next.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsTemp
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object vwProductsid_product: TcxGridDBColumn
        Caption = #1058#1086#1074#1072#1088
        DataBinding.FieldName = 'id_product'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'id_product'
        Properties.ListColumns = <
          item
            FieldName = 'product_name'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsProducts
        Properties.OnEditValueChanged = vwProductsid_productPropertiesEditValueChanged
        Properties.OnValidate = vwProductsid_productPropertiesValidate
        Width = 244
      end
      object vwProductsamount: TcxGridDBColumn
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        DataBinding.FieldName = 'amount'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.OnValidate = vwProductsamountPropertiesValidate
        Width = 70
      end
      object vwProductsprice: TcxGridDBColumn
        Caption = #1062#1077#1085#1072
        DataBinding.FieldName = 'price'
        Options.Editing = False
        Width = 40
      end
      object vwProductssumma: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072
        DataBinding.FieldName = 'summa'
        Options.Editing = False
        Width = 54
      end
    end
    object lvlProducts: TcxGridLevel
      GridView = vwProducts
    end
  end
  object pgProviders: TPgQuery
    Connection = datmod.conMain
    SQL.Strings = (
      'select *'
      'from store.pkg_providers_by_dt_get_list(:dt);')
    AutoCommit = False
    AutoCalcFields = False
    Left = 16
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dt'
        Value = nil
      end>
    object pgProvidersid_provider: TIntegerField
      FieldName = 'id_provider'
      ReadOnly = True
    end
    object pgProvidersname: TMemoField
      FieldName = 'name'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
  object dsProviders: TPgDataSource
    DataSet = pgProviders
    Left = 32
    Top = 376
  end
  object pgProducts: TPgQuery
    Connection = datmod.conMain
    SQL.Strings = (
      'select *'
      'from store.pkg_prices_provider_get_list(:id_provider, :dt)')
    ReadOnly = True
    AutoCommit = False
    AutoCalcFields = False
    Left = 80
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_provider'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'dt'
        Value = nil
      end>
    object pgProductsid_product: TIntegerField
      FieldName = 'id_product'
      ReadOnly = True
    end
    object pgProductsproduct_name: TMemoField
      FieldName = 'product_name'
      ReadOnly = True
      BlobType = ftMemo
    end
    object pgProductsprice: TFloatField
      FieldName = 'price'
      ReadOnly = True
    end
  end
  object dsProducts: TPgDataSource
    DataSet = pgProducts
    Left = 96
    Top = 376
  end
  object vtTemp: TVirtualTable
    FieldDefs = <
      item
        Name = 'id_product'
        DataType = ftInteger
      end>
    OnCalcFields = vtTempCalcFields
    OnPostError = vtTempPostError
    Left = 16
    Top = 104
    Data = {040001000A0069645F70726F647563740300000000000000000000000000}
    object vtTempid_product: TIntegerField
      FieldName = 'id_product'
      Required = True
    end
    object vtTempamount: TFloatField
      FieldName = 'amount'
      Required = True
    end
    object vtTempprice: TFloatField
      FieldName = 'price'
    end
    object vtTempsumma: TFloatField
      FieldKind = fkCalculated
      FieldName = 'summa'
      Calculated = True
    end
  end
  object dsTemp: TDataSource
    DataSet = vtTemp
    Left = 32
    Top = 120
  end
  object pgAddHead: TPgQuery
    Connection = datmod.conMain
    SQL.Strings = (
      'select store.pkg_supplies_add_head(:id_provider, :dt) id_supply')
    IndexFieldNames = 'id_supply'
    Left = 208
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_provider'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'dt'
        Value = nil
      end>
    object pgAddHeadid_supply: TIntegerField
      FieldName = 'id_supply'
      ReadOnly = True
    end
  end
  object pgAddTail: TPgQuery
    Connection = datmod.conMain
    SQL.Strings = (
      
        'call store.pkg_supplies_add_tail(:id_supply, :id_product, :amoun' +
        't, :price);')
    Left = 264
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_supply'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'id_product'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'amount'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'price'
        Value = nil
      end>
  end
end
