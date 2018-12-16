object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 199
  Width = 284
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=lz147258369?;Persist Security Info=' +
      'True;User ID=sa;Initial Catalog=NBA_Manage_Sys;Data Source=SKY-2' +
      '0170907GNX\LIUZHEN'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 40
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 88
    Top = 40
  end
end
