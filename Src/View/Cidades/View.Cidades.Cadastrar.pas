unit View.Cidades.Cadastrar;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  View.Herancas.Cadastrar,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Model.Cidades.DM,
  Vcl.Mask,
  Vcl.DBCtrls,
  RTTI.FieldName;

type
  TViewCidadesCadastrar = class(TViewHerancasCadastrar)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigo: TDBEdit;

    [FieldName('CODIGO_IBGE')]
    edtCodigoIBGE: TDBEdit;

    [FieldName('NOME')]
    edtNome: TDBEdit;

    [FieldName('UF')]
    cBoxUF: TDBComboBox;
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

uses
  Exceptions.FieldName,
  Utils;

procedure TViewCidadesCadastrar.FormShow(Sender: TObject);
begin
  inherited;

  ModelCidadesDM.CadastrarGet(idRegistroAlterar);

  if (DataSource1.DataSet.IsEmpty) then begin
    DataSource1.DataSet.Append;
  end else begin
    DataSource1.DataSet.Edit;
  end;

  edtNome.SetFocus;
end;

procedure TViewCidadesCadastrar.btnGravarClick(Sender: TObject);
begin
  try
    DataSource1.DataSet.Post;
  except
    on E: ExceptionsFieldName do begin
      TUtils.tratarExceptionFieldName(Self, E);
    end;
  end;

  // Herda l�gica padr�o
  inherited;
end;

end.
