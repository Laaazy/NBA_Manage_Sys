unit newPlayer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, StdCtrls,dbconnection, jpeg, ExtCtrls;

type
  TnewPlayerForm = class(TForm)
    playerNameEdit: TEdit;
    playerSalaryEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    addPlayerButton: TButton;
    deletePlayerButton: TButton;
    Image1: TImage;
    procedure addPlayerButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure deletePlayerButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  newPlayerForm: TnewPlayerForm;

implementation

{$R *.dfm}

{新球员加入联盟}
procedure TnewPlayerForm.addPlayerButtonClick(Sender: TObject);
var
  newPlayerName:String;
  newPlayerSalary:String;
  sqlStr:String;
  success:integer;
begin
   success:=0;
   newPlayerName:=playerNameEdit.Text;{新球员名}
   newPlayerSalary:=playerSalaryEdit.Text; {新球员薪水}
   if (newPlayerName='') or (newPlayerSalary ='') then
      ShowMessage('球员进入联盟失败，请检查各指标是否正确')
   else
   begin
    with DataModule2.ADOQuery1 do
    begin
    Close;
    SQL.Clear;
    sqlStr:='select * from market where class=''球员'' and name=:newName';
    SQL.Add(sqlStr);
    Prepared:=true;
    Parameters.ParamByName('newName').Value:=newPlayerName;
    Open;
    First;
    if FieldByName('name').AsString=newPlayerName then
       ShowMessage('球员已经存在！')
    else
    begin
    Close;
    SQL.Clear;
    sqlStr:='insert into market values(''球员'',:name,:salary)';
    SQL.Add(sqlStr);
    Prepared:=true;
    Parameters.ParamByName('name').Value:=newPlayerName;
    Parameters.ParamByName('salary').Value:=newPlayerSalary;
    //active:=true;
    success:=ExecSQL;
    if success>0 then
      showMessage('球员加入联盟成功')
    else
      ShowMessage('球员进入联盟失败，请检查各指标是否正确');
    end;
    end;
   end;
end;


procedure TnewPlayerForm.deletePlayerButtonClick(Sender: TObject);
var
  PlayerName:String;
  sqlStr:String;
  success:integer;
begin
  success:=0;
  PlayerName:=playerNameEdit.Text;{退出联盟的球员名}
  if PlayerName='' then
    showMessage('请输入要退出联盟的球员名！')
  else
  begin
    with DataModule2.ADOQuery1 do
    begin
    Close;
    SQL.Clear;
    sqlStr:='select * from market where class=''球员'' and name=:Name';
    SQL.Add(sqlStr);
    Prepared:=true;
    Parameters.ParamByName('Name').Value:=PlayerName;
    Open;
    if IsEmpty then
       ShowMessage('球员不存在！')
    else
    begin
      Close;
      SQL.Clear;
      sqlStr:='delete from market where class=''球员'' and name=:PlayerName';
      SQL.Add(sqlStr);
      Prepared:=True;
      Parameters.ParamByName('PlayerName').Value:=PlayerName;
      success:=ExecSQL;
      if success>0 then
        showMessage('球员退出联盟成功')
      else
        ShowMessage('球员退出联盟失败，请检查各指标是否正确');
    end;
    end;
  end;
end;

procedure TnewPlayerForm.FormShow(Sender: TObject);
begin
   playerNameEdit.Text:='';
   playerSalaryEdit.Text:='';
end;

end.
