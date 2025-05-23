unit ULoginController;

interface

uses
  ULoginService, UBaseRepository, UUsuarioRepository, Generics.Collections,
  UUsuario;

type

  TLoginController = class
  private
    FBaseRepository: TBaseRepository;
    FUsuarioRepository: TUsuarioRepository;
    FLoginService: TLoginService;
  public
    constructor Create;
    destructor Destroy; override;
    function AutenticarSemMensagem(AUsuario: string; ASenha: string): Boolean;
    function ListarUsuarios(): TList<TUsuario>;
  end;

implementation

constructor TLoginController.Create;
begin
  inherited Create;
  FBaseRepository := TBaseRepository.Create;
  FUsuarioRepository := TUsuarioRepository.Create(FBaseRepository);
  FLoginService := TLoginService.Create(FUsuarioRepository);
end;

destructor TLoginController.Destroy;
begin
  FLoginService.Free;
  FUsuarioRepository.Free;
  FBaseRepository.Free;
  inherited;
end;

function TLoginController.AutenticarSemMensagem(AUsuario,
  ASenha: string): Boolean;
begin
  Result := FLoginService.FazerLogin(AUsuario, ASenha);
end;

function TLoginController.ListarUsuarios: TList<TUsuario>;
begin
  Result := FLoginService.ListarTodos();
end;

end.
