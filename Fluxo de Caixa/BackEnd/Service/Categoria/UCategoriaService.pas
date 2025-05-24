unit UCategoriaService;

interface

uses
  Generics.Collections, System.SysUtils, UCategoriaRepository, UCategoriaModel,FireDAC.Comp.Client;

type
  TCategoriaService = class
  private
    FCategoriaRepository: TCategoriaRepository;
  public
    constructor Create(ACategoriaRepository: TCategoriaRepository);
    function ListarTodas(): TList<TCategoriaModel>;
   // function GetDataSetAll: TFDQuery;
  end;

implementation

{ TCategoriaService }

constructor TCategoriaService.Create(ACategoriaRepository
  : TCategoriaRepository);
begin
  FCategoriaRepository := ACategoriaRepository;
end;

//function TCategoriaService.GetDataSetAll: TFDQuery;
//begin
//  Result := FCategoriaRepository.GetDataSetAll;
//end;

function TCategoriaService.ListarTodas: TList<TCategoriaModel>;
var
  Categorias: TList<TCategoriaModel>;
begin
  Result := nil;
  Categorias := TList<TCategoriaModel>.Create;
  Categorias := FCategoriaRepository.FindAll();

  Result := Categorias;
end;

end.
