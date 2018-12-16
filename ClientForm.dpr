program ClientForm;

uses
  Forms,
  client in 'client.pas' {Form1},
  dbConnection in 'dbConnection.pas' {DataModule2: TDataModule},
  main in 'main.pas' {mainForm},
  playerPart in 'playerPart.pas' {playerPartForm},
  newPlayer in 'newPlayer.pas' {newPlayerForm},
  seeplayer in 'seeplayer.pas' {playerForm},
  coachPart in 'coachPart.pas' {coachPartForm},
  newCoach in 'newCoach.pas' {newCoachForm},
  seeCoach in 'seeCoach.pas' {coachForm},
  teamPart in 'teamPart.pas' {teamPartForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TcoachPartForm, coachPartForm);
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TplayerPartForm, playerPartForm);
  Application.CreateForm(TnewPlayerForm, newPlayerForm);
  Application.CreateForm(TplayerForm, playerForm);
  Application.CreateForm(TnewCoachForm, newCoachForm);
  Application.CreateForm(TcoachForm, coachForm);
  Application.CreateForm(TteamPartForm, teamPartForm);
  Application.Run;
end.
