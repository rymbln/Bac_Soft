object FormStudents: TFormStudents
  Left = 0
  Top = 0
  Width = 304
  Height = 188
  TabOrder = 0
  object LabeledEditSURNAME: TLabeledEdit
    Left = 16
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 49
    EditLabel.Height = 13
    EditLabel.Caption = #1060#1072#1084#1080#1083#1080#1103
    TabOrder = 0
  end
  object LabeledEditNAME: TLabeledEdit
    Left = 16
    Top = 64
    Width = 121
    Height = 21
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.Caption = #1048#1084#1103
    TabOrder = 1
  end
  object LabeledEditSecNAME: TLabeledEdit
    Left = 16
    Top = 104
    Width = 121
    Height = 21
    EditLabel.Width = 47
    EditLabel.Height = 13
    EditLabel.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    TabOrder = 2
  end
  object LabeledEditLOGIN: TLabeledEdit
    Left = 168
    Top = 64
    Width = 121
    Height = 21
    EditLabel.Width = 31
    EditLabel.Height = 13
    EditLabel.Caption = #1051#1086#1075#1080#1085
    TabOrder = 3
  end
  object LabeledEditPASS: TLabeledEdit
    Left = 168
    Top = 104
    Width = 121
    Height = 21
    EditLabel.Width = 38
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1072#1088#1086#1083#1100
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 144
    Width = 121
    Height = 25
    TabOrder = 5
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 168
    Top = 144
    Width = 121
    Height = 25
    TabOrder = 6
    Kind = bkCancel
  end
end
