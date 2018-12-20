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

{新教练加入联盟}
procedure TnewCoachForm.addCoachButtonClick(Sender: TObject);
var
  newCoachName:String;
  newCoachSalary:String;
  sqlStr:String;
  success:integer;
begin
  success:=0;
   newCoachName:=coachNameEdit.Text;{新教练名}
   newCoachSalary:=coachSalaryEdit.Text; {新教联薪水}
   if (newCoachName='') or (newCoachSalary ='') then
      ShowMessage('教练进入联盟失败，请检查各指标是否正确')
   else
   begin
    with DataModule2.ADOQuery1 do
    begin
    Close;
    SQL.Clear;
    sqlStr:='select * from market where class=''教练'' and name=:newName';
    SQL.Add(sqlStr);
    Prepared:=true;
    Parameters.ParamByName('newName').Value:=newCoachName;
    Open;
    First;
    if FieldByName('name').AsString=newCoachName then
       ShowMessage('教练已经存在！')
    else
    begin
    Close;
    SQL.Clear;
    sqlStr:='insert into market values(''教练'',:name,:salary)';
    SQL.Add(sqlStr);
    Prepared:=true;
    Parameters.ParamByName('name').Value:=newCoachName;
    Parameters.ParamByName('salary').Value:=newCoachSalary;
    //active:=true;
    success:=ExecSQL;
    if success>0 then
      showMessage('教练加入联盟成功')
    else
      ShowMessage('教练进入联盟失败，请检查各指标是否正确');
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
  CoachName:=coachNameEdit.Text;{退出联盟的球员名}
  if CoachName='' then
    showMessage('请输入要退出联盟的教练名！')
  else
  begin
    with DataModule2.ADOQuery1 do
    begin
    Close;
    SQL.Clear;
    sqlStr:='select * from market where class=''教练'' and name=:Name';
    SQL.Add(sqlStr);
    Prepared:=true;
    Parameters.ParamByName('Name').Value:=CoachName;
    Open;
    if IsEmpty then
       ShowMessage('教练不存在！')
    else
    begin
      Close;
      SQL.Clear;
      sqlStr:='delete from market where class=''教练'' and name=:PlayerName';
      SQL.Add(sqlStr);
      Prepared:=True;
      Parameters.ParamByName('PlayerName').Value:=CoachName;
      success:=ExecSQL;
      if success>0 then
        showMessage('教练退出联盟成功')
      else
        ShowMessage('教练退出联盟失败，请检查各指标是否正确');
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
