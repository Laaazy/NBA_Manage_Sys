unit playerPart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TplayerPartForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    backToHomeButton: TButton;
    procedure backToHomeButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  playerPartForm: TplayerPartForm;

implementation

{$R *.dfm}

procedure TplayerPartForm.backToHomeButtonClick(Sender: TObject);
begin
  //playerPartForm.Hide;
end;


end.
