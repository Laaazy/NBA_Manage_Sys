object playerPartForm: TplayerPartForm
  Left = 0
  Top = 0
  Caption = #29699#21592#31649#29702
  ClientHeight = 175
  ClientWidth = 352
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object newPlayerButton: TButton
    Left = 88
    Top = 56
    Width = 81
    Height = 33
    Caption = #25509#25910#26032#29699#21592
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657' Light'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = newPlayerButtonClick
  end
  object seePlayerButton: TButton
    Left = 175
    Top = 56
    Width = 81
    Height = 33
    Caption = #26597#30475#29699#21592#20449#24687
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657' Light'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = seePlayerButtonClick
  end
end
