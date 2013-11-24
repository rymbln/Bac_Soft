object DataModule4: TDataModule4
  OldCreateOrder = False
  Left = 265
  Top = 172
  Height = 303
  Width = 427
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT surname, name, patronimic FROM respondent WHERE (id_respo' +
        'ndent = :id) and (pass = :pass)')
    Left = 112
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pass'
        ParamType = ptUnknown
      end>
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'localhost:D:\test_base.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 184
    Top = 72
  end
  object IBTransaction1: TIBTransaction
    Active = False
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 136
    Top = 120
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 240
    Top = 120
  end
  object DataSourceTEST: TDataSource
    DataSet = IBQuery2
    Left = 32
    Top = 16
  end
  object DataSourceQUESTION: TDataSource
    DataSet = IBQuery3
    Left = 32
    Top = 64
  end
  object DataSourceRESPONDENT: TDataSource
    DataSet = IBQuery1
    Left = 32
    Top = 112
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT ID_TEST, TEST_DESCRIPTION, MARK_A, MARK_B, MARK_C, MARK_D' +
        ', RANDOM_MODE, ACTIVE_QUESTIONS, ADAPTIVE, TIME_LIMIT  FROM TEST' +
        ' WHERE visibility = 1')
    Left = 160
    Top = 16
  end
  object IBQuery3: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT ID_QUESTION,  TEXT, ANSWER_1, ANSWER_2, ANSWER_3, ANSWER_' +
        '4, RIGHT_ANSWER,  RANDOMIZING, SCORE, TYPE_ID_TYPE, IMAGE FROM Q' +
        'UESTION where TEST_ID_TEST = :id ORDER BY id_question')
    Left = 208
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQueryREPORT: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'INSERT INTO TESTING (START_TIME, END_TIME, RESULT, MARK, TEST_ID' +
        '_TEST, RESPONDENT_ID_RESPONDENT, TESTING_REPORT) values (:start_' +
        'time, :end_time, :result, :mark, :id_test, :id_respondent, :repo' +
        'rt)')
    Left = 272
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'start_time'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'end_time'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'result'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mark'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_test'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_respondent'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'report'
        ParamType = ptUnknown
      end>
  end
  object IBTable1: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    MasterSource = DataSourceQUESTION
    Left = 312
    Top = 128
  end
end
