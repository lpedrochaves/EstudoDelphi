unit UUsuario;

interface

type
  TUsuario = class

  private
    FId: Integer;
    FNome: String;
    FSenha: String;
    function GetId: Integer;
    procedure SetId(const Value: Integer);
    function GetNome: String;
    procedure SetNome(const Value: String);
    function GetSenha: String;
    procedure SetSenha(const Value: String);

  public

    constructor Create(AID: Integer; ANome, ASenha: String); overload;
    constructor Create(); overload;
    property Id: Integer read GetId write SetId;
    property Nome: String read GetNome write SetNome;
    property Senha: String read GetSenha write SetSenha;
  end;

implementation

{ TUsuario }

constructor TUsuario.Create;
begin

end;

constructor TUsuario.Create(AID: Integer; ANome, ASenha: String);
begin
  FId := AID;
  FNome := ANome;
  FSenha := ASenha;
end;

function TUsuario.GetId: Integer;
begin
  Result := FId;
end;

function TUsuario.GetNome: String;
begin
  Result := FNome;
end;

function TUsuario.GetSenha: String;
begin
  Result := FSenha;
end;

procedure TUsuario.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TUsuario.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TUsuario.SetSenha(const Value: String);
begin
  FSenha := Value;
end;

end.
