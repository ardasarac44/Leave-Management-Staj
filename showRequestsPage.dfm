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
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Shape1: TShape
    Left = 464
    Top = 328
    Width = 157
    Height = 106
  end
  object deleteIdLabel: TLabel
    Left = 504
    Top = 355
    Width = 14
    Height = 15
    Caption = 'ID:'
  end
  object Shape2: TShape
    Left = 24
    Top = 328
    Width = 153
    Height = 106
  end
  object editIdLabel: TLabel
    Left = 58
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
    Left = 504
    Top = 392
    Width = 85
    Height = 25
    Caption = 'Delete'
    TabOrder = 1
    OnClick = deleteRequestButtonClick
  end
  object requestIdDeleteBox: TEdit
    Left = 526
    Top = 352
    Width = 63
    Height = 23
    TabOrder = 2
    Text = 'Request ID'
    OnClick = requestIdDeleteBoxClick
  end
  object editRequestButton: TButton
    Left = 58
    Top = 392
    Width = 83
    Height = 25
    Caption = 'Edit'
    TabOrder = 3
    OnClick = editRequestButtonClick
  end
  object requestIdEditBox: TEdit
    Left = 78
    Top = 352
    Width = 63
    Height = 23
    CanUndoSelText = True
    TabOrder = 4
    Text = 'Request ID'
    OnClick = requestIdEditBoxClick
  end
  object updateRequestsButton: TButton
    Left = 464
    Top = 272
    Width = 156
    Height = 25
    Caption = 'Update'
    TabOrder = 5
    OnClick = updateRequestsButtonClick
  end
end
