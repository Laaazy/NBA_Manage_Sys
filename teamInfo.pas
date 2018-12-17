unit teamInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids,dbConnection, DB, ADODB;

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
end;

end.
