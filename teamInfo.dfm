object teamInfoForm: TteamInfoForm
  Left = 0
  Top = 0
  Caption = #29699#38431#20449#24687
  ClientHeight = 494
  ClientWidth = 688
  Color = clCream
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #24494#36719#38597#40657' Light'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 66
    Top = 120
    Width = 65
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #29699#38431#29699#39302#65306
  end
  object Label2: TLabel
    Left = 46
    Top = 34
    Width = 93
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #29699#38431#22522#26412#20449#24687#65306
  end
  object Label3: TLabel
    Left = 66
    Top = 200
    Width = 65
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #29699#38431#25945#32451#65306
  end
  object Label4: TLabel
    Left = 66
    Top = 281
    Width = 65
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #29699#38431#29699#21592#65306
  end
  object teamInfoDBGrid: TDBGrid
    Left = 137
    Top = 34
    Width = 400
    Height = 80
    DataSource = teamInfoDataSource
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #24494#36719#38597#40657' Light'
    TitleFont.Style = []
  end
  object arenaInfoDBGrid: TDBGrid
    Left = 137
    Top = 120
    Width = 400
    Height = 74
    DataSource = arenaInfoDataSource
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #24494#36719#38597#40657' Light'
    TitleFont.Style = []
  end
  object coachInfoDBGrid: TDBGrid
    Left = 137
    Top = 200
    Width = 400
    Height = 75
    DataSource = coachInfoDataSource
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #24494#36719#38597#40657' Light'
    TitleFont.Style = []
  end
  object playerInfoDBGrid: TDBGrid
    Left = 137
    Top = 281
    Width = 400
    Height = 176
    DataSource = playerInfoDataSource
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #24494#36719#38597#40657' Light'
    TitleFont.Style = []
  end
  object teamInfoADOQuery: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 592
    Top = 8
  end
  object teamInfoDataSource: TDataSource
    DataSet = teamInfoADOQuery
    Left = 656
    Top = 8
  end
  object arenaInfoADOQuery: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 592
    Top = 48
  end
  object arenaInfoDataSource: TDataSource
    DataSet = arenaInfoADOQuery
    Left = 656
    Top = 48
  end
  object coachInfoADOQuery: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 592
    Top = 96
  end
  object coachInfoDataSource: TDataSource
    DataSet = coachInfoADOQuery
    Left = 656
    Top = 96
  end
  object playerInfoADOQuery: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 592
    Top = 144
  end
  object playerInfoDataSource: TDataSource
    DataSet = playerInfoADOQuery
    Left = 656
    Top = 144
  end
end
