inherited ViewCidadesBuscar: TViewCidadesBuscar
  Caption = 'Cidades Buscar'
  ClientHeight = 566
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitHeight = 605
  TextHeight = 15
  inherited pnTopo: TPanel
    inherited edtBuscar: TEdit
      Width = 936
      ExplicitWidth = 932
    end
  end
  inherited pnGrid: TPanel
    Height = 459
    ExplicitHeight = 459
    inherited DBGrid1: TDBGrid
      Height = 439
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
          FieldName = 'UF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_IBGE'
          Visible = True
        end>
    end
    inherited pnTotal: TPanel
      Top = 439
      ExplicitTop = 438
    end
  end
  inherited pnRodape: TPanel
    Top = 516
    ExplicitTop = 516
    inherited rdGroupFiltros: TRadioGroup
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome (F2)'
        'UF (F3)')
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelCidadesDM.QCidadesBusca
    Left = 40
    Top = 89
  end
end
