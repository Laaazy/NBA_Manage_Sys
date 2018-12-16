unit coachPart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,StdCtrls,newCoach,seeCoach;

type
  TcoachPartForm = class(TForm)
    newCoachrButton: TButton;
    seeCoachButton: TButton;
    procedure newCoachrButtonClick(Sender: TObject);
    procedure seeCoachButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  coachPartForm: TcoachPartForm;

implementation

{$R *.dfm}

procedure TcoachPartForm.newCoachrButtonClick(Sender: TObject);
begin
  newCoachForm.Show;
end;

procedure TcoachPartForm.seeCoachButtonClick(Sender: TObject);
begin
  coachForm.Show;
end;

end.
