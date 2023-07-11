unit showRequestsPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, dbConnection, Oracle,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TusersRequestForm = class(TForm)
    requestsTable: TStringGrid;
    Shape1: TShape;
    deleteRequestButton: TButton;
    requestIdDeleteBox: TEdit;
    deleteIdLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure fillRequestsTable();
    constructor Create(AOwner: TComponent; const userId : integer);reintroduce;
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


constructor TusersRequestForm.Create(AOwner: TComponent; const userId: Integer);
begin
  inherited Create(AOwner);
  m_userId := userId;
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


procedure TusersRequestForm.fillRequestsTable();
var
  lRequestQuery : TOracleQuery;
  j,i : integer;
begin
  lRequestQuery :=  dbConnection.dbForm.getRequestsByIdQ;
  lRequestQuery.setVariable('id', m_userId);
  lRequestQuery.Execute;
  i := 1;
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
end.