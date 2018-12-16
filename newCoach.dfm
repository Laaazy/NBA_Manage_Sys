object newCoachForm: TnewCoachForm
  Left = 0
  Top = 0
  Caption = #26032#25945#32451#21152#20837#32852#30431
  ClientHeight = 182
  ClientWidth = 381
  Color = clCream
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #24494#36719#38597#40657' Light'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Label1: TLabel
    Left = 124
    Top = 49
    Width = 36
    Height = 17
    Alignment = taCenter
    Caption = #25945#32451#21517
  end
  object Label2: TLabel
    Left = 200
    Top = 49
    Width = 72
    Height = 17
    Alignment = taCenter
    Caption = #25945#32451#34218#37228#25253#20215
  end
  object addCoachButton: TButton
    Left = 96
    Top = 104
    Width = 89
    Height = 25
    Caption = #30830#35748#28155#21152#25945#32451
    TabOrder = 0
    OnClick = addCoachButtonClick
  end
  object deleteCoachButton: TButton
    Left = 191
    Top = 104
    Width = 89
    Height = 25
    Caption = #25945#32451#36864#20986#32852#30431
    TabOrder = 1
    OnClick = deleteCoachButtonClick
  end
  object coachNameEdit: TEdit
    Left = 96
    Top = 73
    Width = 89
    Height = 25
    TabOrder = 2
  end
  object coachSalaryEdit: TEdit
    Left = 191
    Top = 73
    Width = 89
    Height = 25
    TabOrder = 3
  end
end
