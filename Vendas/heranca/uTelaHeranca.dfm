object frmTelaHeranca: TfrmTelaHeranca
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Informe aqui o titulo'
  ClientHeight = 452
  ClientWidth = 825
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 825
    Height = 411
    ActivePage = tabListagem
    Align = alClient
    TabOrder = 0
    object tabListagem: TTabSheet
      Caption = 'Listagem'
      object pnlListagemTop: TPanel
        Left = 0
        Top = 0
        Width = 817
        Height = 49
        Align = alTop
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 0
      end
      object grdListagem: TDBGrid
        Left = 0
        Top = 49
        Width = 817
        Height = 334
        Align = alClient
        DataSource = dtsListagem
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object btnPesquisar: TBitBtn
        Left = 307
        Top = 10
        Width = 78
        Height = 25
        Caption = '&Pesquisar'
        TabOrder = 2
      end
      object mskPesquisar: TMaskEdit
        Left = 19
        Top = 12
        Width = 282
        Height = 21
        TabOrder = 3
        Text = 'Digite sua Pesquisa'
      end
    end
    object tabManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 411
    Width = 825
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnNovo: TBitBtn
      Left = 13
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnAlterar: TBitBtn
      Left = 94
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnCancelar: TBitBtn
      Left = 175
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnExcluir: TBitBtn
      Left = 337
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 3
      OnClick = btnExcluirClick
    end
    object btnGravar: TBitBtn
      Left = 256
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 4
      OnClick = btnGravarClick
    end
    object btnSair: TBitBtn
      Left = 740
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 5
      OnClick = btnSairClick
    end
    object btnNavigator: TDBNavigator
      Left = 418
      Top = 6
      Width = 224
      Height = 25
      DataSource = dtsListagem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 6
    end
  end
  object QryListagem: TZQuery
    Params = <>
    Left = 440
    Top = 24
  end
  object dtsListagem: TDataSource
    DataSet = QryListagem
    Left = 504
    Top = 25
  end
end
