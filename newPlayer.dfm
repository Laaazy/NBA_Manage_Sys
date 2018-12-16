object newPlayerForm: TnewPlayerForm
  Left = 0
  Top = 0
  Caption = #26032#29699#21592#21152#20837#32852#30431
  ClientHeight = 180
  ClientWidth = 380
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
    Caption = #29699#21592#21517
  end
  object Label2: TLabel
    Left = 209
    Top = 49
    Width = 72
    Height = 17
    Alignment = taCenter
    Caption = #29699#21592#34218#37228#25253#20215
  end
  object playerNameEdit: TEdit
    Left = 100
    Top = 72
    Width = 89
    Height = 25
    TabOrder = 0
  end
  object playerSalaryEdit: TEdit
    Left = 195
    Top = 72
    Width = 94
    Height = 25
    TabOrder = 1
  end
  object addPlayerButton: TButton
    Left = 100
    Top = 103
    Width = 89
    Height = 25
    Caption = #30830#35748#28155#21152#29699#21592
    TabOrder = 2
    OnClick = addPlayerButtonClick
  end
  object deletePlayerButton: TButton
    Left = 195
    Top = 103
    Width = 94
    Height = 25
    Caption = #29699#21592#36864#20986#32852#30431
    TabOrder = 3
    OnClick = deletePlayerButtonClick
  end
end
