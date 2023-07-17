unit creatUserPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dbConnection;

type
  TcreateNewUser = class(TForm)
    firstNameLabel: TLabel;
    lastNameLabel: TLabel;
    phoneLabel: TLabel;
    departmentLabel: TLabel;
    emailLabel: TLabel;
    firstNameBox: TEdit;
    lastNameBox: TEdit;
    phoneBox: TEdit;
    departmentBox: TEdit;
    emailBox: TEdit;
    Button1: TButton;
    userNameLabel: TLabel;
    passwordLabel: TLabel;
    userNameBox: TEdit;
    passwordBox: TEdit;
    passwordAgainBox: TEdit;
    paswordAgainLabel: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure phoneBoxClick(Sender: TObject);
  private
    function getUserId(): integer;
    function checkPasswordBoxes(): boolean;
    procedure insertUserCrewDatabase();
    procedure insertUserLoginDatabase();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  createNewUser: TcreateNewUser;

implementation

{$R *.dfm}





procedure TcreateNewUser.Button1Click(Sender: TObject);
begin
  if Self.checkPasswordBoxes() then
  begin
    Self.insertUserCrewDatabase;
    Self.insertUserLoginDatabase;
    ShowMessage('User successfully created.');
    Self.Free;
  end
  else
  begin
    ShowMessage('Passwords are not matched, try again.');
  end;
end;


function TcreateNewUser.getUserId(): Integer;
begin
   getUserId := -1;
   try
      with dbConnection.dbForm.getUserIdQ do
        begin
           SetVariable('firstname', firstNameBox.Text);
           SetVariable('lastname', lastNameBox.Text);
           SetVariable('phone', phoneBox.Text);
           SetVariable('department', departmentBox.Text);
           SetVariable('email', emailBox.Text);
           Execute;
           getUserId := Field(0);
        end;

      except
        ShowMessage('Error occured while adding new user.');
    end;
    dbConnection.dbForm.getUserIdQ.Close;
end;

function TcreateNewUser.checkPasswordBoxes(): boolean;
begin
  checkPasswordBoxes := False;
  if Self.passwordBox.Text = Self.passwordAgainBox.Text then
  begin
    checkPasswordBoxes := True;
  end;

end;


procedure TcreateNewUser.insertUserCrewDatabase();
begin
     try
      with dbConnection.dbForm.insertUserQ do
        begin
           SetVariable('firstname', firstNameBox.Text);
           SetVariable('lastname', lastNameBox.Text);
           SetVariable('phone', phoneBox.Text);
           SetVariable('department', departmentBox.Text);
           SetVariable('email', emailBox.Text);
           Execute;
        end;

      except
        ShowMessage('Error occured while adding new user.');
    end;
    dbConnection.dbForm.insertUserQ.Close;
end;


procedure TcreateNewUser.insertUserLoginDatabase();
begin
    try
      with dbConnection.dbForm.insertNewUserLoginQ do
        begin
           SetVariable('user_id', Self.getUserId());
           SetVariable('user_name', Self.userNameBox.Text);
           SetVariable('user_password', Self.passwordBox.Text);
           Execute;
        end;
      except
        ShowMessage('Error occured while adding new user.');
    end;
    dbConnection.dbForm.insertNewUserLoginQ.Close;
end;




procedure TcreateNewUser.phoneBoxClick(Sender: TObject);
begin
  Self.phoneBox.Text := '';
end;

procedure TcreateNewUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Self.Free;
end;

end.
