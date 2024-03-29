inherited ViewPessoasBuscar: TViewPessoasBuscar
  Caption = 'Pessoas Buscar'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  inherited pnTopo: TPanel
    inherited edtBuscar: TEdit
      ExplicitWidth = 940
    end
  end
  inherited pnGrid: TPanel
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FANTASIA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORNECEDOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_CIDADE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENDERECO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CELULAR'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CidadeNome'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF'
          Width = 64
          Visible = True
        end>
    end
    inherited pnTotal: TPanel
      inherited lbTotal: TLabel
        ExplicitLeft = 838
      end
    end
  end
  inherited pnRodape: TPanel
    inherited rdGroupFiltros: TRadioGroup
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome / Fantasia (F2)'
        'Cidade (F3)')
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelPessoasDM.QPessoasBusca
  end
end
