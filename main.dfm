object mainForm: TmainForm
  Left = 0
  Top = 0
  Caption = #20027#31383#21475
  ClientHeight = 310
  ClientWidth = 479
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 25
  object playerPartButton: TButton
    Left = 184
    Top = 49
    Width = 89
    Height = 81
    Caption = #29699#21592#27169#22359
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657' Light'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = playerPartButtonClick
  end
  object coachPartButton: TButton
    Left = 136
    Top = 136
    Width = 89
    Height = 81
    Caption = #25945#32451#27169#22359
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657' Light'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = coachPartButtonClick
  end
  object teamPartButton: TButton
    Left = 231
    Top = 136
    Width = 89
    Height = 81
    Caption = #29699#38431#27169#22359
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657' Light'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
end
