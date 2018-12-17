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
  teamName:String;//Ҫ�������������
  finishCode:integer;//�Ƿ�ȷ����Ӳ���
implementation

{$R *.dfm}


{�������ѡ��}{����Ҫ��Ӷ����Ա}{����Ҫ��Ӷ�Ľ���}
procedure TteamPartForm.finishAboveButtonClick(Sender: TObject);
var
  sqlStr:String;
  success:integer;
begin
  finishCode:=MessageBox(0,'ȷ��������ϲ�����','�����Ӳ���',MB_OKCANCEL);
  if finishCode=IDOK then
  begin
     {ִ�������ĸ�����}
     {��Ӷ��Ա}
      if CompareStr(hirePlayerComboBox.Text,'��ѡ��Ҫ��Ӷ����Ա')<>0 then
      begin
        success:=-1;
        with DataModule2.ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          sqlStr:='insert into player values(:name,''������'',''������'',:team,NULL)';
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
               sqlStr:='delete from market where class=''��Ա'' and name=:name';
               SQL.Add(sqlStr);
               Prepared:=True;
               Parameters.ParamByName('name').Value:=hirePlayerComboBox.Text;
               success:=ExecSQL;
               if success>0 then
                  ShowMessage('��Ӷ��Ա�ɹ�')
               else
                  ShowMessage('��Ӷ��Աʧ��');
             end
          else
             ShowMessage('��Ӷ��Աʧ��');
        end;
      end;

      {�����Ա}
      if CompareStr(firePlayerComboBox.Text,'��ѡ��Ҫ��͵���Ա')<>0 then
      begin
        success:=-1;
        with DataModule2.ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          sqlStr:='insert into market values(''��Ա'',:name,''��Э��'')';
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
                  ShowMessage('�����Ա�ɹ�')
               else
                  ShowMessage('�����Աʧ��');
             end
          else
             ShowMessage('�����Աʧ��');
        end;
      end;


      {��Ӷ����}
      if CompareStr(hireCoachComboBox.Text,'��ѡ��Ҫ��Ӷ�Ľ���')<>0 then
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
               sqlStr:='delete from market where class=''����'' and name=:name';
               SQL.Add(sqlStr);
               Prepared:=True;
               Parameters.ParamByName('name').Value:=hireCoachComboBox.Text;
               success:=ExecSQL;
               if success>0 then
                  ShowMessage('��Ӷ�����ɹ�')
               else
                  ShowMessage('��Ӷ����ʧ��');
             end
          else
             ShowMessage('��Ӷ����ʧ��');
        end;
      end;

      {��ͽ���}
      if CompareStr(fireCoachComboBox.Text,'��ѡ��Ҫ��͵Ľ���')<>0 then
      begin
        success:=-1;
        with DataModule2.ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          sqlStr:='insert into market values(''����'',:name,''��Э��'')';
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
                  ShowMessage('��ͽ����ɹ�')
               else
                  ShowMessage('��ͽ���ʧ��');
             end
          else
             ShowMessage('��ͽ���ʧ��');
        end;
      end;

     teamPartForm.Hide;
     teamPartForm.Show;
  end;
end;



{������ʾ����ʱ���¼��ظ������б�}
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
    selectTeamComboBox.Text:='��ѡ��Ҫ��������';
    hirePlayerComboBox.Text:='��ѡ��Ҫ��Ӷ����Ա';
    hireCoachComboBox.Text:='��ѡ��Ҫ��Ӷ�Ľ���';
    firePlayerComboBox.Text:='��ѡ��Ҫ��͵���Ա';
    fireCoachComboBox.Text:='��ѡ��Ҫ��͵Ľ���';

   with DataModule2.ADOQuery1 do
   begin
      {�������ѡ��}
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
     {����Ҫ��Ӷ����Ա}
     Close;
     SQL.Clear;
     sqlStr:='select name from market where class=''��Ա''';
     SQL.Add(sqlStr);
     Open;
     First;
      while not Eof do
      begin
        hirePlayerComboBox.Items.Append(FieldByName('name').AsString);
        Next;
      end;
     {����Ҫ��Ӷ�Ľ���}
     Close;
     SQL.Clear;
     sqlStr:='select name from market where class=''����''';
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

