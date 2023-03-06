unit UService.Orcamento;

interface

Uses
  UService.Base,
  Generics.Collections,
  UEntity.Orcamentos;

type
  TServiceOrcamento = class(TServiceBase)
  private
    FOrcamento: TOrcamento;
    FOrcamentos: TObjectList<TOrcamento>;

    function GetOrcamentos: TObjectList<TOrcamento>;

    procedure PreencherOrcamentos(const aJsonOrcamentos: String);

  public
    constructor Create; overload;
    constructor Create(aOrcamento: TOrcamento); overload;
    destructor Destroy; override;

    procedure Registrar; override;
    procedure Listar; override;
    procedure Excluir; override;

    function ObterRegistro(const aId: Integer): TObject; override;

    property Orcamentos: TObjectList<TOrcamento> read GetOrcamentos;
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

{ TServiceOrcamento }

constructor TServiceOrcamento.Create;
begin
  Inherited Create;

  FOrcamentos := TObjectList<TOrcamento>.Create;
end;

constructor TServiceOrcamento.Create(aOrcamento: TOrcamento);
begin
  FOrcamento := aOrcamento;
  Self.Create;
end;

destructor TServiceOrcamento.Destroy;
begin
  FreeAndNil(FOrcamento);
  FreeAndNil(FOrcamentos);
  inherited;
end;

procedure TServiceOrcamento.Excluir;
begin
  if (not Assigned(FOrcamento)) or (FOrcamento.Id = 0) then
    raise Exception.Create('Nenhum Orçamento foi escolhido para exclusão.');

  try
    FRESTClient.BaseURL := Format(URL_BASE_ORCAMENTO + '/%d', [FOrcamento.Id]);
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

function TServiceOrcamento.GetOrcamentos: TObjectList<TOrcamento>;
begin
  Result := FOrcamentos;
end;

procedure TServiceOrcamento.Listar;
begin
    try
    FRESTClient.BaseURL := URL_BASE_SERVICO;
    FRESTRequest.Method := rmGet;
    FRESTRequest.Execute;

    case FRESTResponse.StatusCode of
      API_SUCESSO:
        Self.PreencherOrcamentos(FRESTResponse.Content);
      API_NAO_AUTORIZADO:
        raise Exception.Create('Usuário não autorizado.');
    else
      raise Exception.Create
        ('Erro ao carregar a lista de Orçamentos. Código do Erro: ' +
        FRESTResponse.StatusCode.ToString);
    end;
  except
    on e: Exception do
      raise Exception.Create(e.Message);
  end;

end;

function TServiceOrcamento.ObterRegistro(const aId: Integer): TObject;
begin
  Result := nil;
  // Método sem implementação no momento
end;

procedure TServiceOrcamento.PreencherOrcamentos(const aJsonOrcamentos: String);
begin
  //
end;

procedure TServiceOrcamento.Registrar;
begin
  try
    FRESTClient.BaseURL := URL_BASE_ORCAMENTO;
    FRESTRequest.Params.AddBody(FOrcamento.JSON);
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
