unit userPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, dbConnection, creatUserPage,
  Vcl.ComCtrls, deleteUserPage, editUserPage;

type
  TuserForm = class(TForm)
    employeesTable: TStringGrid;
    createNewUserButton: TButton;
    updateButton: TButton;
    deleteUserButton: TButton;
    editUserButton: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure createNewUserButtonClick(Sender: TObject);
    procedure updateButtonClick(Sender: TObject);
    procedure deleteUserButtonClick(Sender: TObject);
    procedure editUserButtonClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    function fillTable(): boolean;
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
    userForm.fillTable();

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
     userForm.fillTable();
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

function TuserForm.fillTable(): boolean;
  var
    i : integer;
    j: integer;
  begin
    dbConnection.dbForm.employeesTableQ.Execute;
    i :=1;
    columnNames[0]:='id';
    columnNames[1]:='firstname';
    columnNames[2]:='lastname';
    columnNames[3]:='phone';
    columnNames[4]:='department';
    columnNames[5]:='email';
    while not dbConnection.dbForm.employeesTableQ.Eof do
      begin
          for j := 0 to 5 do
            begin
              userForm.employeesTable.Cells[j,i]  := dbConnection.dbForm.employeesTableQ.Field(columnNames[j]);
            end;
            i := i+1;
            userForm.employeesTable.RowCount := i;
            dbConnection.dbForm.employeesTableQ.Next;
      end;
  fillTable := True;
  dbConnection.dbForm.employeesTableQ.Close;
  end;
end.
