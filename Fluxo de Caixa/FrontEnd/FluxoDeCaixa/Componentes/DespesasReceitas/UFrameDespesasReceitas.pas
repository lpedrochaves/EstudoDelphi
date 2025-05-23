unit UFrameDespesasReceitas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls, UFluxoDeCaixaAtualizarModal,
  UFluxoDeCaixaController;

type
  TFrameComponenteDespesaReceita = class(TFrame)
    pnlData: TPanel;
    lblDataBanco: TLabel;
    pnlCategoria: TPanel;
    lblCategoriaBanco: TLabel;
    pnlValor: TPanel;
    lblValorBanco: TLabel;
    pnlPagamento: TPanel;
    lblPagamentoBanco: TLabel;
    pnlEditar: TPanel;
    pnlDeletar: TPanel;
    imgEditar: TImage;
    imgDeletar: TImage;
    pnlFluxo: TPanel;
    pnlBorderTop: TPanel;
    lblTipo: TLabel;
    lblId: TLabel;
    lblCategoriaId: TLabel;
    lblDescricao: TLabel;
    procedure pnlEditarClick(Sender: TObject);
    procedure imgDeletarClick(Sender: TObject);
  private
    FOnDelete: TProc;
    { Private declarations }
  public
    property OnDelete: TProc read FOnDelete write FOnDelete;
    constructor Create(AOwner: TComponent; CategoriaId, Id: Integer;
      Descricao, Tipo: string; Data: string; Pagamento: string;
      Categoria: string; Valor: double); overload;
    constructor Create(AOwner: TComponent); overload;
    { Public declarations }
  end;

implementation

{$R *.dfm}

var
  frmFluxoAtualizarModal: TfrmFluxoDeCaixaAtualizarModal;

constructor TFrameComponenteDespesaReceita.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.Name := '';
end;

constructor TFrameComponenteDespesaReceita.Create(AOwner: TComponent;
  CategoriaId, Id: Integer; Descricao, Tipo: string; Data: string;
  Pagamento: string; Categoria: string; Valor: double);
begin
  inherited Create(AOwner);
  Self.Name := '';
  lblDescricao.Caption := Descricao;
  lblCategoriaId.Caption := IntToStr(CategoriaId);
  lblId.Caption := IntToStr(Id);
  lblTipo.Caption := Tipo;
  lblDataBanco.Caption := Data;
  lblCategoriaBanco.Caption := Categoria;
  lblPagamentoBanco.Caption := Pagamento;
  lblValorBanco.Caption := FloatToStr(Valor);
end;

procedure TFrameComponenteDespesaReceita.imgDeletarClick(Sender: TObject);
var
  FluxoController: TFluxoDeCaixaController;
begin
  FluxoController := TFluxoDeCaixaController.Create();
  if MessageDlg('Deseja deletar esse fluxo?', mtConfirmation, [mbYes, mbNo], 0)
    = mrYes then
  begin
    FluxoController.DeletarFluxo(StrToInt(lblId.Caption));
    if Assigned(FOnDelete) then
      FOnDelete();
  end;
end;

procedure TFrameComponenteDespesaReceita.pnlEditarClick(Sender: TObject);
begin
  frmFluxoAtualizarModal := TfrmFluxoDeCaixaAtualizarModal.Create(Self);
end;

end.
