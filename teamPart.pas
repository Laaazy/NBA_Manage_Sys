unit teamPart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,dbConnection,arenaPart,teamInfo;

type
  TteamPartForm = class(TForm)
    seeTeamButton: TButton;
    repairArenaButton: TButton;
    hirePlayerComboBox: TComboBox;
    firePlayerComboBox: TComboBox;
    hireCoachComboBox: TComboBox;
    fireCoachComboBox: TComboBox;
    selectTeamComboBox: TComboBox;
    finishAboveButton: TButton;
    procedure selectTeamComboBoxChange(Sender: TObject);
    procedure finishAboveButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure hirePlayerComboBoxChange(Sender: TObject);
    procedure hireCoachComboBoxChange(Sender: TObject);
    procedure firePlayerComboBoxChange(Sender: TObject);
    procedure fireCoachComboBoxChange(Sender: TObject);
    procedure repairArenaButtonClick(Sender: TObject);
    procedure seeTeamButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  teamPartForm: TteamPartForm;
  teamName:String;//要操作的球队名字
  finishCode:integer;//是否确认球队操作
implementation

{$R *.dfm}


{加载球队选项}{加载要雇佣的球员}{加载要雇佣的教练}
procedure TteamPartForm.finishAboveButtonClick(Sender: TObject);
var
  sqlStr:String;
  success:integer;
begin
  finishCode:=MessageBox(0,'确认完成以上操作吗？','完成球队操作',MB_OKCANCEL);
  if finishCode=IDOK then
  begin
     {执行以上四个操作}
     {雇佣球员}
      if CompareStr(hirePlayerComboBox.Text,'请选择要雇佣的球员')<>0 then
      begin
        success:=-1;
        with DataModule2.ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          sqlStr:='insert into player values(:name,''待分配'',''待评估'',:team,NULL)';
          SQL.Add(sqlStr);
          Prepared:=True;
          Parameters.ParamByName('name').Value:=hirePlayerComboBox.Text;
          Parameters.ParamByName('team').Value:=teamName;
          success:=ExecSQL;
          if success>0 then
             begin
               success:=-1;
               Close;
               SQL.Clear;
               sqlStr:='delete from market where class=''球员'' and name=:name';
               SQL.Add(sqlStr);
               Prepared:=True;
               Parameters.ParamByName('name').Value:=hirePlayerComboBox.Text;
               success:=ExecSQL;
               if success>0 then
                  ShowMessage('雇佣球员成功')
               else
                  ShowMessage('雇佣球员失败');
             end
          else
             ShowMessage('雇佣球员失败');
        end;
      end;

      {解雇球员}
      if CompareStr(firePlayerComboBox.Text,'请选择要解雇的球员')<>0 then
      begin
        success:=-1;
        with DataModule2.ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          sqlStr:='insert into market values(''球员'',:name,''待协商'')';
          SQL.Add(sqlStr);
          Prepared:=True;
          Parameters.ParamByName('name').Value:=firePlayerComboBox.Text;
          success:=ExecSQL;
          if success>0 then
             begin
               success:=-1;
               Close;
               SQL.Clear;
               sqlStr:='delete from player where name=:name';
               SQL.Add(sqlStr);
               Prepared:=True;
               Parameters.ParamByName('name').Value:=firePlayerComboBox.Text;
               success:=ExecSQL;
               if success>0 then
                  ShowMessage('解雇球员成功')
               else
                  ShowMessage('解雇球员失败');
             end
          else
             ShowMessage('解雇球员失败');
        end;
      end;


      {雇佣教练}
      if CompareStr(hireCoachComboBox.Text,'请选择要雇佣的教练')<>0 then
      begin
        success:=-1;
        with DataModule2.ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          sqlStr:='insert into coach values(:name,:team,NULL)';
          SQL.Add(sqlStr);
          Prepared:=True;
          Parameters.ParamByName('name').Value:=hireCoachComboBox.Text;
          Parameters.ParamByName('team').Value:=teamName;
          success:=ExecSQL;
          if success>0 then
             begin
               success:=-1;
               Close;
               SQL.Clear;
               sqlStr:='delete from market where class=''教练'' and name=:name';
               SQL.Add(sqlStr);
               Prepared:=True;
               Parameters.ParamByName('name').Value:=hireCoachComboBox.Text;
               success:=ExecSQL;
               if success>0 then
                  ShowMessage('雇佣教练成功')
               else
                  ShowMessage('雇佣教练失败');
             end
          else
             ShowMessage('雇佣教练失败');
        end;
      end;

      {解雇教练}
      if CompareStr(fireCoachComboBox.Text,'请选择要解雇的教练')<>0 then
      begin
        success:=-1;
        with DataModule2.ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          sqlStr:='insert into market values(''教练'',:name,''待协商'')';
          SQL.Add(sqlStr);
          Prepared:=True;
          Parameters.ParamByName('name').Value:=fireCoachComboBox.Text;
          success:=ExecSQL;
          if success>0 then
             begin
               success:=-1;
               Close;
               SQL.Clear;
               sqlStr:='delete from coach where name=:name';
               SQL.Add(sqlStr);
               Prepared:=True;
               Parameters.ParamByName('name').Value:=fireCoachComboBox.Text;
               success:=ExecSQL;
               if success>0 then
                  ShowMessage('解雇教练成功')
               else
                  ShowMessage('解雇教练失败');
             end
          else
             ShowMessage('解雇教练失败');
        end;
      end;

     teamPartForm.Hide;
     teamPartForm.Show;
  end;
