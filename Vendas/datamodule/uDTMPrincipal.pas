unit uDTMPrincipal;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection;

type
  TdtmConnPrincipal = class(TDataModule)
    Conn: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmConnPrincipal: TdtmConnPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
