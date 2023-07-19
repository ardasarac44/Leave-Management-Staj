unit leaveRequestPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids,dbConnection,
  Vcl.Menus, Vcl.WinXPickers, Vcl.ExtCtrls, showRequestsPage;

type
  TleaveRequestForm = class(TForm)
    requestButton: TButton;
    userGrid: TStringGrid;
    startDatePick: TDatePicker;
    endDatePick: TDatePicker;
    priorityButtonGroup: TRadioGroup;
    priorityButton1: TRadioButton;
    priorityButton2: TRadioButton;
    priorityButton3: TRadioButton;
    editRequestsButton: TButton;
    editRequestsLabel: TLabel;
    Shape1: TShape;
    endDateLabel: TLabel;
    startDateLabel: TLabel;
    priorityLabel: TLabel;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    constructor Create(AOwner: TComponent; const userId : integer);reintroduce;
    procedure requestButtonClick(Sender: TObject);
    function checkPriority(): integer;
    function checkAvailableRequests(): boolean;
    procedure insertRequest();
    procedure editRequestsButtonClick(Sender: TObject);
  private

    { Private declarations }
  public
    m_userId: integer;
    { Public declarations }
  end;

var
  leaveRequestForm: TleaveRequestForm;


implementation

{$R *.dfm}

constructor TleaveRequestForm.Create(AOwner: TComponent; const userId: Integer);
begin
  inherited Create(AOwner);
  m_userId := userId;
end;

procedure TleaveRequestForm.editRequestsButtonClick(Sender: TObject);
var
  lUsersRequestForm :TusersRequestForm;
  begin
    lUsersRequestForm := TusersRequestForm.Create(Self, Self.m_userId );
    lUsersRequestForm.BringToFront;
    lUsersRequestForm.Name := 'user_requests_page';
    lUsersRequestForm.Show;
  end;

procedure TleaveRequestForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TleaveRequestForm.FormCreate(Sender: TObject);
var
  j: integer;
    begin
        Self.userGrid.Cells[0,0] := 'ID';
        Self.userGrid.Cells[0,1] := 'First Name';
        Self.userGrid.Cells[0,2] := 'Last Name';
        Self.userGrid.Cells[0,3] := 'Phone';
        Self.userGrid.Cells[0,4] := 'E-mail';
        Self.userGrid.Cells[0,5] := 'Department';
        Self.userGrid.ColWidths[1] := 140;
      try
          with dbConnection.dbForm.getEmployeeByIdQ do
            begin
             SetVariable('id', Self.m_userId);
             Execute;
             for j := 0 to 5 do
                begin
                  Self.userGrid.Cells[1,j]  := dbConnection.dbForm.getEmployeeByIdQ.Field(j);

                end;
            end;
          except
            ShowMessage('User not found!');

        dbConnection.dbForm.getEmployeeByIdQ.Close;
      end;
    end;


procedure TleaveRequestForm.requestButtonClick(Sender: TObject);
var
  dt: TDate;
begin
  if checkAvailableRequests() then
  begin
    insertRequest();
  end
  else
  begin
    ShowMessage('Choose different priority or edit pending requests.');
  end;
  dbConnection.dbForm.requestLeaveQ.Close;
end;


function TleaveRequestForm.checkPriority(): integer;
  begin
    checkPriority := 0;
    if self.priorityButton1.Checked	= True then
      checkPriority := 1;
    if self.priorityButton2.Checked	= True then
      checkPriority := 2;
    if self.priorityButton3.Checked	= True then
      checkPriority := 3;
  end;
function TleaveRequestForm.checkAvailableRequests(): boolean;
  begin
    dbConnection.dbForm.requestPriorityCheckQ.SetVariable('crew_id', Self.m_userId);
    dbConnection.dbForm.requestPriorityCheckQ.SetVariable('priority', checkPriority());
    dbConnection.dbForm.requestPriorityCheckQ.Execute;
    checkAvailableRequests := True;
    if dbConnection.dbForm.requestPriorityCheckQ.Eof then
    begin
      checkAvailableRequests := True;
    end
    else
    begin
      checkAvailableRequests := False;
    end;
  end;


procedure TleaveRequestForm.insertRequest();
  begin
    try
      with dbConnection.dbForm.requestLeaveQ do
      begin
          SetVariable('crew_id', Self.m_userId);
          SetVariable('start_date', DateToStr(Self.startDatePick.Date));
          SetVariable('end_date', DateToStr(Self.endDatePick.Date));
          SetVariable('priority', checkPriority());
          Execute;
          ShowMessage('Request successful!');
      end;
      except
      begin
         ShowMessage('Request failed!');
      end;
    end;
  end;

end.
