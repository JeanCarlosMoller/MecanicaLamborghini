unit UDAO.Carro;

interface

uses
  UDAO.Base, JSON;

type
  TDAOCarro = class(TDAOBase)
    private
      function ProcurarUsuario(const aId: Integer): TJSONObject;
    public
      function ObterRegistros: TJSONArray; virtual;
      function ProcurarPorId(const aIdentificador: Integer): TJSONObject; override;
      constructor Create;
  end;

implementation

uses
  SysUtils, UDAO.Intf, UDAO.Usuario;

{ TDAOCarro }

constructor TDAOCarro.Create;
begin
  FTabela := 'carro'
end;

function TDAOCarro.ObterRegistros: TJSONArray;
var
  xJSONArray, xJSONArrayAux: TJSONArray;
  xJSONObject: TJSONObject;
  I: Integer;
  xIdUser: Integer;
begin
  xJSONArray := inherited;

  if xJSONArray.Count = 0 then
    Exit(xJSONArray);

  xJSONArrayAux := TJSONArray.Create;

  for I := 0 to Pred(xJSONArray.Count) do
  begin
    xJSONObject := TJSONObject.ParseJSONValue(
      TEncoding.ASCII.GetBytes(
        xJSONArray[I].ToJSON), 0) as TJSONObject;

    xIdUser := StrToInt(xJSONObject.GetValue('idusuario').Value);
    xJSONObject.AddPair('usuario', Self.ProcurarUsuario(xIdUser));
    xJSONObject.RemovePair('idusuario');

    xJSONArrayAux.AddElement(xJSONObject);
  end;

  FreeAndNil(xJSONArray);
  Result := xJSONArrayAux;
end;

function TDAOCarro.ProcurarPorId(const aIdentificador: Integer): TJSONObject;
var
  xJSONObject: TJSONObject;
  xIdUser: Integer;
begin
  xJSONObject := inherited;

  if xJSONObject.Count = 0 then
    Exit(xJSONObject);

  xIdUser := StrToInt(xJSONObject.GetValue('idusuario').Value);
  xJSONObject.AddPair('usuario', Self.ProcurarUsuario(xIdUser));
  xJSONObject.RemovePair('idusuario');

  Result := xJSONObject;
end;

function TDAOCarro.ProcurarUsuario(const aId: Integer): TJSONObject;
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
