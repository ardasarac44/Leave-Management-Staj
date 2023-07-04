unit loginPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dbConnection, userPage;

type
  TloginForm = class(TForm)
    usernameTextBox: TEdit;
    passwordTextBox: TEdit;
    usernameLabel: TLabel;
    passwordLabel: TLabel;
    loginButton: TButton;
    procedure loginButtonClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

    function checkAdminConnection(username, password : string): boolean;
  end;

var
  loginForm: TloginForm;

implementation

{$R *.dfm}


  procedure TloginForm.loginButtonClick(Sender: TObject);
  var
    lusername : string;
    lpassword : string;
  begin
       if usernameTextBox.Text <> '' then
       begin
       dbConnection.dbForm.userLoginTable.Execute;

       while not dbConnection.dbForm.userLoginTable.Eof do
         begin
            lusername := dbConnection.dbForm.userLoginTable.Field('username');
            lpassword := dbConnection.dbForm.userLoginTable.Field('password');
            if (lusername = usernameTextBox.Text) and (lpassword = passwordTextBox.Text) then
            begin
                 loginPage.loginForm.Free;
                 userPage.userForm.Show();
            end;
             dbConnection.dbForm.userLoginTable.Next;
         end;
       end;
       dbConnection.dbForm.userLoginTable.Close;
  end;

  function TloginForm.checkAdminConnection(username, password : string): boolean;
  begin
    if (username = 'admin') and (password = 'admin') then
    begin
      checkAdminConnection := True;
    end
    else begin
      checkAdminConnection := False;
    end;

  end;


end.


