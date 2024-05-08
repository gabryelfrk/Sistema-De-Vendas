unit View.Pessoas.Cadastrar;

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
  Data.DB, Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Model.Pessoas.DM,
  RTTI.FieldName,
  Exceptions.FieldName,
  Utils;

type
  TViewPessoasCadastrar = class(TViewHerancasCadastrar)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtNome: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    edtCidade: TEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPessoasCadastrar: TViewPessoasCadastrar;

implementation

{$R *.dfm}

procedure TViewPessoasCadastrar.btnGravarClick(Sender: TObject);
begin
  try
    DataSource1.DataSet.Post;
  except
    on E: ExceptionsFieldName do
    begin
      TUtils.tratarExceptionFieldName(Self, E);
    end;
  end;

  // Herda lógica padrão
  inherited;
end;

procedure TViewPessoasCadastrar.FormShow(Sender: TObject);
begin
  inherited;

  ModelPessoasDM.CadastrarGet(idRegistroAlterar);

  if (DataSource1.DataSet.IsEmpty) then
  begin
    DataSource1.DataSet.Append;
  end
  else
  begin
    DataSource1.DataSet.Edit;
  end;

  edtNome.SetFocus;
end;

end.

