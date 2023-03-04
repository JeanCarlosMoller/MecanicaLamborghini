program backend;

{$APPTYPE CONSOLE}

uses
  Horse,
  Horse.CORS,
  Horse.Jhonson,
  Horse.JWT,
  Horse.BasicAuthentication,
  System.SysUtils,
  UDAO.Pecas in 'model\dao\UDAO.Pecas.pas',
  UEntity.Carros in 'model\entities\UEntity.Carros.pas',
  UEntity.Logins in 'model\entities\UEntity.Logins.pas',
  UEntity.Servicos in 'model\entities\UEntity.Servicos.pas',
  UEntity.Usuarios in 'model\entities\UEntity.Usuarios.pas',
  UDAO.Base in 'model\dao\UDAO.Base.pas',
  UDAO.Intf in 'model\dao\UDAO.Intf.pas',
  UUtil.Banco in 'model\utils\UUtil.Banco.pas',
  UDAO.Usuario in 'model\dao\UDAO.Usuario.pas',
  UDAO.Carro in 'model\dao\UDAO.Carro.pas',
  UController.Base in 'model\controllers\UController.Base.pas',
  UController.Usuario in 'model\controllers\UController.Usuario.pas',
  UController.Login in 'model\controllers\UController.Login.pas',
  UEntity.Orcamentos in 'model\entities\UEntity.Orcamentos.pas',
  UEntity.ItemServicos in 'model\entities\UEntity.ItemServicos.pas',
  UDAO.ItemPeca in 'model\dao\UDAO.ItemPeca.pas',
  UDAO.ItemServico in 'model\dao\UDAO.ItemServico.pas',
  UDAO.Orcamento in 'model\dao\UDAO.Orcamento.pas',
  UDAO.Servico in 'model\dao\UDAO.Servico.pas',
  UEntity.Pecas in 'model\entities\UEntity.Pecas.pas',
  UEntity.ItemPecas in 'model\entities\UEntity.ItemPecas.pas',
  UController.Carro in 'model\controllers\UController.Carro.pas',
  UController.Orcamento in 'model\controllers\UController.Orcamento.pas',
  UController.Servico in 'model\controllers\UController.Servico.pas',
  UController.Peca in 'model\controllers\UController.Peca.pas',
  UController.ItemPeca in 'model\controllers\UController.ItemPeca.pas',
  UController.ItemServico in 'model\controllers\UController.ItemServico.pas';

procedure Registry;
begin
  THorse.Group.Prefix('v1')
    .Post('/login', TControllerLogin.PostLogin);

  THorse.Group.Prefix('v1')
    .Get('/usuarios', TControllerUsuario.Gets)
    .Get('/usuarios/:id', TControllerUsuario.Get)
    .Post('/usuarios', TControllerUsuario.Post)
    .Delete('/usuarios/:id', TControllerUsuario.Delete);

  THorse.Group.Prefix('v1')
    .Get('/carros', TControllerCarro.Gets)
    .Get('/carros/:id', TControllerCarro.Get)
    .Post('/carros', TControllerCarro.Post)
    .Delete('/carros/:id', TControllerCarro.Delete);

  THorse.Group.Prefix('v1')
    .Get('/servicos', TControllerServico.Gets)
    .Get('/servicos/:id', TControllerServico.Get)
    .Post('/servicos', TControllerServico.Post)
    .Delete('/servicos/:id', TControllerServico.Delete);

  THorse.Group.Prefix('v1')
    .Get('/orcamentos', TControllerOrcamento.Gets)
    .Get('/orcamentos/:id', TControllerOrcamento.Get)
    .Post('/orcamentos', TControllerOrcamento.Post)
    .Delete('/orcamentos/:id', TControllerOrcamento.Delete);

  THorse.Group.Prefix('v1')
    .Get('/pecas', TControllerPeca.Gets)
    .Get('/pecas/:id', TControllerPeca.Get)
    .Post('/pecas', TControllerPeca.Post)
    .Delete('/pecas/:id', TControllerPeca.Delete);

  THorse.Group.Prefix('v1')
    .Get('/itempecas', TControllerItemPeca.Gets)
    .Get('/itempecas/:id', TControllerItemPeca.Get)
    .Post('/itempecas', TControllerItemPeca.Post)
    .Delete('/itempecas/:id', TControllerItemPeca.Delete);

  THorse.Group.Prefix('v1')
    .Get('/itemservico', TControllerItemServico.Gets)
    .Get('/itemservico/:id', TControllerItemServico.Get)
    .Post('/itemservico', TControllerItemServico.Post)
    .Delete('/itemservico/:id', TControllerItemServico.Delete);

end;

procedure ConfigMiddleware;
begin
  THorse
    .Use(Cors)
    .Use(Jhonson);

  THorse
    .Use(HorseBasicAuthentication(
    TControllerUsuario.ValidateUser, THorseBasicAuthenticationConfig
      .New
        .SkipRoutes(['/v1/usuarios',
                    '/v1/usuarios/:id',

                    '/v1/carros',
                    '/v1/carros/:id',
                    '/v1/orcamentos',
                    '/v1/orcamentos/:id',
                    '/v1/pecas',
                    '/v1/pecas/:id',
                    '/v1/itempecas',
                    '/v1/itempecas/:id',
                    '/v1/servicos',
                    '/v1/servicos/:id',
                    '/v1/itemservico',
                    '/v1/itemservico/:id'])));

  THorse
    .Use(HorseJWT('SECRET_KEY',
      THorseJWTConfig
        .New
          .SkipRoutes(['/v1/login',
                      '/v1/usuarios',
                      '/v1/usuarios/:id'])));
end;

begin

  ConfigMiddleware;
  Registry;
  THorse.Listen(9000,
    procedure(Horse: THorse)
    begin
      Writeln('Server is running at port ' + IntToStr(Horse.Port));
    end);
end.