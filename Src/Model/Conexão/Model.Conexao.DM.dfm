object ModelConexaoDM: TModelConexaoDM
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=curso_vendas'
      'User_Name=root'
      'Password=larissa'
      'Server=127.0.0.1 '
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 56
    Top = 32
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 64
    Top = 96
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\projetos\Vendas\libmySQL.dll'
    Left = 64
    Top = 168
  end
end
