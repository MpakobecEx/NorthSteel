unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmMain = class(TForm)
    mainMenu: TMainMenu;
    btnDirectories: TMenuItem;
    btnProcedures: TMenuItem;
    btnDirProviders: TMenuItem;
    btnDirProducts: TMenuItem;
    btnDirPrices: TMenuItem;
    btnProcSupply: TMenuItem;
    procedure btnDirProvidersClick(Sender: TObject);
    procedure btnDirProductsClick(Sender: TObject);
    procedure btnDirPricesClick(Sender: TObject);
    procedure btnProcSupplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uProviders, uProducts, uPrices, uSupplies;

procedure TfrmMain.btnDirPricesClick(Sender: TObject);
begin
  if not Assigned(frmPrices) then
    frmPrices := TfrmPrices.Create(frmMain);

  frmPrices.ShowModal;
end;

procedure TfrmMain.btnDirProductsClick(Sender: TObject);
begin
  if not Assigned(frmProducts) then
    frmProducts := TfrmProducts.Create(frmMain);

  frmProducts.ShowModal;
end;

procedure TfrmMain.btnDirProvidersClick(Sender: TObject);
begin
  if not Assigned(frmProviders) then
    frmProviders := TfrmProviders.Create(frmMain);

  frmProviders.ShowModal;
end;

procedure TfrmMain.btnProcSupplyClick(Sender: TObject);
begin
  if not Assigned(frmSupplies) then
    frmSupplies := TfrmSupplies.Create(frmMain);

  frmSupplies.ShowModal;
end;

end.
