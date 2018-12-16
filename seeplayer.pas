unit seeplayer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids,dbConnection, DB, ADODB;

type
  TplayerForm = class(TForm)
    playerInMarket: TLabel;
    playerInTeam: TLabel;
    PlayerInMarketGrid: TDBGrid;
    playerInTeamGrid: TDBGrid;
    QueryPlayerInMarket: TADOQuery;
    QueryPlayerInTeam: TADOQuery;
    DataSourcePlayerInMarket: TDataSource;
    DataSourcePlayerInTeam: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  playerForm: TplayerForm;

implementation

{$R *.dfm}

procedure TplayerForm.FormShow(Sender: TObject);
var
  sqlStr:String;
begin
  with QueryPlayerInMarket do
  begin
   Close;
   SQL.Clear;
   //PlayerInMarketGrid.DataSource:=dbConnection.DataModule2.DataSource1;
   sqlStr:='select name as ''球员姓名'',salary as ''薪水报价'' from market where class=''球员''';
   SQL.Add(sqlStr);
   Open;
  end;
  with QueryPlayerInTeam do
  begin
   Close;
   SQL.Clear;
   //playerInTeamGrid.DataSource:=dbConnection.DataModule2.DataSource1;
   sqlStr:='select name as ''球员姓名'',position as ''球队角色'','+
   'ability as ''能力值'',team as ''所属球队'' from player where not (team is NULL)'+
   'order by team desc';
   SQL.Add(sqlStr);
   Open;
  end;
end;

end.
