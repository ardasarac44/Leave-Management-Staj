object usersRequestForm: TusersRequestForm
  Left = 0
  Top = 0
  Caption = 'Pending Requests'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Shape1: TShape
    Left = 448
    Top = 328
    Width = 129
    Height = 106
  end
  object deleteIdLabel: TLabel
    Left = 472
    Top = 355
    Width = 14
    Height = 15
    Caption = 'ID:'
  end
  object requestsTable: TStringGrid
    Left = 8
    Top = 96
    Width = 612
    Height = 153
    ColCount = 7
    DefaultColWidth = 93
    DefaultRowHeight = 35
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goFixedRowDefAlign]
    TabOrder = 0
  end
  object deleteRequestButton: TButton
    Left = 472
    Top = 392
    Width = 89
    Height = 25
    Caption = 'Delete'
    TabOrder = 1
  end
  object requestIdDeleteBox: TEdit
    Left = 498
    Top = 352
    Width = 63
    Height = 23
    TabOrder = 2
    Text = 'Request ID'
  end
end
