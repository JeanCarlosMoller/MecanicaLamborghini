unit UController.ItemPeca;

interface

uses
  Horse,
  UController.Base;

type
  TControllerItemPeca = class (TControllerBase)
    private
    public
      class procedure Gets(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
      class procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
      class procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
      class procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
  end;

implementation

uses
  UDAO.ItemPeca;

{ TControllerItemPeca }

class procedure TControllerItemPeca.Delete(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOItemPeca.Create;
  inherited;
end;

class procedure TControllerItemPeca.Get(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOItemPeca.Create;
  inherited;
end;

class procedure TControllerItemPeca.Gets(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOItemPeca.Create;
  inherited;
end;

class procedure TControllerItemPeca.Post(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOItemPeca.Create;
  inherited;
end;

end.
