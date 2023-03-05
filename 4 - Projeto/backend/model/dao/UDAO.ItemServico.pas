unit UDAO.ItemServico;

interface

uses
  UDAO.Base, System.JSON, UDAO.Orcamento;

type
  TDAOItemServico = class(TDAOBase)
  private
    function ProcurarServicoPorId(const aId: Integer): TJSONObject;
    function ProcurarOrcamentoPorId(const aId: Integer): TJSONObject;
  public
    Constructor Create;
    function ObterRegistros: TJSONArray; override;
    function ProcurarPorId(const aIdentificador: Integer): TJSONObject;
      override;

  end;

implementation

{ TDAOItemServico }
uses
  System.SysUtils, UDAO.Intf, UDAO.Servico;

constructor TDAOItemServico.Create;
begin
  FTabela := 'itemservico';
end;

function TDAOItemServico.ProcurarServicoPorId(const aId: Integer): TJSONObject;
var
  xDAO: IDAO;
begin
  xDAO := TDAOServico.Create;
  try
    Result := xDAO.ProcurarPorId(aId);
  finally
    xDAO := nil;
  end;
end;

function TDAOItemServico.ObterRegistros: TJSONArray;
var
  xJSONArray, xJSONArrayAux: TJSONArray;
  xJSONObject: TJSONObject;
  I: Integer;
  xIdServico, xIdOrcamento: Integer;
begin
  xJSONArray := inherited;

  if xJSONArray.Count = 0 then
    Exit(xJSONArray);

  xJSONArrayAux := TJSONArray.Create;

  for I := 0 to Pred(xJSONArray.Count) do
  begin
    xJSONObject := TJSONObject.ParseJSONValue
      (TEncoding.ASCII.GetBytes(xJSONArray[I].ToJSON), 0) as TJSONObject;

    xIdServico := StrToInt(xJSONObject.GetValue('idservico').Value);
    xJSONObject.AddPair('servico', Self.ProcurarServicoPorId(xIdServico));
    xJSONObject.RemovePair('iservico');

    xIdOrcamento := StrToInt(xJSONObject.GetValue('idorcamento').Value);
    xJSONObject.AddPair('orcamento', Self.ProcurarOrcamentoPorId(xIdOrcamento));
    xJSONObject.RemovePair('idorcamento');

    xJSONArrayAux.AddElement(xJSONObject);
  end;
  FreeAndNil(xJSONArray);
  Result := xJSONArrayAux;
end;

function TDAOItemServico.ProcurarOrcamentoPorId(const aId: Integer)
  : TJSONObject;
var
  xDAO: IDAO;
begin
  xDAO := TDAOOrcamento.Create;
  try
    Result := xDAO.ProcurarPorId(aId);
  finally
    xDAO := nil;
  end;
end;

function TDAOItemServico.ProcurarPorId(const aIdentificador: Integer)
  : TJSONObject;
var
  xJSONObject: TJSONObject;
  xIdServico, xIdOrcamento: Integer;
begin
  xJSONObject := inherited;

  if xJSONObject.Count = 0 then
    Exit(xJSONObject);

  xIdServico := StrToInt(xJSONObject.GetValue('idservico').Value);
  xJSONObject.AddPair('servico', Self.ProcurarServicoPorId(xIdServico));
  xJSONObject.RemovePair('idservico');

  xIdOrcamento := StrToInt(xJSONObject.GetValue('idorcamento').Value);
  xJSONObject.AddPair('orcamento', Self.ProcurarOrcamentoPorId(xIdOrcamento));
  xJSONObject.RemovePair('idorcamento');

  Result := xJSONObject;
end;

end.
