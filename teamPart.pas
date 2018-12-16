unit teamPart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,dbConnection;

type
  TteamPartForm = class(TForm)
    seeTeamButton: TButton;
    repairArenaButton: TButton;
    hirePlayerComboBox: TComboBox;
    firePlayerComboBox: TComboBox;
    hireCoachComboBox: TComboBox;
    fireCoachComboBox: TComboBox;
    selectTeamComboBox: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure selectTeamComboBoxChange(Sender: TObject);
//    procedure addHirePlayer();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  teamPartForm: TteamPartForm;
  teamName:String;//Ҫ�������������
implementation

{$R *.dfm}

// {����Ҫ��Ӷ����Ա}
//procedure addHirePlayer();
//var
//sqlStr:String;
//begin
//   with DataModule2.ADOQuery1 do
//   begin
//     Close;
//     SQL.Clear;
//     sqlStr:='select name from market where class=''��Ա''';
//     SQL.Add(sqlStr);
//     Open;
//     First;
//      while not Eof do
//      begin
//        hirePlayerComboBox.Items.Append(FieldByName('name').AsString);
//        Next;
//      end;
//   end;
//end;

{�������ѡ��}{����Ҫ��Ӷ����Ա}{����Ҫ��Ӷ�Ľ���}
procedure TteamPartForm.FormCreate(Sender: TObject);
var
  sqlStr:String;
begin
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

{�����ѡ��}{����Ҫ��͵���Ա}{����Ҫ��͵Ľ���}
procedure TteamPartForm.selectTeamComboBoxChange(Sender: TObject);
var
  sqlStr:String;
  flag:Boolean;
begin
   //ShowMessage(selectTeamComboBox.Text);
   flag:=False;
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

          {����Ҫ��͵���Ա}
          Close;
          SQL.Clear;
          sqlStr:='select name from player where team=:teamName';
          SQL.Add(sqlStr);
          Prepared:=True;
          Parameters.ParamByName('teamName').Value:=teamName;
          Open;
          firePlayerComboBox.Clear;
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
          seeTeamButton.Enabled:=False;
          repairArenaButton.Enabled:=False;
      end;


   end;
end;

end.
