object dmComLearning: TdmComLearning
  OldCreateOrder = False
  Height = 402
  Width = 598
  object dmComLearningdataBase: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=GR12CLD_u.mdb;Mode=' +
      'ReadWrite;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 264
    Top = 48
  end
  object tblUsers: TADOTable
    Active = True
    Connection = dmComLearningdataBase
    CursorType = ctStatic
    TableName = 'tbluser'
    Left = 144
    Top = 144
  end
  object dsrUsers: TDataSource
    DataSet = tblUsers
    Left = 192
    Top = 144
  end
  object tblContent: TADOTable
    Active = True
    Connection = dmComLearningdataBase
    CursorType = ctStatic
    TableName = 'tblcontent'
    Left = 144
    Top = 216
  end
  object tblTests: TADOTable
    Active = True
    Connection = dmComLearningdataBase
    CursorType = ctStatic
    TableName = 'tbltests'
    Left = 144
    Top = 280
  end
  object dsrContent: TDataSource
    DataSet = tblContent
    Left = 200
    Top = 216
  end
  object dsrTests: TDataSource
    DataSet = tblTests
    Left = 192
    Top = 280
  end
  object qryComLearning: TADOQuery
    Connection = dmComLearningdataBase
    CursorType = ctStatic
    DataSource = dsrContent
    Parameters = <>
    SQL.Strings = (
      'Select * from tblcontent')
    Left = 320
    Top = 208
  end
  object dsrComLearning: TDataSource
    DataSet = qryComLearning
    Left = 400
    Top = 208
  end
end
