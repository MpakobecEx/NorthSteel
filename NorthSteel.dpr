program NorthSteel;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uDM in 'uDM.pas' {datmod: TDataModule},
  uProviders in 'uProviders.pas' {frmProviders},
  uProducts in 'uProducts.pas' {frmProducts},
  uPrices in 'uPrices.pas' {frmPrices},
  uSupplies in 'uSupplies.pas' {frmSupplies},
  uAddSupply in 'uAddSupply.pas' {frmAddSupply};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tdatmod, datmod);
  Application.Run;
end.
