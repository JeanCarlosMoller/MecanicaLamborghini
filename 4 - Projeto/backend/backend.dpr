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
  UController.Login in 'model\controllers\UController.Login.pas';

procedure Registry;
begin
  THorse.Group.Prefix('v1')
    .Post('/login', TControllerLogin.PostLogin);

  THorse.Group.Prefix('v1')
    .Get('/usuarios', TControllerUsuario.Gets)
    .Get('/usuarios/:id', TControllerUsuario.Get)
    .Post('/usuarios', TControllerUsuario.Post)
    .Delete('/usuarios/:id', TControllerUsuario.Delete);
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
                    '/v1/usuarios/:id'])));

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