unit UController.Peca;

interface

uses
  Horse,
  UController.Base;

type
  TControllerPeca = class (TControllerBase)
    private
    public
      class procedure Gets(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
      class procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
      class procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
      class procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
  end;

implementation

uses
  UDAO.Pecas;

{ TControllerPeca }

class procedure TControllerPeca.Delete(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOPecas.Create;
  inherited;
end;

class procedure TControllerPeca.Get(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOPecas.Create;
  inherited;
end;

class procedure TControllerPeca.Gets(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOPecas.Create;
  inherited;
end;

class procedure TControllerPeca.Post(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOPecas.Create;
  inherited;
end;

end.
