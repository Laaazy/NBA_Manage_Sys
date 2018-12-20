unit newCoach;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,dbConnection, jpeg, ExtCtrls;

type
  TnewCoachForm = class(TForm)
    addCoachButton: TButton;
    deleteCoachButton: TButton;
    coachNameEdit: TEdit;
    coachSalaryEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    procedure addCoachButtonClick(Sender: TObject);
    procedure deleteCoachButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  newCoachForm: TnewCoachForm;

implementation

{$R *.dfm}

{�½�����������}
procedure TnewCoachForm.addCoachButtonClick(Sender: TObject);
var
  newCoachName:String;
  newCoachSalary:String;
  sqlStr:String;
  success:integer;
begin
  success:=0;
   newCoachName:=coachNameEdit.Text;{�½�����}
   newCoachSalary:=coachSalaryEdit.Text; {�½���нˮ}
   if (newCoachName='') or (newCoachSalary ='') then
      ShowMessage('������������ʧ�ܣ������ָ���Ƿ���ȷ')
   else
   begin
    with DataModule2.ADOQuery1 do
    begin
    Close;
    SQL.Clear;
    sqlStr:='select * from market where class=''����'' and name=:newName';
    SQL.Add(sqlStr);
    Prepared:=true;
    Parameters.ParamByName('newName').Value:=newCoachName;
    Open;
    First;
    if FieldByName('name').AsString=newCoachName then
       ShowMessage('�����Ѿ����ڣ�')
    else
    begin
    Close;
    SQL.Clear;
    sqlStr:='insert into market values(''����'',:name,:salary)';
    SQL.Add(sqlStr);
    Prepared:=true;
    Parameters.ParamByName('name').Value:=newCoachName;
    Parameters.ParamByName('salary').Value:=newCoachSalary;
    //active:=true;
    success:=ExecSQL;
    if success>0 then
      showMessage('�����������˳ɹ�')
    else
      ShowMessage('������������ʧ�ܣ������ָ���Ƿ���ȷ');
    end;
    end;
   end;
end;

procedure TnewCoachForm.deleteCoachButtonClick(Sender: TObject);
var
  CoachName:String;
  sqlStr:String;
  success:integer;
begin
  success:=0;
  CoachName:=coachNameEdit.Text;{�˳����˵���Ա��}
  if CoachName='' then
    showMessage('������Ҫ�˳����˵Ľ�������')
  else
  begin
    with DataModule2.ADOQuery1 do
    begin
    Close;
    SQL.Clear;
    sqlStr:='select * from market where class=''����'' and name=:Name';
    SQL.Add(sqlStr);
    Prepared:=true;
    Parameters.ParamByName('Name').Value:=CoachName;
    Open;
    if IsEmpty then
       ShowMessage('���������ڣ�')
    else
    begin
      Close;
      SQL.Clear;
      sqlStr:='delete from market where class=''����'' and name=:PlayerName';
      SQL.Add(sqlStr);
      Prepared:=True;
      Parameters.ParamByName('PlayerName').Value:=CoachName;
      success:=ExecSQL;
      if success>0 then
        showMessage('�����˳����˳ɹ�')
      else
        ShowMessage('�����˳�����ʧ�ܣ������ָ���Ƿ���ȷ');
    end;
    end;
  end;
end;

procedure TnewCoachForm.FormShow(Sender: TObject);
begin
  coachNameEdit.Text:='';
  coachSalaryEdit.Text:='';
end;

end.
