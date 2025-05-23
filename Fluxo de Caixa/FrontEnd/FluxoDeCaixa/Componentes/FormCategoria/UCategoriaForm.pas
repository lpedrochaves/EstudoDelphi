unit UCategoriaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  System.Generics.Collections, UCategoriaController, UCategoriaModel, Data.DB,
  Vcl.DBGrids, FireDAC.Comp.Client;

type
  TFormCategoria = class(TForm)
    strTabelaCategoria: TStringGrid;
    pnlBotoes: TPanel;
    btnSelecionar: TButton;
    btnCancelar: TButton;
    dbGridCategorias: TDBGrid;
    edtBuscarCategoria: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure strTabelaCategoriaClick(Sender: TObject);
    procedure pnlBotoesClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtBuscarCategoriaChange(Sender: TObject);
    procedure strTabelaCategoriaDblClick(Sender: TObject);

  private
    FCategorias: TList<TCategoriaModel>;
    FCategoriaController: TCategoriaController;
  public
    CategoriaSelecionada: TCategoriaModel;
    procedure PreencherGrid(ALista: TList<TCategoriaModel>);
    { Public declarations }
  end;

var
  FormCategoria: TFormCategoria;

implementation

{$R *.dfm}
{ TFormCategoria }

procedure TFormCategoria.btnSelecionarClick(Sender: TObject);
begin
  if Assigned(CategoriaSelecionada) then
    ModalResult := mrOk
  else
    ShowMessage('Selecione uma categoria primeiro!');
end;




procedure TFormCategoria.edtBuscarCategoriaChange(Sender: TObject);
var
  TextoDigitado: string;
  CategoriaItem: TCategoriaModel;
  ListaFiltrada: TList<TCategoriaModel>;
begin

  FCategoriaController := TCategoriaController.Create;
  FCategorias := FCategoriaController.FindAll;

  TextoDigitado := Trim(LowerCase(edtBuscarCategoria.Text));
  ListaFiltrada := TList<TCategoriaModel>.Create;

  for CategoriaItem in FCategorias do
  begin
    if TextoDigitado = '' then
      ListaFiltrada.Add(CategoriaItem)
    else if Pos(TextoDigitado, LowerCase(CategoriaItem.NomeCategoria)) > 0 then
      ListaFiltrada.Add(CategoriaItem);
  end;

  PreencherGrid(ListaFiltrada);
  ListaFiltrada.Free;
end;

procedure TFormCategoria.FormCreate(Sender: TObject);
var
  CategoriasController: TCategoriaController;
begin


  strTabelaCategoria.ColCount := 2;
  strTabelaCategoria.Cells[0, 0] := 'Código';
  strTabelaCategoria.Cells[1, 0] := 'Nome';
  strTabelaCategoria.ColWidths[0] := 80;
  strTabelaCategoria.ColWidths[1] := strTabelaCategoria.ClientWidth -
    strTabelaCategoria.ColWidths[0] - 10;

  try

    CategoriasController := TCategoriaController.Create;
    FCategorias := CategoriasController.FindAll();
    PreencherGrid(FCategorias);
  finally
  end;
end;

procedure TFormCategoria.pnlBotoesClick(Sender: TObject);
begin
  FCategorias.Free;
  ModalResult := mrCancel;
end;

procedure TFormCategoria.PreencherGrid(ALista: TList<TCategoriaModel>);
var
  i: Integer;
begin
  strTabelaCategoria.RowCount := ALista.Count + 1;
  strTabelaCategoria.Cells[0, 0] := 'Código';
  strTabelaCategoria.Cells[1, 0] := 'Nome';

  for i := 0 to ALista.Count - 1 do
  begin
    strTabelaCategoria.Cells[0, i + 1] := ALista[i].Id.ToString;
    strTabelaCategoria.Cells[1, i + 1] := ALista[i].NomeCategoria;
  end;

end;

procedure TFormCategoria.strTabelaCategoriaClick(Sender: TObject);
var
  Linha: Integer;
begin
  Linha := strTabelaCategoria.Row;
  if Linha > 0 then
  begin
    CategoriaSelecionada := FCategorias[Linha - 1];
    strTabelaCategoria.Options := strTabelaCategoria.Options + [goRowSelect];
  end;

end;

procedure TFormCategoria.strTabelaCategoriaDblClick(Sender: TObject);
begin
  if Assigned(CategoriaSelecionada) then
    ModalResult := mrOk;
end;

end.
