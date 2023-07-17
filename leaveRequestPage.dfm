object leaveRequestForm: TleaveRequestForm
  Left = 0
  Top = 0
  Caption = 'Leave Request'
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
  object editRequestsLabel: TLabel
    Left = 299
    Top = 391
    Width = 207
    Height = 21
    Caption = 'View and edit your requests:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = 280
    Top = 24
    Width = 321
    Height = 257
  end
  object endDateLabel: TLabel
    Left = 328
    Top = 111
    Width = 64
    Height = 20
    Caption = 'End Date:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object startDateLabel: TLabel
    Left = 328
    Top = 56
    Width = 70
    Height = 20
    Caption = 'Start Date:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object priorityLabel: TLabel
    Left = 328
    Top = 172
    Width = 50
    Height = 20
    Caption = 'Priority:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object requestButton: TButton
    Left = 432
    Top = 240
    Width = 97
    Height = 25
    Caption = 'Request'
    TabOrder = 0
    OnClick = requestButtonClick
  end
  object userGrid: TStringGrid
    Left = 24
    Top = 56
    Width = 250
    Height = 225
    ColCount = 2
    DefaultColWidth = 90
    DefaultRowHeight = 35
    RowCount = 6
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goFixedRowDefAlign]
    TabOrder = 1
  end
  object startDatePick: TDatePicker
    Left = 412
    Top = 39
    Date = 45114.000000000000000000
    DateFormat = 'd/m/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 2
  end
  object endDatePick: TDatePicker
    Left = 412
    Top = 99
    Date = 45117.000000000000000000
    DateFormat = 'd/m/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 3
  end
  object priorityButtonGroup: TRadioGroup
    Left = 412
    Top = 137
    Width = 150
    Height = 97
    TabOrder = 4
  end
  object priorityButton1: TRadioButton
    Left = 416
    Top = 153
    Width = 113
    Height = 17
    Caption = '1 (highest)'
    Checked = True
    TabOrder = 5
    TabStop = True
  end
  object priorityButton2: TRadioButton
    Left = 416
    Top = 176
    Width = 113
    Height = 17
    Caption = '2'
    TabOrder = 6
  end
  object priorityButton3: TRadioButton
    Left = 416
    Top = 199
    Width = 113
    Height = 17
    Caption = '3'
    TabOrder = 7
  end
  object editRequestsButton: TButton
    Left = 512
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 8
    OnClick = editRequestsButtonClick
  end
end
