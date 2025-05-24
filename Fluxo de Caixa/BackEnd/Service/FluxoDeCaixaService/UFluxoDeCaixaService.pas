unit UFluxoDeCaixaService;

interface

uses
  Generics.Collections, System.SysUtils, UFluxoDeCaixaRepository,
  UFluxoDeCaixa, UCategoriaRepository, UCategoriaModel, UFluxoDeCaixaDTOPost,
  UBaseRepository;

type
  TFluxoDeCaixaService = class
  private
    FFluxoDeCaixaRepository: TFluxoDeCaixaRepository;
  public
    constructor Create(AFluxoDeCaixaRepository: TFluxoDeCaixaRepository);
    function ListarTodosFluxos(): TList<TFluxoDeCaixa>;
    function ListarTodasDespesas(): TList<TFluxoDeCaixa>;
    function ListarTodasReceitas(): TList<TFluxoDeCaixa>;
    procedure AtualizarFluxo(AFluxoDeCaixa: TFluxoDeCaixaDTOPost);
    procedure CadastrarFluxo(AFluxoDeCaixa: TFluxoDeCaixaDTOPost);
    procedure DeletarFluxo(AId: Integer);
    function ResultadoNoPeríodo(): Double;
    function DespesasNoPeríodo(): Double;
    function ReceitasNoPeríodo(): Double;
   // function BuscarPaginado(APagina, ATamanhoPagina: Integer): TFluxoDeCaixaPaginadoDTO;
  end;

implementation

//function TFluxoDeCaixaService.BuscarPaginado(APagina,
//  ATamanhoPagina: Integer): TFluxoDeCaixaPaginadoDTO;
//begin
//  Result := FFluxoDeCaixaRepository.BuscarPaginado(APagina, ATamanhoPagina);
//end;

procedure TFluxoDeCaixaService.CadastrarFluxo(AFluxoDeCaixa
  : TFluxoDeCaixaDTOPost);
var
  CategoriaRepositoy: TCategoriaRepository;
  BaseRepository: TBaseRepository;
begin
  BaseRepository := TBaseRepository.Create;
  CategoriaRepositoy := TCategoriaRepository.Create(BaseRepository);

  if CategoriaRepositoy.ExistePorId(AFluxoDeCaixa.CategoriaId) then
    FFluxoDeCaixaRepository.Cadastrar(AFluxoDeCaixa)
  else
    raise Exception.Create('Erro: A categoria informada não existe.');

end;

constructor TFluxoDeCaixaService.Create(AFluxoDeCaixaRepository
  : TFluxoDeCaixaRepository);
begin
  FFluxoDeCaixaRepository := AFluxoDeCaixaRepository;
end;

procedure TFluxoDeCaixaService.DeletarFluxo(AId: Integer);
// var
// FluxoRepository: TFluxoDeCaixaRepository;
begin

  if AId <= 0 then
    raise Exception.Create('ID inválido para exclusão');

  if not Assigned(FFluxoDeCaixaRepository) then
    raise Exception.Create('Erro interno: Repositório não inicializado.');

  FFluxoDeCaixaRepository.Delete(AId);
end;

function TFluxoDeCaixaService.DespesasNoPeríodo: Double;
var
  ValorDoSomatorio: Double;
  Fluxos: TList<TFluxoDeCaixa>;
  Fluxo: TFluxoDeCaixa;
  // i: Integer;
begin
  ValorDoSomatorio := 0;
  Fluxos := TList<TFluxoDeCaixa>.Create();
  Fluxo := TFluxoDeCaixa.Create();
  Fluxos := FFluxoDeCaixaRepository.FindAllFluxoDeCaixaByName();

  try
    for Fluxo in Fluxos do
    begin
      if Fluxo.Tipo = 'Despesa' then
        ValorDoSomatorio := ValorDoSomatorio + Fluxo.Valor
    end;
  finally
    Fluxos.Free;
  end;
  Result := ValorDoSomatorio;
end;

procedure TFluxoDeCaixaService.AtualizarFluxo(AFluxoDeCaixa
  : TFluxoDeCaixaDTOPost);
var
  CategoriaRepositoy: TCategoriaRepository;
  BaseRepository: TBaseRepository;