end;



{重新显示界面时重新加载各下拉列表}
procedure TteamPartForm.FormShow(Sender: TObject);
var
  sqlStr:String;
begin
    hirePlayerComboBox.Enabled:=False;
    hireCoachComboBox.Enabled:=False;
    firePlayerComboBox.Enabled:=False;
    fireCoachComboBox.Enabled:=False;
    finishAboveButton.Enabled:=False;
    seeTeamButton.Enabled:=False;
    repairArenaButton.Enabled:=False;

    selectTeamComboBox.Clear;
    hirePlayerComboBox.Clear;
    hireCoachComboBox.Clear;
    selectTeamComboBox.Text:='请选择要管理的球队';
    hirePlayerComboBox.Text:='请选择要雇佣的球员';
    hireCoachComboBox.Text:='请选择要雇佣的教练';
    firePlayerComboBox.Text:='请选择要解雇的球员';
    fireCoachComboBox.Text:='请选择要解雇的教练';

   with DataModule2.ADOQuery1 do
   begin
      {加载球队选项}
      Close;
      SQL.Clear;
      sqlStr:='select name from team';
      SQL.Add(sqlStr);
      Open;
      First;
      while not Eof do
      begin
        selectTeamComboBox.Items.Append(FieldByName('name').AsString);
        Next;
      end;
     {加载要雇佣的球员}
     Close;
     SQL.Clear;
     sqlStr:='select name from market where class=''球员''';
     SQL.Add(sqlStr);
     Open;
     First;
      while not Eof do
      begin
        hirePlayerComboBox.Items.Append(FieldByName('name').AsString);
        Next;
      end;
     {加载要雇佣的教练}
     Close;
     SQL.Clear;
     sqlStr:='select name from market where class=''教练''';
     SQL.Add(sqlStr);
     Open;
     First;
      while not Eof do
      begin
        hireCoachComboBox.Items.Append(FieldByName('name').AsString);
        Next;
      end;
   end;
end;

{雇佣教练下拉菜单被选择}
procedure TteamPartForm.hireCoachComboBoxChange(Sender: TObject);
begin
  if hireCoachComboBox.ItemIndex=-1 then
     hireCoachComboBox.Text:='请选择要雇佣的教练';
end;

{雇佣球员下拉菜单被选择}
procedure TteamPartForm.hirePlayerComboBoxChange(Sender: TObject);
begin
  {没有任何一项被选中}
  if hirePlayerComboBox.ItemIndex=-1 then
     hirePlayerComboBox.Text:='请选择要雇佣的球员';
//  else
//    ShowMessage(hirePlayerComboBox.text);
end;

