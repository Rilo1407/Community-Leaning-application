unit dmComLearning_u;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmComLearning = class(TDataModule)
    dmComLearningdataBase: TADOConnection;
    tblUsers: TADOTable;
    dsrUsers: TDataSource;
    tblContent: TADOTable;
    tblTests: TADOTable;
    dsrContent: TDataSource;
    dsrTests: TDataSource;
    qryComLearning: TADOQuery;
    dsrComLearning: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmComLearning: TdmComLearning;

implementation

{$R *.dfm}

end.
