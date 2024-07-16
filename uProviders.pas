unit uProviders;

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
  TfrmProviders = class(TForm)
    vwProviders: TcxGridDBTableView;
    lvlProviders: TcxGridLevel;
    grdProviders: TcxGrid;
    pgProviders: TPgQuery;
    pgProvidersid_provider: TIntegerField;
    pgProvidersname: TMemoField;
    dsProviders: TPgDataSource;
    vwProvidersname: TcxGridDBColumn;
    bmProviders: TdxBarManager;
    bmProvidersBar1: TdxBar;
    btnRefresh: TdxBarButton;
    btnCommit: TdxBarButton;
    procedure FormShow(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure pgProvidersAfterPost(DataSet: TDataSet);
    procedure pgProvidersPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgProvidersAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProviders: TfrmProviders;

implementation

{$R *.dfm}

procedure TfrmProviders.btnCommitClick(Sender: TObject);
begin
  pgProviders.ApplyUpdates();
  pgProviders.Connection.Commit;
  pgProviders.Connection.StartTransaction;
  ReOpenDataset(pgProviders);
  btnCommit.Enabled := false;
end;

procedure TfrmProviders.btnRefreshClick(Sender: TObject);
begin
  pgProviders.CancelUpdates;
  pgProviders.Connection.Rollback;
  pgProviders.Connection.StartTransaction;
  ReOpenDataset(pgProviders);
  btnCommit.Enabled := false;
end;

procedure TfrmProviders.FormClose(Sender: TObject; var Action: TCloseAction);
var
  VButton: integer;
begin
  if btnCommit.Enabled then
  begin
    VButton := MessageDlg('Сохранить изменения?', mtConfirmation, mbYesNo, 0);

    case VButton of
      mrYes:
        begin
          pgProviders.ApplyUpdates();
          pgProviders.Connection.Commit;
          pgProviders.Connection.StartTransaction;
        end;
      mrNo:
        begin
          pgProviders.CancelUpdates;
          pgProviders.Connection.Rollback;
          pgProviders.Connection.StartTransaction;
        end;
      else Action := TCloseAction.caNone;
    end;
  end;
end;

procedure TfrmProviders.FormShow(Sender: TObject);
begin
  ReOpenDataset(pgProviders);
  btnCommit.Enabled := false;
end;

procedure TfrmProviders.pgProvidersAfterDelete(DataSet: TDataSet);
begin
  btnCommit.Enabled := true;
end;

procedure TfrmProviders.pgProvidersAfterPost(DataSet: TDataSet);
begin
  btnCommit.Enabled := true;
end;

procedure TfrmProviders.pgProvidersPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := TDataAction.daAbort;

  if pgProvidersname.AsString = '' then
    ShowMessage('Заполните наименование поставщика');

  ShowMessage('Ошибка при заполнении полей');
end;

end.
