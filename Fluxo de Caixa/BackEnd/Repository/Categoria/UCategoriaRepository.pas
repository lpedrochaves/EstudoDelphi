unit UCategoriaRepository;

interface

uses
  UBaseRepository, FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Stan.Param,
  FireDAC.Phys.PGDef, System.Generics.Collections, UCategoriaModel,
  System.SysUtils, System.Variants;

type
  TCategoriaRepository = class
  private
    FDQuery: TFDQuery;
    FBaseRepository: TBaseRepository;
  public
    function FindAll(): TList<TCategoriaModel>;
    constructor Create(ABaseRepository: TBaseRepository);
    function ExistePorId(const Id: Integer): Boolean;
    procedure Buscar();
  end;

implementation

procedure TCategoriaRepository.Buscar;
begin

end;

constructor TCategoriaRepository.Create(ABaseRepository: TBaseRepository);
begin
  FBaseRepository := ABaseRepository;
  FDQuery := TFDQuery.Create(nil);
  FDQuery.Connection := FBaseRepository.Connection;
end;

function TCategoriaRepository.ExistePorId(const Id: Integer): Boolean;
begin
  if FDQuery = nil then
  begin
    raise Exception.Create('Erro: FDQuery não foi instanciado.');
  end;
  // UTILIZAR SELECT 1, PARA RETORNAR APENAS O 1 SE ENCONTRAR, ASSIM OTIMIZA
  FDQuery.SQL.Text := 'SELECT 1 FROM fin.categorias WHERE id = :id';
  FDQuery.ParamByName('id').AsInteger := Id;
  FDQuery.Open;

  if not(FDQuery.IsEmpty) then
  begin
    Result := True;
  end
  else
    Result := False;
end;

function TCategoriaRepository.FindAll: TList<TCategoriaModel>;
var
  Categoria: TCategoriaModel;
begin
  if FDQuery = nil then
  begin
    raise Exception.Create('Erro: FDQuery não foi instanciado.');
  end;

  Result := TList<TCategoriaModel>.Create;

  FDQuery.SQL.Text := 'SELECT * FROM fin.categorias';
  FDQuery.Open;

  while not FDQuery.Eof do
  begin
    try
      Categoria := TCategoriaModel.Create(FDQuery.FieldByName('id').AsInteger,
        FDQuery.FieldByName('nome_categoria').AsString);
      Result.Add(Categoria);
    Except
      Categoria.Free;
      raise
    end;
    FDQuery.Next;
  end;

end;



end.
