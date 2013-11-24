object FormQUESTION: TFormQUESTION
  Left = 173
  Top = 20
  Width = 800
  Height = 480
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1074#1086#1087#1088#1086#1089#1072
  Color = clBtnFace
  Constraints.MaxHeight = 480
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 480
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 25
    Align = alTop
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1080#1087' '#1089#1086#1079#1076#1072#1074#1072#1077#1084#1086#1075#1086' '#1074#1086#1087#1088#1086#1089#1072' '#1085#1072' '#1074#1082#1083#1072#1076#1082#1077' '#1085#1080#1078#1077
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 412
    Width = 792
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 664
      Top = 8
      Width = 105
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 544
      Top = 8
      Width = 105
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 379
    Width = 792
    Height = 33
    Align = alBottom
    TabOrder = 2
    object Label7: TLabel
      Left = 240
      Top = 8
      Width = 24
      Height = 13
      Caption = #1058#1077#1089#1090
    end
    object DBLookupComboBoxTEST: TDBLookupComboBox
      Left = 280
      Top = 4
      Width = 145
      Height = 21
      KeyField = 'ID_TEST'
      ListField = 'TEST_DESCRIPTION'
      ListSource = DataModule6.DataSourceTEST
      TabOrder = 0
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 25
    Width = 792
    Height = 354
    ActivePage = TabSheet3
    Align = alClient
    MultiLine = True
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = #1054#1076#1080#1085#1086#1095#1085#1099#1081' '#1074#1099#1073#1086#1088
      DesignSize = (
        784
        326)
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 75
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        Caption = #1058#1077#1082#1089#1090' '#1074#1086#1087#1088#1086#1089#1072
      end
      object BtnSelectImageSingle: TButton
        Left = 16
        Top = 284
        Width = 137
        Height = 25
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
        TabOrder = 0
        OnClick = BtnSelectImageSingleClick
      end
      object RadioButton4: TRadioButton
        Left = 512
        Top = 180
        Width = 17
        Height = 25
        TabOrder = 1
      end
      object RadioButton3: TRadioButton
        Left = 168
        Top = 180
        Width = 17
        Height = 25
        TabOrder = 2
      end
      object RadioButton2: TRadioButton
        Left = 512
        Top = 140
        Width = 17
        Height = 25
        TabOrder = 3
      end
      object RadioButton1: TRadioButton
        Left = 168
        Top = 140
        Width = 17
        Height = 25
        TabOrder = 4
      end
      object MemQuestionSingle: TMemo
        Left = 16
        Top = 24
        Width = 745
        Height = 89
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
      end
      object SingleScore: TLabeledEdit
        Left = 192
        Top = 232
        Width = 121
        Height = 21
        EditLabel.Width = 100
        EditLabel.Height = 13
        EditLabel.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1074#1086#1087#1088#1086#1089#1072
        TabOrder = 6
      end
      object SingleAnswer4: TLabeledEdit
        Left = 536
        Top = 184
        Width = 225
        Height = 21
        EditLabel.Width = 99
        EditLabel.Height = 13
        EditLabel.Caption = #1042#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072' '#8470'4'
        TabOrder = 7
      end
      object SingleAnswer3: TLabeledEdit
        Left = 192
        Top = 184
        Width = 225
        Height = 21
        EditLabel.Width = 99
        EditLabel.Height = 13
        EditLabel.Caption = #1042#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072' '#8470'3'
        TabOrder = 8
      end
      object SingleAnswer2: TLabeledEdit
        Left = 536
        Top = 144
        Width = 225
        Height = 21
        EditLabel.Width = 99
        EditLabel.Height = 13
        EditLabel.Caption = #1042#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072' '#8470'2'
        TabOrder = 9
      end
      object SingleAnswer1: TLabeledEdit
        Left = 192
        Top = 144
        Width = 225
        Height = 21
        EditLabel.Width = 99
        EditLabel.Height = 13
        EditLabel.Caption = #1042#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072' '#8470'1'
        TabOrder = 10
      end
      object CheckBox1: TCheckBox
        Left = 168
        Top = 268
        Width = 585
        Height = 17
        Caption = #1059#1095#1072#1074#1089#1090#1074#1091#1077#1090' '#1083#1080' '#1074#1086#1087#1088#1086#1089' '#1074' '#1089#1083#1091#1095#1072#1081#1085#1086' '#1074#1099#1073#1086#1088#1077' '#1087#1088#1080' '#1087#1088#1086#1093#1086#1078#1076#1077#1085#1080#1080' '#1090#1077#1089#1090#1072
        TabOrder = 11
      end
      object ImageQuestionSingle: TDBImage
        Left = 16
        Top = 128
        Width = 137
        Height = 121
        DataField = 'IMAGE'
        DataSource = DataModule6.DataSourceQUESTIONS
        TabOrder = 12
      end
      object EditSingle: TEdit
        Left = 16
        Top = 256
        Width = 137
        Height = 21
        TabOrder = 13
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1052#1085#1086#1078#1077#1089#1090#1074#1077#1085#1085#1099#1081' '#1074#1099#1073#1086#1088
      ImageIndex = 1
      DesignSize = (
        784
        326)
      object Label4: TLabel
        Left = 16
        Top = 8
        Width = 75
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        Caption = #1058#1077#1082#1089#1090' '#1074#1086#1087#1088#1086#1089#1072
      end
      object CheckMutyRAND: TCheckBox
        Left = 168
        Top = 268
        Width = 585
        Height = 17
        Caption = #1059#1095#1072#1074#1089#1090#1074#1091#1077#1090' '#1083#1080' '#1074#1086#1087#1088#1086#1089' '#1074' '#1089#1083#1091#1095#1072#1081#1085#1086' '#1074#1099#1073#1086#1088#1077' '#1087#1088#1080' '#1087#1088#1086#1093#1086#1078#1076#1077#1085#1080#1080' '#1090#1077#1089#1090#1072
        TabOrder = 0
      end
      object EditMULTYscore: TLabeledEdit
        Left = 192
        Top = 232
        Width = 121
        Height = 21
        EditLabel.Width = 100
        EditLabel.Height = 13
        EditLabel.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1074#1086#1087#1088#1086#1089#1072
        TabOrder = 1
      end
      object EditMULTYans4: TLabeledEdit
        Left = 536
        Top = 184
        Width = 225
        Height = 21
        EditLabel.Width = 99
        EditLabel.Height = 13
        EditLabel.Caption = #1042#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072' '#8470'4'
        TabOrder = 2
      end
      object EditMULTYans3: TLabeledEdit
        Left = 192
        Top = 184
        Width = 225
        Height = 21
        EditLabel.Width = 99
        EditLabel.Height = 13
        EditLabel.Caption = #1042#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072' '#8470'3'
        TabOrder = 3
      end
      object EditMULTYans2: TLabeledEdit
        Left = 536
        Top = 144
        Width = 225
        Height = 21
        EditLabel.Width = 99
        EditLabel.Height = 13
        EditLabel.Caption = #1042#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072' '#8470'2'
        TabOrder = 4
      end
      object EditMULTYans1: TLabeledEdit
        Left = 192
        Top = 144
        Width = 225
        Height = 21
        EditLabel.Width = 99
        EditLabel.Height = 13
        EditLabel.Caption = #1042#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072' '#8470'1'
        TabOrder = 5
      end
      object Button1: TButton
        Left = 16
        Top = 284
        Width = 137
        Height = 25
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
        TabOrder = 6
        OnClick = Button1Click
      end
      object MemoMultyTEXT: TMemo
        Left = 16
        Top = 24
        Width = 745
        Height = 89
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
      end
      object CheckAns1: TCheckBox
        Left = 168
        Top = 144
        Width = 17
        Height = 25
        TabOrder = 8
      end
      object CheckAns3: TCheckBox
        Left = 168
        Top = 184
        Width = 17
        Height = 25
        TabOrder = 9
      end
      object CheckAns2: TCheckBox
        Left = 512
        Top = 144
        Width = 17
        Height = 25
        TabOrder = 10
      end
      object CheckAns4: TCheckBox
        Left = 512
        Top = 184
        Width = 17
        Height = 25
        TabOrder = 11
      end
      object ImageQuestionMulty: TDBImage
        Left = 16
        Top = 120
        Width = 137
        Height = 129
        DataField = 'IMAGE'
        DataSource = DataModule6.DataSourceQUESTIONS
        TabOrder = 12
      end
      object EditMulty: TEdit
        Left = 16
        Top = 256
        Width = 137
        Height = 21
        TabOrder = 13
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1054#1090#1082#1088#1099#1090#1099#1081' '#1074#1086#1087#1088#1086#1089
      ImageIndex = 2
      DesignSize = (
        784
        326)
      object Label5: TLabel
        Left = 16
        Top = 8
        Width = 75
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        Caption = #1058#1077#1082#1089#1090' '#1074#1086#1087#1088#1086#1089#1072
      end
      object MemOpenTEXT: TMemo
        Left = 16
        Top = 24
        Width = 745
        Height = 89
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object Button2: TButton
        Left = 16
        Top = 276
        Width = 137
        Height = 25
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
        TabOrder = 1
        OnClick = Button2Click
      end
      object EditOpenRightAnswer: TLabeledEdit
        Left = 192
        Top = 144
        Width = 225
        Height = 21
        EditLabel.Width = 145
        EditLabel.Height = 13
        EditLabel.Caption = #1055#1088#1072#1074#1080#1083#1100#1085#1099#1081' '#1074#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072
        TabOrder = 2
      end
      object EditOpenScore: TLabeledEdit
        Left = 192
        Top = 232
        Width = 121
        Height = 21
        EditLabel.Width = 100
        EditLabel.Height = 13
        EditLabel.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1074#1086#1087#1088#1086#1089#1072
        TabOrder = 3
      end
      object CheckBoxOpenRand: TCheckBox
        Left = 168
        Top = 268
        Width = 585
        Height = 17
        Caption = #1059#1095#1072#1074#1089#1090#1074#1091#1077#1090' '#1083#1080' '#1074#1086#1087#1088#1086#1089' '#1074' '#1089#1083#1091#1095#1072#1081#1085#1086' '#1074#1099#1073#1086#1088#1077' '#1087#1088#1080' '#1087#1088#1086#1093#1086#1078#1076#1077#1085#1080#1080' '#1090#1077#1089#1090#1072
        TabOrder = 4
      end
      object ImageQuestionEnter: TDBImage
        Left = 16
        Top = 120
        Width = 137
        Height = 121
        DataField = 'IMAGE'
        DataSource = DataModule6.DataSourceQUESTIONS
        TabOrder = 5
      end
      object EditEnter: TEdit
        Left = 16
        Top = 248
        Width = 137
        Height = 21
        TabOrder = 6
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 16
    Top = 409
  end
end
