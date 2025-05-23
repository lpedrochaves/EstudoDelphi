unit UTipoPagamentoModel;

interface

type
  TTipoPagamentoModel = class

  private
    FId: Integer;
    FTipoPagamento: string;
    function GetId: Integer;
    function GetTipoPagamento: String;
    procedure SetId(const Value: Integer);
    procedure SetTipoPagamento(const Value: String);
  public
    constructor Create(AID: Integer; ATipoPagamento: String); overload;
    constructor Create(); overload;
    property Id: Integer read GetId write SetId;
    property TipoPagamento: String read GetTipoPagamento write SetTipoPagamento;
  end;

implementation

{ TTipoPagamentoModel }

constructor TTipoPagamentoModel.Create(AID: Integer; ATipoPagamento: String);
begin
  FId := AID;
  FTipoPagamento := ATipoPagamento;
end;

constructor TTipoPagamentoModel.Create;
begin

end;

function TTipoPagamentoModel.GetId: Integer;
begin
  Result := FId;
end;

function TTipoPagamentoModel.GetTipoPagamento: String;
begin
  Result := FTipoPagamento;
end;

procedure TTipoPagamentoModel.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TTipoPagamentoModel.SetTipoPagamento(const Value: String);
begin
  FTipoPagamento := Value;
end;

end.
