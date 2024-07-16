object frmPrices: TfrmPrices
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1094#1077#1085
  ClientHeight = 394
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grdPrices: TcxGrid
    Left = 0
    Top = 28
    Width = 792
    Height = 366
    Align = alClient
    TabOrder = 0
    object vwPrices: TcxGridDBTableView
      Navigator.Buttons.ConfirmDelete = True
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Enabled = False
      Navigator.Buttons.First.Visible = False
      Navigator.Buttons.PriorPage.Enabled = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Enabled = False
      Navigator.Buttons.Prior.Visible = False
      Navigator.Buttons.Next.Enabled = False
      Navigator.Buttons.Next.Visible = False
      Navigator.Buttons.NextPage.Enabled = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Enabled = False
      Navigator.Buttons.Last.Visible = False
      Navigator.Buttons.Append.Enabled = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Enabled = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Enabled = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Enabled = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsPrices
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ShowEditButtons = gsebForFocusedRecord
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object vwPricesid_price: TcxGridDBColumn
        DataBinding.FieldName = 'id_price'
        Visible = False
      end
      object vwPricesid_provider: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        DataBinding.FieldName = 'id_provider'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_provider'
        Properties.ListColumns = <
          item
            FieldName = 'name'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsProviders
      end
      object vwPricesid_product: TcxGridDBColumn
        Caption = #1058#1086#1074#1072#1088
        DataBinding.FieldName = 'id_product'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id_product'
        Properties.ListColumns = <
          item
            FieldName = 'product_name'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsProduct
      end
      object vwPricesprice: TcxGridDBColumn
        Caption = #1062#1077#1085#1072
        DataBinding.FieldName = 'price'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.OnValidate = vwPricespricePropertiesValidate
      end
      object vwPricesbegin_dt: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1089
        DataBinding.FieldName = 'begin_dt'
      end
      object vwPricesend_dt: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1087#1086
        DataBinding.FieldName = 'end_dt'
      end
    end
    object lvlPrices: TcxGridLevel
      GridView = vwPrices
    end
  end
  object dsPrices: TPgDataSource
    DataSet = pgPrices
    Left = 40
    Top = 96
  end
  object pgProviders: TPgQuery
    Connection = datmod.conMain
    SQL.Strings = (
      'select *'
      'from store.pkg_providers_get_list();')
    AutoCommit = False
    Left = 24
    Top = 264
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
    Left = 40
    Top = 280
  end
  object pgPrices: TPgQuery
    SQLInsert.Strings = (
      'call store.pkg_product_prices_add(:id_provider,'
      '                                  :id_product,'
      '                                  :price,'
      '                                  :begin_dt,'
      '                                  :end_dt);')
    SQLDelete.Strings = (
      'call store.pkg_product_prices_delete(:id_price) ')
    SQLUpdate.Strings = (
      'call store.pkg_product_prices_edit(:id_price,'
      '                                   :id_provider,'
      '                                   :id_product,'
      '                                   :price,'
      '                                   :begin_dt,'
      '                                   :end_dt);')
    Connection = datmod.conMain
    SQL.Strings = (
      'select *'
      'from store.pkg_product_prices_get_list();')
    CachedUpdates = True
    AutoCommit = False
    Options.StrictUpdate = False
    AfterInsert = pgPricesAfterInsert
    AfterPost = pgPricesAfterPost
    AfterDelete = pgPricesAfterDelete
    OnPostError = pgPricesPostError
    Left = 24
    Top = 80
    object pgPricesid_price: TIntegerField
      FieldName = 'id_price'
    end
    object pgPricesid_provider: TIntegerField
      FieldName = 'id_provider'
      LookupCache = True
      Required = True
    end
    object pgPricesid_product: TIntegerField
      FieldName = 'id_product'
      LookupCache = True
      Required = True
    end
    object pgPricesprice: TFloatField
      FieldName = 'price'
      Required = True
    end
    object pgPricesbegin_dt: TDateField
      FieldName = 'begin_dt'
      Required = True
    end
    object pgPricesend_dt: TDateField
      FieldName = 'end_dt'
    end
  end
  object pgProduct: TPgQuery
    Connection = datmod.conMain
    SQL.Strings = (
      'select *'
      'from store.pkg_products_get_list();')
    AutoCommit = False
    Left = 104
    Top = 264
    object pgProductid_product: TIntegerField
      FieldName = 'id_product'
      ReadOnly = True
    end
    object pgProductproduct_name: TMemoField
      FieldName = 'product_name'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
  object dsProduct: TPgDataSource
    DataSet = pgProduct
    Left = 120
    Top = 280
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 616
    Top = 160
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      28
      0)
    object dxBarManager1Bar1: TdxBar
      Caption = 'Main'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 826
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnRefresh'
        end
        item
          Visible = True
          ItemName = 'btnCommit'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object btnRefresh: TdxBarButton
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Category = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      Visible = ivAlways
      OnClick = btnRefreshClick
    end
    object btnCommit: TdxBarButton
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Category = 0
      Enabled = False
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Visible = ivAlways
      OnClick = btnCommitClick
    end
  end
end
