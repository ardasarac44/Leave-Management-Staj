unit userPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, dbConnection, creatUserPage,
  Vcl.ComCtrls, deleteUserPage, editUserPage, Vcl.ExtCtrls, Oracle, adminRequestControlPage;

type
  TuserForm = class(TForm)
    employeesTable: TStringGrid;
    createNewUserButton: TButton;
    updateButton: TButton;
    deleteUserButton: TButton;
    editUserButton: TButton;
    filterPanel: TPanel;
    filterButton: TButton;
    idBox: TEdit;
    firstNameBox: TEdit;
    departmentBox: TEdit;
    idLabel: TLabel;
    lastNameLabel: TLabel;
    firstNameLabel: TLabel;
    departmentLabel: TLabel;
    lastNameBox: TEdit;
    resetFilterButton: TButton;
    showRequestsButton: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure createNewUserButtonClick(Sender: TObject);
    procedure updateButtonClick(Sender: TObject);
    procedure deleteUserButtonClick(Sender: TObject);
    procedure editUserButtonClick(Sender: TObject);
    procedure filterButtonClick(Sender: TObject);
    procedure resetFilterButtonClick(Sender: TObject);
    procedure showRequestsButtonClick(Sender: TObject);


  private
    { Private declarations }
    function checkEmptyBox(filterBox : TEdit): boolean;
  public
    { Public declarations }
    function fillTable(tableQuery: TOracleQuery): boolean;
  end;
type
  TcolumnNames = array [0..5] of string;
var
  userForm: TuserForm;
  columnNames: TcolumnNames;

implementation

{$R *.dfm}

  procedure TuserForm.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    Application.Terminate;
  end;




  procedure TuserForm.FormCreate(Sender: TObject);
  begin
    userForm.employeesTable.ColWidths[0] := 60;
    userForm.employeesTable.ColWidths[5] := 140;
    userForm.employeesTable.Cells[0,0] := 'Id';
    userForm.employeesTable.Cells[1,0] := 'First Name';
    userForm.employeesTable.Cells[2,0] := 'Last Name';
    userForm.employeesTable.Cells[3,0] := 'Phone';
    userForm.employeesTable.Cells[4,0] := 'Department';
    userForm.employeesTable.Cells[5,0] := 'E-mail';
    userForm.fillTable(dbConnection.dbForm.employeesTableQ);

  end;

  procedure TuserForm.resetFilterButtonClick(Sender: TObject);
begin
  Self.idBox.Text := '';
  Self.firstNameBox.Text := '';
  Self.lastNameBox.Text := '';
  Self.departmentBox.Text := '';
  userForm.fillTable(dbConnection.dbForm.employeesTableQ);
end;

procedure TuserForm.showRequestsButtonClick(Sender: TObject);
var
    lcontrolRequests :TcontrolRequestsForm;
    begin
      lcontrolRequests := TcontrolRequestsForm.Create(Self);
      lcontrolRequests.BringToFront;
      lcontrolRequests.Name := 'control_requests_form';
      lcontrolRequests.Show;
end;

procedure TuserForm.updateButtonClick(Sender: TObject);
  var
    j: integer;
begin
     userForm.employeesTable.RowCount := 2;
     for j := 0 to 5 do
       begin
         userForm.employeesTable.Cells[j,1] := '';
       end;
     userForm.fillTable(dbConnection.dbForm.employeesTableQ);
end;

procedure TuserForm.createNewUserButtonClick(Sender: TObject);
  var
    lAddUserForm :TcreateNewUser;
    begin
      lAddUserForm := TcreateNewUser.Create(Self);
      lAddUserForm.BringToFront;
      lAddUserForm.Name := 'add_user_form';
      lAddUserForm.Show;
    end;

procedure TuserForm.deleteUserButtonClick(Sender: TObject);
  var
    lDeleteUserForm : TdeleteUser;
  begin
    lDeleteUserForm := TdeleteUser.Create(Self);
    lDeleteUserForm.BringToFront;
    lDeleteUserForm.Name := 'delete_user_form';
    lDeleteUserForm.Show;
  end;


procedure TuserForm.editUserButtonClick(Sender: TObject);
var
  lEditUserForm: TeditUser;
begin
    lEditUserForm := TeditUser.Create(Self);
    lEditUserForm.BringToFront;
    lEditUserForm.Name := 'editUserForm';
    lEditUserForm.Show;
end;

function TuserForm.fillTable(tableQuery: TOracleQuery): boolean;
  var
    i : integer;
    j: integer;
  begin
    try
      with tableQuery do
        begin
           Execute;
        end;

      except
        ShowMessage('Error occured while filling table.');
    end;
    columnNames[0]:='id';
    columnNames[1]:='firstname';
    columnNames[2]:='lastname';
    columnNames[3]:='phone';
    columnNames[4]:='department';
    columnNames[5]:='email';
    userForm.employeesTable.RowCount := 1;
    i := 1;
    while not tableQuery.Eof do
      begin
          userForm.employeesTable.RowCount := i+1;
          for j := 0 to 5 do
          begin
              userForm.employeesTable.Cells[j,i]  := tableQuery.Field(columnNames[j]);
          end;
          i := i+1;
          tableQuery.Next;
      end;
  fillTable := True;
  tableQuery.Close;
  end;
procedure TuserForm.filterButtonClick(Sender: TObject);
begin

      if Self.checkEmptyBox(idBox) then
        begin
          dbConnection.dbForm.getEmployeeFilterQ.SetVariable('id',StrToInt(Self.idBox.Text));
        end
        else
        begin
          dbConnection.dbForm.getEmployeeFilterQ.SetVariable('id',-1);
        end;
       if Self.checkEmptyBox(firstNameBox) then
        begin
          dbConnection.dbForm.getEmployeeFilterQ.SetVariable('firstname', Self.firstNameBox.Text);
        end
        else
        begin
          dbConnection.dbForm.getEmployeeFilterQ.SetVariable('firstname', 'None');
        end;
         if Self.checkEmptyBox(departmentBox) then
        begin
          dbConnection.dbForm.getEmployeeFilterQ.SetVariable('department', Self.departmentBox.Text);
        end
        else
        begin
          dbConnection.dbForm.getEmployeeFilterQ.SetVariable('department', 'None');
        end;
         if Self.checkEmptyBox(lastNameBox) then
        begin
          dbConnection.dbForm.getEmployeeFilterQ.SetVariable('lastname', Self.lastNameBox.Text);
        end
        else
        begin
          dbConnection.dbForm.getEmployeeFilterQ.SetVariable('lastname', 'None');
        end;

        fillTable(dbConnection.dbForm.getEmployeeFilterQ);

end;

function TuserForm.checkEmptyBox(filterBox : TEdit): boolean;
begin
    if filterBox.Text = '' then
      begin
        checkEmptyBox := False;
      end
     else
      begin
        checkEmptyBox := True;
      end;

end;

end.
