unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,playerPart,coachPart,teamPart, Buttons, pngimage, ExtCtrls;

type
  TmainForm = class(TForm)
    logoutButton: TBitBtn;
    Image1: TImage;
    coachPartButton2: TBitBtn;
    playerPartButton2: TBitBtn;
    teamPartButton2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    //procedure playerPartButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    //procedure coachPartButtonClick(Sender: TObject);
    //procedure teamPartButtonClick(Sender: TObject);
    procedure logoutButtonClick(Sender: TObject);
    procedure coachPartButton2Click(Sender: TObject);
    procedure playerPartButton2Click(Sender: TObject);
    procedure teamPartButton2Click(Sender: TObject);
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
procedure TmainForm.coachPartButton2Click(Sender: TObject);
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
  coachPart.authority:=Authority;
end;

{退出系统}
procedure TmainForm.logoutButtonClick(Sender: TObject);
begin
  mainForm.Hide;
end;

{进入球员模块}
procedure TmainForm.playerPartButton2Click(Sender: TObject);
begin
  playerPartForm.show;
end;

//procedure TmainForm.playerPartButtonClick(Sender: TObject);
//begin
//  //mainForm.Hide;
//  playerPartForm.show;
//end;

//{进入教练模块}
//procedure TmainForm.coachPartButtonClick(Sender: TObject);
//begin
//    coachPartForm.Show;
//end;

{球队模块}
procedure TmainForm.teamPartButton2Click(Sender: TObject);
begin
   teamPartForm.Show;
end;

//procedure TmainForm.teamPartButtonClick(Sender: TObject);
//begin
//   teamPartForm.Show;
//end;

end.
