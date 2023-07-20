object controlRequestsForm: TcontrolRequestsForm
  Left = 0
  Top = 0
  Caption = 'Requests'
  ClientHeight = 560
  ClientWidth = 920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object requestsTable: TStringGrid
    Left = 8
    Top = 56
    Width = 745
    Height = 313
    ColCount = 9
    DefaultColWidth = 90
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goFixedRowDefAlign]
    TabOrder = 0
  end
  object filterPanel: TPanel
    Left = 759
    Top = 56
    Width = 138
    Height = 449
    TabOrder = 1
    object idLabel: TLabel
      Left = 32
      Top = 19
      Width = 14
      Height = 15
      Caption = 'ID:'
    end
    object lastNameLabel: TLabel
      Left = 32
      Top = 230
      Width = 59
      Height = 15
      Caption = 'Last Name:'
    end
    object firstNameLabel: TLabel
      Left = 32
      Top = 165
      Width = 60
      Height = 15
      Caption = 'First Name:'
    end
    object departmentLabel: TLabel
      Left = 24
      Top = 292
      Width = 66
      Height = 15
      Caption = 'Department:'
    end
    object requestIdLabel: TLabel
      Left = 24
      Top = 88
      Width = 59
      Height = 15
      Caption = 'Request ID:'
    end
    object filterButton: TButton
      Left = 32
      Top = 355
      Width = 75
      Height = 25
      Caption = 'Filter'
      TabOrder = 0
      OnClick = filterButtonClick
    end
    object idBox: TEdit
      Left = 16
      Top = 40
      Width = 97
      Height = 23
      TabOrder = 1
    end
    object lastNameBox: TEdit
      Left = 16
      Top = 251
      Width = 97
      Height = 23
      TabOrder = 2
    end
    object firstNameBox: TEdit
      Left = 16
      Top = 186
      Width = 97
      Height = 23
      TabOrder = 3
    end
    object departmentBox: TEdit
      Left = 16
      Top = 313
      Width = 97
      Height = 23
      TabOrder = 4
    end
    object resetFilterButton: TButton
      Left = 32
      Top = 399
      Width = 75
      Height = 25
      Caption = 'Reset'
      TabOrder = 5
      OnClick = resetFilterButtonClick
    end
    object requestIdBox: TEdit
      Left = 16
      Top = 120
      Width = 97
      Height = 23
      BevelOuter = bvNone
      TabOrder = 6
    end
  end
  object approveRequestPanel: TPanel
    Left = 456
    Top = 392
    Width = 281
    Height = 129
    TabOrder = 2
    object approveByRquestIdLabel: TLabel
      Left = 48
      Top = 32
      Width = 59
      Height = 15
      Caption = 'Request ID:'
    end
    object approveRequestButton: TButton
      Left = 168
      Top = 64
      Width = 97
      Height = 57
      Caption = 'Approve'
      TabOrder = 0
      OnClick = approveRequestButtonClick
    end
    object denyRequestButton: TButton
      Left = 24
      Top = 64
      Width = 97
      Height = 25
      Cancel = True
      Caption = 'Deny'
      TabOrder = 1
      OnClick = denyRequestButtonClick
    end
    object approveRequestIdBox: TEdit
      Left = 136
      Top = 24
      Width = 81
      Height = 23
      BevelOuter = bvNone
      TabOrder = 2
    end
    object pendingRequestButton: TButton
      Left = 24
      Top = 95
      Width = 97
      Height = 26
      Cancel = True
      Caption = 'Pending'
      TabOrder = 3
      OnClick = pendingRequestButtonClick
    end
  end
  object updateRequestsTableButton: TButton
    Left = 48
    Top = 430
    Width = 107
    Height = 56
    Cancel = True
    Caption = 'Update Table'
    TabOrder = 3
    OnClick = updateRequestsTableButtonClick
  end
end
