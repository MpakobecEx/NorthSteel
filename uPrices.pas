unit uPrices;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, dxUIAClasses, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, cxDBLookupComboBox, cxCalc, dxBar, cxClasses, MemDS,
  DBAccess, PgAccess, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid,

  uDM;

type
  TfrmPrices = class(TForm)
    vwPrices: TcxGridDBTableView;
    lvlPrices: TcxGridLevel;
    grdPrices: TcxGrid;
    dsPrices: TPgDataSource;
    vwPricesid_price: TcxGridDBColumn;
    vwPricesid_provider: TcxGridDBColumn;
    vwPricesid_product: TcxGridDBColumn;
    vwPricesprice: TcxGridDBColumn;
    vwPricesbegin_dt: TcxGridDBColumn;
    vwPricesend_dt: TcxGridDBColumn;
    pgProviders: TPgQuery;
    dsProviders: TPgDataSource;
    pgPrices: TPgQuery;
    pgPricesid_price: TIntegerField;
    pgPricesid_provider: TIntegerField;
    pgPricesid_product: TIntegerField;
    pgPricesprice: TFloatField;
    pgPricesbegin_dt: TDateField;
    pgPricesend_dt: TDateField;
    pgProduct: TPgQuery;
    dsProduct: TPgDataSource;
    pgProductid_product: TIntegerField;
    pgProductproduct_name: TMemoField;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    btnRefresh: TdxBarButton;
    btnCommit: TdxBarButton;
    pgProvidersid_provider: TIntegerField;
    pgProvidersname: TMemoField;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure pgPricesAfterPost(DataSet: TDataSet);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure pgPricesAfterInsert(DataSet: TDataSet);
    procedure pgPricesPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure vwPricespricePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgPricesAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrices: TfrmPrices;

implementation

{$R *.dfm}

procedure TfrmPrices.btnCommitClick(Sender: TObject);
begin
  pgPrices.ApplyUpdates();
  pgPrices.Connection.Commit;
  pgPrices.Connection.StartTransaction;
  ReOpenDataset(pgPrices);
  btnCommit.Enabled := false;
end;

procedure TfrmPrices.btnRefreshClick(Sender: TObject);
begin
  pgPrices.CancelUpdates;
  pgPrices.Connection.Rollback;
  pgPrices.Connection.StartTransaction;
  ReOpenDataset(pgPrices);
  btnCommit.Enabled := false;
end;

procedure TfrmPrices.Button1Click(Sender: TObject);
begin
  pgPrices.Post;
end;

procedure TfrmPrices.FormClose(Sender: TObject; var Action: TCloseAction);
var
  VButton: integer;
begin
  if btnCommit.Enabled then
  begin
    VButton := MessageDlg('Сохранить изменения?', mtConfirmation, mbYesNo, 0);

    case VButton of
      mrYes:
        begin
          pgPrices.ApplyUpdates();
          pgPrices.Connection.Commit;
          pgPrices.Connection.StartTransaction;
        end;
      mrNo:
        begin
          pgPrices.CancelUpdates;
          pgPrices.Connection.Rollback;
          pgPrices.Connection.StartTransaction;
        end;
      else Action := TCloseAction.caNone;
    end;
  end;
end;

procedure TfrmPrices.FormShow(Sender: TObject);
begin
  ReOpenDataset(pgPrices);
  ReOpenDataset(pgProviders);
  ReOpenDataset(pgProduct);
end;

procedure TfrmPrices.pgPricesAfterDelete(DataSet: TDataSet);
begin
  btnCommit.Enabled := true;
end;

procedure TfrmPrices.pgPricesAfterInsert(DataSet: TDataSet);
begin
  pgPricesbegin_dt.AsDateTime := Now;
end;

procedure TfrmPrices.pgPricesAfterPost(DataSet: TDataSet);
begin
  btnCommit.Enabled := true;
end;

procedure TfrmPrices.pgPricesPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action := TDataAction.daAbort;

  if pgPricesid_provider.IsNull then
  begin
    ShowMessage('Выберите поставщика');
    Exit;
  end;

  if pgPricesid_product.IsNull then
  begin
    ShowMessage('Выберите товар');
    Exit;
  end;

  if pgPricesprice.IsNull then
  begin
    ShowMessage('Заполните цену');
    Exit;
  end;

  if pgPricesbegin_dt.IsNull then
  begin
    ShowMessage('Заполните дату начала действия цены');
    Exit;
  end;

  ShowMessage('Ошибка при заполнении полей');
end;

procedure TfrmPrices.vwPricespricePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if DisplayValue <= 0 then
  begin
    ErrorText := 'Неверная цена';
    Error := True;
  end;
end;

end.
