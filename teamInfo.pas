unit teamInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids,dbConnection, DB, ADODB, jpeg, ExtCtrls;

type
  TteamInfoForm = class(TForm)
    teamInfoDBGrid: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    arenaInfoDBGrid: TDBGrid;
    Label3: TLabel;
    coachInfoDBGrid: TDBGrid;
    Label4: TLabel;
    playerInfoDBGrid: TDBGrid;
    teamInfoADOQuery: TADOQuery;
    teamInfoDataSource: TDataSource;
    arenaInfoADOQuery: TADOQuery;
    arenaInfoDataSource: TDataSource;
    coachInfoADOQuery: TADOQuery;
    coachInfoDataSource: TDataSource;
    playerInfoADOQuery: TADOQuery;
    playerInfoDataSource: TDataSource;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  teamInfoForm: TteamInfoForm;
  teamName:String;
  arenaName:String;

implementation

{$R *.dfm}

{显示球队信息}
procedure TteamInfoForm.FormShow(Sender: TObject);
var
  sqlStr:String;
begin
   {查询球队基本信息}
   with teamInfoADOQuery do
   begin
      Close;
      SQL.Clear;
      sqlStr:='select name as 球队名,division as 所属赛区,arena as 球馆 from team where name=:teamName';
      SQL.Add(sqlStr);
      Prepared:=True;
      Parameters.ParamByName('teamName').Value:=teamName;
      Open;
      arenaName:=FieldByName('球馆').AsString;
   end;
   teamInfoDBGrid.Columns[0].Width:=120;
   teamInfoDBGrid.Columns.Items[0].Title.Alignment:=taCenter;
   teamInfoDBGrid.Columns.Items[0].Alignment:=taCenter;
   teamInfoDBGrid.Columns[1].Width:=120;
   teamInfoDBGrid.Columns.Items[1].Title.Alignment:=taCenter;
   teamInfoDBGrid.Columns.Items[1].Alignment:=taCenter;
   teamInfoDBGrid.Columns[2].Width:=120;
   teamInfoDBGrid.Columns.Items[2].Title.Alignment:=taCenter;
   teamInfoDBGrid.Columns.Items[2].Alignment:=taCenter;

   {查询球馆信息}
   with arenaInfoADOQuery do
   begin
      Close;
      SQL.Clear;
      sqlStr:='select name as 球馆名,location as 球馆位置 from arena where name=:arenaName';
      SQL.Add(sqlStr);
      Prepared:=True;
      Parameters.ParamByName('arenaName').Value:=arenaName;
      Open;
   end;
   arenaInfoDBGrid.Columns[0].Width:=120;
   arenaInfoDBGrid.Columns.Items[0].Title.Alignment:=taCenter;
   arenaInfoDBGrid.Columns.Items[0].Alignment:=taCenter;
   arenaInfoDBGrid.Columns[1].Width:=140;
   arenaInfoDBGrid.Columns.Items[1].Title.Alignment:=taCenter;
   arenaInfoDBGrid.Columns.Items[1].Alignment:=taCenter;

   {查询教练信息}
   with coachInfoADOQuery do
   begin
      Close;
      SQL.Clear;
      sqlStr:='select name as 教练名 from coach where team=:teamName';
      SQL.Add(sqlStr);
      Prepared:=True;
      Parameters.ParamByName('teamName').Value:=teamName;
      Open;
   end;
   coachInfoDBGrid.Columns[0].Width:=140;
   coachInfoDBGrid.Columns.Items[0].Title.Alignment:=taCenter;
   coachInfoDBGrid.Columns.Items[0].Alignment:=taCenter;


   {查询球员信息}
   with playerInfoADOQuery do
   begin
      Close;
      SQL.Clear;
      sqlStr:='select name as 球员名,position as 球队角色,ability as 能力值 '+
              'from player where team=:team';
      SQL.Add(sqlStr);
      Prepared:=True;
      Parameters.ParamByName('team').Value:=teamName;
      Open;
   end;
   playerInfoDBGrid.Columns[0].Width:=120;
   playerInfoDBGrid.Columns.Items[0].Title.Alignment:=taCenter;
   playerInfoDBGrid.Columns.Items[0].Alignment:=taCenter;
   playerInfoDBGrid.Columns[1].Width:=120;
   playerInfoDBGrid.Columns.Items[1].Title.Alignment:=taCenter;
   playerInfoDBGrid.Columns.Items[1].Alignment:=taCenter;
   playerInfoDBGrid.Columns[2].Width:=120;
   playerInfoDBGrid.Columns.Items[2].Title.Alignment:=taCenter;
   playerInfoDBGrid.Columns.Items[2].Alignment:=taCenter;

end;

end.
