unit UDAO.Orcamento;

interface

uses
  UDAO.Base, System.JSON, UDAO.Carro, UDAO.Usuario;

type
  TDAOOrcamento = class(TDAOBase)
  private
    function ProcurarUsuarioPorId(const aId: Integer): TJSONObject;
    function ProcurarCarroPorId(const aId: Integer): TJSONObject;
  public
    Constructor Create;
    function ObterRegistros: TJSONArray; override;
    function ProcurarPorId(const aIdentificador: Integer): TJSONObject;
      override;
  end;

implementation

uses
  System.SysUtils, UDAO.Intf;

{ TDAOOrcamento }

constructor TDAOOrcamento.Create;
begin
  FTabela := 'orcamento';
end;

function TDAOOrcamento.ObterRegistros: TJSONArray;
var
  xJSONArray, xJSONArrayAux: TJSONArray;
  xJSONObject: TJSONObject;
  I: Integer;
  xIdUsuario, xIdCarro: Integer;
begin
  xJSONArray := inherited;

  if xJSONArray.Count = 0 then
    Exit(xJSONArray);

  xJSONArrayAux := TJSONArray.Create;

  for I := 0 to Pred(xJSONArray.Count) do
  begin
    xJSONObject := TJSONObject.ParseJSONValue
      (TEncoding.ASCII.GetBytes(xJSONArray[I].ToJSON), 0) as TJSONObject;

    xIdUsuario := StrToInt(xJSONObject.GetValue('idusuario').Value);
    xJSONObject.AddPair('usuario', Self.ProcurarUsuarioPorId(xIdUsuario));
    xJSONObject.RemovePair('idusuario');

    xIdCarro := StrToInt(xJSONObject.GetValue('idcarro').Value);
    xJSONObject.AddPair('carro', Self.ProcurarCarroPorId(xIdCarro));
    xJSONObject.RemovePair('idcarro');

    xJSONArrayAux.AddElement(xJSONObject);
  end;
  FreeAndNil(xJSONArray);
  Result := xJSONArrayAux;

end;

function TDAOOrcamento.ProcurarCarroPorId(const aId: Integer): TJSONObject;
var
  xDAO: IDAO;
begin
  xDAO := TDAOCarro.Create;
  try
    Result := xDAO.ProcurarPorId(aId);
  finally
    xDAO := nil;
  end;
end;

function TDAOOrcamento.ProcurarPorId(const aIdentificador: Integer)
  : TJSONObject;
var
  xJSONObject: TJSONObject;
  xIdUsuario, xIdCarro: Integer;
begin
  xJSONObject := inherited;

  if xJSONObject.Count = 0 then
    Exit(xJSONObject);

  xIdUsuario := StrToInt(xJSONObject.GetValue('idusuario').Value);
  xJSONObject.AddPair('usuario', Self.ProcurarUsuarioPorId(xIdUsuario));
  xJSONObject.RemovePair('idusuario');

  xIdCarro := StrToInt(xJSONObject.GetValue('idcarro').Value);
  xJSONObject.AddPair('carro', Self.ProcurarCarroPorId(xIdCarro));
  xJSONObject.RemovePair('idcarro');

  Result := xJSONObject;
end;

function TDAOOrcamento.ProcurarUsuarioPorId(const aId: Integer): TJSONObject;
var
  xDAO: IDAO;
begin
  xDAO := TDAOUsuario.Create;
  try
    Result := xDAO.ProcurarPorId(aId);
  finally
    xDAO := nil;
  end;
end;

end.
