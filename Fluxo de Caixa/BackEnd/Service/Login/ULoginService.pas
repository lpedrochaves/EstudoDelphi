unit ULoginService;

interface

uses
  UUsuarioRepository, UUsuario, Generics.Collections, System.SysUtils;

type
  TLoginService = class
  private
    FUsuarioRepository: TUsuarioRepository;
  public
    constructor Create(AUsuarioRepository: TUsuarioRepository);
    function FazerLogin(AUsuario, ASenha: String): boolean;
    function ListarTodos(): TList<TUsuario>;
  end;

implementation

constructor TLoginService.Create(AUsuarioRepository: TUsuarioRepository);
begin
  FUsuarioRepository := AUsuarioRepository;
end;

function TLoginService.FazerLogin(AUsuario, ASenha: String): boolean;
var
  Usuario: TUsuario;
  Usuarios: TList<TUsuario>;
begin
  Result := False;
  Usuarios := TList<TUsuario>.Create;
  Usuarios := FUsuarioRepository.FindAll;

  try
    for Usuario in Usuarios do
    begin
      if (Usuario.Nome = AUsuario) and (Usuario.Senha = ASenha) then
      begin
        Result := True;
        Break;
      end;
    end;
  finally
    Usuarios.Free;
  end;
end;

function TLoginService.ListarTodos(): TList<TUsuario>;
var
  Usuarios: TList<TUsuario>;
begin
  Usuarios := TList<TUsuario>.Create;
  Usuarios := FUsuarioRepository.FindAll();
  Result := Usuarios;
end;

end.
