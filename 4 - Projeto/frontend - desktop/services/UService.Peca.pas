unit UService.Peca;

interface

Uses
  UService.Base,
  Generics.Collections,
  UEntity.Pecas;

type
  TServicePeca = class(TServiceBase)
  private
    FPeca: TPeca;
    FPecas: TObjectList<TPeca>;

    function GetPecas: TObjectList<TPeca>;

    procedure PreencherPecas(const aJsonPecas: String);

  public
    constructor Create; overload;
    constructor Create(aPeca: TPeca); overload;
    destructor Destroy; override;

    procedure Registrar; override;
    procedure Listar; override;
    procedure Excluir; override;

    function ObterRegistro(const aId: Integer): TObject; override;

    property Pecas: TObjectList<TPeca> read GetPecas;
  end;

implementation

uses
  System.SysUtils,
  REST.Types,
  UService.Intf,
  UUtils.Constants,
  DataSet.Serialize,
  FireDAC.Comp.Client,
  UUtils.Functions;

{ TServicePeca }

constructor TServicePeca.Create;
begin
  Inherited Create;

  FPecas := TObjectList<TPeca>.Create;
end;

constructor TServicePeca.Create(aPeca: TPeca);
begin
  FPeca := aPeca;
  Self.Create;
end;

destructor TServicePeca.Destroy;
begin
  FreeAndNil(FPeca);
  FreeAndNil(FPecas);
  inherited;
end;

procedure TServicePeca.Excluir;
begin
  if (not Assigned(FPeca)) or (FPeca.Id = 0) then
    raise Exception.Create('Nenhum Servico foi escolhido para exclusão.');

  try
    FRESTClient.BaseURL := Format(URL_BASE_PECA + '/%d', [FPeca.Id]);
    FRESTRequest.Method := rmDelete;
    FRESTRequest.Execute;

    case FRESTResponse.StatusCode of
      API_SUCESSO_SEM_RETORNO:
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

function TServicePeca.GetPecas: TObjectList<TPeca>;
begin
  Result := FPecas;
end;

procedure TServicePeca.Listar;
begin
  try
    FRESTClient.BaseURL := URL_BASE_SERVICO;
    FRESTRequest.Method := rmGet;
    FRESTRequest.Execute;

    case FRESTResponse.StatusCode of
      API_SUCESSO:
        Self.PreencherPecas(FRESTResponse.Content);
      API_NAO_AUTORIZADO:
        raise Exception.Create('Usuário não autorizado.');
    else
      raise Exception.Create
        ('Erro ao carregar a lista de Peças. Código do Erro: ' +
        FRESTResponse.StatusCode.ToString);
    end;
  except
    on e: Exception do
      raise Exception.Create(e.Message);
  end;
end;

function TServicePeca.ObterRegistro(const aId: Integer): TObject;
begin
  Result := nil;
  // Método sem implementação no momento
end;

procedure TServicePeca.PreencherPecas(const aJsonPecas: String);
begin
  //
end;

procedure TServicePeca.Registrar;
begin
  try
    FRESTClient.BaseURL := URL_BASE_PECA;
    FRESTRequest.Params.AddBody(FPeca.JSON);
    FRESTRequest.Method := rmPost;
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
