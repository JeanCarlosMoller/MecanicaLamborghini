program backend;

{$APPTYPE CONSOLE}

uses
  Horse,
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
<<<<<<< HEAD
  UEntity.Orcamentos in 'model\entities\UEntity.Orcamentos.pas',
  UEntity.ItemServicos in 'model\entities\UEntity.ItemServicos.pas';
=======
  UDAO.ItemPeca in 'model\dao\UDAO.ItemPeca.pas',
  UDAO.ItemServico in 'model\dao\UDAO.ItemServico.pas',
  UDAO.Orcamento in 'model\dao\UDAO.Orcamento.pas',
  UDAO.Servico in 'model\dao\UDAO.Servico.pas',
  UDAO.Carro in 'model\dao\UDAO.Carro.pas';
>>>>>>> main

begin

  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('pong');
    end);

  THorse.Listen(9000,
    procedure(Horse: THorse)
    begin
      Writeln('Server is runing on port ' + IntToStr(Horse.Port));
    end);
end.