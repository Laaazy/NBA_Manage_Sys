unit seeCoach;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, jpeg, ExtCtrls;

type
  TcoachForm = class(TForm)
    Label1: TLabel;
    coachInMarketGrid: TDBGrid;
    playerInTeam: TLabel;
    coachInTeamGrid: TDBGrid;
    QueryCoachInMarket: TADOQuery;
    QueryCoachInTeam: TADOQuery;
    DataSourceCoachInMarket: TDataSource;
    DataSourceCoachInTeam: TDataSource;
    Image1: TImage;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  coachForm: TcoachForm;

implementation

{$R *.dfm}

procedure TcoachForm.FormShow(Sender: TObject);
var
  sqlStr:String;
begin
  with QueryCoachInMarket do
  begin
   Close;
   SQL.Clear;
   sqlStr:='select name as ''教练姓名'',salary as ''薪水报价'' from market where class=''教练''';
   SQL.Add(sqlStr);
   Open;
  end;
  coachInMarketGrid.Columns[0].Width:=100;
  coachInMarketGrid.Columns.Items[0].Title.Alignment:=taCenter;
  coachInMarketGrid.Columns.Items[0].Alignment:=taCenter;
  coachInMarketGrid.Columns[1].Width:=100;
  coachInMarketGrid.Columns.Items[1].Title.Alignment:=taCenter;
  coachInMarketGrid.Columns.Items[1].Alignment:=taCenter;
  with QueryCoachInTeam do
  begin
   Close;
   SQL.Clear;
   sqlStr:='select name as ''教练姓名'',team as ''所属球队'' from coach where not (team is NULL)'+
   'order by team desc';
   SQL.Add(sqlStr);
   Open;
  end;
  coachInTeamGrid.Columns[0].Width:=100;
  coachInTeamGrid.Columns.Items[0].Title.Alignment:=taCenter;
  coachInTeamGrid.Columns.Items[0].Alignment:=taCenter;
  coachInTeamGrid.Columns[1].Width:=100;
  coachInTeamGrid.Columns.Items[1].Title.Alignment:=taCenter;
  coachInTeamGrid.Columns.Items[1].Alignment:=taCenter;
end;

end.
