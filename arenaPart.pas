unit arenaPart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,dbConnection, jpeg, ExtCtrls;

type
  TarenaPartForm = class(TForm)
    arenaNameLabel: TLabel;
    newArenaNameEdit: TEdit;
    newArenaLocationEdit: TEdit;
    repaireArenaButton: TButton;
    oldArenaNameEdit: TEdit;
    oldArenaLocationEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure repaireArenaButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  arenaPartForm: TarenaPartForm;
  teamName:String;{球馆所属球队名}
  arenaName:String;{原球馆名}
  location:String;{原球队地址名}
  newArenaName:String;{新球馆名}
  newLocation:String;{新球馆地址}
  finishCode:Integer;{确认框的返回结果}

implementation

{$R *.dfm}

{加载原球馆名与球馆地址}
procedure TarenaPartForm.FormShow(Sender: TObject);
var
  sqlStr:String;
begin
   with DataModule2.ADOQuery1 do
   begin
      Close;
      SQL.Clear;
      sqlStr:='select arena from team where name=:name';
      SQL.Add(sqlStr);
      Prepared:=True;
      Parameters.ParamByName('name').Value:=teamName;
      Open;
      First;
      arenaName:=FieldByName('arena').AsString;
      oldArenaNameEdit.Text:=arenaName;
      newArenaNameEdit.Text:='新的球馆名';

      Close;
      SQL.Clear;
      sqlStr:='select location from arena where name=:name';
      SQL.Add(sqlStr);
      Prepared:=True;
      Parameters.ParamByName('name').Value:=arenaName;
      Open;
      First;
      location:=FieldByName('location').AsString;
      oldArenaLocationEdit.text:=location;
      newArenaLocationEdit.Text:='新的球馆地址'

   end;

end;

{确认修改按钮被点击}
procedure TarenaPartForm.repaireArenaButtonClick(Sender: TObject);
var
  sqlStr:String;
  success:Integer;
begin
  finishCode:=MessageBox(0,'确认完成以上维护吗？','完成球馆维护',MB_OKCANCEL);
  if finishCode=IDOK then
    begin
      newArenaName:=newArenaNameEdit.Text;
      newLocation:=newArenaLocationEdit.text;
      if CompareStr(newArenaNameEdit.Text,'新的球馆名')<>0 then
         begin
           success:=-1;
           with DataModule2.ADOQuery1 do
           begin
              Close;
              SQL.Clear;
              {外键设置级联更新}
              sqlStr:='update arena set name=:newName where name=:oldName';
              SQL.Add(sqlStr);
              Prepared:=True;
              Parameters.ParamByName('newName').Value:=newArenaName;
              Parameters.ParamByName('oldName').Value:=arenaName;
              success:=ExecSQL;
              if success>0 then
                ShowMessage('球馆更名成功')
              else
                ShowMessage('球馆更名失败');
           end;
         end;

       if CompareStr(newArenaLocationEdit.Text,'新的球馆地址')<>0 then
         begin
           success:=-1;
           with DataModule2.ADOQuery1 do
           begin
              Close;
              SQL.Clear;
              sqlStr:='update arena set location=:newLocation where location=:oldLocation';
              SQL.Add(sqlStr);
              Prepared:=True;
              Parameters.ParamByName('oldLocation').Value:=location;
              Parameters.ParamByName('newLocation').Value:=newLocation;
              success:=ExecSQL;
              if success>0 then
                ShowMessage('球馆搬迁成功')
              else
                ShowMessage('球馆搬迁失败');
           end;
         end;
    end;

end;

end.
