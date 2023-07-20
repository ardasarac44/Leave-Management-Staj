object editRequestForm: TeditRequestForm
  Left = 0
  Top = 0
  Caption = 'editRequestForm'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Shape1: TShape
    Left = 312
    Top = 72
    Width = 265
    Height = 314
  end
  object editStartDateLabel: TLabel
    Left = 336
    Top = 121
    Width = 54
    Height = 15
    Caption = 'Start Date:'
  end
  object editEndDateLabel: TLabel
    Left = 336
    Top = 177
    Width = 50
    Height = 15
    Caption = 'End Date:'
  end
  object editPriorityLabel: TLabel
    Left = 336
    Top = 250
    Width = 41
    Height = 15
    Caption = 'Priority:'
  end
  object editRequestTable: TStringGrid
    Left = 40
    Top = 72
    Width = 225
    Height = 297
    ColCount = 2
    DefaultColWidth = 100
    DefaultRowHeight = 40
    RowCount = 7
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goFixedRowDefAlign]
    TabOrder = 0
  end
  object editStartDatePicker: TDatePicker
    Left = 408
    Top = 104
    Date = 45119.000000000000000000
    DateFormat = 'dd/mm/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 1
  end
  object editEndDatePicker: TDatePicker
    Left = 408
    Top = 160
    Date = 45119.000000000000000000
    DateFormat = 'dd/mm/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 2
  end
  object editRadioButtonGroup: TRadioGroup
    Left = 408
    Top = 240
    Width = 129
    Height = 81
    TabOrder = 3
  end
  object priorityRadioButton1: TRadioButton
    Left = 424
    Top = 250
    Width = 113
    Height = 17
    Caption = '1 (highest)'
    Checked = True
    TabOrder = 4
    TabStop = True
  end
  object priorityRadioButton2: TRadioButton
    Left = 424
    Top = 273
    Width = 113
    Height = 17
    Caption = '2'
    TabOrder = 5
  end
  object priorityRadioButton3: TRadioButton
    Left = 424
    Top = 296
    Width = 113
    Height = 17
    Caption = '3'
    TabOrder = 6
  end
  object editButton: TButton
    Left = 408
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 7
    OnClick = editButtonClick
  end
end
