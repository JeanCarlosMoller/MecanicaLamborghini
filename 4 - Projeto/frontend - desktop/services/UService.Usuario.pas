unit UService.Usuario;

interface

uses
  UService.Base,
  UUtils.Constants,
  UEntity.Usuarios;

type
  TServiceUsuario = class(TServiceBase)
  private
    FUsuario: TUsuario;
  public
    constructor Create; overload;
    constructor Create(aUsuario: TUsuario); overload;
    destructor Destroy; override;

    procedure Registrar; override;
    procedure Listar; override;
    procedure Excluir; override;

    function ObterRegistro(const aId: Integer): TObject; override;
  end;

implementation

uses
  REST.Types,
  System.JSON,
  System.SysUtils,
  System.Classes,
  DataSet.Serialize,
  FireDAC.comp.Client;

{ TServiceUsuario }

constructor TServiceUsuario.Create;
begin
  Inherited Create;
end;

constructor TServiceUsuario.Create(aUsuario: TUsuario);
begin
  FUsuario := aUsuario;
  Self.Create;
end;

destructor TServiceUsuario.Destroy;
begin
  FreeAndNil(FUsuario);
  inherited;
end;

procedure TServiceUsuario.Excluir;
begin
  //
end;

procedure TServiceUsuario.Listar;
begin
  //
end;

function TServiceUsuario.ObterRegistro(const aId: Integer): TObject;
var
  xMemTable: TFDMemTable;
begin
  Result := nil;

  xMemTable := TFDMemTable.Create(nil);

  try
    FRESTClient.BaseURL := URL_BASE_USUARIO + '/' + aId.ToString;
    FRESTRequest.Method := rmGet;
    FRESTRequest.Execute;

    if FRESTResponse.StatusCode = API_SUCESSO then
    begin
      xMemTable.LoadFromJSON(FRESTResponse.Content);

      if xMemTable.FindFirst then
        Result := TUsuario.Create(xMemTable.FieldByName('id').AsInteger);
    end;
  finally
    FreeAndNil(xMemTable);
  end;

end;

procedure TServiceUsuario.Registrar;
begin
  try
    FRESTClient.BaseURL := URL_BASE_USUARIO;
    FRESTRequest.Method := rmPost;
    FRESTRequest.Params.AddBody(FUsuario.JSON);
    FRESTRequest.Execute;

    case FRESTResponse.StatusCode of
      API_CRIADO:
        Exit;
      API_NAO_AUTORIZADO:
        raise Exception.Create('Usuário não autorizado.');
    else
      raise Exception.Create('Erro não catalogado.');
    end;
  except
    on e: Exception do
      raise Exception.Create(e.Message);
  end;
end;

end.
