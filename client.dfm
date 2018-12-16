object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #30331#24405
  ClientHeight = 170
  ClientWidth = 316
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 59
    Top = 39
    Width = 39
    Height = 19
    Caption = #29992#25143#21517
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #24494#36719#38597#40657' Light'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 72
    Top = 67
    Width = 26
    Height = 19
    Caption = #23494#30721
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #24494#36719#38597#40657' Light'
    Font.Style = []
    ParentFont = False
  end
  object managerNameEdit: TEdit
    Left = 104
    Top = 40
    Width = 121
    Height = 21
    Hint = 'username here...'
    TabOrder = 0
  end
  object managerPassWordEdit: TEdit
    Left = 104
    Top = 67
    Width = 121
    Height = 21
    Hint = 'username here...'
    TabOrder = 1
  end
  object loginButton: TButton
    Left = 104
    Top = 94
    Width = 57
    Height = 25
    Caption = #30331#24405
    TabOrder = 2
    OnClick = loginButtonClick
  end
  object registerButton: TButton
    Left = 168
    Top = 94
    Width = 57
    Height = 25
    Caption = #27880#20876
    TabOrder = 3
  end
end
