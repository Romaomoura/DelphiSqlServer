unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset,uDTMPrincipal, uEnum;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    pnlListagemTop: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnSair: TBitBtn;
    btnNavigator: TDBNavigator;
    QryListagem: TZQuery;
    dtsListagem: TDataSource;
    lblIndicePesquisa: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
  private
    { Private declarations }
    EstadoDoCadastro: TEstadoDoCadastro;
    procedure ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                              btnExcluir : TBitBtn; btnNavigator:TDBNavigator;
                              pgcPrincipal:TPageControl; Flag:Boolean);
    procedure ControlaIndiceTab(pgcPrincipal: TPageControl; Indice: Integer);
    function RetornarCampo(Campo: string): string;
  public
    { Public declarations }
    IndiceAtual: string;
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}
//Procedimento para controle de tela
procedure TfrmTelaHeranca.ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                                          btnExcluir : TBitBtn; btnNavigator:TDBNavigator;
                                          pgcPrincipal:TPageControl; Flag:Boolean);
begin
  btnNovo.Enabled        := Flag;
  btnExcluir.Enabled     := Flag;
  btnAlterar.Enabled     := Flag;
  btnNavigator.Enabled   := Flag;
  pgcPrincipal.Pages[0].TabVisible := Flag;
  btnCancelar.Enabled     := not(Flag);
  btnGravar.Enabled       := not(Flag);

end;

procedure TfrmTelaHeranca.ControlaIndiceTab(pgcPrincipal:TPageControl; Indice: Integer);
begin
  if (pgcPrincipal.Pages[Indice].TabVisible) then
      pgcPrincipal.TabIndex := Indice;
end;

function TfrmTelaHeranca.RetornarCampo(Campo : string) : string;
var i : Integer;
begin
  for i := 0 to QryListagem.Fields.Count-1 do
    begin
      if QryListagem.Fields[i].FieldName = Campo then
        begin
          Result := QryListagem.Fields[i].DisplayLabel;
          Break
        end;
    end;

end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
 ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnExcluir,
                  btnNavigator, pgcPrincipal, false);
 EstadoDoCadastro := ecAlterar;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnExcluir,
                  btnNavigator, pgcPrincipal, true);
    ControlaIndiceTab(pgcPrincipal, 0);
    EstadoDoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.btnExcluirClick(Sender: TObject);
begin
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnExcluir,
                  btnNavigator, pgcPrincipal, true);
    ControlaIndiceTab(pgcPrincipal, 0);
    EstadoDoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  Try
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnExcluir,
                      btnNavigator, pgcPrincipal, true);
    ControlaIndiceTab(pgcPrincipal, 0);
    if (EstadoDoCadastro = ecInserir) then
      ShowMessage('Inserido')
    else if (EstadoDoCadastro = ecAlterar) then
      ShowMessage('Alterado')
    else
      ShowMessage('Nada aconteceu!')
  Finally
    EstadoDoCadastro := ecNenhum;
  End;
end;

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnExcluir,
                  btnNavigator, pgcPrincipal, false);
  EstadoDoCadastro := ecInserir;
end;

procedure TfrmTelaHeranca.btnSairClick(Sender: TObject);
begin
    Close();
end;

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
     QryListagem.Connection :=  dtmConnPrincipal.Conn;
     dtsListagem.DataSet := QryListagem;
     grdListagem.DataSource := dtsListagem;
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
  if (QryListagem.SQL.Text <> EmptyStr) then
  begin
    QryListagem.Open;
  end;

end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
 IndiceAtual := Column.FieldName;
 QryListagem.IndexFieldNames :=  IndiceAtual;
 lblIndicePesquisa.Caption := RetornarCampo(IndiceAtual);
end;

end.
