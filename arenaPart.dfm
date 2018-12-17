object arenaPartForm: TarenaPartForm
  Left = 0
  Top = 0
  Caption = #32500#25252#29699#39302
  ClientHeight = 210
  ClientWidth = 553
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
  object arenaNameLabel: TLabel
    Left = 195
    Top = 40
    Width = 161
    Height = 19
    Alignment = taCenter
    AutoSize = False
    Caption = #35831#32534#36753#32500#25252#29699#39302#20449#24687
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #24494#36719#38597#40657' Light'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object Label1: TLabel
    Left = 60
    Top = 66
    Width = 65
    Height = 19
    Alignment = taRightJustify
    Caption = #21407#29699#39302#21517#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #24494#36719#38597#40657' Light'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 47
    Top = 96
    Width = 78
    Height = 19
    Alignment = taRightJustify
    Caption = #21407#29699#39302#22320#22336#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #24494#36719#38597#40657' Light'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object newArenaNameEdit: TEdit
    Left = 279
    Top = 65
    Width = 153
    Height = 25
    TabOrder = 0
    Text = #26032#30340#29699#39302#21517
  end
  object newArenaLocationEdit: TEdit
    Left = 279
    Top = 96
    Width = 153
    Height = 25
    TabOrder = 1
    Text = #26032#30340#29699#39302#22320#22336
  end
  object repaireArenaButton: TButton
    Left = 216
    Top = 127
    Width = 121
    Height = 25
    Caption = #30830#35748#29699#39302#20462#25913
    TabOrder = 2
    OnClick = repaireArenaButtonClick
  end
  object oldArenaNameEdit: TEdit
    Left = 128
    Top = 65
    Width = 145
    Height = 25
    TabOrder = 3
    Text = #21407#29699#39302#21517
  end
  object oldArenaLocationEdit: TEdit
    Left = 128
    Top = 96
    Width = 145
    Height = 25
    TabOrder = 4
    Text = #21407#29699#39302#22320#22336
  end
end
