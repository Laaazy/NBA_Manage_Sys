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
  teamName:String;//要操作的球队名字
implementation

{$R *.dfm}

// {加载要雇佣的球员}
//procedure addHirePlayer();
//var
//sqlStr:String;
//begin
//   with DataModule2.ADOQuery1 do
//   begin
//     Close;
//     SQL.Clear;
//     sqlStr:='select name from market where class=''球员''';
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

{加载球队选项}{加载要雇佣的球员}{加载要雇佣的教练}
procedure TteamPartForm.FormCreate(Sender: TObject);
var
  sqlStr:String;
begin
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

{下拉项被选择}{加载要解雇的球员}{加载要解雇的教练}
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
          flag:=True;{下拉列表被选择的内容正确}
          teamName:=selectTeamComboBox.Text;
          {激活其他选项控件}
          hirePlayerComboBox.Enabled:=True;
          firePlayerComboBox.Enabled:=True;
          hireCoachComboBox.Enabled:=True;
          fireCoachComboBox.Enabled:=True;
          seeTeamButton.Enabled:=True;
          repairArenaButton.Enabled:=True;

          {加载要解雇的球员}
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
