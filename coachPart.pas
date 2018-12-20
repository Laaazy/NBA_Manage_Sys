unit coachPart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,StdCtrls,newCoach,seeCoach, jpeg, ExtCtrls;

type
  TcoachPartForm = class(TForm)
    newCoachrButton: TButton;
    seeCoachButton: TButton;
    Image1: TImage;
    procedure newCoachrButtonClick(Sender: TObject);
    procedure seeCoachButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  coachPartForm: TcoachPartForm;
  authority:String;

implementation

{$R *.dfm}

procedure TcoachPartForm.newCoachrButtonClick(Sender: TObject);
begin
  {�ж��û�Ȩ��}
  if authority='1' then
    begin
      showMessage('�Բ������޴�Ȩ��');
    end
  else
  newCoachForm.Show;
end;

procedure TcoachPartForm.seeCoachButtonClick(Sender: TObject);
begin
  coachForm.Show;
end;

end.
