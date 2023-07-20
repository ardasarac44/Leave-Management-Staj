unit showRequestsPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, dbConnection, Oracle,
  Vcl.StdCtrls, Vcl.ExtCtrls, editRequestPage;

type
  TusersRequestForm = class(TForm)
    requestsTable: TStringGrid;
    Shape1: TShape;
    deleteRequestButton: TButton;
    requestIdDeleteBox: TEdit;
    deleteIdLabel: TLabel;
    editRequestButton: TButton;
    Shape2: TShape;
    requestIdEditBox: TEdit;
    editIdLabel: TLabel;
    updateRequestsButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure fillRequestsTable();
    constructor Create(AOwner: TComponent; const userId : integer);reintroduce;
    procedure editRequestButtonClick(Sender: TObject);
    function getRequestStatus(requestId: integer): string;
    procedure requestIdEditBoxClick(Sender: TObject);
    procedure requestIdDeleteBoxClick(Sender: TObject);
    procedure deleteRequestButtonClick(Sender: TObject);
    function checkRequestId(request : integer): boolean;
    function isApproved(requestId: integer): boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure updateRequestsButtonClick(Sender: TObject);
  private
    { Private declarations }
    m_userId: integer;
  public
    { Public declarations }
  end;

var
  usersRequestForm: TusersRequestForm;

implementation

{$R *.dfm}


function TusersRequestForm.getRequestStatus(requestId: integer): string;
begin
  getRequestStatus := '';
  dbConnection.dbForm.getRequestStatusQ.SetVariable('req_id', requestId);
  dbConnection.dbForm.getRequestStatusQ.Execute;
  getRequestStatus :=  dbConnection.dbForm.getRequestStatusQ.Field(0);
end;

constructor TusersRequestForm.Create(AOwner: TComponent; const userId: Integer);
begin
  inherited Create(AOwner);
  m_userId := userId;
end;



procedure TusersRequestForm.deleteRequestButtonClick(Sender: TObject);
var
  req_id: integer;
  deleteNotification: string;
begin
  req_id := StrToInt(Self.requestIdDeleteBox.Text);
  deleteNotification := 'Are you sure you want to delete Request ' +  IntToStr(req_id);
  if checkRequestId(req_id) then
  begin
    if not isApproved(req_id)  then
    begin
      if Vcl.Dialogs.MessageDlg(deleteNotification,
      mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
      begin
        dbConnection.dbForm.deleteRequestQ.SetVariable('req_id', req_id);
        dbConnection.dbForm.deleteRequestQ.SetVariable('crew_id', m_userId);
        dbConnection.dbForm.deleteRequestQ.Execute;
        dbConnection.dbForm.deleteRequestQ.Close;
      end;
    end else
    begin
      ShowMessage('Approved request cannot be deleted.');
    end;
  end else
  begin
  ShowMessage('Enter valid request ID.');
  end;
  Self.fillRequestsTable;
end;

procedure TusersRequestForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Self.Free;
end;

procedure TusersRequestForm.FormCreate(Sender: TObject);
begin
    Self.requestsTable.ColWidths[2] := 70;
    Self.requestsTable.ColWidths[5] := 60;
    Self.requestsTable.Cells[0,0] := 'First Name';
    Self.requestsTable.Cells[1,0] := 'Last Name';
    Self.requestsTable.Cells[2,0] := 'Request ID';
    Self.requestsTable.Cells[3,0] := 'Start Date';
    Self.requestsTable.Cells[4,0] := 'End Date';
    Self.requestsTable.Cells[5,0] := 'Priority';
    Self.requestsTable.Cells[6,0] := 'Status';
    Self.fillRequestsTable;
end;



procedure TusersRequestForm.requestIdDeleteBoxClick(Sender: TObject);
begin
  Self.requestIdDeleteBox.Text := '';
end;

procedure TusersRequestForm.requestIdEditBoxClick(Sender: TObject);
begin
  Self.requestIdEditBox.Text := '';
end;

procedure TusersRequestForm.updateRequestsButtonClick(Sender: TObject);
begin
    Self.fillRequestsTable;
end;

procedure TusersRequestForm.editRequestButtonClick(Sender: TObject);
var
  lEditRequestForm: TeditRequestForm;
begin
    if checkRequestId(StrToInt(Self.requestIdEditBox.Text)) and (getRequestStatus(StrToInt(Self.requestIdEditBox.Text)) = 'Pending')  then
    begin
      lEditRequestForm := TeditRequestForm.Create(Self,Self.m_userId, StrToInt(Self.requestIdEditBox.Text));
      lEditRequestForm.BringToFront;
      lEditRequestForm.Name := 'editRequestForm';
      lEditRequestForm.Show;
    end else
    begin
      ShowMessage('Enter valid request ID.'+sLineBreak+'You can only edit pending requests.');
    end;
end;

procedure TusersRequestForm.fillRequestsTable();
var
  lRequestQuery : TOracleQuery;
  j,i : integer;
begin
  lRequestQuery :=  dbConnection.dbForm.getRequestsByIdQ;
  lRequestQuery.setVariable('id', m_userId);
  lRequestQuery.Execute;
  i := 1;
  Self.requestsTable.RowCount := 1;
  while not lRequestQuery.Eof do
  begin
    Self.requestsTable.RowCount := i+1;
    for j := 0 to 6 do
      begin
        Self.requestsTable.Cells[j,i]  := lRequestQuery.Field(j);
      end;
    lRequestQuery.Next;
    i := i+1;
  end;
  lRequestQuery.Close;
end;

function TusersRequestForm.checkRequestId(request : integer): boolean;
var
  i: Integer;
begin
     checkRequestId := False;
     for i := 1 to requestsTable.RowCount - 1 do
     begin
       if StrToInt(requestsTable.Cells[2,i]) = request then
       begin
         checkRequestId := True;
       end;
     end;
end;


function TusersRequestForm.isApproved(requestId: integer): boolean;
begin
  isApproved := False;
  dbConnection.dbForm.getRequestStatusQ.SetVariable('req_id', requestId);
  dbConnection.dbForm.getRequestStatusQ.Execute;
  if dbConnection.dbForm.getRequestStatusQ.Field(0) = 'Approved' then
  begin
    isApproved := True;
  end;
  dbConnection.dbForm.getRequestStatusQ.Close;
end;

end.
