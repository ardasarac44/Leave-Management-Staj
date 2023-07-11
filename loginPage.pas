unit loginPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dbConnection, userPage, leaveRequestPage;

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

    function checkAdminConnection(username : string): boolean;
  end;

var
  loginForm: TloginForm;

implementation

{$R *.dfm}


  procedure TloginForm.loginButtonClick(Sender: TObject);
  var
    lusername : string;
    lpassword : string;
    lleaveRequestForm : TleaveRequestForm;
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
               loginPage.loginForm.Hide;
               if Self.checkAdminConnection(lusername) then
                 begin
                   userPage.userForm.Show();
                 end
               else
                 begin
                    lleaveRequestForm := TleaveRequestForm.Create(Self,dbConnection.dbForm.userLoginTable.Field('user_id'));
                    lleaveRequestForm.BringToFront;
                    lleaveRequestForm.Name := 'leave_request_form';
                    lleaveRequestForm.Show;
                 end;
              end;
               dbConnection.dbForm.userLoginTable.Next;
           end;
       end;
       dbConnection.dbForm.userLoginTable.Close;
  end;

  function TloginForm.checkAdminConnection(username : string): boolean;
  begin
    if (username = 'admin')  then
    begin
      checkAdminConnection := True;
    end
    else begin
      checkAdminConnection := False;
    end;

  end;


end.


