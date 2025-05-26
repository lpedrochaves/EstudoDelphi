unit UFrameInicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, UFluxoDeCaixaController, UFluxoDeCaixaRepository, UFluxoDeCaixa,
  Utils, Generics.Collections;

type
  TFrameInicio = class(TFrame)
    pnlContainer: TPanel;
    pnlBody: TPanel;
    pnlDadosAdicionais: TPanel;
    pnlInformacoesDoGrafico: TPanel;
    pnlInformacoesDoFluxo: TPanel;
    pnlInformacaoReceita: TPanel;
    lblReceita: TLabel;
    lblValorReceita: TLabel;
    pnlInformacaoResultado: TPanel;
    lblResultado: TLabel;
    lblValorResultado: TLabel;
    pnlInfomacaoDespesa: TPanel;
    lblDespesas: TLabel;
    lblValorDespesa: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


end.
