program Project1;

uses
  Vcl.Forms,
  dbConnection in 'dbConnection.pas' {dbForm},
  loginPage in 'loginPage.pas' {loginForm},
  userPage in 'userPage.pas' {userForm},
  creatUserPage in 'creatUserPage.pas' {createNewUser},
  deleteUserPage in 'deleteUserPage.pas' {deleteUser},
  editUserPage in 'editUserPage.pas' {editUser},
  leaveRequestPage in 'leaveRequestPage.pas' {leaveRequestForm},
  showRequestsPage in 'showRequestsPage.pas' {usersRequestForm},
  editRequestPage in 'editRequestPage.pas' {editRequestForm},
  adminRequestControlPage in 'adminRequestControlPage.pas' {controlRequestsForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TloginForm, loginForm);
  Application.CreateForm(TdbForm, dbForm);
  Application.CreateForm(TuserForm, userForm);
  Application.CreateForm(TcreateNewUser, createNewUser);
  Application.CreateForm(TdeleteUser, deleteUser);
  Application.CreateForm(TeditUser, editUser);
  Application.CreateForm(TusersRequestForm, usersRequestForm);
  Application.Run;
end.
