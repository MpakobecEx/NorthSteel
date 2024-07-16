unit uAddSupply;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, dxUIAClasses, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxDBLookupComboBox,
  cxCalc, VirtualTable, DBAccess, PgAccess, MemDS, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, cxDropDownEdit, cxCalendar,
  cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, Vcl.ExtCtrls,

  uDM;

type
  TfrmAddSupply = class(TForm)
    lblProvider: TLabel;
    lcbProvider: TcxLookupComboBox;
    pgProviders: TPgQuery;
    dsProviders: TPgDataSource;
    pgProvidersid_provider: TIntegerField;
    pgProvidersname: TMemoField;
    lblDt: TLabel;
    Panel1: TPanel;
    pnlButtons: TPanel;
    btnCancel: TButton;
    btnAdd: TButton;
    vwProducts: TcxGridDBTableView;
    lvlProducts: TcxGridLevel;
    grdProducts: TcxGrid;
    pgProducts: TPgQuery;
    dsProducts: TPgDataSource;
    pgProductsid_product: TIntegerField;
    pgProductsproduct_name: TMemoField;
    vwProductsid_product: TcxGridDBColumn;
    vwProductsprice: TcxGridDBColumn;
    vwProductsamount: TcxGridDBColumn;
    vwProductssumma: TcxGridDBColumn;
    pgProductsprice: TFloatField;
    vtTemp: TVirtualTable;
    dsTemp: TDataSource;
    vtTempid_product: TIntegerField;
    vtTempamount: TFloatField;
    vtTempprice: TFloatField;
    vtTempsumma: TFloatField;
    deDt: TcxDateEdit;
    pgAddHead: TPgQuery;
    pgAddHeadid_supply: TIntegerField;
    pgAddTail: TPgQuery;
    procedure lcbProviderPropertiesEditValueChanged(Sender: TObject);
    procedure deDtPropertiesEditValueChanged(Sender: TObject);
    procedure vtTempCalcFields(DataSet: TDataSet);
    procedure vwProductsCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure vwProductsid_productPropertiesEditValueChanged(Sender: TObject);
    procedure vwProductsid_productPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure vwProductsamountPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure vtTempPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddSupply: TfrmAddSupply;

implementation

{$R *.dfm}

procedure TfrmAddSupply.btnAddClick(Sender: TObject);
var
  VIdSupply: integer;
begin
  try
    if vtTemp.State in [dsEdit, dsInsert] then
      vtTemp.Post;

    if vtTemp.RecordCount = 0 then
    begin
      ShowMessage('Заполните товары');
      Exit;
    end;

    with pgAddHead do
    begin
      Close;
      ParamByName('id_provider').AsInteger := lcbProvider.EditValue;
      ParamByName('dt').AsDate := deDt.Date;
      Open;
    end;

    VIdSupply := pgAddHeadid_supply.AsInteger;

    pgAddTail.ParamByName('id_supply').AsInteger := VIdSupply;

    vtTemp.First;
    while not vtTemp.Eof do
    begin
      with pgAddTail do
      begin
        ParamByName('id_product').AsInteger := vtTempid_product.AsInteger;
        ParamByName('amount').AsFloat := vtTempamount.AsFloat;
        ParamByName('price').AsFloat := vtTempprice.AsFloat;
        Execute;
      end;
      vtTemp.Next;
    end;

    datmod.conMain.Commit;
    datmod.conMain.StartTransaction;

    frmAddSupply.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      datmod.conMain.Rollback;
      datmod.conMain.StartTransaction;
    end;
  end;
end;

procedure TfrmAddSupply.btnCancelClick(Sender: TObject);
begin
  frmAddSupply.ModalResult := mrCancel;
end;

procedure TfrmAddSupply.deDtPropertiesEditValueChanged(Sender: TObject);
begin
  lcbProvider.ItemIndex := -1;
  pgProducts.ParamByName('dt').Value := deDt.Date;
  pgProviders.ParamByName('dt').Value := deDt.Date;
  ReOpenDataset(pgProviders);
  lcbProvider.Enabled := True;
  grdProducts.Enabled := False;
  btnAdd.Enabled := False;
end;

procedure TfrmAddSupply.FormShow(Sender: TObject);
begin
  deDt.Clear;
end;

procedure TfrmAddSupply.lcbProviderPropertiesEditValueChanged(Sender: TObject);
begin
  vtTemp.Close;
  vtTemp.Open;
  vtTemp.Clear;
  if lcbProvider.ItemIndex <> -1 then
  begin
    pgProducts.ParamByName('id_provider').AsInteger := pgProvidersid_provider.AsInteger;
    ReOpenDataset(pgProducts);
    grdProducts.Enabled := True;
    btnAdd.Enabled := True;
  end;
end;

procedure TfrmAddSupply.vtTempCalcFields(DataSet: TDataSet);
begin
  vtTempsumma.AsFloat := vtTempamount.AsFloat * vtTempprice.AsFloat;
end;

procedure TfrmAddSupply.vtTempPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  if vtTempid_product.IsNull then
  begin
    ShowMessage('Выберите товар');
    Exit;
  end;

  if vtTempamount.IsNull then
  begin
    ShowMessage('Введите количество');
    Exit;
  end;
end;

procedure TfrmAddSupply.vwProductsamountPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if DisplayValue <= 0 then
  begin
    ErrorText := 'Неверное количество';
    Error := true;
  end;
end;

procedure TfrmAddSupply.vwProductsCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  ShowMessage(vtTempid_product.AsString);
end;

procedure TfrmAddSupply.vwProductsid_productPropertiesEditValueChanged(
  Sender: TObject);
begin
  vtTempid_product.AsInteger := pgProductsid_product.AsInteger;
  vtTempprice.AsFloat := pgProductsprice.AsFloat;
end;

procedure TfrmAddSupply.vwProductsid_productPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  I: integer;
begin
  ErrorText := 'Товар ' + DisplayValue +  ' уже добавлен';
  for I := 0 to vwProducts.DataController.RecordCount - 1 do
  begin
    if vwProducts.DataController.Values[I, vwProductsid_product.Index] = pgProductsid_product.Value then
      Error := True;
  end;

  if Error then
  begin
    vtTemp.Delete;
    vtTemp.Edit;
  end;
end;

end.
