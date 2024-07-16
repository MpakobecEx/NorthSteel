unit uProducts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, dxUIAClasses, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, dxBar, cxClasses, DBAccess, PgAccess, MemDS, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid,

  uDM;

type
  TfrmProducts = class(TForm)
    vwGroups: TcxGridDBTableView;
    lvlGroups: TcxGridLevel;
    grdProducts: TcxGrid;
    lvlProducts: TcxGridLevel;
    vwProducts: TcxGridDBTableView;
    pgGroups: TPgQuery;
    dsGroups: TPgDataSource;
    pgGroupsid_group: TIntegerField;
    pgGroupsname: TMemoField;
    pgProducts: TPgQuery;
    dsProducts: TPgDataSource;
    pgProductsid_product: TIntegerField;
    pgProductsid_group: TIntegerField;
    pgProductsname: TMemoField;
    vwGroupsNAME: TcxGridDBColumn;
    vwGroupsID_GROUP: TcxGridDBColumn;
    vwProductsID_PRODUCT: TcxGridDBColumn;
    vwProductsNAME: TcxGridDBColumn;
    bmProducts: TdxBarManager;
    bmProductsBar1: TdxBar;
    btnRefresh: TdxBarButton;
    btnCommit: TdxBarButton;
    procedure btnRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure pgAfterPost(DataSet: TDataSet);
    procedure pgAfterDelete(DataSet: TDataSet);
    procedure pgPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProducts: TfrmProducts;

implementation

{$R *.dfm}

procedure TfrmProducts.btnCommitClick(Sender: TObject);
begin
  pgGroups.ApplyUpdates();
  pgProducts.ApplyUpdates();
  pgGroups.Connection.Commit;
  pgGroups.Connection.StartTransaction;
  ReOpenDataset(pgGroups);
  ReOpenDataset(pgProducts);
  btnCommit.Enabled := false;
end;

procedure TfrmProducts.btnRefreshClick(Sender: TObject);
begin
  pgGroups.CancelUpdates;
  pgProducts.CancelUpdates;
  pgGroups.Connection.Rollback;
  pgGroups.Connection.StartTransaction;
  ReOpenDataset(pgGroups);
  ReOpenDataset(pgProducts);
  btnCommit.Enabled := false;
end;

procedure TfrmProducts.FormClose(Sender: TObject; var Action: TCloseAction);
var
  VButton: integer;
begin
  if btnCommit.Enabled then
  begin
    VButton := MessageDlg('Сохранить изменения?', mtConfirmation, mbYesNo, 0);

    case VButton of
      mrYes:
        begin
          pgGroups.ApplyUpdates();
          pgProducts.ApplyUpdates();
          pgGroups.Connection.Commit;
          pgGroups.Connection.StartTransaction;
        end;
      mrNo:
        begin
          pgGroups.CancelUpdates;
          pgProducts.CancelUpdates;
          pgGroups.Connection.Rollback;
          pgGroups.Connection.StartTransaction;
        end;
      else Action := TCloseAction.caNone;
    end;
  end;
end;

procedure TfrmProducts.FormShow(Sender: TObject);
begin
  ReOpenDataset(pgGroups);
  ReOpenDataset(pgProducts);
end;

procedure TfrmProducts.pgAfterPost(DataSet: TDataSet);
begin
  btnCommit.Enabled := true;
end;

procedure TfrmProducts.pgPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action := TDataAction.daAbort;

  if DataSet.FieldByName('name').AsString = '' then
    ShowMessage('Заполните наименование');

  ShowMessage('Ошибка при заполнении полей');
end;

procedure TfrmProducts.pgAfterDelete(DataSet: TDataSet);
begin
  btnCommit.Enabled := true;
end;

end.
