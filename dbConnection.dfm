object dbForm: TdbForm
  Left = 0
  Top = 0
  Caption = 'dbForm'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object OracleDataSet1: TOracleDataSet
    Optimize = False
    Session = OracleSession1
    Left = 176
    Top = 248
  end
  object OracleSession1: TOracleSession
    LogonUsername = 'arda44'
    LogonPassword = 'arda1999'
    LogonDatabase = 'localhost:1521/XEPDB1'
    Preferences.ConvertUTF = cuUTF8ToUTF16
    Connected = True
    Left = 176
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 80
    Top = 240
  end
  object userLoginTable: TOracleQuery
    SQL.Strings = (
      'Select * from user_login ')
    Session = OracleSession1
    Optimize = False
    Left = 104
    Top = 168
  end
  object employeesTableQ: TOracleQuery
    SQL.Strings = (
      'select * from arda44.EMPLOYEE  order by id')
    Session = OracleSession1
    Optimize = False
    Left = 552
    Top = 88
  end
  object insertUserQ: TOracleQuery
    SQL.Strings = (
      
        'INSERT INTO arda44.employee (id, Firstname, Lastname, Phone ,Dep' +
        'artment,Email)'
      
        'values ( :id, :firstname, :lastname, :phone, :department, :email' +
        ')'
      '')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000006000000060000003A00490044000300000000000000000000001400
      00003A00460049005200530054004E0041004D00450005000000000000000000
      0000120000003A004C004100530054004E0041004D0045000500000000000000
      000000000C0000003A00500048004F004E004500050000000000000000000000
      160000003A004400450050004100520054004D0045004E005400050000000000
      0000000000000C0000003A0045004D00410049004C0005000000000000000000
      0000}
    Left = 552
    Top = 136
  end
  object getNumberOfUsersQ: TOracleQuery
    SQL.Strings = (
      'SELECT COUNT(*) FROM professors')
    Session = OracleSession1
    Optimize = False
    Left = 552
    Top = 336
  end
  object deleteUserWithIdQ: TOracleQuery
    SQL.Strings = (
      'delete from arda44.employee where id = :id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400050000000000000000000000}
    Left = 552
    Top = 264
  end
  object getEmployeeByIdQ: TOracleQuery
    SQL.Strings = (
      'select * from arda44.employee where id = :id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    Left = 456
    Top = 88
  end
  object getEmployeeByNameQ: TOracleQuery
    SQL.Strings = (
      
        'select * from arda44.employee where (firstname = :firstname and ' +
        'lastname = :lastname)')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000002000000140000003A00460049005200530054004E0041004D004500
      050000000000000000000000120000003A004C004100530054004E0041004D00
      4500050000000000000000000000}
    Left = 464
    Top = 144
  end
end
