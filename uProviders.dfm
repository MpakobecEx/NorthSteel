object frmProviders: TfrmProviders
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
  ClientHeight = 329
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
  object grdProviders: TcxGrid
    Left = 0
    Top = 28
    Width = 635
    Height = 301
    Align = alClient
    TabOrder = 0
    object vwProviders: TcxGridDBTableView
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
      DataController.DataSource = dsProviders
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ShowEditButtons = gsebForFocusedRecord
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object vwProvidersname: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'name'
      end
    end
    object lvlProviders: TcxGridLevel
      GridView = vwProviders
    end
  end
  object pgProviders: TPgQuery
    SQLInsert.Strings = (
      'call store.pkg_providers_add(:name);')
    SQLDelete.Strings = (
      'call store.pkg_providers_delete(:id_provider);')
    SQLUpdate.Strings = (
      'call store.pkg_providers_edit(:id_provider,'
      '                              :name);')
    Connection = datmod.conMain
    SQL.Strings = (
      'select *'
      'from store.pkg_providers_get_list();')
    CachedUpdates = True
    AutoCommit = False
    Options.StrictUpdate = False
    Options.AutoPrepare = True
    AfterPost = pgProvidersAfterPost
    AfterDelete = pgProvidersAfterDelete
    OnPostError = pgProvidersPostError
    Left = 32
    Top = 48
    object pgProvidersid_provider: TIntegerField
      FieldName = 'id_provider'
      ReadOnly = True
    end
    object pgProvidersname: TMemoField
      FieldName = 'name'
      Required = True
      BlobType = ftMemo
    end
  end
  object dsProviders: TPgDataSource
    DataSet = pgProviders
    Left = 48
    Top = 64
  end
  object bmProviders: TdxBarManager
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
    Left = 576
    Top = 48
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      28
      0)
    object bmProvidersBar1: TdxBar
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
