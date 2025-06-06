unit UGraficoPizzaPercentualCategorias;

interface

type
  TGraficoPizzaPercentualCategorias = class

  private
    FData: TDate;
    FCategoria: string;
    FTipo: string;
    FPagamento: string;
    FTotalValorCategoria: double;

    function GetData: TDate;
    procedure SetData(const Value: TDate);

    function GetCategoria: string;
    procedure SetCategoria(const Value: string);

    function GetTipo: string;
    procedure SetTipo(const Value: string);

    function GetPagamento: string;
    procedure SetPagamento(const Value: string);

    function GetTotalValorCategoria: double;
    procedure SetTotalValorCategoria(const Value: double);

  public
    constructor Create(ACategoria, ATipo, APagamento: string;
      ATotalValorCategoria: double); overload;
    constructor Create(AData: TDate; ACategoria, ATipo: string;
      ATotalValorCategoria: double); overload;
    constructor Create(); overload;
    property Categoria: String read GetCategoria write SetCategoria;
    property Tipo: String read GetTipo write SetTipo;
    property Pagamento: String read GetPagamento write SetPagamento;
    property TotalValorCategoria: double read GetTotalValorCategoria
      write SetTotalValorCategoria;
    property Data: TDate read GetData write SetData;

  end;

implementation

constructor TGraficoPizzaPercentualCategorias.Create;
begin

end;

constructor TGraficoPizzaPercentualCategorias.Create(AData: TDate;
  ACategoria, ATipo: string; ATotalValorCategoria: double);
begin
  FData := AData;
  FCategoria := ACategoria;
  FTipo := ATipo;
  FTotalValorCategoria := ATotalValorCategoria;
end;

constructor TGraficoPizzaPercentualCategorias.Create(ACategoria, ATipo,
  APagamento: string; ATotalValorCategoria: double);
begin
  FCategoria := ACategoria;
  FTipo := ATipo;
  FPagamento := APagamento;
  FTotalValorCategoria := ATotalValorCategoria;
end;

function TGraficoPizzaPercentualCategorias.GetData: TDate;
begin
  Result := FData;
end;

procedure TGraficoPizzaPercentualCategorias.SetData(const Value: TDate);
begin
  FData := Value;
end;

function TGraficoPizzaPercentualCategorias.GetCategoria: string;
begin
  Result := FCategoria;
end;

procedure TGraficoPizzaPercentualCategorias.SetCategoria(const Value: string);
begin
  FCategoria := Value;
end;

function TGraficoPizzaPercentualCategorias.GetTipo: string;
begin
  Result := FTipo;
end;

procedure TGraficoPizzaPercentualCategorias.SetTipo(const Value: string);
begin
  FTipo := Value;
end;

function TGraficoPizzaPercentualCategorias.GetPagamento: string;
begin
  Result := FPagamento;
end;

procedure TGraficoPizzaPercentualCategorias.SetPagamento(const Value: string);
begin
  FPagamento := Value;
end;

function TGraficoPizzaPercentualCategorias.GetTotalValorCategoria: double;
begin
  Result := FTotalValorCategoria;
end;

procedure TGraficoPizzaPercentualCategorias.SetTotalValorCategoria
  (const Value: double);
begin
  FTotalValorCategoria := Value;
end;

end.
