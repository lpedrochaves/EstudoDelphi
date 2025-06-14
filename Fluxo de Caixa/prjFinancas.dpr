program prjFinancas;

uses
  Vcl.Forms,
  untInicio in 'FrontEnd\Paginas\Home\untInicio.pas' {frmInicio},
  UFrameFluxo in 'FrontEnd\Paginas\PáginaInicialFluxo\UFrameFluxo.pas' {FrameFluxo: TFrame},
  UFrameDespesasReceitas in 'FrontEnd\FluxoDeCaixa\Componentes\DespesasReceitas\UFrameDespesasReceitas.pas' {FrameComponenteDespesaReceita: TFrame},
  UUsuario in 'BackEnd\Model\UUsuario.pas',
  UDataBaseConfig in 'BackEnd\Repository\Factory\UDataBaseConfig.pas',
  UBaseRepository in 'BackEnd\Repository\Factory\UBaseRepository.pas',
  UUsuarioRepository in 'BackEnd\Repository\Usuario\UUsuarioRepository.pas',
  ULoginService in 'BackEnd\Service\Login\ULoginService.pas',
  ULoginController in 'BackEnd\Controller\Login\ULoginController.pas',
  ULoginPage in 'FrontEnd\Paginas\Login\ULoginPage.pas' {frmLogin},
  UFluxoDeCaixa in 'BackEnd\Model\FluxoDeCaixa\UFluxoDeCaixa.pas',
  UFluxoDeCaixaRepository in 'BackEnd\Repository\FluxoDeCaixa\UFluxoDeCaixaRepository.pas',
  UFluxoDeCaixaService in 'BackEnd\Service\FluxoDeCaixaService\UFluxoDeCaixaService.pas',
  UFluxoDeCaixaController in 'BackEnd\Controller\FluxoDeCaixa\UFluxoDeCaixaController.pas',
  UFluxoDeCaixaAtualizarModal in 'FrontEnd\Paginas\FluxoDeCaixaAtualizar\UFluxoDeCaixaAtualizarModal.pas' {frmFluxoDeCaixaAtualizarModal},
  UFluxoDeCaixaDTOPost in 'BackEnd\DTO\FluxoDeCaixa\Post\UFluxoDeCaixaDTOPost.pas',
  UCategoriaModel in 'BackEnd\Model\Categoria\UCategoriaModel.pas',
  UCategoriaRepository in 'BackEnd\Repository\Categoria\UCategoriaRepository.pas',
  UCategoriaService in 'BackEnd\Service\Categoria\UCategoriaService.pas',
  UCategoriaController in 'BackEnd\Controller\Categoria\UCategoriaController.pas',
  UCategoriaForm in 'FrontEnd\FluxoDeCaixa\Componentes\FormCategoria\UCategoriaForm.pas' {FormCategoria},
  UTipoPagamentoModel in 'BackEnd\Model\TipoPagamento\UTipoPagamentoModel.pas',
  UTipoPagamentoRepository in 'BackEnd\Repository\TipoPagamento\UTipoPagamentoRepository.pas',
  UTipoPagamentoService in 'BackEnd\Service\TipoPagamento\UTipoPagamentoService.pas',
  UTipoPagamentoController in 'BackEnd\Controller\TipoPagamento\UTipoPagamentoController.pas',
  UFluxoDeCaixaCadastrarModal in 'FrontEnd\Paginas\FluxoDeCaixaCadastrar\UFluxoDeCaixaCadastrarModal.pas' {FormFluxoDeCaixaCadastrarModal},
  Utils in 'BackEnd\Utils\Utils.pas',
  UFluxoDeCaixaMapper in 'BackEnd\DTO\FluxoDeCaixa\FluxoDeCaixaMapper\UFluxoDeCaixaMapper.pas',
  UGraficoPizzaPercentualCategorias in 'BackEnd\DTO\Grafico\GraficoPizza\UGraficoPizzaPercentualCategorias.pas',
  UGraficoPizzaPercentualCategoriasRepository in 'BackEnd\Repository\Grafico\UGraficoPizzaPercentualCategoriasRepository.pas',
  UGraficoPizzaPercentualCategoriasService in 'BackEnd\Service\Grafico\UGraficoPizzaPercentualCategoriasService.pas',
  UGraficoPizzaPercentualCategoriasController in 'BackEnd\Controller\Grafico\UGraficoPizzaPercentualCategoriasController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmInicio, frmInicio);
  Application.CreateForm(TfrmFluxoDeCaixaAtualizarModal, frmFluxoDeCaixaAtualizarModal);
  Application.CreateForm(TFormCategoria, FormCategoria);
  Application.CreateForm(TFormFluxoDeCaixaCadastrarModal, FormFluxoDeCaixaCadastrarModal);
  Application.Run;

end.
