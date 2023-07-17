unit deleteUserPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, dbConnection;

type
  TdeleteUser = class(TForm)
    idBox: TEdit;
    searchByIdButton: TButton;
    employeeGrid: TStringGrid;
    queryByNameLabel: TLabel;
    queryByIdLabel: TLabel;
    firstNameBox: TEdit;
    lastNameBox: TEdit;
    searchByNameButton: TButton;
    deleteButton: TButton;
    procedure searchByIdButtonClick(Sender: TObject);
    procedure lastNameBoxClick(Sender: TObject);
    procedure firstNameBoxClick(Sender: TObject);
    procedure idBoxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure searchByNameButtonClick(Sender: TObject);
    procedure deleteButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  deleteUser: TdeleteUser;

implementation

{$R *.dfm}







procedure TdeleteUser.deleteButtonClick(Sender: TObject);
begin
  try
      with dbConnection.dbForm.deleteUserWithIdQ do
        begin
          if Self.employeeGrid.Cells[0,1] <> '' then
            begin
                SetVariable('id', Self.employeeGrid.Cells[0,1]);
                Execute;
            end;
        end;
      except
        ShowMessage('User not found!');
    end;
    dbConnection.dbForm.deleteUserWithIdQ.Close;
    Self.Free;
end;



procedure TdeleteUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Self.Free;
end;

procedure TdeleteUser.FormCreate(Sender: TObject);
begin
    Self.employeeGrid.Cells[0,0] := 'ID';
    Self.employeeGrid.Cells[1,0] := 'First Name';
    Self.employeeGrid.Cells[2,0] := 'Last Name';
    Self.employeeGrid.Cells[3,0] := 'Phone';
    Self.employeeGrid.Cells[4,0] := 'Department';
    Self.employeeGrid.Cells[5,0] := 'E-mail';
    Self.employeeGrid.ColWidths[0] := 50;
    Self.employeeGrid.ColWidths[4] := 95;
    Self.employeeGrid.ColWidths[5] := 120;
end;

procedure TdeleteUser.idBoxClick(Sender: TObject);
begin
    Self.idBox.Text := '';
end;

procedure TdeleteUser.lastNameBoxClick(Sender: TObject);
begin
   Self.lastNameBox.Text := '';
end;

procedure TdeleteUser.firstNameBoxClick(Sender: TObject);
begin
   Self.firstNameBox.Text := '';
end;


procedure TdeleteUser.searchByIdButtonClick(Sender: TObject);
var
  j : integer;
begin
  try
      with dbConnection.dbForm.getEmployeeByIdQ do
        begin
           SetVariable('id', idBox.Text);
           Execute;
            for j := 0 to 5 do
            begin
              Self.employeeGrid.Cells[j,1]  := dbConnection.dbForm.getEmployeeByIdQ.Field(j);
            end;
        end;
      except
        ShowMessage('User not found!');
    end;
    dbConnection.dbForm.getEmployeeByIdQ.Close;
end;

procedure TdeleteUser.searchByNameButtonClick(Sender: TObject);
var
  j : integer;
begin
    try
      with dbConnection.dbForm.getEmployeeByNameQ do
        begin
           SetVariable('firstname', firstNameBox.Text);
           SetVariable('lastname', lastNameBox.Text);
           Execute;
            for j := 0 to 5 do
            begin
              Self.employeeGrid.Cells[j,1]  := dbConnection.dbForm.getEmployeeByNameQ.Field(j);
            end;
        end;
      except
        ShowMessage('User not found!');
    end;
    dbConnection.dbForm.getEmployeeByNameQ.Close;
end;

end.
