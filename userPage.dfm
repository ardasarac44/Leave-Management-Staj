object userForm: TuserForm
  Left = 0
  Top = 0
  Caption = 'userForm'
  ClientHeight = 454
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object professorsTable: TStringGrid
    Left = 32
    Top = 64
    Width = 657
    Height = 313
    ColCount = 6
    DefaultColWidth = 105
    FixedCols = 0
    RowCount = 2
    TabOrder = 0
  end
  object createNewUserButton: TButton
    Left = 568
    Top = 400
    Width = 99
    Height = 25
    Caption = 'Create New User'
    TabOrder = 1
    OnClick = createNewUserButtonClick
  end
  object updateButton: TButton
    Left = 472
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 2
    OnClick = updateButtonClick
  end
  object deleteUserButton: TButton
    Left = 376
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Delete User'
    TabOrder = 3
    OnClick = deleteUserButtonClick
  end
end