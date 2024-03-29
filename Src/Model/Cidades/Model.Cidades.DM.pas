unit Model.Cidades.DM;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Model.Conexao.DM;

type
  TModelCidadesDM = class(TDataModule)
    QCidadesCadastro: TFDQuery;
    QCidadesBusca: TFDQuery;
    QCidadesCadastroNOME: TStringField;
    QCidadesCadastroUF: TStringField;
    QCidadesCadastroCODIGO_IBGE: TIntegerField;
    QCidadesBuscaID: TFDAutoIncField;
    QCidadesBuscaNOME: TStringField;
    QCidadesBuscaUF: TStringField;
    QCidadesBuscaCODIGO_IBGE: TIntegerField;
    QCidadesCadastroID: TFDAutoIncField;
    procedure QCidadesCadastroBeforePost(DataSet: TDataSet);
  private
  public
    procedure CidadesBuscar(const condicao : string);
    procedure CadastrarGet(const idCidade : integer);
    procedure ValidarDadosQueryCadastro;
  end;

var
  ModelCidadesDM: TModelCidadesDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Exceptions.FieldName;

{ TModelCidadesDM }

procedure TModelCidadesDM.CadastrarGet(const idCidade: integer);
begin
  QCidadesCadastro.Close;
  QCidadesCadastro.SQL.Clear;
  QCidadesCadastro.SQL.Add('SELECT * FROM CIDADES');
  QCidadesCadastro.SQL.Add('WHERE (ID = :idCidade)');
  QCidadesCadastro.ParamByName('idCidade').AsInteger := idCidade;
  QCidadesCadastro.Open;
end;

procedure TModelCidadesDM.CidadesBuscar(const condicao: string);
begin
  QCidadesBusca.Close;
  QCidadesBusca.SQL.Clear;
  QCidadesBusca.SQL.Add('SELECT * FROM CIDADES');
  QCidadesBusca.SQL.Add(condicao);
  QCidadesBusca.Open;
end;

procedure TModelCidadesDM.QCidadesCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidarDadosQueryCadastro;
end;

procedure TModelCidadesDM.ValidarDadosQueryCadastro;
begin
  if (QCidadesCadastroNOME.AsString.Trim.IsEmpty) then begin
    raise ExceptionsFieldName.Create('Preencha o campo nome!', 'NOME');
  end;

  if (QCidadesCadastroUF.AsString.Trim.IsEmpty) then begin
    raise ExceptionsFieldName.Create('Preencha o campo UF!', 'UF');
  end;

  if (QCidadesCadastroCODIGO_IBGE.AsInteger > 0) then begin
    if (Length(QCidadesCadastroCODIGO_IBGE.AsString) <> 7) then begin
      raise ExceptionsFieldName.Create('C�digo IBGE deve conter 7 caracteres!', 'CODIGO_IBGE');
    end;
  end;
end;

end.
