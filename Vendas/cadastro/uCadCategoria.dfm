inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categoria'
  ClientWidth = 746
  ExplicitWidth = 752
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 746
    inherited tabListagem: TTabSheet
      inherited pnlListagemTop: TPanel
        Width = 738
      end
      inherited grdListagem: TDBGrid
        Width = 738
        Columns = <
          item
            Expanded = False
            FieldName = 'categoriaId'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Visible = True
          end>
      end
    end
  end
  inherited pnlRodape: TPanel
    Width = 746
    inherited btnSair: TBitBtn
      Left = 661
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'select categoriaId, descricao'
      'from categorias;')
    object QryListagemcategoriaId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
  end
end
