object DataModule6: TDataModule6
  OldCreateOrder = False
  Left = 301
  Top = 128
  Height = 388
  Width = 668
  object IBDatabase1: TIBDatabase
    DatabaseName = 'localhost:D:\TEST_BASE.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 552
    Top = 208
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 352
    Top = 192
  end
  object DataSourceTEST: TDataSource
    DataSet = IBDataSetTEST
    Left = 152
    Top = 8
  end
  object DataSourceQUESTIONS: TDataSource
    DataSet = IBDataSetQUESTIONS
    Left = 152
    Top = 64
  end
  object DataSourceGROUPS: TDataSource
    DataSet = IBDataSetGROUP
    Left = 40
    Top = 64
  end
  object DataSourceRESPONDENT: TDataSource
    DataSet = IBDataSetRESPONDENT
    Left = 40
    Top = 160
  end
  object IBQueryTEST: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TEST')
    Left = 352
    Top = 16
  end
  object IBQueryQUESTION: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DataSourceTEST
    SQL.Strings = (
      'select * from QUESTION ')
    Left = 352
    Top = 72
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 384
    Top = 240
  end
  object IBQueryAddGroup: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'insert into GROUPS (GROUP_DESCRIPTION) values (:group_name)')
    Left = 464
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'group_name'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'description'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object IBDataSetGROUP: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from groups;')
    RefreshSQL.Strings = (
      
        'select ID_GROUP, GROUP_DESCRIPTION from GROUPS order by GROUP_DE' +
        'SCRIPTION')
    SelectSQL.Strings = (
      
        'select ID_GROUP, GROUP_DESCRIPTION from GROUPS order by GROUP_DE' +
        'SCRIPTION')
    ModifySQL.Strings = (
      'select * from GROUPS')
    Left = 40
    Top = 8
  end
  object IBDataSetRESPONDENT: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'select ID_RESPONDENT, SURNAME, NAME, PATRONIMIC, PASS, GROUP_ID_' +
        'GROUP from RESPONDENT WHERE GROUP_ID_GROUP = :ID_GROUP order by ' +
        'SURNAME')
    SelectSQL.Strings = (
      
        'select ID_RESPONDENT, SURNAME, NAME, PATRONIMIC, PASS, GROUP_ID_' +
        'GROUP from RESPONDENT WHERE GROUP_ID_GROUP = :ID_GROUP order by ' +
        'SURNAME')
    ModifySQL.Strings = (
      'select * from RESPONDENT WHERE GROUP_ID_GROUP = :ID_GROUP')
    DataSource = DataSourceGROUPS
    Left = 40
    Top = 120
  end
  object IBTable1: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'GROUPS'
    Left = 56
    Top = 288
  end
  object IBQueryRESPONDENT: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction3
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from RESPONDENT;')
    Left = 464
    Top = 64
  end
  object IBTransaction3: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 440
    Top = 192
  end
  object IBQueryShowAllRepondents: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction3
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DataSourceRESPONDENT
    ParamCheck = False
    SQL.Strings = (
      'SELECT * FROM RESPONDENT;')
    Left = 464
    Top = 120
  end
  object DataSourceSHowAllREspondent: TDataSource
    DataSet = IBQueryShowAllRepondents
    Left = 512
    Top = 304
  end
  object IBQuerySORT: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction3
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DataSourceSHowAllREspondent
    Left = 352
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBDataSetTEST: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT ID_TEST, TEST_DESCRIPTION, MARK_A, MARK_B, MARK_C, MARK_D' +
        ', VISIBILITY, RANDOM_MODE, ACTIVE_QUESTIONS, ADAPTIVE, TIME_LIMI' +
        'T FROM TEST order by TEST_DESCRIPTION')
    SelectSQL.Strings = (
      
        'SELECT ID_TEST, TEST_DESCRIPTION, MARK_A, MARK_B, MARK_C, MARK_D' +
        ', VISIBILITY, RANDOM_MODE, ACTIVE_QUESTIONS, ADAPTIVE, TIME_LIMI' +
        'T FROM TEST order by TEST_DESCRIPTION')
    Left = 152
    Top = 120
  end
  object IBDataSetQUESTIONS: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT * FROM QUESTION WHERE test_id_test = :id_test')
    SelectSQL.Strings = (
      'SELECT * FROM QUESTION WHERE test_id_test = :id_test')
    DataSource = DataSourceTEST
    Left = 152
    Top = 168
  end
end
