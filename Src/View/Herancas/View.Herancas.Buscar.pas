unit View.Herancas.Buscar;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Menus;

type
  TViewHerancasBuscar = class(TForm)
    pnTopo: TPanel;
    pnGrid: TPanel;
    pnRodape: TPanel;
    Label1: TLabel;
    edtBuscar: TEdit;
    rdGroupFiltros: TRadioGroup;
    btnCadastrar: TBitBtn;
    btnUtilizar: TBitBtn;
    btnFechar: TBitBtn;
    DBGrid1: TDBGrid;
    pnTotal: TPanel;
    lbTotal: TLabel;
    DataSource1: TDataSource;
    btnAlterar: TBitBtn;
    PopupMenu1: TPopupMenu;
    Atualizar1: TMenuItem;
    N1: TMenuItem;
    Excluir1: TMenuItem;
    procedure btnFecharClick(Sender: TObject);
    procedure btnUtilizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtBuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure edtBuscarChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rdGroupFiltrosClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure Atualizar1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
  private

  protected
    procedure BuscarDados; virtual;
    procedure ChamarTelaCadastrar(id: integer = 0); virtual; abstract; //  abstract pois n�o chama ela aqui, s� nas telas que herdam
  public
    { Public declarations }
  end;

var
  ViewHerancasBuscar: TViewHerancasBuscar;

implementation

{$R *.dfm}

procedure TViewHerancasBuscar.Atualizar1Click(Sender: TObject);
begin
  Self.BuscarDados;
end;

procedure TViewHerancasBuscar.btnAlterarClick(Sender: TObject);
begin

  // Tem registro selecionado no grid?
  if (DataSource1.DataSet.IsEmpty) then begin
    raise Exception.Create('Selecione um registro');
  end;

  Self.ChamarTelaCadastrar(DataSource1.DataSet.FieldByName('ID').AsInteger);
end;

procedure TViewHerancasBuscar.btnCadastrarClick(Sender: TObject);
begin
  Self.ChamarTelaCadastrar;
end;

procedure TViewHerancasBuscar.btnFecharClick(Sender: TObject);
begin
  Self.CloseModal;
  Self.ModalResult := mrCancel;
end;

procedure TViewHerancasBuscar.btnUtilizarClick(Sender: TObject);
begin

  // Tem registro selecionado no grid?
  if (DataSource1.DataSet.IsEmpty) then begin
    raise Exception.Create('Selecione um registro');
  end;

  Self.CloseModal;
  Self.ModalResult := mrOk;
end;

procedure TViewHerancasBuscar.edtBuscarChange(Sender: TObject);
begin
  Self.BuscarDados;
end;

procedure TViewHerancasBuscar.BuscarDados;
begin
  lbTotal.Caption := 'Registros Localizados: 000000';

  if (DataSource1.DataSet.IsEmpty) then begin  
    exit;
  end;

  lbTotal.Caption := 'Registros Localizados: ' + FormatFloat('000000', DataSource1.DataSet.RecordCount); 
end;

procedure TViewHerancasBuscar.DBGrid1DblClick(Sender: TObject);
begin
  btnUtilizar.Click;
end;

procedure TViewHerancasBuscar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  // � par?
  if (not Odd(DataSource1.DataSet.RecNo)) then begin
  
    // Cor do fundo da linha
    DBGrid1.Canvas.Brush.Color := $00DDDDDD;
  end;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TViewHerancasBuscar.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then begin
    btnUtilizar.Click;
  end;
end;

procedure TViewHerancasBuscar.edtBuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (Key) of
    VK_UP   : DataSource1.DataSet.Prior;
    VK_DOWN : DataSource1.DataSet.Next;
  end;
end;

procedure TViewHerancasBuscar.edtBuscarKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not DataSource1.DataSet.IsEmpty) then begin
    btnUtilizar.Click;
  end;
end;

procedure TViewHerancasBuscar.Excluir1Click(Sender: TObject);
begin

  // Tem registro selecionado no grid?
  if (DataSource1.DataSet.IsEmpty) then begin
    raise Exception.Create('Selecione um registro');
  end;

  if (Application.MessageBox(
      'Confirma exclus�o deste registro?',
      'Confirma exclus�o?',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES) then
  begin
    exit;
  end;

  DataSource1.DataSet.Delete;
  Self.BuscarDados;
end;

procedure TViewHerancasBuscar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (Key) of
    VK_F4:
    begin

      // Se F4, e Alt estiver pressionado
      if (ssAlt in Shift) then begin

        // Recebe 0 pro usu�rio n�o fechar com ALT + F4
        Key := 0;
      end;
    end;

    VK_ESCAPE:
    begin
      btnFechar.Click;
    end;
  end;

  if (Key in [VK_F1..VK_F12]) then begin
    if (rdGroupFiltros.Items.Count >= Key - VK_F1) then begin
      rdGroupFiltros.ItemIndex := Key - VK_F1;
    end;
  end;
end;

procedure TViewHerancasBuscar.FormShow(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
  edtBuscar.SetFocus;
end;

procedure TViewHerancasBuscar.rdGroupFiltrosClick(Sender: TObject);
begin
  edtBuscar.SetFocus;
end;

end.
