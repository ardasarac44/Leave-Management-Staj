unit editRequestPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXPickers, dbConnection, Oracle;

type
  TeditRequestForm = class(TForm)
    editRequestTable: TStringGrid;
    editStartDatePicker: TDatePicker;
    editEndDatePicker: TDatePicker;
    Shape1: TShape;
    editRadioButtonGroup: TRadioGroup;
    priorityRadioButton1: TRadioButton;
    priorityRadioButton2: TRadioButton;
    priorityRadioButton3: TRadioButton;
    editStartDateLabel: TLabel;
    editEndDateLabel: TLabel;
    editPriorityLabel: TLabel;
    editButton: TButton;
    procedure FormCreate(Sender: TObject);
    constructor Create(AOwner: TComponent; const userId, reqId : integer);reintroduce;
    function checkAvailableRequests(): boolean;
    function checkPriority(): integer;
    procedure editButtonClick(Sender: TObject);
    procedure editRequest();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    m_userId: integer;
    m_reqId: integer;
  public
    { Public declarations }
  end;

var
  editRequestForm: TeditRequestForm;

implementation

{$R *.dfm}

constructor TeditRequestForm.Create(AOwner: TComponent; const userId, reqId : integer);
begin
  inherited Create(AOwner);
  Self.m_userId := userId;
  Self.m_reqId := reqId;
end;

procedure TeditRequestForm.editButtonClick(Sender: TObject);
var
  lpriority : integer;
begin
    lpriority := checkPriority();
    if (StrToInt(Self.editRequestTable.Cells[1,5]) = lpriority) then
    begin
      Self.editRequest();
    end
    else begin
      if not checkAvailableRequests() then
      begin
        ShowMessage('Edit failed! Choose different priority.');
      end
      else begin
        Self.editRequest();
      end;
    end;
end;

procedure TeditRequestForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Self.Free;
end;

procedure TeditRequestForm.FormCreate(Sender: TObject);
var
  lEditRequestQuery : TOracleQuery;
  j: integer;
  Form: TForm;
begin

    Self.editRequestTable.Cells[0,0] := 'First Name';
    Self.editRequestTable.Cells[0,1] := 'Last Name';
    Self.editRequestTable.Cells[0,2] := 'Request ID';
    Self.editRequestTable.Cells[0,3] := 'Start Date';
    Self.editRequestTable.Cells[0,4] := 'End Date';
    Self.editRequestTable.Cells[0,5] := 'Priority';
    Self.editRequestTable.Cells[0,6] := 'Status';
    lEditRequestQuery :=  dbConnection.dbForm.getRequestByReqIdQ;
    lEditRequestQuery.setVariable('id', Self.m_userId);
    lEditRequestQuery.setVariable('req_id', Self.m_reqId);
    lEditRequestQuery.Execute;
    for j := 0 to 6 do
      begin
        Self.editRequestTable.Cells[1,j]  := lEditRequestQuery.Field(j);
      end;
    lEditRequestQuery.Close;
end;

function TeditRequestForm.checkAvailableRequests(): boolean;
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

function TeditRequestForm.checkPriority(): integer;
  begin
    checkPriority := 0;
    if self.priorityRadioButton1.Checked	= True then
      checkPriority := 1;
    if self.priorityRadioButton2.Checked	= True then
      checkPriority := 2;
    if self.priorityRadioButton3.Checked	= True then
      checkPriority := 3;
  end;


procedure TeditRequestForm.editRequest();
begin
  try
      with dbConnection.dbForm.editRequestQ do
      begin
          SetVariable('req_id', Self.m_reqId);
          SetVariable('start_date', DateToStr(Self.editStartDatePicker.Date));
          SetVariable('end_date', DateToStr(Self.editEndDatePicker.Date));
          SetVariable('priority', checkPriority());
          Execute;
          ShowMessage('Edit successful!');
      end;
      except
      begin
         ShowMessage('Edit failed!');
      end;
    end;
end;
end.
