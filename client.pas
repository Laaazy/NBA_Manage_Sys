unit client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dbConnection, StdCtrls, main,registPart;

type
  TForm1 = class(TForm)
    managerNameEdit: TEdit;
    managerPassWordEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    loginButton: TButton;
    registerButton: TButton;
    procedure loginButtonClick(Sender: TObject);
    procedure registerButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  sqlStr:String;
  flag:boolean;
  ciphertext:String;{���ܺ�����룬�����ݿ�ƥ��}
  Authority:String;{�û�Ȩ��}

implementation
{$R *.dfm}

 {��¼ģ�飬������ܴ洢}
procedure TForm1.loginButtonClick(Sender: TObject);
var
  I:integer;
begin
  flag:=False;
  with DataModule2.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    sqlStr:='select * from manager';
    SQL.Add(sqlStr);
    Open;
    First;
    while not Eof do
    begin
       ciphertext:=managerPassWordEdit.Text;
       I:=1;
       while(i<=Length(ciphertext)) do
       begin
          ciphertext[I]:=Char(Ord(ciphertext[I])+32);
          Inc(i);
       end;
       if  (managerNameEdit.Text=FieldByName('name').AsString) and
           (ciphertext=FieldByName('passWord').AsString) then
           begin
              flag:=True;
              Authority:=FieldByName('Authority').AsString;
              main.Authority:=Authority;
              //ShowMessage('��½�ɹ���');
              Form1.hide;
              mainForm.show;
              Break;
           end
       else
            Next;
    end;
    if flag=False then
        ShowMessage('�û������������');
  end;
end;

{ע��}
procedure TForm1.registerButtonClick(Sender: TObject);
begin
    registForm.Show;
end;

end.
