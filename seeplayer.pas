unit seeplayer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids,dbConnection, DB, ADODB, jpeg, ExtCtrls;

type
  TplayerForm = class(TForm)
    playerInMarket: TLabel;
    PlayerInMarketGrid: TDBGrid;
    playerInTeamGrid: TDBGrid;
    QueryPlayerInMarket: TADOQuery;
    QueryPlayerInTeam: TADOQuery;
    DataSourcePlayerInMarket: TDataSource;
    DataSourcePlayerInTeam: TDataSource;
    Image1: TImage;
    Label1: TLabel;
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
   sqlStr:='select name as ''球员姓名'',salary as ''薪水报价'' from market where class=''球员''';
   SQL.Add(sqlStr);
   Open;
  end;
  playerInMarketGrid.Columns[0].Width:=100;
  playerInMarketGrid.Columns.Items[0].Title.Alignment:=taCenter;
  playerInMarketGrid.Columns.Items[0].Alignment:=taCenter;
  playerInMarketGrid.Columns[1].Width:=100;
  playerInMarketGrid.Columns.Items[1].Title.Alignment:=taCenter;
  playerInMarketGrid.Columns.Items[1].Alignment:=taCenter;


  with QueryPlayerInTeam do
  begin
   Close;
   SQL.Clear;
   sqlStr:='select name as ''球员姓名'',position as ''球队角色'','+
   'ability as ''能力值'',team as ''所属球队'' from player where not (team is NULL)'+
   'order by team desc';
   SQL.Add(sqlStr);
   Open;
  end;
  playerInTeamGrid.Columns[0].Width:=100;
  playerInTeamGrid.Columns.Items[0].Title.Alignment:=taCenter;
  playerInTeamGrid.Columns.Items[0].Alignment:=taCenter;
  playerInTeamGrid.Columns[1].Width:=100;
  playerInTeamGrid.Columns.Items[1].Title.Alignment:=taCenter;
  playerInTeamGrid.Columns.Items[1].Alignment:=taCenter;
  playerInTeamGrid.Columns[2].Width:=100;
  playerInTeamGrid.Columns.Items[2].Title.Alignment:=taCenter;
  playerInTeamGrid.Columns.Items[2].Alignment:=taCenter;
  playerInTeamGrid.Columns[3].Width:=100;
  playerInTeamGrid.Columns.Items[3].Title.Alignment:=taCenter;
  playerInTeamGrid.Columns.Items[3].Alignment:=taCenter;
end;

end.
