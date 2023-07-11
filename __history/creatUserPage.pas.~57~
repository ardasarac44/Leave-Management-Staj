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
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
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
    end;
    dbConnection.dbForm.insertUserQ.Close;
    Self.Free;
  end;


procedure TcreateNewUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Self.Free;
end;

end.
