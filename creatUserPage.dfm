object createNewUser: TcreateNewUser
  Left = 187
  Top = 52
  Caption = 'Create New User'
  ClientHeight = 289
  ClientWidth = 503
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnClose = FormClose
  TextHeight = 15
  object firstNameLabel: TLabel
    Left = 23
    Top = 24
    Width = 60
    Height = 15
    Caption = 'First Name:'
  end
  object lastNameLabel: TLabel
    Left = 23
    Top = 67
    Width = 59
    Height = 15
    Caption = 'Last Name:'
  end
  object phoneLabel: TLabel
    Left = 23
    Top = 115
    Width = 37
    Height = 15
    Caption = 'Phone:'
  end
  object departmentLabel: TLabel
    Left = 24
    Top = 158
    Width = 66
    Height = 15
    Caption = 'Department:'
  end
  object emailLabel: TLabel
    Left = 23
    Top = 203
    Width = 37
    Height = 15
    Caption = 'E-mail:'
  end
  object userNameLabel: TLabel
    Left = 256
    Top = 24
    Width = 61
    Height = 15
    Caption = 'User Name:'
  end
  object passwordLabel: TLabel
    Left = 256
    Top = 67
    Width = 53
    Height = 15
    Caption = 'Password:'
  end
  object paswordAgainLabel: TLabel
    Left = 256
    Top = 115
    Width = 87
    Height = 15
    Caption = 'Password Again:'
  end
  object firstNameBox: TEdit
    Left = 96
    Top = 21
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object lastNameBox: TEdit
    Left = 96
    Top = 64
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object phoneBox: TEdit
    Left = 96
    Top = 112
    Width = 121
    Height = 23
    HideSelection = False
    TabOrder = 2
    Text = '(5xx-xxx-xxxx)'
    OnClick = phoneBoxClick
  end
  object departmentBox: TEdit
    Left = 96
    Top = 155
    Width = 121
    Height = 23
    TabOrder = 3
  end
  object emailBox: TEdit
    Left = 96
    Top = 200
    Width = 121
    Height = 23
    TabOrder = 4
  end
  object Button1: TButton
    Left = 120
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 5
    OnClick = Button1Click
  end
  object userNameBox: TEdit
    Left = 349
    Top = 21
    Width = 121
    Height = 23
    TabOrder = 6
  end
  object passwordBox: TEdit
    Left = 349
    Top = 64
    Width = 121
    Height = 23
    TabOrder = 7
  end
  object passwordAgainBox: TEdit
    Left = 349
    Top = 112
    Width = 121
    Height = 23
    CanUndoSelText = True
    TabOrder = 8
  end
end
