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
  Vcl.DBCtrls;

type
  TViewCidadesCadastrar = class(TViewHerancasCadastrar)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigo: TDBEdit;
    edtCodigoIBGE: TDBEdit;
    edtNome: TDBEdit;
    cBoxUF: TDBComboBox;
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FidRegistroAlterar: integer;
  public
    property idRegistroAlterar: integer read FidRegistroAlterar write FidRegistroAlterar; // Controla se irá Alterar o registro ou se será Novo
  end;

implementation

{$R *.dfm}

procedure TViewCidadesCadastrar.FormCreate(Sender: TObject);
begin
  inherited;

  FIdRegistroAlterar := 0;
end;

procedure TViewCidadesCadastrar.FormShow(Sender: TObject);
begin
  inherited;

  ModelCidadesDM.CadastrarGet(FIdRegistroAlterar);

  if (DataSource1.DataSet.IsEmpty) then begin
    DataSource1.DataSet.Append;
  end else begin
    DataSource1.DataSet.Edit;
  end;

  edtNome.SetFocus;
end;

procedure TViewCidadesCadastrar.btnGravarClick(Sender: TObject);
begin
  if (Trim(edtNome.Text).IsEmpty) then begin
    edtNome.SetFocus;
    raise Exception.Create('Preencha o campo nome!');
  end;

  if (Trim(cBoxUF.Text).IsEmpty) then begin
    cBoxUF.SetFocus;
    raise Exception.Create('Preencha o campo UF!');
  end;

  if (not Trim(edtCodigoIBGE.Text).IsEmpty) then begin
    if (Length(edtCodigoIBGE.Text) <> 7) then begin
      edtCodigoIBGE.SetFocus;
      raise Exception.Create('Código IBGE deve conter 7 carácteres!');
    end;
  end;

  DataSource1.DataSet.Post;

  // Herda lógica padrão
  inherited;
end;

end.
