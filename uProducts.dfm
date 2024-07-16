object frmProducts: TfrmProducts
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1090#1086#1074#1072#1088#1086#1074
  ClientHeight = 299
  ClientWidth = 635
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
  object grdProducts: TcxGrid
    Left = 0
    Top = 28
    Width = 635
    Height = 271
    Align = alClient
    TabOrder = 0
    object vwGroups: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Visible = False
      Navigator.Buttons.Next.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsGroups
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object vwGroupsID_GROUP: TcxGridDBColumn
        DataBinding.FieldName = 'id_group'
        Visible = False
      end
      object vwGroupsNAME: TcxGridDBColumn
        Caption = #1058#1086#1074#1072#1088#1099
        DataBinding.FieldName = 'name'
      end
    end
    object vwProducts: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Visible = False
      Navigator.Buttons.Next.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataModeController.DetailInSQLMode = True
      DataController.DataSource = dsProducts
      DataController.DetailKeyFieldNames = 'id_group'
      DataController.MasterKeyFieldNames = 'id_group'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object vwProductsID_PRODUCT: TcxGridDBColumn
        DataBinding.FieldName = 'id_product'
        Visible = False
      end
      object vwProductsNAME: TcxGridDBColumn
        Caption = #1058#1086#1074#1072#1088
        DataBinding.FieldName = 'name'
      end
    end
    object lvlGroups: TcxGridLevel
      GridView = vwGroups
      object lvlProducts: TcxGridLevel
        GridView = vwProducts
      end
    end
  end
  object pgGroups: TPgQuery
    KeyFields = 'id_group'
    SequenceMode = smInsert
    SQLInsert.Strings = (
      'call store.pkg_product_groups_add(:name);')
    SQLDelete.Strings = (
      'call store.pkg_product_groups_delete(:id_group);')
    SQLUpdate.Strings = (
      'call store.pkg_product_groups_edit(:id_group, :name);')
    Connection = datmod.conMain
    SQL.Strings = (
      'select *'
      'from store.pkg_product_groups_get_list();')
    CachedUpdates = True
    AutoCommit = False
    Options.StrictUpdate = False
    AfterPost = pgAfterPost
    AfterDelete = pgAfterDelete
    OnPostError = pgPostError
    Left = 24
    Top = 80
    object pgGroupsid_group: TIntegerField
      FieldName = 'id_group'
    end
    object pgGroupsname: TMemoField
      FieldName = 'name'
      Required = True
      BlobType = ftMemo
    end
  end
  object dsGroups: TPgDataSource
    DataSet = pgGroups
    Left = 40
    Top = 96
  end
  object pgProducts: TPgQuery
    KeyFields = 'id_product'
    SQLInsert.Strings = (
      'call store.pkg_products_add(:id_group, :name);')
    SQLDelete.Strings = (
      'call store.pkg_products_delete(:id_product);')
    SQLUpdate.Strings = (
      'call store.pkg_products_edit(:id_product, :name);')
    Connection = datmod.conMain
    SQL.Strings = (
      'select *'
      'from store.pkg_products_detail_get_list(:id_group);')
    CachedUpdates = True
    AutoCommit = False
    Options.StrictUpdate = False
    AfterPost = pgAfterPost
    AfterDelete = pgAfterDelete
    OnPostError = pgPostError
    Left = 24
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_group'
        Value = nil
      end>
    object pgProductsid_product: TIntegerField
      FieldName = 'id_product'
    end
    object pgProductsid_group: TIntegerField
      FieldName = 'id_group'
    end
    object pgProductsname: TMemoField
      FieldName = 'name'
      Required = True
      BlobType = ftMemo
    end
  end
  object dsProducts: TPgDataSource
    DataSet = pgProducts
    Left = 40
    Top = 184
  end
  object bmProducts: TdxBarManager
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
    Left = 568
    Top = 40
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      28
      0)
    object bmProductsBar1: TdxBar
      Caption = 'Main'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 669
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
