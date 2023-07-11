program Project1;

uses
  Vcl.Forms,
  dbConnection in 'dbConnection.pas' {dbForm},
  loginPage in 'loginPage.pas' {loginForm},
  userPage in 'userPage.pas' {userForm},
  creatUserPage in 'creatUserPage.pas' {createNewUser},
  deleteUserPage in 'deleteUserPage.pas' {deleteUser};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TloginForm, loginForm);
  Application.CreateForm(TdbForm, dbForm);
  Application.CreateForm(TuserForm, userForm);
  Application.CreateForm(TcreateNewUser, createNewUser);
  Application.CreateForm(TdeleteUser, deleteUser);
  Application.Run;
end.
