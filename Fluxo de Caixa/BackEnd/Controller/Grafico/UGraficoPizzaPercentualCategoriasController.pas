unit UGraficoPizzaPercentualCategoriasController;

interface

uses
  UBaseRepository, UGraficoPizzaPercentualCategoriasService,
  UGraficoPizzaPercentualCategoriasRepository,
  UGraficoPizzaPercentualCategorias, Generics.Collections;

type
  TGraficoPizzaPercentualCategoriasController = class
  private
    FBaseRepository: TBaseRepository;
    FGraficoRepository: TGraficoPizzaPercentualCategoriasRepository;
    FGraficoService: TGraficoPizzaPercentualCategoriasService;
  public
    constructor Create();
    destructor Destroy();
    function FindAll(): TList<TGraficoPizzaPercentualCategorias>;
    function UltimosLancamentos(): TList<TGraficoPizzaPercentualCategorias>;
  end;

implementation

constructor TGraficoPizzaPercentualCategoriasController.Create;
begin
  FBaseRepository := TBaseRepository.Create();
  FGraficoRepository := TGraficoPizzaPercentualCategoriasRepository.Create
    (FBaseRepository);
  FGraficoService := TGraficoPizzaPercentualCategoriasService.Create
    (FGraficoRepository);
end;

destructor TGraficoPizzaPercentualCategoriasController.Destroy;
begin
  FBaseRepository.Free;
  FGraficoRepository.Free;
  FGraficoService.Free;
end;

function TGraficoPizzaPercentualCategoriasController.UltimosLancamentos()
  : TList<TGraficoPizzaPercentualCategorias>;
begin
  Result := FGraficoService.MostrarUltimosLancamentos();
end;

function TGraficoPizzaPercentualCategoriasController.FindAll
  : TList<TGraficoPizzaPercentualCategorias>;
begin
  Result := FGraficoService.MostrarGraficoDePizza();
end;

end.
