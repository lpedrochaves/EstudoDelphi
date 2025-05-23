unit UTipoPagamentoRepository;

interface

uses
  UBaseRepository, FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Stan.Param,
  FireDAC.Phys.PGDef, System.Generics.Collections, UTipoPagamentoModel,
  System.SysUtils, System.Variants;

type
  TTipoPagamentoRepository = class
  private
    FDQuery: TFDQuery;
    FBaseRepository: TBaseRepository;
  public
    function FindAll(): TList<TTipoPagamentoModel>;
    constructor Create(ABaseRepository: TBaseRepository);
  end;

implementation

{ TTipoPagamentoRepository }

constructor TTipoPagamentoRepository.Create(ABaseRepository: TBaseRepository);
begin
  FBaseRepository := ABaseRepository;
  FDQuery := TFDQuery.Create(nil);
  FDQuery.Connection := FBaseRepository.Connection;
end;

function TTipoPagamentoRepository.FindAll: TList<TTipoPagamentoModel>;
var
  TipoPagamento: TTipoPagamentoModel;
begin
  if FDQuery = nil then
  begin
    raise Exception.Create('Erro: FDQuery não foi instanciado.');
  end;

  Result := TList<TTipoPagamentoModel>.Create;

  FDQuery.SQL.Text := 'SELECT * FROM fin.tipos_pagamento';
  FDQuery.Open;

  while not FDQuery.Eof do
  begin
    try
      TipoPagamento := TTipoPagamentoModel.Create(FDQuery.FieldByName('id')
        .AsInteger, FDQuery.FieldByName('nomepagamento').AsString);
      Result.Add(TipoPagamento);
    Except
      TipoPagamento.Free;
      raise
    end;
    FDQuery.Next;
  end;

end;

end.
