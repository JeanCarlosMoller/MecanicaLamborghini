unit UService.ItemPeca;

interface

Uses
  UService.Base,
  Generics.Collections,
  UEntity.ItemPecas;

type
  TServiceItemPeca = class(TServiceBase)
  private
    FItemPeca: TItemPeca;
    FItemPecas: TObjectList<TItemPeca>;

    function GetItemPecas: TObjectList<TItemPeca>;

    procedure PreencherItemPecas(const aJsonPecas: String);
    procedure PreencherPeca(const aJsonPeca: String);
    procedure PreencherOrcamento(const aJsonOrcamento: String);

  public
    constructor Create; overload;
    constructor Create(aItemPeca: TItemPeca); overload;
    destructor Destroy; override;

    procedure Registrar; override;
    procedure Listar; override;
    procedure Excluir; override;

    function ObterRegistro(const aId: Integer): TObject; override;

    property ItemPecas: TObjectList<TItemPeca> read GetItemPecas;
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

{ TServiceItemPeca }

constructor TServiceItemPeca.Create(aItemPeca: TItemPeca);
begin
  FItemPeca := aItemPeca;
  Self.Create;
end;

constructor TServiceItemPeca.Create;
begin
  Inherited Create;

  FItemPecas := TObjectList<TItemPeca>.Create;
end;

destructor TServiceItemPeca.Destroy;
begin
  FreeAndNil(FItemPeca);
  FreeAndNil(FItemPecas);
  inherited;
end;

procedure TServiceItemPeca.Excluir;
begin
  if (not Assigned(FItemPeca)) or (FItemPeca.Id = 0) then
    raise Exception.Create('Nenhum Item de Peça foi escolhido para exclusão.');

  try
    FRESTClient.BaseURL := Format(URL_BASE_ITEMPECA + '/%d', [FItemPeca.Id]);
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

function TServiceItemPeca.GetItemPecas: TObjectList<TItemPeca>;
begin
  Result := FItemPecas;
end;

procedure TServiceItemPeca.Listar;
begin
  try
    FRESTClient.BaseURL := URL_BASE_ITEMPECA;
    FRESTRequest.Method := rmGet;
    FRESTRequest.Execute;

    case FRESTResponse.StatusCode of
      API_SUCESSO:
        Self.PreencherItemPecas(FRESTResponse.Content);
      API_NAO_AUTORIZADO:
        raise Exception.Create('Usuário não autorizado.');
    else
      raise Exception.Create
        ('Erro ao carregar a lista de Times. Código do Erro: ' +
        FRESTResponse.StatusCode.ToString);
    end;
  except
    on e: Exception do
      raise Exception.Create(e.Message);
  end;
end;

function TServiceItemPeca.ObterRegistro(const aId: Integer): TObject;
begin
  Result := nil;
  // Método sem implementação no momento
end;

procedure TServiceItemPeca.PreencherItemPecas(const aJsonPecas: String);
begin
  //
end;

procedure TServiceItemPeca.PreencherOrcamento(const aJsonOrcamento: String);
begin
  //
end;

procedure TServiceItemPeca.PreencherPeca(const aJsonPeca: String);
begin
  //
end;

procedure TServiceItemPeca.Registrar;
begin
  try
    FRESTClient.BaseURL := URL_BASE_ITEMPECA;
    FRESTRequest.Params.AddBody(FItemPeca.JSON);
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
