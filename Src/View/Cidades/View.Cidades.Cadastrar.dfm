inherited ViewCidadesCadastrar: TViewCidadesCadastrar
  Caption = 'Cidades Cadastrar/Alterar'
  ClientHeight = 276
  ClientWidth = 636
  OnShow = FormShow
  ExplicitWidth = 648
  ExplicitHeight = 314
  TextHeight = 15
  inherited pnDados: TPanel
    Width = 636
    Height = 235
    ExplicitWidth = 632
    ExplicitHeight = 234
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 38
      Height = 15
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 34
      Height = 15
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 112
      Width = 15
      Height = 15
      Caption = 'UF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 160
      Width = 66
      Height = 15
      Caption = 'C'#243'digo IBGE'
    end
    object edtCodigo: TDBEdit
      Left = 8
      Top = 32
      Width = 154
      Height = 23
      Color = clBtnFace
      DataField = 'ID'
      DataSource = DataSource1
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtCodigoIBGE: TDBEdit
      Left = 8
      Top = 176
      Width = 154
      Height = 23
      DataField = 'CODIGO_IBGE'
      DataSource = DataSource1
      TabOrder = 2
    end
    object cBoxUF: TDBComboBox
      Left = 8
      Top = 131
      Width = 145
      Height = 23
      Style = csDropDownList
      DataField = 'UF'
      DataSource = DataSource1
      DropDownCount = 28
      Items.Strings = (
        'AC'
        'AL'
        'AM'
        'AP'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MG'
        'MS'
        'MT'
        'PA'
        'PB'
        'PE'
        'PI'
        'PR'
        'RJ'
        'RN'
        'RO'
        'RR'
        'RS'
        'SC'
        'SE'
        'SP'
        'TO'
        'EX')
      TabOrder = 1
    end
    object edtNome: TDBEdit
      Left = 8
      Top = 83
      Width = 561
      Height = 23
      DataField = 'NOME'
      DataSource = DataSource1
      TabOrder = 3
    end
  end
  inherited pnRodape: TPanel
    Top = 235
    Width = 636
    ExplicitTop = 234
    ExplicitWidth = 632
    inherited btnGravar: TBitBtn
      Left = 375
      ExplicitLeft = 371
    end
    inherited btnCancelar: TBitBtn
      Left = 505
      ExplicitLeft = 501
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelCidadesDM.QCidadesCadastro
    Left = 376
    Top = 16
  end
end
