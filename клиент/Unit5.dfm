object Form5: TForm5
  Left = 672
  Top = 190
  Width = 863
  Height = 525
  AlphaBlend = True
  AlphaBlendValue = 0
  Caption = 'Form5'
  Color = clBtnFace
  TransparentColor = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridRESPONDENT: TDBGrid
    Left = 0
    Top = 0
    Width = 847
    Height = 137
    Align = alTop
    DataSource = DataModule4.DataSourceRESPONDENT
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        Expanded = False
        FieldName = 'SURNAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PATRONIMIC'
        Visible = True
      end>
  end
  object DBGridQUESTION: TDBGrid
    Left = 0
    Top = 350
    Width = 847
    Height = 137
    Align = alBottom
    DataSource = DataModule4.DataSourceQUESTION
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_QUESTION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEXT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANSWER_1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANSWER_2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANSWER_3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANSWER_4'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RIGHT_ANSWER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RANDOMIZING'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCORE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TYPE_ID_TYPE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMAGE'
        Visible = True
      end>
  end
  object DBGridTEST: TDBGrid
    Left = 0
    Top = 137
    Width = 847
    Height = 213
    Align = alClient
    DataSource = DataModule4.DataSourceTEST
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_TEST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEST_DESCRIPTION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MARK_A'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MARK_B'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MARK_C'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MARK_D'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RANDOM_MODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACTIVE_QUESTIONS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADAPTIVE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIME_LIMIT'
        Visible = True
      end>
  end
end