begin
  BaseRepository := TBaseRepository.Create;
  CategoriaRepositoy := TCategoriaRepository.Create(BaseRepository);

  if CategoriaRepositoy.ExistePorId(AFluxoDeCaixa.CategoriaId) then
    FFluxoDeCaixaRepository.Update(AFluxoDeCaixa)
  else
    raise Exception.Create('Erro: A categoria informada não existe.');

end;

function TFluxoDeCaixaService.ListarTodasDespesas: TList<TFluxoDeCaixa>;
var
  Fluxo: TFluxoDeCaixa;
  ListaFluxos: TList<TFluxoDeCaixa>;
  Fluxos: TList<TFluxoDeCaixa>;
begin
  Result := nil;
  ListaFluxos := TList<TFluxoDeCaixa>.Create();
  Fluxos := FFluxoDeCaixaRepository.FindAllFluxoDeCaixaByName();

  for Fluxo in Fluxos do
  begin
    if (Fluxo.Tipo) = 'Despesa' then
    begin
      ListaFluxos.Add(Fluxo);
    end;

  end;
  Result := ListaFluxos;
end;

function TFluxoDeCaixaService.ListarTodasReceitas: TList<TFluxoDeCaixa>;
var
  Fluxo: TFluxoDeCaixa;
  ListaFluxos: TList<TFluxoDeCaixa>;
  Fluxos: TList<TFluxoDeCaixa>;
begin
  Result := nil;
  ListaFluxos := TList<TFluxoDeCaixa>.Create();
  Fluxos := FFluxoDeCaixaRepository.FindAllFluxoDeCaixaByName();

  for Fluxo in Fluxos do
  begin
    if (Fluxo.Tipo) = 'Receita' then
    begin
      ListaFluxos.Add(Fluxo);
    end;

  end;
  Result := ListaFluxos;

end;

function TFluxoDeCaixaService.ListarTodosFluxos: TList<TFluxoDeCaixa>;
var
  Fluxos: TList<TFluxoDeCaixa>;
begin
  Fluxos := TList<TFluxoDeCaixa>.Create();
  Result := nil;

  Fluxos := FFluxoDeCaixaRepository.FindAllFluxoDeCaixaByName();
  Result := Fluxos;

end;

function TFluxoDeCaixaService.ReceitasNoPeríodo: Double;
var
  ValorDoSomatorio: Double;
  Fluxos: TList<TFluxoDeCaixa>;
  Fluxo: TFluxoDeCaixa;
  // i: Integer;
begin
  ValorDoSomatorio := 0;
  Fluxos := TList<TFluxoDeCaixa>.Create();
  Fluxo := TFluxoDeCaixa.Create();
  Fluxos := FFluxoDeCaixaRepository.FindAllFluxoDeCaixaByName();

  try
    for Fluxo in Fluxos do
    begin
      if Fluxo.Tipo = 'Receita' then
        ValorDoSomatorio := ValorDoSomatorio + Fluxo.Valor
    end;
  finally
    Fluxos.Free;
  end;
  Result := ValorDoSomatorio;
end;

function TFluxoDeCaixaService.ResultadoNoPeríodo: Double;
var
  ValorDoSomatorio: Double;
  Fluxos: TList<TFluxoDeCaixa>;
  Fluxo: TFluxoDeCaixa;
  // i: Integer;
begin
  ValorDoSomatorio := 0;
  Fluxos := TList<TFluxoDeCaixa>.Create();
  Fluxo := TFluxoDeCaixa.Create();
  Fluxos := FFluxoDeCaixaRepository.FindAllFluxoDeCaixaByName();

  try
    for Fluxo in Fluxos do
    begin
      if Fluxo.Tipo = 'Despesa' then
        ValorDoSomatorio := ValorDoSomatorio - Fluxo.Valor
      else
        ValorDoSomatorio := ValorDoSomatorio + Fluxo.Valor
    end;
  finally
    Fluxos.Free;
  end;

  Result := ValorDoSomatorio;

end;

end.

// procedure TFluxoCaixaService.Atualizar(const Fluxo: TFluxoCaixaModel);
// var
// CategoriaRepo: TCategoriaRepository;
// begin
// CategoriaRepo := TCategoriaRepository.Create;
// try
// if not CategoriaRepo.ExistePorId(Fluxo.IdCategoria) then
// raise Exception.Create('Categoria informada não existe.');
//
// // Aqui sim pode chamar o método do repositório para atualizar o fluxo
// FFluxoCaixaRepository.Atualizar(Fluxo);
//
// finally
// CategoriaRepo.Free;
// end;
// end;
