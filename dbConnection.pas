unit dbConnection;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Oracle, Data.DB, OracleData;

type
  TdbForm = class(TForm)
    OracleDataSet1: TOracleDataSet;
    OracleSession1: TOracleSession;
    DataSource1: TDataSource;
    userLoginTable: TOracleQuery;
    employeesTableQ: TOracleQuery;
    insertUserQ: TOracleQuery;
    getNumberOfUsersQ: TOracleQuery;
    deleteUserWithIdQ: TOracleQuery;
    getEmployeeByIdQ: TOracleQuery;
    getEmployeeByNameQ: TOracleQuery;
    editUserQ: TOracleQuery;
    selectUsersQ: TOracleQuery;
    searchByNameQ: TOracleQuery;
    searchByLastNameQ: TOracleQuery;
    searchByIdQ: TOracleQuery;
    searchByDepartmentQ: TOracleQuery;
    requestLeaveQ: TOracleQuery;
    requestPriorityCheckQ: TOracleQuery;
    getRequestsByIdQ: TOracleQuery;
    getRequestByReqIdQ: TOracleQuery;
    editRequestQ: TOracleQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dbForm: TdbForm;

implementation

{$R *.dfm}








end.
