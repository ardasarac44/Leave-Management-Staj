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
    Left = 448
    Top = 144
  end
  object editUserQ: TOracleQuery
    SQL.Strings = (
      'UPDATE arda44.employee'
      'SET '
      '       firstname = :firstname,'
      '       lastname = :lastname,'
      '       phone = :phone,'
      '       email = :email,'
      '       department = :department'
      'where ID = :id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000006000000060000003A00490044000300000000000000000000001400
      00003A00460049005200530054004E0041004D00450005000000000000000000
      0000120000003A004C004100530054004E0041004D0045000500000000000000
      00000000160000003A004400450050004100520054004D0045004E0054000500
      000000000000000000000C0000003A00500048004F004E004500050000000000
      0000000000000C0000003A0045004D00410049004C0005000000000000000000
      0000}
    Left = 456
    Top = 264
  end
  object selectUsersQ: TOracleQuery
    SQL.Strings = (
      'SELECT e.*, e.rowid  from arda44.employee e')
    Session = OracleSession1
    Optimize = False
    Left = 448
    Top = 328
  end
  object searchByNameQ: TOracleQuery
    SQL.Strings = (
      'SELECT * '
      'FROM arda44.employee'
      'WHERE regexp_like (firstname , :firstname ) ')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000001000000140000003A00460049005200530054004E0041004D004500
      050000000000000000000000}
    Left = 360
    Top = 264
  end
  object searchByLastNameQ: TOracleQuery
    SQL.Strings = (
      'SELECT * '
      'FROM arda44.employee'
      'WHERE regexp_like (lastname, :lastname)')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A004C004100530054004E0041004D0045000500
      00000000000000000000}
    Left = 376
    Top = 368
  end
  object searchByIdQ: TOracleQuery
    SQL.Strings = (
      'SELECT * '
      'FROM arda44.employee'
      'WHERE id = :id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    Left = 288
    Top = 368
  end
  object searchByDepartmentQ: TOracleQuery
    SQL.Strings = (
      'SELECT * '
      'FROM arda44.employee'
      'WHERE regexp_like (department, :department) ')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A004400450050004100520054004D0045004E00
      5400050000000000000000000000}
    Left = 280
    Top = 296
  end
  object requestLeaveQ: TOracleQuery
    SQL.Strings = (
      'insert into ARDA44.CREW_REQUEST'
      '  (crew_id, start_date, end_date, request_priority, approved)'
      'values'
      
        '  (:crew_id, to_date(:start_date, '#39'dd-mm-yyyy'#39'), to_date(:end_da' +
        'te, '#39'dd-mm-yyyy'#39'), :priority, '#39'Pending'#39')')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000004000000100000003A0043005200450057005F004900440003000000
      0000000000000000160000003A00530054004100520054005F00440041005400
      4500050000000000000000000000120000003A0045004E0044005F0044004100
      54004500050000000000000000000000120000003A005000520049004F005200
      490054005900030000000000000000000000}
    Left = 304
    Top = 224
  end
  object requestPriorityCheckQ: TOracleQuery
    SQL.Strings = (
      
        'select * from arda44.CREW_REQUEST where crew_id = :crew_id and r' +
        'equest_priority = :priority')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000002000000100000003A0043005200450057005F004900440003000000
      0000000000000000120000003A005000520049004F0052004900540059000300
      00000000000000000000}
    Left = 328
    Top = 144
  end
  object getRequestsByIdQ: TOracleQuery
    SQL.Strings = (
      'select firstName, '
      '       lastname,'
      '       request_id, '
      '       start_date, '
      '       end_date, '
      '       request_priority, '
      '       approved '
      'from CREW_REQUEST'
      'inner join employee'
      '     on  crew_request.crew_id = employee.id'
      'where employee.id = :id'
      'order by request_priority')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    Left = 328
    Top = 96
  end
end