{维护球馆}
procedure TteamPartForm.repairArenaButtonClick(Sender: TObject);
begin
   arenaPartForm.Show;
end;

{解雇教练下拉菜单被选中}
procedure TteamPartForm.fireCoachComboBoxChange(Sender: TObject);
begin
   if fireCoachComboBox.ItemIndex=-1 then
      fireCoachComboBox.Text:='请选择要解雇的教练';
end;

{解雇球员下拉菜单被选中}
procedure TteamPartForm.firePlayerComboBoxChange(Sender: TObject);
begin
    if firePlayerComboBox.ItemIndex=-1 then
       firePlayerComboBox.Text:='请选择要解雇的球员';
end;


{球队下拉项被选择}{加载要解雇的球员}{加载要解雇的教练}
procedure TteamPartForm.seeTeamButtonClick(Sender: TObject);
begin
  teamInfoForm.Show;
end;

procedure TteamPartForm.selectTeamComboBoxChange(Sender: TObject);
var
  sqlStr:String;
  flag:Boolean;
begin
   flag:=False;
   //ShowMessage(selectTeamComboBox.Text);
   with DataModule2.ADOQuery1 do
   begin
      Close;
      SQL.Clear;
      sqlStr:='select name from team';
      SQL.Add(sqlStr);
      Open;
      First;
      while not Eof do
      begin
        if selectTeamComboBox.Text=FieldByName('name').AsString then
        begin
          flag:=True;{下拉列表被选择的内容正确}
          teamName:=selectTeamComboBox.Text;
          {激活其他选项控件}
          hirePlayerComboBox.Enabled:=True;
          firePlayerComboBox.Enabled:=True;
          hireCoachComboBox.Enabled:=True;
          fireCoachComboBox.Enabled:=True;
          seeTeamButton.Enabled:=True;
          repairArenaButton.Enabled:=True;
          finishAboveButton.Enabled:=True;

          {将要管理的球队传递给球馆维护部分}
          arenaPart.teamName:=teamName;
          {将要管理的球队传递给球队信息部分}
          teamInfo.teamName:=teamName;

          {重置雇佣球员及教练下拉框}
          hirePlayerComboBox.Text:='请选择要雇佣的球员';
          hireCoachComboBox.Text:='请选择要雇佣的教练';

          {加载要解雇的球员}
          Close;
          SQL.Clear;
          sqlStr:='select name from player where team=:teamName';
          SQL.Add(sqlStr);
          Prepared:=True;
          Parameters.ParamByName('teamName').Value:=teamName;
          Open;
          firePlayerComboBox.Clear;
          firePlayerComboBox.Text:='请选择要解雇的球员';
          First;
          while not Eof do
          begin
            firePlayerComboBox.Items.Append(FieldByName('name').AsString);
            Next;
          end;

          {加载要解雇的教练}
          Close;
          SQL.Clear;
          sqlStr:='select name from coach where team=:teamName';
          SQL.Add(sqlStr);
          Prepared:=True;
          Parameters.ParamByName('teamName').Value:=teamName;
          Open;
          First;
          fireCoachComboBox.Clear;
          fireCoachComboBox.Text:='请选择要解雇的教练';
          while not Eof do
          begin
            fireCoachComboBox.Items.Append(FieldByName('name').AsString);
            Next;
          end;
          Break;
        end;
        Next;
      end;
      if flag=False then
      begin
          hirePlayerComboBox.Enabled:=False;
          firePlayerComboBox.Enabled:=False;
          hireCoachComboBox.Enabled:=False;
          fireCoachComboBox.Enabled:=False;
          finishAboveButton.Enabled:=False;
          seeTeamButton.Enabled:=False;
          repairArenaButton.Enabled:=False;

          selectTeamComboBox.Text:='请选择要管理的球队';
          hirePlayerComboBox.Text:='请选择要雇佣的球员';
          hireCoachComboBox.Text:='请选择要雇佣的教练';
          firePlayerComboBox.Text:='请选择要解雇的球员';
          fireCoachComboBox.Text:='请选择要解雇的教练';
      end;


   end;
end;

end.
