unit UGraficoPizzaPercentualCategoriasService;

interface

uses
  Generics.Collections, System.SysUtils,
  UGraficoPizzaPercentualCategoriasRepository,
  UGraficoPizzaPercentualCategorias,
  UBaseRepository;

type
  TGraficoPizzaPercentualCategoriasService = class
  private
    FGraficoPizzaPercentualCategoriasRepository
      : TGraficoPizzaPercentualCategoriasRepository;
  public
    constructor Create(AGraficoRepository
      : TGraficoPizzaPercentualCategoriasRepository);
    function MostrarGraficoDePizza(): TList<TGraficoPizzaPercentualCategorias>;
    function MostrarUltimosLancamentos()
      : TList<TGraficoPizzaPercentualCategorias>;
  end;

implementation

constructor TGraficoPizzaPercentualCategoriasService.Create(AGraficoRepository
  : TGraficoPizzaPercentualCategoriasRepository);
begin
  FGraficoPizzaPercentualCategoriasRepository := AGraficoRepository;
end;

function TGraficoPizzaPercentualCategoriasService.MostrarUltimosLancamentos()
  : TList<TGraficoPizzaPercentualCategorias>;
var
  ListaGrafico: TList<TGraficoPizzaPercentualCategorias>;
begin
  ListaGrafico := TList<TGraficoPizzaPercentualCategorias>.Create;

  ListaGrafico := FGraficoPizzaPercentualCategoriasRepository.
    ListarUltimosLancamentosPorCategoria();
  Result := ListaGrafico;
end;

function TGraficoPizzaPercentualCategoriasService.MostrarGraficoDePizza
  : TList<TGraficoPizzaPercentualCategorias>;
var
  ListaGrafico: TList<TGraficoPizzaPercentualCategorias>;
begin
  ListaGrafico := TList<TGraficoPizzaPercentualCategorias>.Create;

  ListaGrafico := FGraficoPizzaPercentualCategoriasRepository.
    ListarDadosDeCategoria();
  Result := ListaGrafico;
end;

end.
