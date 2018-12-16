object playerForm: TplayerForm
  Left = 0
  Top = 0
  Caption = #29699#21592#20449#24687
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
  object playerInMarket: TLabel
    Left = 40
    Top = 8
    Width = 72
    Height = 17
    Alignment = taCenter
    Caption = #33258#30001#24066#22330#29699#21592
  end
  object playerInTeam: TLabel
    Left = 40
    Top = 144
    Width = 48
    Height = 17
    Alignment = taCenter
    Caption = #29699#38431#29699#21592
  end
  object PlayerInMarketGrid: TDBGrid
    Left = 40
    Top = 31
    Width = 441
    Height = 98
    DataSource = DataSourcePlayerInMarket
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #24494#36719#38597#40657' Light'
    TitleFont.Style = []
  end
  object playerInTeamGrid: TDBGrid
    Left = 40
    Top = 167
    Width = 441
    Height = 186
    DataSource = DataSourcePlayerInTeam
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #24494#36719#38597#40657' Light'
    TitleFont.Style = []
  end
  object QueryPlayerInMarket: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 496
    Top = 32
  end
  object QueryPlayerInTeam: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 504
    Top = 168
  end
  object DataSourcePlayerInMarket: TDataSource
    DataSet = QueryPlayerInMarket
    Left = 496
    Top = 80
  end
  object DataSourcePlayerInTeam: TDataSource
    DataSet = QueryPlayerInTeam
    Left = 504
    Top = 216
  end
end
