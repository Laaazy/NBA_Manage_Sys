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
  teamName:String;{������������}
  arenaName:String;{ԭ�����}
  location:String;{ԭ��ӵ�ַ��}
  newArenaName:String;{�������}
  newLocation:String;{����ݵ�ַ}
  finishCode:Integer;{ȷ�Ͽ�ķ��ؽ��}

implementation

{$R *.dfm}

{����ԭ���������ݵ�ַ}
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
      newArenaNameEdit.Text:='�µ������';

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
      newArenaLocationEdit.Text:='�µ���ݵ�ַ'

   end;

end;

{ȷ���޸İ�ť�����}
procedure TarenaPartForm.repaireArenaButtonClick(Sender: TObject);
var
  sqlStr:String;
  success:Integer;
begin
  finishCode:=MessageBox(0,'ȷ���������ά����','������ά��',MB_OKCANCEL);
  if finishCode=IDOK then
    begin
      newArenaName:=newArenaNameEdit.Text;
      newLocation:=newArenaLocationEdit.text;
      if CompareStr(newArenaNameEdit.Text,'�µ������')<>0 then
         begin
           success:=-1;
           with DataModule2.ADOQuery1 do
           begin
              Close;
              SQL.Clear;
              {������ü�������}
              sqlStr:='update arena set name=:newName where name=:oldName';
              SQL.Add(sqlStr);
              Prepared:=True;
              Parameters.ParamByName('newName').Value:=newArenaName;
              Parameters.ParamByName('oldName').Value:=arenaName;
              success:=ExecSQL;
              if success>0 then
                ShowMessage('��ݸ����ɹ�')
              else
                ShowMessage('��ݸ���ʧ��');
           end;
         end;

       if CompareStr(newArenaLocationEdit.Text,'�µ���ݵ�ַ')<>0 then
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
                ShowMessage('��ݰ�Ǩ�ɹ�')
              else
                ShowMessage('��ݰ�Ǩʧ��');
           end;
         end;
    end;

end;

end.
