unit UController.Carro;

interface

uses
  Horse,
  UController.Base;

type
  TControllerCarro = class(TControllerBase)
    private
    public
      class procedure Gets(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
      class procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
      class procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
      class procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
  end;

implementation

uses
  UDAO.Intf,
  UDAO.Carro;

{ TControllerCarro }

class procedure TControllerCarro.Delete(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOCarro.Create;
  inherited;
end;

class procedure TControllerCarro.Get(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOCarro.Create;
  inherited;
end;

class procedure TControllerCarro.Gets(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOCarro.Create;
  inherited;
end;

class procedure TControllerCarro.Post(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOCarro.Create;
  inherited;
end;

end.
