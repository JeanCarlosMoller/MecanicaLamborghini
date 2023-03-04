unit UController.Orcamento;

interface

uses
  Horse,
  UController.Base;

type
  TControllerOrcamento = class(TControllerBase)
    private
    public
      class procedure Gets(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
      class procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
      class procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
      class procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
  end;

implementation

{ TControllerOrcamento }

uses
  UDAO.Intf,
  UDAO.Orcamento;

class procedure TControllerOrcamento.Delete(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOOrcamento.Create;
  Inherited;
end;

class procedure TControllerOrcamento.Get(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOOrcamento.Create;
  Inherited;
end;

class procedure TControllerOrcamento.Gets(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOOrcamento.Create;
  Inherited;
end;

class procedure TControllerOrcamento.Post(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOOrcamento.Create;
  Inherited;
end;

end.

