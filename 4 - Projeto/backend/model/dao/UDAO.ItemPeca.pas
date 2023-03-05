unit UDAO.ItemPeca;

interface

uses
  UDAO.Base, System.JSON;

type
  TDAOItemPeca = class(TDAOBase)
  private
    function ProcurarPecaPorId(const aId: Integer): TJSONObject;
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
  System.SysUtils, UDAO.Intf, UDAO.Pecas, UDAO.Orcamento;

constructor TDAOItemPeca.Create;
begin
  FTabela := 'itempeca';
end;

function TDAOItemPeca.ProcurarPecaPorId(const aId: Integer): TJSONObject;
var
  xDAO: IDAO;
begin
  xDAO := TDAOPecas.Create;
  try
    Result := xDAO.ProcurarPorId(aId);
  finally
    xDAO := nil;
  end;
end;

function TDAOItemPeca.ProcurarPorId(const aIdentificador: Integer): TJSONObject;
var
  xJSONObject: TJSONObject;
  xIdPeca, xIdOrcamento: Integer;
begin
  xJSONObject := inherited;

  if xJSONObject.Count = 0 then
    Exit(xJSONObject);

  xIdPeca := StrToInt(xJSONObject.GetValue('idpeca').Value);
  xJSONObject.AddPair('peca', Self.ProcurarPecaPorId(xIdPeca));
  xJSONObject.RemovePair('idpeca');

  xIdOrcamento := StrToInt(xJSONObject.GetValue('idorcamento').Value);
  xJSONObject.AddPair('orcamento', Self.ProcurarOrcamentoPorId(xIdOrcamento));
  xJSONObject.RemovePair('idorcamento');

  Result := xJSONObject;
end;

function TDAOItemPeca.ObterRegistros: TJSONArray;
var
  xJSONArray, xJSONArrayAux: TJSONArray;
  xJSONObject: TJSONObject;
  I: Integer;
  xIdPeca, xIdOrcamento: Integer;
begin
  xJSONArray := inherited;

  if xJSONArray.Count = 0 then
    Exit(xJSONArray);

  xJSONArrayAux := TJSONArray.Create;

  for I := 0 to Pred(xJSONArray.Count) do
  begin
    xJSONObject := TJSONObject.ParseJSONValue
      (TEncoding.ASCII.GetBytes(xJSONArray[I].ToJSON), 0) as TJSONObject;

    xIdPeca := StrToInt(xJSONObject.GetValue('idpeca').Value);
    xJSONObject.AddPair('peca', Self.ProcurarPecaPorId(xIdPeca));
    xJSONObject.RemovePair('idpeca');

    xIdOrcamento := StrToInt(xJSONObject.GetValue('idorcamento').Value);
    xJSONObject.AddPair('orcamento', Self.ProcurarOrcamentoPorId(xIdOrcamento));
    xJSONObject.RemovePair('idorcamento');

    xJSONArrayAux.AddElement(xJSONObject);
  end;

  FreeAndNil(xJSONArray);
  Result := xJSONArrayAux;
end;

function TDAOItemPeca.ProcurarOrcamentoPorId(const aId: Integer): TJSONObject;
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

end.
