object coachForm: TcoachForm
  Left = 0
  Top = 0
  Caption = #25945#32451#20449#24687
  ClientHeight = 381
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
  object Label1: TLabel
    Left = 40
    Top = 8
    Width = 72
    Height = 17
    Caption = #33258#30001#24066#22330#25945#32451
  end
  object playerInTeam: TLabel
    Left = 40
    Top = 144
    Width = 48
    Height = 17
    Alignment = taCenter
    Caption = #29699#38431#25945#32451
  end
  object coachInMarketGrid: TDBGrid
    Left = 40
    Top = 31
    Width = 441
    Height = 98
    DataSource = DataSourceCoachInMarket
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #24494#36719#38597#40657' Light'
    TitleFont.Style = []
  end
  object coachInTeamGrid: TDBGrid
    Left = 40
    Top = 167
    Width = 441
    Height = 186
    DataSource = DataSourceCoachInTeam
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #24494#36719#38597#40657' Light'
    TitleFont.Style = []
  end
  object QueryCoachInMarket: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 504
    Top = 32
  end
  object QueryCoachInTeam: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 504
    Top = 168
  end
  object DataSourceCoachInMarket: TDataSource
    DataSet = QueryCoachInMarket
    Left = 504
    Top = 80
  end
  object DataSourceCoachInTeam: TDataSource
    DataSet = QueryCoachInTeam
    Left = 504
    Top = 216
  end
end
