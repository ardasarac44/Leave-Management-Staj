unit editUserPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, dbConnection;

type
  TeditUser = class(TForm)
    userGrid: TStringGrid;
    idBox: TEdit;
    queryButton: TButton;
    idBoxLabel: TLabel;
    firstNameBox: TEdit;
    lastNameBox: TEdit;
    phoneBox: TEdit;
    departmentBox: TEdit;
    emailBox: TEdit;
    firstNameEditLabel: TLabel;
    lastNameEditLabel: TLabel;
    phoneEditLabel: TLabel;
    departmentEditLabel: TLabel;
    emailEditLabel: TLabel;
    editButton: TButton;
    procedure queryButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure editButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  editUser: TeditUser;

implementation

{$R *.dfm}




procedure TeditUser.editButtonClick(Sender: TObject);

begin
    try
      with dbConnection.dbForm.editUserQ do
        begin
           SetVariable('id', Self.userGrid.Cells[1,0]);
           SetVariable('firstname', firstNameBox.Text);
           SetVariable('lastname', lastNameBox.Text);
           SetVariable('phone', phoneBox.Text);
           SetVariable('department', departmentBox.Text);
           SetVariable('email', emailBox.Text);
           Execute;

        end;
      except
        begin
          ShowMessage('Edit failed!');
        end;
    end;
    dbConnection.dbForm.editUserQ.Close;
    Self.Free;
end;

procedure TeditUser.FormCreate(Sender: TObject);
begin
    Self.userGrid.Cells[0,0] := 'ID';
    Self.userGrid.Cells[0,1] := 'First Name';
    Self.userGrid.Cells[0,2] := 'Last Name';
    Self.userGrid.Cells[0,3] := 'Phone';
    Self.userGrid.Cells[0,4] := 'Department';
    Self.userGrid.Cells[0,5] := 'E-mail';
end;

procedure TeditUser.queryButtonClick(Sender: TObject);
var
  j: integer;
begin
  try
      with dbConnection.dbForm.getEmployeeByIdQ do
        begin
           SetVariable('id', idBox.Text);
           Execute;
            for j := 0 to 5 do
            begin
              Self.userGrid.Cells[1,j]  := dbConnection.dbForm.getEmployeeByIdQ.Field(j);

            end;
        end;
      except
        ShowMessage('User not found!');
    end;
    dbConnection.dbForm.getEmployeeByIdQ.Close;
    Self.firstNameBox.Text :=  Self.userGrid.Cells[1,1];
    Self.lastNameBox.Text :=  Self.userGrid.Cells[1,2];
    Self.phoneBox.Text :=  Self.userGrid.Cells[1,3];
    Self.departmentBox.Text :=  Self.userGrid.Cells[1,4];
    Self.emailBox.Text :=  Self.userGrid.Cells[1,5];
end;

end.
