unit UFluxoDeCaixaAtualizarModal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, UCategoriaForm, UTipoPagamentoController,
  UTipoPagamentoModel, Generics.Collections, UFluxoDeCaixaDTOPost,
  UFluxoDeCaixa, UFluxoDeCaixaController, System.RegularExpressions, Utils;

type


  TOnFluxoAtualizado = procedure of object;

  TfrmFluxoDeCaixaAtualizarModal = class(TForm)

    lblTitulo: TLabel;
    selDespesaReceita: TComboBox;
    memDescricao: TMemo;
    edtCategoria: TEdit;
    imgCategoria: TImage;
    lblTipoFluxo: TLabel;
    lblCategoria: TLabel;
    lblValor: TLabel;
    lblData: TLabel;
    lblDescricao: TLabel;
    edtValor: TMaskEdit;
    edtData: TMaskEdit;
    btnAtualizar: TButton;
    btnCancelar: TButton;
    lblTipoPagamento: TLabel;
    edtId: TEdit;
    lblDadoCategoria: TLabel;
    lblDadoData: TLabel;
    lblDadoTipoFluxo: TLabel;
    lblDadoValor: TLabel;
    lblDadoPagamento: TLabel;
    pnlCategoria: TPanel;
    pnlData: TPanel;
    pnlTipoFluxo: TPanel;
    pnlTipoPagamento: TPanel;
    selTipoPagamento: TComboBox;
    pnlValor: TPanel;

    procedure imgCategoriaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure CriarTiposDePagamento();
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LimparCampos;

    procedure btnCancelarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure edtDataEnter(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure selDespesaReceitaKeyPress(Sender: TObject; var Key: Char);

    // procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FIdFluxo: Integer;

    { Private declarations }
  public
    { Public declarations }

    OnFluxoAtualizado: TOnFluxoAtualizado; // PROP PARA  ATUALIZAR FLUXO

    // constructor Create(AOwner: TComponent); overload;
    constructor Create(AOwner: TComponent; Descricao, Tipo: string;
      Data: string; Pagamento: string; Categoria, Id: Integer;
      Valor: double); overload;

    procedure SelecionarTipoPagamentoPorNome(const Nome: string);
    function ValidarCampos(CategoriaTexto, DataTexto, Pagamento, Valor,
      FormaPagamento: string): Boolean;

  end;

var
  frmFluxoDeCaixaAtualizarModal: TfrmFluxoDeCaixaAtualizarModal;

implementation

{$R *.dfm}
{ TfrmFluxoDeCaixaAtualizarModal }

// constructor TfrmFluxoDeCaixaAtualizarModal.Create(AOwner: TComponent);
// begin
// inherited Create(AOwner);
// end;

procedure TfrmFluxoDeCaixaAtualizarModal.btnAtualizarClick(Sender: TObject);
var
  FluxoDeCaixaDto: TFluxoDeCaixaDTOPost;
  FluxoDeCaixaController: TFluxoDeCaixaController;
  TipoPagamentoId: Integer;
  TextoValor: string;
  ValorConvertido: double;

begin

  if not ValidarCampos(edtCategoria.Text, edtData.Text, selDespesaReceita.Text,
    edtValor.Text, selTipoPagamento.Text) then
  begin
    Exit;
  end;

  try
    if selTipoPagamento.ItemIndex >= 0 then
    begin
      TipoPagamentoId :=
        Integer(selTipoPagamento.Items.Objects[selTipoPagamento.ItemIndex]);
    end
    else
    begin
      ShowMessage('Selecione um tipo de pagamento.');
      Exit;
    end;

    ValorConvertido := ConverterValorParaFloat(edtValor.Text);

    FluxoDeCaixaDto := TFluxoDeCaixaDTOPost.Create;
    try
      // ShowMessage('Criando DTO');

      FluxoDeCaixaDto.Id := FIdFluxo;
      FluxoDeCaixaDto.CategoriaId := StrToInt(edtCategoria.Text);
      FluxoDeCaixaDto.TipoPagamentoId := TipoPagamentoId;
      FluxoDeCaixaDto.Tipo := selDespesaReceita.Text;
      FluxoDeCaixaDto.Data := StrToDate(edtData.Text);
      FluxoDeCaixaDto.Valor := ValorConvertido;
      FluxoDeCaixaDto.Descricao := memDescricao.Text;

      FluxoDeCaixaController := TFluxoDeCaixaController.Create;
      try
        // ShowMessage('Chamando controlador');
        FluxoDeCaixaController.Atualizar(FluxoDeCaixaDto);

      finally
        FluxoDeCaixaController.Free;
      end;
    finally
      FluxoDeCaixaDto.Free;
    end;

    ShowMessage('Atualização concluída com sucesso!');

    // if Assigned(OnFluxoAtualizado) then
    // begin
    // OnFluxoAtualizado;
    // end;

    ModalResult := mrOk;

    if Assigned(FOnAtualizarLista) then
      FOnAtualizarLista(Self);

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar: ' + E.Message);
  end;
end;

procedure TfrmFluxoDeCaixaAtualizarModal.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmFluxoDeCaixaAtualizarModal.btnCancelarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtData.SelStart := 0;
end;

constructor TfrmFluxoDeCaixaAtualizarModal.Create(AOwner: TComponent;
  Descricao, Tipo, Data, Pagamento: string; Categoria, Id: Integer;
  Valor: double);

begin
  inherited Create(AOwner);

  CriarTiposDePagamento();
  SelecionarTipoPagamentoPorNome(Pagamento);

  memDescricao.Text := Descricao;
  edtCategoria.Text := IntToStr(Categoria);
  FIdFluxo := Id;
  selTipoPagamento.Text := Pagamento;
  selDespesaReceita.Text := Tipo;
  edtData.Text := Data;
  edtValor.Text := ConverterValorParaTexto(Valor);

end;

// METODO QUE VA POPULAR O SELECT DE PAGAMENTO
procedure TfrmFluxoDeCaixaAtualizarModal.CriarTiposDePagamento;
var
  TipoPagamento: TTipoPagamentoModel;
  TipoPagamentosController: TTipoPagamentoController;
  Tipos: TList<TTipoPagamentoModel>;

begin
  TipoPagamentosController := TTipoPagamentoController.Create;
  try
    Tipos := TipoPagamentosController.FindAll;
    try
      selTipoPagamento.Items.Clear;
      for TipoPagamento in Tipos do
        // selTipoPagamento.Items.Add(TipoPagamento.TipoPagamento);
        // selTipoPagamento.Items.Add(IntToStr(TipoPagamento.Id));

        selTipoPagamento.Items.AddObject(TipoPagamento.TipoPagamento,
          // texto visível
          TObject(Pointer(TipoPagamento.Id))
          // armazena o ID no objeto associado
          );

      // Quando você for salvar no banco de dados, use isto:     DICA GPT
      // var
      // TipoPagamentoId: Integer;
      // begin
      // TipoPagamentoId := Integer(selTipoPagamento.Items.Objects[selTipoPagamento.ItemIndex]);

    finally
      Tipos.Free;
    end;
  finally
    TipoPagamentosController.Free;
  end;
end;

procedure TfrmFluxoDeCaixaAtualizarModal.edtDataEnter(Sender: TObject);
begin
  edtData.SelStart := 0;
end;

procedure TfrmFluxoDeCaixaAtualizarModal.edtValorChange(Sender: TObject);
var
  Valor: Currency;
  TextoFormatado: string;
begin
  TextoFormatado := TRegEx.Replace(edtValor.Text, '[^\d]', '');

  if TextoFormatado = '' then
    Exit;
  Valor := StrToCurr(TextoFormatado) / 100;

  edtValor.Text := FormatFloat('#,##0.00', Valor);

  edtValor.SelStart := Length(edtValor.Text);
end;

procedure TfrmFluxoDeCaixaAtualizarModal.edtValorKeyPress(Sender: TObject;

  var Key: Char);
begin
  if not(Key in ['0' .. '9', #8]) then
    Key := #0;
end;

procedure TfrmFluxoDeCaixaAtualizarModal.FormCreate(Sender: TObject);
begin

end;

// PEGA O ID DO PAGAMENTO NO METODO CREATE, SEM PRECISAR SELECIONAR OUTRO OU RE-SELECIONAR
procedure TfrmFluxoDeCaixaAtualizarModal.SelecionarTipoPagamentoPorNome
  (const Nome: string);
var
  i: Integer;
begin
  for i := 0 to selTipoPagamento.Items.Count - 1 do
  begin
    if selTipoPagamento.Items[i] = Nome then
    begin
      selTipoPagamento.ItemIndex := i;
      Break;
    end;
  end;
end;

// METODO QUE PEGA O ID DA CATEGORIA E COLOCA NO FORM
procedure TfrmFluxoDeCaixaAtualizarModal.imgCategoriaClick(Sender: TObject);
var
  FormCategoria: TFormCategoria;
begin
  FormCategoria := TFormCategoria.Create(Self);
  try
    if FormCategoria.ShowModal = mrOk then
    begin
      if Assigned(FormCategoria.CategoriaSelecionada) then
      begin
        edtCategoria.Text := FormCategoria.CategoriaSelecionada.Id.ToString;
      end;
    end;
  finally
    FormCategoria.Free;
  end;
end;

procedure TfrmFluxoDeCaixaAtualizarModal.selDespesaReceitaKeyPress
  (Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

function TfrmFluxoDeCaixaAtualizarModal.ValidarCampos(CategoriaTexto, DataTexto,
  Pagamento, Valor, FormaPagamento: string): Boolean;
var
  i, CategoriaId: Integer;
  // ValorFluxo: double;
begin
  Result := True;

  // TryStrToFloat(edtValor.Text, ValorFluxo);
  TryStrToInt(edtCategoria.Text, CategoriaId);

  if (CategoriaTexto = '') or (CategoriaId <= 0) then
  begin
    lblDadoCategoria.Visible := True;
    lblDadoCategoria.Font.Color := clRed;
    lblDadoCategoria.Caption := 'Categoria inválida!';
    edtCategoria.Align := alTop;
    edtCategoria.Height := 23;
    Result := False;
  end
  else
  begin
    lblDadoCategoria.Visible := False;
    edtCategoria.Height := 25;
  end;

  if DataTexto = '  /  /    ' then
  begin
    lblDadoData.Visible := True;
    lblDadoData.Font.Color := clRed;
    lblDadoData.Caption := 'Data obrigatória!';
    edtData.Align := alTop;
    edtData.Height := 23;
    Result := False;
  end
  else
  begin
    lblDadoData.Visible := False;
    edtData.Height := 25;
  end;

  if Pagamento = '' then
  begin
    lblDadoTipoFluxo.Visible := True;
    lblDadoTipoFluxo.Font.Color := clRed;
    lblDadoTipoFluxo.Caption := 'Tipo obrigatório!';
    selDespesaReceita.Align := alTop;
    // selDespesaReceita.Height := 23;
    pnlTipoFluxo.Height := 27;
    Result := False;
  end
  else
  begin
    lblDadoTipoFluxo.Visible := False;
    pnlTipoFluxo.Height := 25;
  end;

  if Valor = '' then
  begin
    lblDadoValor.Visible := True;
    lblDadoValor.Font.Color := clRed;
    lblDadoValor.Caption := 'Valor obrigatório!';
    edtValor.Align := alTop;
    edtValor.Height := 23;
    Result := False;
  end
  else
  begin
    lblDadoValor.Visible := False;
    edtValor.Height := 25;
  end;

  if FormaPagamento = '' then
  begin
    lblDadoPagamento.Visible := True;
    lblDadoPagamento.Font.Color := clRed;
    lblDadoPagamento.Caption := 'Tipo obrigatório!';
    selTipoPagamento.Align := alTop;
    pnlTipoPagamento.Height := 27;
    Result := False;
  end
  else
  begin
    lblDadoPagamento.Visible := False;
    pnlTipoPagamento.Height := 25;
  end;

end;

procedure TfrmFluxoDeCaixaAtualizarModal.LimparCampos;
begin
  edtCategoria.Text := '';
  lblDadoCategoria.Visible := False;
  edtCategoria.Height := 25;

  edtData.Text := '  /  /    ';
  lblDadoData.Visible := False;
  edtData.Height := 25;

  selDespesaReceita.Text := '';
  lblDadoTipoFluxo.Visible := False;
  pnlTipoFluxo.Height := 25;

  edtValor.Text := '';
  lblDadoValor.Visible := False;
  edtValor.Height := 25;

  selTipoPagamento.ItemIndex := -1;
  selTipoPagamento.Text := '';
  lblDadoPagamento.Visible := False;
  pnlTipoPagamento.Height := 25;

  memDescricao.Text := '';
end;

end.