{��Ӷ���������˵���ѡ��}
procedure TteamPartForm.hireCoachComboBoxChange(Sender: TObject);
begin
  if hireCoachComboBox.ItemIndex=-1 then
     hireCoachComboBox.Text:='��ѡ��Ҫ��Ӷ�Ľ���';
end;

{��Ӷ��Ա�����˵���ѡ��}
procedure TteamPartForm.hirePlayerComboBoxChange(Sender: TObject);
begin
  {û���κ�һ�ѡ��}
  if hirePlayerComboBox.ItemIndex=-1 then
     hirePlayerComboBox.Text:='��ѡ��Ҫ��Ӷ����Ա';
//  else
//    ShowMessage(hirePlayerComboBox.text);
end;

{ά�����}
procedure TteamPartForm.repairArenaButtonClick(Sender: TObject);
begin
   arenaPartForm.Show;
end;

{��ͽ��������˵���ѡ��}
procedure TteamPartForm.fireCoachComboBoxChange(Sender: TObject);
begin
   if fireCoachComboBox.ItemIndex=-1 then
      fireCoachComboBox.Text:='��ѡ��Ҫ��͵Ľ���';
end;

{�����Ա�����˵���ѡ��}
procedure TteamPartForm.firePlayerComboBoxChange(Sender: TObject);
begin
    if firePlayerComboBox.ItemIndex=-1 then
       firePlayerComboBox.Text:='��ѡ��Ҫ��͵���Ա';
end;


{��������ѡ��}{����Ҫ��͵���Ա}{����Ҫ��͵Ľ���}
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
          flag:=True;{�����б�ѡ���������ȷ}
          teamName:=selectTeamComboBox.Text;
          {��������ѡ��ؼ�}
          hirePlayerComboBox.Enabled:=True;
          firePlayerComboBox.Enabled:=True;
          hireCoachComboBox.Enabled:=True;
          fireCoachComboBox.Enabled:=True;
          seeTeamButton.Enabled:=True;
          repairArenaButton.Enabled:=True;
          finishAboveButton.Enabled:=True;

          {��Ҫ�������Ӵ��ݸ����ά������}
          arenaPart.teamName:=teamName;
          {��Ҫ�������Ӵ��ݸ������Ϣ����}
          teamInfo.teamName:=teamName;

          {���ù�Ӷ��Ա������������}
          hirePlayerComboBox.Text:='��ѡ��Ҫ��Ӷ����Ա';
          hireCoachComboBox.Text:='��ѡ��Ҫ��Ӷ�Ľ���';

          {����Ҫ��͵���Ա}
          Close;
          SQL.Clear;
          sqlStr:='select name from player where team=:teamName';
          SQL.Add(sqlStr);
          Prepared:=True;
          Parameters.ParamByName('teamName').Value:=teamName;
          Open;
          firePlayerComboBox.Clear;
          firePlayerComboBox.Text:='��ѡ��Ҫ��͵���Ա';
          First;
          while not Eof do
          begin
            firePlayerComboBox.Items.Append(FieldByName('name').AsString);
            Next;
          end;

          {����Ҫ��͵Ľ���}
          Close;
          SQL.Clear;
          sqlStr:='select name from coach where team=:teamName';
          SQL.Add(sqlStr);
          Prepared:=True;
          Parameters.ParamByName('teamName').Value:=teamName;
          Open;
          First;
          fireCoachComboBox.Clear;
          fireCoachComboBox.Text:='��ѡ��Ҫ��͵Ľ���';
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

          selectTeamComboBox.Text:='��ѡ��Ҫ��������';
          hirePlayerComboBox.Text:='��ѡ��Ҫ��Ӷ����Ա';
          hireCoachComboBox.Text:='��ѡ��Ҫ��Ӷ�Ľ���';
          firePlayerComboBox.Text:='��ѡ��Ҫ��͵���Ա';
          fireCoachComboBox.Text:='��ѡ��Ҫ��͵Ľ���';
      end;


   end;
end;

end.
