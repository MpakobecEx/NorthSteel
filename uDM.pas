unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, PgAccess;

type
  Tdatmod = class(TDataModule)
    conMain: TPgConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datmod: Tdatmod;

procedure ReOpenDataset(AQuery: TPgQuery);

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure ReOpenDataset(AQuery: TPgQuery);
begin
  AQuery.Close;
  AQuery.Open;
end;

end.
