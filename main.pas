unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,playerPart,coachPart;

type
  TmainForm = class(TForm)
    playerPartButton: TButton;
    coachPartButton: TButton;
    teamPartButton: TButton;
    procedure playerPartButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure coachPartButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainForm: TmainForm;
  Authority:String;{用户权限}

implementation

{$R *.dfm}
 {进入教练模块}
procedure TmainForm.coachPartButtonClick(Sender: TObject);
begin
    coachPartForm.Show;
end;

procedure TmainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Application.Terminate;
end;


procedure TmainForm.FormShow(Sender: TObject);
begin
  playerPart.Authority:=Authority;
end;

{进入球员模块}
procedure TmainForm.playerPartButtonClick(Sender: TObject);
begin
  //mainForm.Hide;
  playerPartForm.show;
end;

end.
