inherited ViewCidadesCadastrar: TViewCidadesCadastrar
  Caption = 'Cidades Cadastrar/Alterar'
  ClientHeight = 342
  ClientWidth = 659
  OnShow = FormShow
  ExplicitWidth = 671
  ExplicitHeight = 380
  TextHeight = 15
  inherited pnDados: TPanel
    Width = 659
    Height = 301
    ExplicitWidth = 655
    ExplicitHeight = 300
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
      TabOrder = 3
    end
    object edtNome: TDBEdit
      Left = 8
      Top = 80
      Width = 650
      Height = 23
      DataField = 'NOME'
      DataSource = DataSource1
      TabOrder = 1
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
      TabOrder = 2
    end
  end
  inherited pnRodape: TPanel
    Top = 301
    Width = 659
    ExplicitTop = 300
    ExplicitWidth = 655
    inherited btnGravar: TBitBtn
      Left = 398
      ExplicitLeft = 394
    end
    inherited btnCancelar: TBitBtn
      Left = 528
      ExplicitLeft = 524
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelCidadesDM.QCidadesCadastro
    Left = 376
    Top = 16
  end
end
