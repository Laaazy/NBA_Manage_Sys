unit registPart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,dbConnection, pngimage, ExtCtrls;

type
  TregistForm = class(TForm)
    usernameEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    passwordEdit: TEdit;
    registButton: TButton;
    inviteCodeEdit: TEdit;
    Label3: TLabel;
    surePassWordEdit: TEdit;
    Label4: TLabel;
    Image1: TImage;
    procedure registButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  registForm: TregistForm;

implementation

{$R *.dfm}

{ע��}


procedure TregistForm.FormShow(Sender: TObject);
begin
  inviteCodeEdit.Text:='';
  usernameEdit.Text:='';
  passwordEdit.Text:='';
  surePassWordEdit.Text:='';
end;

procedure TregistForm.registButtonClick(Sender: TObject);
var
  sqlStr:String;
  success:Integer;
  authority:String;
  i:integer;
  passWord:String;
begin
   success:=-1;
   with DataModule2.ADOQuery1 do
   begin
     Close;
     SQL.Clear;
     sqlStr:='select * from inviteCode where code=:code';
     SQL.Add(sqlStr);
     Prepared:=True;
     Parameters.ParamByName('code').Value:=inviteCodeEdit.Text;
     Open;
     First;
     if  CompareStr('',FieldByName('code').AsString)=0 then
         ShowMessage('�����벻��ȷ')
     else
     begin
         //ShowMessage('ƥ��');
         //ShowMessage(passwordEdit.Text+'      '+surePassWordEdit.Text);
         if not SameText(passwordEdit.Text,surePassWordEdit.Text) then
            ShowMessage('�������벻��ͬ����ȷ������')
         else
         begin
           Close;
           SQL.Clear;
           sqlStr:='select name from manager where name=:Name';
           SQL.Add(sqlStr);
           Prepared:=True;
           Parameters.ParamByName('Name').Value:=usernameEdit.Text;
           Open;
           First;
           //�û����ѱ�ʹ��
           //ShowMessage(FieldByName('name').AsString);
           if not SameStr('',FieldByName('name').AsString) then
               ShowMessage('�û����Ѵ��ڣ�')
           else
           begin
            //ShowMessage('������ͬ');
            if inviteCodeEdit.Text='Mgr' then
              authority:='2'
            else
              authority:='1';
            Close;
            SQL.Clear;
            sqlStr:='insert into manager values(:username,:password,:auth)';
            SQL.Add(sqlStr);
            Prepared:=True;
            Parameters.ParamByName('username').Value:=usernameEdit.Text;
            passWord:=passwordEdit.Text;
            //������ܴ洢
            //ShowMessage(IntToStr(Length(passWord)));
            i:=1;
            while(i<=Length(passWord)) do
            begin
              passWord[I]:=Char(Ord(passWord[I])+32);
              Inc(i);
            end;
            //ShowMessage(passWord);
            Parameters.ParamByName('password').Value:=passWord;
            Parameters.ParamByName('auth').Value:=authority;
            success:=ExecSQL;
            if success>0 then
              begin
                ShowMessage('ע��ɹ���');
                registForm.Hide
              end
            else
              ShowMessage('ע��ʧ��');
              registForm.Hide;
          end;
         end;//�������벻��ͬ
     end;//

   end;
end;

end.
