object teamPartForm: TteamPartForm
  Left = 0
  Top = 0
  Caption = #29699#38431#31649#29702
  ClientHeight = 175
  ClientWidth = 488
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
  object seeTeamButton: TButton
    Left = 350
    Top = 64
    Width = 87
    Height = 25
    Caption = #26597#30475#29699#38431#20449#24687
    Enabled = False
    TabOrder = 0
  end
  object repairArenaButton: TButton
    Left = 350
    Top = 95
    Width = 87
    Height = 25
    Caption = #32500#25252#29699#38431#29699#39302
    Enabled = False
    TabOrder = 1
  end
  object hirePlayerComboBox: TComboBox
    Left = 56
    Top = 64
    Width = 137
    Height = 25
    Enabled = False
    TabOrder = 2
    Text = #35831#36873#25321#35201#38599#20323#30340#29699#21592
    OnChange = hirePlayerComboBoxChange
  end
  object firePlayerComboBox: TComboBox
    Left = 199
    Top = 64
    Width = 145
    Height = 25
    Enabled = False
    TabOrder = 3
    Text = #35831#36873#25321#35201#35299#38599#30340#29699#21592
    OnChange = firePlayerComboBoxChange
  end
  object hireCoachComboBox: TComboBox
    Left = 56
    Top = 95
    Width = 137
    Height = 25
    Enabled = False
    TabOrder = 4
    Text = #35831#36873#25321#35201#38599#20323#30340#25945#32451
    OnChange = hireCoachComboBoxChange
  end
  object fireCoachComboBox: TComboBox
    Left = 199
    Top = 95
    Width = 145
    Height = 25
    Enabled = False
    TabOrder = 5
    Text = #35831#36873#25321#35201#35299#38599#30340#25945#32451
    OnChange = fireCoachComboBoxChange
  end
  object selectTeamComboBox: TComboBox
    Left = 167
    Top = 33
    Width = 145
    Height = 25
    Hint = #35831#36873#25321#35201#31649#29702#30340#29699#38431
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Text = #35831#36873#25321#35201#31649#29702#30340#29699#38431
    OnChange = selectTeamComboBoxChange
  end
  object finishAboveButton: TButton
    Left = 167
    Top = 126
    Width = 145
    Height = 25
    Caption = #23436#25104#20197#19978#25805#20316
    Enabled = False
    TabOrder = 7
    OnClick = finishAboveButtonClick
  end
end
