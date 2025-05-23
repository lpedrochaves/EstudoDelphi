unit UTipoPagamentoController;

interface

uses
  UBaseRepository, UTipoPagamentoRepository, UTipoPagamentoService,
  Generics.Collections, System.SysUtils, UTipoPagamentoModel;

type
  TTipoPagamentoController = class
  private
    FTipoPagamentoService: TTipoPagamentoService;
    FBaseRepository: TBaseRepository;
    TipoPagamentosRepository: TTipoPagamentoRepository;
  public
    constructor Create();
    destructor Destroy; override;
    function FindAll(): TList<TTipoPagamentoModel>;
  end;

implementation

{ TTipoPagamentoController }

constructor TTipoPagamentoController.Create;
begin
  inherited Create;
  FBaseRepository := TBaseRepository.Create;
  TipoPagamentosRepository := TTipoPagamentoRepository.Create(FBaseRepository);
  FTipoPagamentoService := TTipoPagamentoService.Create
    (TipoPagamentosRepository);
end;

destructor TTipoPagamentoController.Destroy;
begin
  FTipoPagamentoService.Free;
  TipoPagamentosRepository.Free;
  FBaseRepository.Free;
  inherited;
end;

function TTipoPagamentoController.FindAll: TList<TTipoPagamentoModel>;
begin
  Result := FTipoPagamentoService.ListarTodas();
end;


end.
