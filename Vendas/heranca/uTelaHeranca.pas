unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset,uDTMPrincipal;

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
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                              btnExcluir : TBitBtn; btnNavigator:TDBNavigator;
                              pgcPrincipal:TPageControl; Flag:Boolean);
  public
    { Public declarations }
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

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
procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
 ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnExcluir,
                  btnNavigator, pgcPrincipal, false);
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
 ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnExcluir,
                  btnNavigator, pgcPrincipal, true);
end;

procedure TfrmTelaHeranca.btnExcluirClick(Sender: TObject);
begin
 ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnExcluir,
                  btnNavigator, pgcPrincipal, true);
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
 ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnExcluir,
                  btnNavigator, pgcPrincipal, true);
end;

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnExcluir,
                  btnNavigator, pgcPrincipal, false);
end;

procedure TfrmTelaHeranca.btnSairClick(Sender: TObject);
begin
    Close();
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
     QryListagem.Connection :=  dtmConnPrincipal.Conn;
     dtsListagem.DataSet := QryListagem;
     grdListagem.DataSource := dtsListagem;
end;

end.
