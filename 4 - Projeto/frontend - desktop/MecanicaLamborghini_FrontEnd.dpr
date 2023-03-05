program MecanicaLamborghini_FrontEnd;

uses
  System.StartUpCopy,
  FMX.Forms,
  UService.Base in 'services\UService.Base.pas',
  UService.Intf in 'services\UService.Intf.pas',
  UService.Usuario in 'services\UService.Usuario.pas',
  UEntity.Carros in '..\backend\model\entities\UEntity.Carros.pas',
  UEntity.ItemPecas in '..\backend\model\entities\UEntity.ItemPecas.pas',
  UEntity.ItemServicos in '..\backend\model\entities\UEntity.ItemServicos.pas',
  UEntity.Logins in '..\backend\model\entities\UEntity.Logins.pas',
  UEntity.Orcamentos in '..\backend\model\entities\UEntity.Orcamentos.pas',
  UEntity.Pecas in '..\backend\model\entities\UEntity.Pecas.pas',
  UEntity.Servicos in '..\backend\model\entities\UEntity.Servicos.pas',
  UEntity.Usuarios in '..\backend\model\entities\UEntity.Usuarios.pas',
  UDAO.Base in '..\backend\model\dao\UDAO.Base.pas',
  UDAO.Carro in '..\backend\model\dao\UDAO.Carro.pas',
  UDAO.Intf in '..\backend\model\dao\UDAO.Intf.pas',
  UDAO.ItemPeca in '..\backend\model\dao\UDAO.ItemPeca.pas',
  UDAO.ItemServico in '..\backend\model\dao\UDAO.ItemServico.pas',
  UDAO.Orcamento in '..\backend\model\dao\UDAO.Orcamento.pas',
  UDAO.Pecas in '..\backend\model\dao\UDAO.Pecas.pas',
  UDAO.Servico in '..\backend\model\dao\UDAO.Servico.pas',
  UDAO.Usuario in '..\backend\model\dao\UDAO.Usuario.pas',
  UUtil.Banco in '..\backend\model\utils\UUtil.Banco.pas',
  UController.Base in '..\backend\model\controllers\UController.Base.pas',
  UController.Carro in '..\backend\model\controllers\UController.Carro.pas',
  UController.ItemPeca in '..\backend\model\controllers\UController.ItemPeca.pas',
  UController.ItemServico in '..\backend\model\controllers\UController.ItemServico.pas',
  UController.Login in '..\backend\model\controllers\UController.Login.pas',
  UController.Orcamento in '..\backend\model\controllers\UController.Orcamento.pas',
  UController.Peca in '..\backend\model\controllers\UController.Peca.pas',
  UController.Servico in '..\backend\model\controllers\UController.Servico.pas',
  UController.Usuario in '..\backend\model\controllers\UController.Usuario.pas',
  UService.Usuario.Authenticated in 'services\UService.Usuario.Authenticated.pas',
  UUtils.Constants in 'utils\UUtils.Constants.pas',
  UService.Servico in 'services\UService.Servico.pas',
  UUtils.Functions in 'utils\UUtils.Functions.pas',
  UService.Login in 'services\UService.Login.pas',
  UService.Carro in 'services\UService.Carro.pas',
  UService.Peca in 'services\UService.Peca.pas',
  UService.ItemPeca in 'services\UService.ItemPeca.pas',
  UService.Orcamento in 'services\UService.Orcamento.pas',
  UService.ItemServico in 'services\UService.ItemServico.pas',
  UfrmLogin in 'views\UfrmLogin.pas' {FrmLogin},
  UfrmOrcamentosMecanico in 'views\UfrmOrcamentosMecanico.pas' {frmOrcamentosMecanico};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TfrmOrcamentosMecanico, frmOrcamentosMecanico);
  Application.Run;
end.
