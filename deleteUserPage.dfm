object deleteUser: TdeleteUser
  Left = 0
  Top = 0
  Caption = 'deleteUser'
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
  object queryByNameLabel: TLabel
    Left = 64
    Top = 204
    Width = 83
    Height = 15
    Caption = 'Query by Name'
  end
  object queryByIdLabel: TLabel
    Left = 64
    Top = 131
    Width = 62
    Height = 15
    Caption = 'Query by ID'
  end
  object idBox: TEdit
    Left = 176
    Top = 128
    Width = 121
    Height = 23
    TabOrder = 0
    Text = 'ID'
    OnClick = idBoxClick
  end
  object searchByIdButton: TButton
    Left = 480
    Top = 127
    Width = 75
    Height = 25
    Caption = 'Search'
    TabOrder = 1
    OnClick = searchByIdButtonClick
  end
  object employeeGrid: TStringGrid
    Left = 24
    Top = 264
    Width = 577
    Height = 57
    ColCount = 6
    DefaultColWidth = 88
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goFixedRowDefAlign]
    TabOrder = 2
  end
  object firstNameBox: TEdit
    Left = 176
    Top = 201
    Width = 121
    Height = 23
    TabOrder = 3
    Text = 'First Name'
    OnClick = firstNameBoxClick
  end
  object lastNameBox: TEdit
    Left = 328
    Top = 201
    Width = 121
    Height = 23
    TabOrder = 4
    Text = 'Last Name'
    OnClick = lastNameBoxClick
  end
  object searchByNameButton: TButton
    Left = 480
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Search'
    TabOrder = 5
    OnClick = searchByNameButtonClick
  end
  object deleteButton: TButton
    Left = 480
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 6
    OnClick = deleteButtonClick
  end
end
