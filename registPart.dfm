object registForm: TregistForm
  Left = 0
  Top = 0
  Caption = #27880#20876
  ClientHeight = 242
  ClientWidth = 448
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
    Left = 101
    Top = 92
    Width = 53
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #29992#25143#21517
  end
  object Label2: TLabel
    Left = 101
    Top = 123
    Width = 53
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #23494#30721
  end
  object Label3: TLabel
    Left = 101
    Top = 60
    Width = 53
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #36992#35831#30721
  end
  object Label4: TLabel
    Left = 96
    Top = 153
    Width = 58
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #30830#35748#23494#30721
  end
  object usernameEdit: TEdit
    Left = 160
    Top = 88
    Width = 121
    Height = 25
    Cursor = crIBeam
    TabOrder = 0
  end
  object passwordEdit: TEdit
    Left = 160
    Top = 119
    Width = 121
    Height = 25
    Cursor = crIBeam
    TabOrder = 1
  end
  object registButton: TButton
    Left = 184
    Top = 181
    Width = 75
    Height = 25
    Caption = #30830#35748#27880#20876
    TabOrder = 2
    OnClick = registButtonClick
  end
  object inviteCodeEdit: TEdit
    Left = 160
    Top = 57
    Width = 121
    Height = 25
    Cursor = crIBeam
    TabOrder = 3
  end
  object surePassWordEdit: TEdit
    Left = 160
    Top = 150
    Width = 121
    Height = 25
    Cursor = crIBeam
    TabOrder = 4
  end
end
