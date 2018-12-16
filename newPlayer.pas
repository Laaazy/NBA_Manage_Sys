unit newPlayer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, StdCtrls,dbconnection;

type
  TnewPlayerForm = class(TForm)
    playerNameEdit: TEdit;
    playerSalaryEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    addPlayerButton: TButton;
    procedure addPlayerButtonClick(Sender: TObject);
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
    sqlStr:='select * from market where name=:newName';
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

end.
