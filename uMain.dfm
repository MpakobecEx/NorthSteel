object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = #1043#1083#1072#1074#1085#1086#1077' '#1084#1077#1085#1102
  ClientHeight = 30
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mainMenu: TMainMenu
    Left = 136
    Top = 65520
    object btnDirectories: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object btnDirProviders: TMenuItem
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082#1080
        OnClick = btnDirProvidersClick
      end
      object btnDirProducts: TMenuItem
        Caption = #1058#1086#1074#1072#1088#1099
        OnClick = btnDirProductsClick
      end
      object btnDirPrices: TMenuItem
        Caption = #1062#1077#1085#1099
        OnClick = btnDirPricesClick
      end
    end
    object btnProcedures: TMenuItem
      Caption = #1054#1087#1077#1088#1072#1094#1080#1080
      object btnProcSupply: TMenuItem
        Caption = #1055#1086#1089#1090#1072#1074#1082#1080
        OnClick = btnProcSupplyClick
      end
    end
  end
end
