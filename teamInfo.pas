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

{��ʾ�����Ϣ}
procedure TteamInfoForm.FormShow(Sender: TObject);
var
  sqlStr:String;
begin
   {��ѯ��ӻ�����Ϣ}
   with teamInfoADOQuery do
   begin
      Close;
      SQL.Clear;
      sqlStr:='select name as �����,division as ��������,arena as ��� from team where name=:teamName';
      SQL.Add(sqlStr);
      Prepared:=True;
      Parameters.ParamByName('teamName').Value:=teamName;
      Open;
      arenaName:=FieldByName('���').AsString;
   end;

   {��ѯ�����Ϣ}
   with arenaInfoADOQuery do
   begin
      Close;
      SQL.Clear;
      sqlStr:='select name as �����,location as ���λ�� from arena where name=:arenaName';
      SQL.Add(sqlStr);
      Prepared:=True;
      Parameters.ParamByName('arenaName').Value:=arenaName;
      Open;
   end;

   {��ѯ������Ϣ}
   with coachInfoADOQuery do
   begin
      Close;
      SQL.Clear;
      sqlStr:='select name as ������ from coach where team=:teamName';
      SQL.Add(sqlStr);
      Prepared:=True;
      Parameters.ParamByName('teamName').Value:=teamName;
      Open;
   end;

   {��ѯ��Ա��Ϣ}
   with playerInfoADOQuery do
   begin
      Close;
      SQL.Clear;
      sqlStr:='select name as ��Ա��,position as ��ӽ�ɫ,ability as ����ֵ '+
              'from player where team=:team';
      SQL.Add(sqlStr);
      Prepared:=True;
      Parameters.ParamByName('team').Value:=teamName;
      Open;
   end;
end;

end.
