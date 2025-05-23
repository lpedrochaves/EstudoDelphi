unit Utils;

interface

uses
  System.SysUtils;

function ConverterValorParaFloat(const Texto: string): Double;

function ConverterValorParaTexto(const Valor: Double): string;


implementation

function ConverterValorParaFloat(const Texto: string): Double;
var
  ValorLimpo: string;
  FormatSettings: TFormatSettings;
begin
  ValorLimpo := StringReplace(Texto, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
  ValorLimpo := StringReplace(ValorLimpo, '.', '', [rfReplaceAll]);
  Result := StrToFloat(ValorLimpo);
end;

function ConverterValorParaTexto(const Valor: Double): string;
var
  Texto: string;
begin
  Result := 'R$ ' + FormatFloat('#,##0.00', Valor);

end;

end.
