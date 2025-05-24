unit UCategoriaController;

interface

uses
  UBaseRepository, UCategoriaRepository, UCategoriaService,
  Generics.Collections, System.SysUtils, UCategoriaModel, FireDAC.Comp.Client;

type
  TCategoriaController = class
  private
    FCategoriaService: TCategoriaService;
    FBaseRepository: TBaseRepository;
    FCategoriaRepository: TCategoriaRepository;
  public
    constructor Create();
    destructor Destroy; override;
    function FindAll(): TList<TCategoriaModel>;
    function GetDataSetAll: TFDQuery;
  end;

implementation

{ TCategoriaController }

constructor TCategoriaController.Create;
begin
  inherited Create;
  FBaseRepository := TBaseRepository.Create;
  FCategoriaRepository := TCategoriaRepository.Create(FBaseRepository);
  FCategoriaService := TCategoriaService.Create(FCategoriaRepository);
end;

destructor TCategoriaController.Destroy;
begin
  inherited;
  FBaseRepository.Free;
  FCategoriaRepository.Free;
  FCategoriaService.Free;
end;

function TCategoriaController.FindAll: TList<TCategoriaModel>;
begin
  Result := FCategoriaService.ListarTodas();
end;


function TCategoriaController.GetDataSetAll: TFDQuery;
begin
  Result := FCategoriaService.GetDataSetAll;
end;

end.
