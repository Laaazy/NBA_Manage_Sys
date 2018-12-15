unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,playerPart;

type
  TmainForm = class(TForm)
    playerPartButton: TButton;
    coachPartButton: TButton;
    teamPartButton: TButton;
    procedure playerPartButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainForm: TmainForm;

implementation

{$R *.dfm}

procedure TmainForm.playerPartButtonClick(Sender: TObject);
begin
  mainForm.Hide;
  playerPartForm.show;
end;

end.
