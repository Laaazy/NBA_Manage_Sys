unit teamPart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TteamPartForm = class(TForm)
    hirePlayerButton: TButton;
    firePlayerButton: TButton;
    fireCoachButton: TButton;
    hireCoachButton: TButton;
    seeTeamButton: TButton;
    repairArenaButton: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  teamPartForm: TteamPartForm;

implementation

{$R *.dfm}

end.
