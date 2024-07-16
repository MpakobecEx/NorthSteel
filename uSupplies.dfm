object frmSupplies: TfrmSupplies
  Left = 0
  Top = 0
  Caption = #1055#1086#1089#1090#1072#1074#1082#1080
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grdSupplies: TcxGrid
    Left = 0
    Top = 56
    Width = 635
    Height = 243
    Align = alClient
    TabOrder = 0
    object vwSupplyHead: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsSupplyHead
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object vwSupplyHeadid_supply: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'id_supply'
        Width = 32
      end
      object vwSupplyHeadid_provider: TcxGridDBColumn
        DataBinding.FieldName = 'id_provider'
        Visible = False
      end
      object vwSupplyHeadname_provider: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        DataBinding.FieldName = 'name_provider'
        Width = 349
      end
      object vwSupplyHeaddt: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'dt'
        Width = 119
      end
      object vwSupplyHeadsumma: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072
        DataBinding.FieldName = 'summa'
        Width = 118
      end
    end
    object vwSupplyTail: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataModeController.DetailInSQLMode = True
      DataController.DataSource = dsSupplyTail
      DataController.DetailKeyFieldNames = 'id_supply'
      DataController.MasterKeyFieldNames = 'id_supply'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object vwSupplyTailid_supply: TcxGridDBColumn
        DataBinding.FieldName = 'id_supply'
        Visible = False
      end
      object vwSupplyTailid_product: TcxGridDBColumn
        DataBinding.FieldName = 'id_product'
        Visible = False
      end
      object vwSupplyTailname_group: TcxGridDBColumn
        Caption = #1043#1088#1091#1087#1087#1072' '#1090#1086#1074#1072#1088#1072
        DataBinding.FieldName = 'name_group'
      end
      object vwSupplyTailname_product: TcxGridDBColumn
        Caption = #1058#1086#1074#1072#1088
        DataBinding.FieldName = 'name_product'
      end
      object vwSupplyTailid_group: TcxGridDBColumn
        DataBinding.FieldName = 'id_group'
        Visible = False
      end
      object vwSupplyTailprice: TcxGridDBColumn
        Caption = #1062#1077#1085#1072
        DataBinding.FieldName = 'price'
      end
      object vwSupplyTailamount: TcxGridDBColumn
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        DataBinding.FieldName = 'amount'
      end
      object vwSupplyTailsumma: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072
        DataBinding.FieldName = 'summa'
      end
    end
    object lvlSupplyHead: TcxGridLevel
      GridView = vwSupplyHead
      object lvlSupplyTail: TcxGridLevel
        GridView = vwSupplyTail
      end
    end
  end
  object pgSupplyHead: TPgQuery
    KeyFields = 'id_supply'
    SQLDelete.Strings = (
      'call store.pkg_supplies_delete(:id_supply);')
    Connection = datmod.conMain
    SQL.Strings = (
      'select *'
      'from store.pkg_supplies_get_report_head(:dt_begin, :dt_end);')
    AutoCommit = False
    Options.StrictUpdate = False
    AfterDelete = pgSupplyHeadAfterDelete
    Left = 32
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dt_begin'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'dt_end'
        Value = nil
      end>
    object pgSupplyHeadid_supply: TIntegerField
      FieldName = 'id_supply'
      ReadOnly = True
    end
    object pgSupplyHeadid_provider: TIntegerField
      FieldName = 'id_provider'
      ReadOnly = True
    end
    object pgSupplyHeadname_provider: TMemoField
      FieldName = 'name_provider'
      ReadOnly = True
      BlobType = ftMemo
    end
    object pgSupplyHeaddt: TDateField
      FieldName = 'dt'
      ReadOnly = True
    end
    object pgSupplyHeadsumma: TFloatField
      FieldName = 'summa'
      ReadOnly = True
    end
  end
  object dsSupplyHead: TPgDataSource
    DataSet = pgSupplyHead
    Left = 48
    Top = 104
  end
  object pgSupplyTail: TPgQuery
    Connection = datmod.conMain
    SQL.Strings = (
      'select *'
      'from store.pkg_supplies_get_report_tail(:id_supply)')
    AutoCommit = False
    Left = 32
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_supply'
        Value = nil
      end>
    object pgSupplyTailid_supply: TIntegerField
      FieldName = 'id_supply'
      ReadOnly = True
    end
    object pgSupplyTailid_product: TIntegerField
      FieldName = 'id_product'
      ReadOnly = True
    end
    object pgSupplyTailname_product: TMemoField
      FieldName = 'name_product'
      ReadOnly = True
      BlobType = ftMemo
    end
    object pgSupplyTailid_group: TIntegerField
      FieldName = 'id_group'
      ReadOnly = True
    end
    object pgSupplyTailname_group: TMemoField
      FieldName = 'name_group'
      ReadOnly = True
      BlobType = ftMemo
    end
    object pgSupplyTailprice: TFloatField
      FieldName = 'price'
      ReadOnly = True
    end
    object pgSupplyTailamount: TFloatField
      FieldName = 'amount'
      ReadOnly = True
    end
    object pgSupplyTailsumma: TFloatField
      FieldName = 'summa'
      ReadOnly = True
    end
  end
  object dsSupplyTail: TPgDataSource
    DataSet = pgSupplyTail
    Left = 48
    Top = 216
  end
  object repSupply: TfrxReport
    Version = '2024.2.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45487.330680914360000000
    ReportOptions.LastChange = 45488.192746655090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure repSupplyOnStartReport(Sender: TfrxComponent);'
      'begin'
      
        '                                                                ' +
        '              '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnStartReport = 'repSupplyOnStartReport'
    Left = 480
    Top = 112
    Datasets = <
      item
        DataSet = dbSupplyHead
        DataSetName = 'dbSupplyHead'
      end
      item
        DataSet = dbSupplyTail
        DataSetName = 'dbSupplyTail'
      end>
    Variables = <
      item
        Name = ' dt'
        Value = Null
      end
      item
        Name = 'begin_date'
        Value = '<Date>'
      end
      item
        Name = 'begin_end'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object memTitle: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559073210000000000
          Top = 0.000002400000000000
          Width = 718.110700730000000000
          Height = 34.015771670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            #1054#1090#1095#1105#1090' '#1087#1086' '#1087#1086#1089#1090#1072#1074#1082#1072#1084
            '')
          ParentFont = False
        end
      end
      object dHead: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 162.519790000000000000
        Width = 718.110700000000000000
        DataSet = dbSupplyHead
        DataSetName = 'dbSupplyHead'
        RowCount = 0
        object dbSupplyHeadname_provider: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 86.929190000000000000
          Width = 393.071120000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'name_provider'
          DataSet = dbSupplyHead
          DataSetName = 'dbSupplyHead'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dbSupplyHead."name_provider"]')
          ParentFont = False
        end
        object dbSupplyHeaddt: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 480.000310000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'dt'
          DataSet = dbSupplyHead
          DataSetName = 'dbSupplyHead'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dbSupplyHead."dt"]')
          ParentFont = False
        end
        object dbSupplyHeadsumma: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'summa'
          DataSet = dbSupplyHead
          DataSetName = 'dbSupplyHead'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dbSupplyHead."summa"]')
          ParentFont = False
        end
        object dbSupplyHeadid_supply: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'id_supply'
          DataSet = dbSupplyHead
          DataSetName = 'dbSupplyHead'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dbSupplyHead."id_supply"]')
          ParentFont = False
        end
      end
      object hHead: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 120.944960000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 86.929190000000000000
          Width = 393.071120000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = dbSupplyHead
          DataSetName = 'dbSupplyHead'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1055#1086#1089#1090#1072#1074#1097#1080#1082
            '')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 480.000310000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = dbSupplyHead
          DataSetName = 'dbSupplyHead'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1044#1072#1090#1072
            '')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = dbSupplyHead
          DataSetName = 'dbSupplyHead'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1057#1091#1084#1084#1072
            '')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = dbSupplyHead
          DataSetName = 'dbSupplyHead'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #8470)
          ParentFont = False
        end
      end
      object dTail: TfrxDetailData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        DataSet = dbSupplyTail
        DataSetName = 'dbSupplyTail'
        RowCount = 0
        object dbSupplyTailprice: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 480.000310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'price'
          DataSet = dbSupplyTail
          DataSetName = 'dbSupplyTail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dbSupplyTail."price"]')
          ParentFont = False
        end
        object dbSupplyTailamount: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 559.370440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'amount'
          DataSet = dbSupplyTail
          DataSetName = 'dbSupplyTail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dbSupplyTail."amount"]')
          ParentFont = False
        end
        object dbSupplyTailsumma: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'summa'
          DataSet = dbSupplyTail
          DataSetName = 'dbSupplyTail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dbSupplyTail."summa"]')
          ParentFont = False
        end
        object dbSupplyTailname_product: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 86.929190000000000000
          Width = 393.071120000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'name_product'
          DataSet = dbSupplyTail
          DataSetName = 'dbSupplyTail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dbSupplyTail."name_product"]')
          ParentFont = False
        end
      end
      object hTail: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 86.929190000000000000
          Width = 393.071120000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = dbSupplyTail
          DataSetName = 'dbSupplyTail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1058#1086#1074#1072#1088
            '')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 480.000310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = dbSupplyTail
          DataSetName = 'dbSupplyTail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1062#1077#1085#1072
            '')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 559.370440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = dbSupplyTail
          DataSetName = 'dbSupplyTail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1050#1086#1083'-'#1074#1086
            '')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = dbSupplyTail
          DataSetName = 'dbSupplyTail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1057#1091#1084#1084#1072
            '')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 325.039580000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Top = 11.338590000000010000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Date] [Time]')
          ParentFont = False
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 528
    Top = 112
  end
  object frxBIFFExport1: TfrxBIFFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    RowHeightScale = 1.000000000000000000
    ChunkSize = 0
    Inaccuracy = 10.000000000000000000
    FitPages = False
    Pictures = True
    ParallelPages = 0
    Left = 576
    Top = 112
  end
  object dbSupplyHead: TfrxDBDataset
    UserName = 'dbSupplyHead'
    CloseDataSource = False
    DataSource = dsSupplyHead
    BCDToCurrency = False
    DataSetOptions = []
    Left = 144
    Top = 88
    FieldDefs = <
      item
        FieldName = 'id_supply'
      end
      item
        FieldName = 'id_provider'
      end
      item
        FieldName = 'name_provider'
        FieldType = fftString
      end
      item
        FieldName = 'dt'
        FieldType = fftDateTime
      end
      item
        FieldName = 'summa'
      end>
  end
  object dbSupplyTail: TfrxDBDataset
    UserName = 'dbSupplyTail'
    CloseDataSource = False
    DataSource = dsSupplyTail
    BCDToCurrency = False
    DataSetOptions = []
    Left = 144
    Top = 200
    FieldDefs = <
      item
        FieldName = 'id_supply'
      end
      item
        FieldName = 'id_product'
      end
      item
        FieldName = 'name_product'
        FieldType = fftString
      end
      item
        FieldName = 'id_group'
      end
      item
        FieldName = 'name_group'
        FieldType = fftString
      end
      item
        FieldName = 'price'
      end
      item
        FieldName = 'amount'
      end
      item
        FieldName = 'summa'
      end>
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
    Left = 328
    Top = 112
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      56
      0)
    object dxBarManager1Bar1: TdxBar
      Caption = 'Main'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 28
      DockingStyle = dsTop
      FloatLeft = 669
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnAdd'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnDelete'
        end>
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar2: TdxBar
      Caption = 'Date'
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
          UserDefine = [udWidth]
          UserWidth = 20
          Visible = True
          ItemName = 'cbDate'
        end
        item
          Visible = True
          ItemName = 'dcBegin'
        end
        item
          Visible = True
          ItemName = 'dcEnd'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnReport'
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
    object btnAdd: TdxBarButton
      Caption = #1053#1086#1074#1072#1103' '#1087#1086#1089#1090#1072#1074#1082#1072
      Category = 0
      Hint = #1053#1086#1074#1072#1103' '#1087#1086#1089#1090#1072#1074#1082#1072
      Visible = ivAlways
      OnClick = btnAddClick
    end
    object btnDelete: TdxBarButton
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1089#1090#1072#1074#1082#1091
      Category = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1089#1090#1072#1074#1082#1091
      Visible = ivAlways
      OnClick = btnDeleteClick
    end
    object cbDate: TcxBarEditItem
      Category = 0
      Visible = ivAlways
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.OnEditValueChanged = cbDatePropertiesEditValueChanged
      InternalEditValue = False
    end
    object dcBegin: TdxBarDateCombo
      Caption = #1076#1072#1090#1072' '#1089
      Category = 0
      Enabled = False
      Hint = #1076#1072#1090#1072' '#1089
      Visible = ivAlways
      OnChange = dcBeginChange
      Glyph.SourceDPI = 96
      Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E00000000000000000000FF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FFFFFFFFFF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFF0000
        00FF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF000080FF000080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF000080FF000080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000080FF0000
        80FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        80FF000080FFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FFFFFFFFFFFFFFFFFF000080FF000080FF000080FF0000
        80FF000080FFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FF800000FF800000FF800000FF800000FF800000FF8000
        00FF800000FF800000FF800000FF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFF000000FF800000FF800000FF800000FF800000FF800000FF8000
        00FF800000FF800000FF800000FF000000FFFF00FFFF000000FF800000FF8000
        00FF800000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFF000000FF800000FF8000
        00FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF0000
        00FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF}
      ShowCaption = True
    end
    object dcEnd: TdxBarDateCombo
      Caption = #1087#1086
      Category = 0
      Enabled = False
      Hint = #1087#1086
      Visible = ivAlways
      OnChange = dcEndChange
      Glyph.SourceDPI = 96
      Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E00000000000000000000FF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FFFFFFFFFF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFF0000
        00FF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF000080FF000080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF000080FF000080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000080FF0000
        80FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        80FF000080FFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FFFFFFFFFFFFFFFFFF000080FF000080FF000080FF0000
        80FF000080FFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FF800000FF800000FF800000FF800000FF800000FF8000
        00FF800000FF800000FF800000FF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFF000000FF800000FF800000FF800000FF800000FF800000FF8000
        00FF800000FF800000FF800000FF000000FFFF00FFFF000000FF800000FF8000
        00FF800000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFF000000FF800000FF8000
        00FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF0000
        00FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF}
      ShowCaption = True
    end
    object btnReport: TdxBarButton
      Caption = #1054#1090#1095#1105#1090
      Category = 0
      Enabled = False
      Hint = #1054#1090#1095#1105#1090
      Visible = ivAlways
      OnClick = btnReportClick
    end
  end
end
