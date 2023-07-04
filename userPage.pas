unit userPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, dbConnection, creatUserPage,
  Vcl.ComCtrls, deleteUserPage;

type
  TuserForm = class(TForm)
    professorsTable: TStringGrid;
    createNewUserButton: TButton;
    updateButton: TButton;
    deleteUserButton: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure createNewUserButtonClick(Sender: TObject);
    procedure updateButtonClick(Sender: TObject);
    procedure deleteUserButtonClick(Sender: TObject);

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

    userForm.professorsTable.Cells[0,0] := 'Id';
    userForm.professorsTable.Cells[1,0] := 'First Name';
    userForm.professorsTable.Cells[2,0] := 'Last Name';
    userForm.professorsTable.Cells[3,0] := 'Phone';
    userForm.professorsTable.Cells[4,0] := 'Department';
    userForm.professorsTable.Cells[5,0] := 'E-mail';
    userForm.fillTable();

  end;

  procedure TuserForm.updateButtonClick(Sender: TObject);
begin

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
              userForm.professorsTable.Cells[j,i]  := dbConnection.dbForm.employeesTableQ.Field(columnNames[j]);
            end;
            i := i+1;
            userForm.professorsTable.RowCount := i;
            dbConnection.dbForm.employeesTableQ.Next;
      end;
  fillTable := True;
  dbConnection.dbForm.employeesTableQ.Close;
  end;
end.
