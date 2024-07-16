unit uSupplies;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, dxUIAClasses, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, frxSmartMemo, cxCheckBox, dxBar, dxBarExtItems,
  cxBarEditItem, cxClasses, frxClass, frxDBSet, frxExportBIFF,
  frxExportBaseDialog, frxExportPDF, frCoreClasses, DBAccess, PgAccess, MemDS,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid,

  uDM;

type
  TfrmSupplies = class(TForm)
    vwSupplyHead: TcxGridDBTableView;
    lvlSupplyHead: TcxGridLevel;
    grdSupplies: TcxGrid;
    pgSupplyHead: TPgQuery;
    dsSupplyHead: TPgDataSource;
    lvlSupplyTail: TcxGridLevel;
    vwSupplyTail: TcxGridDBTableView;
    pgSupplyHeadid_supply: TIntegerField;
    pgSupplyHeadid_provider: TIntegerField;
    pgSupplyHeadname_provider: TMemoField;
    pgSupplyHeaddt: TDateField;
    pgSupplyHeadsumma: TFloatField;
    vwSupplyHeadid_supply: TcxGridDBColumn;
    vwSupplyHeadid_provider: TcxGridDBColumn;
    vwSupplyHeadname_provider: TcxGridDBColumn;
    vwSupplyHeaddt: TcxGridDBColumn;
    vwSupplyHeadsumma: TcxGridDBColumn;
    pgSupplyTail: TPgQuery;
    dsSupplyTail: TPgDataSource;
    pgSupplyTailid_supply: TIntegerField;
    pgSupplyTailid_product: TIntegerField;
    pgSupplyTailname_product: TMemoField;
    pgSupplyTailid_group: TIntegerField;
    pgSupplyTailname_group: TMemoField;
    pgSupplyTailprice: TFloatField;
    pgSupplyTailamount: TFloatField;
    pgSupplyTailsumma: TFloatField;
    vwSupplyTailid_supply: TcxGridDBColumn;
    vwSupplyTailid_product: TcxGridDBColumn;
    vwSupplyTailname_product: TcxGridDBColumn;
    vwSupplyTailid_group: TcxGridDBColumn;
    vwSupplyTailname_group: TcxGridDBColumn;
    vwSupplyTailprice: TcxGridDBColumn;
    vwSupplyTailamount: TcxGridDBColumn;
    vwSupplyTailsumma: TcxGridDBColumn;
    repSupply: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxBIFFExport1: TfrxBIFFExport;
    dbSupplyHead: TfrxDBDataset;
    dbSupplyTail: TfrxDBDataset;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    btnRefresh: TdxBarButton;
    btnAdd: TdxBarButton;
    btnDelete: TdxBarButton;
    dxBarManager1Bar2: TdxBar;
    cbDate: TcxBarEditItem;
    dcBegin: TdxBarDateCombo;
    dcEnd: TdxBarDateCombo;
    btnReport: TdxBarButton;
    procedure btnRefreshClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure cbDatePropertiesEditValueChanged(Sender: TObject);
    procedure dcBeginChange(Sender: TObject);
    procedure dcEndChange(Sender: TObject);
    procedure pgSupplyHeadAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSupplies: TfrmSupplies;

implementation

{$R *.dfm}

uses uAddSupply;

procedure TfrmSupplies.btnAddClick(Sender: TObject);
begin
  if not Assigned(frmAddSupply) then
    frmAddSupply := TfrmAddSupply.Create(frmSupplies);

  frmAddSupply.ShowModal;

  if frmAddSupply.ModalResult = mrOk then
    btnRefresh.Click;
end;

procedure TfrmSupplies.btnDeleteClick(Sender: TObject);
begin
  if MessageDlg('Подтвердите удаление', mtConfirmation, mbYesNo, 0) = mrYes then
    pgSupplyHead.Delete;
end;

procedure TfrmSupplies.btnRefreshClick(Sender: TObject);
begin
  pgSupplyHead.ParamByName('dt_begin').Clear;
  if cbDate.EditValue = True then
    pgSupplyHead.ParamByName('dt_begin').AsDate := dcBegin.Date;

  pgSupplyHead.ParamByName('dt_end').Clear;
  if cbDate.EditValue = True then
    pgSupplyHead.ParamByName('dt_end').AsDate := dcEnd.Date;

  ReOpenDataset(pgSupplyHead);
  ReOpenDataset(pgSupplyTail);
  vwSupplyHead.ViewData.Expand(True);
  btnDelete.Enabled := True;
  btnReport.Enabled := True;
end;

procedure TfrmSupplies.btnReportClick(Sender: TObject);
begin
  repSupply.ShowReport();
end;

procedure TfrmSupplies.cbDatePropertiesEditValueChanged(Sender: TObject);
begin
  dcBegin.Enabled := TcxCheckBox(Sender).Checked;
  dcEnd.Enabled := TcxCheckBox(Sender).Checked;
end;

procedure TfrmSupplies.dcBeginChange(Sender: TObject);
begin
  if dcEnd.Date < dcBegin.Date then
    dcEnd.Date := dcBegin.Date;
end;

procedure TfrmSupplies.dcEndChange(Sender: TObject);
begin
  if dcEnd.Date < dcBegin.Date then
    dcBegin.Date := dcEnd.Date;
end;

procedure TfrmSupplies.pgSupplyHeadAfterDelete(DataSet: TDataSet);
begin
  pgSupplyHead.Refresh;
  with datmod.conMain do
  begin
    Commit;
    StartTransaction;
  end;
end;

end.
