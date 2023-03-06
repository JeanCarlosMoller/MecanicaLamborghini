unit UService.ItemServico;

interface

Uses
  UService.Base,
  Generics.Collections,
  UEntity.ItemServicos;

type
  TServiceItemServico = class(TServiceBase)
  private
    FItemServico: TItemServico;
    FItemServicos: TObjectList<TItemServico>;

    function GetItemServicos: TObjectList<TItemServico>;

    procedure PreencherItemServicos(const aJsonServicos: String);
    procedure PreencherServico(const aJsonServico: String);
    procedure PreencherOrcamento(const aJsonOrcamento: String);

  public
    constructor Create; overload;
    constructor Create(aItemServico: TItemServico); overload;
    destructor Destroy; override;

    procedure Registrar; override;
    procedure Listar; override;
    procedure Excluir; override;

    function ObterRegistro(const aId: Integer): TObject; override;

    property ItemServicos: TObjectList<TItemServico> read GetItemServicos;
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

{ TServiceItemServico }

constructor TServiceItemServico.Create;
begin
  Inherited Create;

  FItemServicos := TObjectList<TItemServico>.Create;
end;

constructor TServiceItemServico.Create(aItemServico: TItemServico);
begin
  FItemServico := aItemServico;
  Self.Create;
end;

destructor TServiceItemServico.Destroy;
begin
  FreeAndNil(FItemServico);
  FreeAndNil(FItemServicos);
  inherited;
end;

procedure TServiceItemServico.Excluir;
begin
  if (not Assigned(FItemServico)) or (FItemServico.Id = 0) then
    raise Exception.Create
      ('Nenhum Item de Serviço foi escolhido para exclusão.');

  try
    FRESTClient.BaseURL := Format(URL_BASE_ITEMSERVICO + '/%d',
      [FItemServico.Id]);
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

function TServiceItemServico.GetItemServicos: TObjectList<TItemServico>;
begin
  Result := FItemServicos;
end;

procedure TServiceItemServico.Listar;
begin
  try
    FRESTClient.BaseURL := URL_BASE_ITEMSERVICO;
    FRESTRequest.Method := rmGet;
    FRESTRequest.Execute;

    case FRESTResponse.StatusCode of
      API_SUCESSO:
        Self.PreencherItemServicos(FRESTResponse.Content);
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

function TServiceItemServico.ObterRegistro(const aId: Integer): TObject;
begin
  Result := nil;
  // Método sem implementação no momento
end;

procedure TServiceItemServico.PreencherItemServicos(const aJsonServicos
  : String);
begin
  //
end;

procedure TServiceItemServico.PreencherOrcamento(const aJsonOrcamento: String);
begin
  //
end;

procedure TServiceItemServico.PreencherServico(const aJsonServico: String);
begin
  //
end;

procedure TServiceItemServico.Registrar;
begin
  try
    FRESTClient.BaseURL := URL_BASE_ITEMSERVICO;
    FRESTRequest.Params.AddBody(FItemServico.JSON);
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
