object ModelPessoasDM: TModelPessoasDM
  Height = 242
  Width = 404
  object QPessoasCadastro: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'SELECT * FROM PESSOAS ')
    Left = 136
    Top = 56
    object QPessoasCadastroID: TFDAutoIncField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QPessoasCadastroNOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome/Raz'#227'o'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object QPessoasCadastroFANTASIA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Fantasia'
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 60
    end
    object QPessoasCadastroCLIENTE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      FixedChar = True
      Size = 1
    end
    object QPessoasCadastroFORNECEDOR: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      FixedChar = True
      Size = 1
    end
    object QPessoasCadastroCEP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object QPessoasCadastroID_CIDADE: TIntegerField
      DisplayLabel = 'C'#243'digo Cidade'
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
      Required = True
    end
    object QPessoasCadastroENDERECO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 60
    end
    object QPessoasCadastroNUMERO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object QPessoasCadastroBAIRRO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 40
    end
    object QPessoasCadastroCOMPLEMENTO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 40
    end
    object QPessoasCadastroTELEFONE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 15
    end
    object QPessoasCadastroCELULAR: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 15
    end
    object QPessoasCadastroEMAIL: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object QPessoasCadastroTIPO_JURIDICO: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Tipo Jur'#237'dico'
      FieldName = 'TIPO_JURIDICO'
      Origin = 'TIPO_JURIDICO'
    end
    object QPessoasCadastroCPF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 14
    end
    object QPessoasCadastroRG: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RG'
      Origin = 'RG'
      Size = 14
    end
    object QPessoasCadastroCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 18
    end
    object QPessoasCadastroIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IE'
      Origin = 'IE'
      Size = 14
    end
    object QPessoasCadastroATIVO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object QPessoasCadastroNASCIMENTO: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nascimento'
      FieldName = 'NASCIMENTO'
      Origin = 'NASCIMENTO'
    end
    object QPessoasCadastroDH_CADASTRO: TSQLTimeStampField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cadastro'
      FieldName = 'DH_CADASTRO'
      Origin = 'DH_CADASTRO'
    end
  end
  object QPessoasBusca: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT '
      'P.ID,'
      'P.NOME, '
      'P.FANTASIA, '
      'P.CLIENTE,'
      'P.FORNECEDOR,'
      'P.ID_CIDADE,'
      'P.ENDERECO,'
      'P.TELEFONE,'
      'P.CELULAR,'
      'C.NOME AS CidadeNome, '
      'C.UF'
      'FROM PESSOAS P'
      'INNER JOIN CIDADES C ON C.ID = P.ID_CIDADE'
      '')
    Left = 232
    Top = 72
    object QPessoasBuscaID: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QPessoasBuscaNOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object QPessoasBuscaFANTASIA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Fantasia'
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 60
    end
    object QPessoasBuscaCLIENTE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      FixedChar = True
      Size = 1
    end
    object QPessoasBuscaFORNECEDOR: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      FixedChar = True
      Size = 1
    end
    object QPessoasBuscaID_CIDADE: TIntegerField
      DisplayLabel = 'C'#243'd. Cidade'
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
      Required = True
    end
    object QPessoasBuscaENDERECO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 60
    end
    object QPessoasBuscaTELEFONE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 15
    end
    object QPessoasBuscaCELULAR: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 15
    end
    object QPessoasBuscaCidadeNome: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cidade'
      FieldName = 'CidadeNome'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QPessoasBuscaUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
  end
end
