unit playerPart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,newPlayer,seePlayer, jpeg, ExtCtrls;

type
  TplayerPartForm = class(TForm)
    newPlayerButton: TButton;
    seePlayerButton: TButton;
    Image1: TImage;
    procedure newPlayerButtonClick(Sender: TObject);
    procedure seePlayerButtonClick(Sender: TObject);
//    procedure backToHomeButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  playerPartForm: TplayerPartForm;
  Authority:String;{�û�Ȩ��}

implementation

uses client;

{$R *.dfm}

//procedure TplayerPartForm.backToHomeButtonClick(Sender: TObject);
//var
//  W,parent:TWinControl;
//  pos:TPoint;
//  currentWindow:HWND;
//  windowRect:TRect;
//begin
//  currentWindow:=GetActiveWindow;
//  GetWindowRect(currentWindow,windowRect);
//  GetClientRect();
//  pos.X:=windowRect.Left;
//  pos.Y:=windowRect.Top;
//  //pos.Y:=pos.Y-30;
//  //currentWindow:=GetActiveWindow;
//  w:=FindVCLWindow(pos);
//  //w:=w.Parent;
//  parent:=w.Parent;
//  w.hide;
//  parent.Show;
//end;


procedure TplayerPartForm.newPlayerButtonClick(Sender: TObject);
begin
  {�ж��û�Ȩ��}
  if Authority='1' then
    begin
      showMessage('�Բ������޴�Ȩ��');
    end
  else
    newPlayerForm.show;
end;

procedure TplayerPartForm.seePlayerButtonClick(Sender: TObject);
begin
  playerForm.show;
end;

end.
