program Vendas;

uses
  Vcl.Forms,
  View.Principal in 'Src\View\View.Principal.pas' {ViewPrincipal},
  Model.Conexao.DM in 'Src\Model\Conexão\Model.Conexao.DM.pas' {ModelConexaoDM: TDataModule},
  Model.Cidades.DM in 'Src\Model\Cidades\Model.Cidades.DM.pas' {ModelCidadesDM: TDataModule},
  View.Herancas.Buscar in 'Src\View\Herancas\View.Herancas.Buscar.pas' {ViewHerancasBuscar},
  View.Cidades.Buscar in 'Src\View\Cidades\View.Cidades.Buscar.pas' {ViewCidadesBuscar},
  View.Herancas.Cadastrar in 'Src\View\Herancas\View.Herancas.Cadastrar.pas' {ViewHerancasCadastrar},
  View.Cidades.Cadastrar in 'Src\View\Cidades\View.Cidades.Cadastrar.pas' {ViewCidadesCadastrar},
  Model.Pessoas.DM in 'Src\Model\Pessoas\Model.Pessoas.DM.pas' {ModelPessoasDM: TDataModule},
  View.Pessoas.Buscar in 'Src\View\Pessoas\View.Pessoas.Buscar.pas' {ViewPessoasBuscar},
  Exceptions.FieldName in 'Src\Exceptions\Exceptions.FieldName.pas',
  RTTI.FieldName in 'Src\RTTI\RTTI.FieldName.pas',
  Utils in 'Src\Utils\Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Delphi: Sistema de vendas do zero ao multicamadas';
  Application.CreateForm(TModelConexaoDM, ModelConexaoDM);
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
