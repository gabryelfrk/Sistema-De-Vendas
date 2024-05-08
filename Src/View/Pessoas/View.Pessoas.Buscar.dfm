inherited ViewPessoasBuscar: TViewPessoasBuscar
  Caption = 'Pessoas Buscar'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 1011
  ExplicitHeight = 603
  TextHeight = 15
  inherited pnTopo: TPanel
    ExplicitWidth = 995
    inherited edtBuscar: TEdit
      ExplicitWidth = 928
    end
  end
  inherited pnGrid: TPanel
    inherited DBGrid1: TDBGrid
      Width = 999
      Height = 437
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENDERECO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CELULAR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CidadeNome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF'
          Visible = True
        end>
    end
    inherited pnTotal: TPanel
      Top = 437
      Width = 999
      inherited lbTotal: TLabel
        Left = 834
        Height = 19
      end
    end
  end
  inherited pnRodape: TPanel
    inherited rdGroupFiltros: TRadioGroup
      Width = 593
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome / Fantasia (F2)'
        'Cidade (F3)')
    end
    inherited btnCadastrar: TBitBtn
      Left = 594
    end
    inherited btnUtilizar: TBitBtn
      Left = 796
    end
    inherited btnFechar: TBitBtn
      Left = 897
    end
    inherited btnAlterar: TBitBtn
      Left = 695
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelPessoasDM.QPessoasBusca
  end
end
