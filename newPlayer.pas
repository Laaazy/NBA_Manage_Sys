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

{����Ա��������}
procedure TnewPlayerForm.addPlayerButtonClick(Sender: TObject);
var
  newPlayerName:String;
  newPlayerSalary:String;
  sqlStr:String;
  success:integer;
begin
   success:=0;
   newPlayerName:=playerNameEdit.Text;{����Ա��}
   newPlayerSalary:=playerSalaryEdit.Text; {����Աнˮ}
   if (newPlayerName='') or (newPlayerSalary ='') then
      ShowMessage('��Ա��������ʧ�ܣ������ָ���Ƿ���ȷ')
   else
   begin
    with DataModule2.ADOQuery1 do
    begin
    Close;
    SQL.Clear;
    sqlStr:='select * from market where class=''��Ա'' and name=:newName';
    SQL.Add(sqlStr);
    Prepared:=true;
    Parameters.ParamByName('newName').Value:=newPlayerName;
    Open;
    First;
    if FieldByName('name').AsString=newPlayerName then
       ShowMessage('��Ա�Ѿ����ڣ�')
    else
    begin
    Close;
    SQL.Clear;
    sqlStr:='insert into market values(''��Ա'',:name,:salary)';
    SQL.Add(sqlStr);
    Prepared:=true;
    Parameters.ParamByName('name').Value:=newPlayerName;
    Parameters.ParamByName('salary').Value:=newPlayerSalary;
    //active:=true;
    success:=ExecSQL;
    if success>0 then
      showMessage('��Ա�������˳ɹ�')
    else
      ShowMessage('��Ա��������ʧ�ܣ������ָ���Ƿ���ȷ');
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
  PlayerName:=playerNameEdit.Text;{�˳����˵���Ա��}
  if PlayerName='' then
    showMessage('������Ҫ�˳����˵���Ա����')
  else
  begin
    with DataModule2.ADOQuery1 do
    begin
    Close;
    SQL.Clear;
    sqlStr:='select * from market where class=''��Ա'' and name=:Name';
    SQL.Add(sqlStr);
    Prepared:=true;
    Parameters.ParamByName('Name').Value:=PlayerName;
    Open;
    if IsEmpty then
       ShowMessage('��Ա�����ڣ�')
    else
    begin
      Close;
      SQL.Clear;
      sqlStr:='delete from market where class=''��Ա'' and name=:PlayerName';
      SQL.Add(sqlStr);
      Prepared:=True;
      Parameters.ParamByName('PlayerName').Value:=PlayerName;
      success:=ExecSQL;
      if success>0 then
        showMessage('��Ա�˳����˳ɹ�')
      else
        ShowMessage('��Ա�˳�����ʧ�ܣ������ָ���Ƿ���ȷ');
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
