unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMPrincipal;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    Movimentao1: TMenuItem;
    Relatrio1: TMenuItem;
    Cliente1: TMenuItem;
    N1: TMenuItem;
    Categoria1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    menuSair: TMenuItem;
    Vendas1: TMenuItem;
    Cliente2: TMenuItem;
    N4: TMenuItem;
    Produto1: TMenuItem;
    N5: TMenuItem;
    VendaporData1: TMenuItem;
    procedure menuSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategoria;

procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
  frmCadCategoria := TfrmCadCategoria.Create(Self);
  frmCadCategoria.ShowModal;
  frmCadCategoria.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(dtmConnPrincipal);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
{
  dtmConn := TdtmConn.Create(Self);
  dtmConn.Conn.SQLHourGlass := True;
  dtmConn.Conn.Protocol := 'mssql';
  dtmConn.Conn.LibraryLocation := 'C:\Users\crmou\OneDrive\�rea de Trabalho\Projetos-Delphi\DelphiSqlServer\Vendas\ntwdblib.dll';
  dtmConn.Conn.HostName := 'DESKTOP-O2FSG9O';
  dtmConn.Conn.Port := 1433;
  dtmConn.Conn.User := '';
  dtmConn.Conn.Password := '';
  dtmConn.Conn.Database := 'dbVendas';
  dtmConn.Conn.Connected := true;
}
  dtmConnPrincipal := TdtmConnPrincipal.Create(Self);
  with dtmConnPrincipal.Conn do
    begin
      SQLHourGlass := True;
      Protocol := 'mssql';
      LibraryLocation := 'C:\Windows\SysWOW64\ntwdblib.dll\ntwdblib.dll';
      HostName := 'DESKTOP-O2FSG9O';
      Port := 1433;
      User := '';
      Password := '';
      Database := 'dbVendas';
      Connected := true;
    end;

end;

procedure TfrmPrincipal.menuSairClick(Sender: TObject);
begin
    //Close;
  Application.Terminate;
end;

end.
