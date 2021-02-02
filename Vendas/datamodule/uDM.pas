unit uDM;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection;

type
  TdtmConn = class(TDataModule)
    Conn: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmConn: TdtmConn;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
