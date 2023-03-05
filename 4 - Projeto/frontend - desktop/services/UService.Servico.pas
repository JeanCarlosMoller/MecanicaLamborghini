unit UService.Servico;

interface

Uses
  UService.Base,
  Generics.Collections,
  UEntity.Servicos;

type
  TServiceServico = class(TServiceBase)
  private
    FServico: TServico;
    FServicos: TObjectList<TServico>;

    function GetServicos: TObjectList<TServico>;

    procedure PreencherServicos(const aJsonServicos: String);

  public
    constructor Create; overload;
    constructor Create(aServico: TServico); overload;
    destructor Destroy; override;

    procedure Registrar; override;
    procedure Listar; override;
    procedure Excluir; override;

    function ObterRegistro(const aId: Integer): TObject; override;

    property Servicos: TObjectList<TServico> read GetServicos;
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

{ TServiceServico }

constructor TServiceServico.Create;
begin
  Inherited Create;

  FServicos := TObjectList<TServico>.Create;
end;

constructor TServiceServico.Create(aServico: TServico);
begin
  FServico := aServico;
  Self.Create;
end;

destructor TServiceServico.Destroy;
begin
  FreeAndNil(FServico);
  FreeAndNil(FServicos);
  inherited;
end;

procedure TServiceServico.Excluir;
begin
  if (not Assigned(FServico)) or (FServico.Id = 0) then
    raise Exception.Create('Nenhum Servico foi escolhido para exclusão.');

  try
    FRESTClient.BaseURL := Format(URL_BASE_SERVICO + '/%d', [FServico.Id]);
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

function TServiceServico.GetServicos: TObjectList<TServico>;
begin
  Result := FServicos;
end;

procedure TServiceServico.Listar;
begin
  try
    FRESTClient.BaseURL := URL_BASE_SERVICO;
    FRESTRequest.Method := rmGet;
    FRESTRequest.Execute;

    case FRESTResponse.StatusCode of
      API_SUCESSO:
        Self.PreencherServicos(FRESTResponse.Content);
      API_NAO_AUTORIZADO:
        raise Exception.Create('Usuário não autorizado.');
    else
      raise Exception.Create
        ('Erro ao carregar a lista de Serviços. Código do Erro: ' +
        FRESTResponse.StatusCode.ToString);
    end;
  except
    on e: Exception do
      raise Exception.Create(e.Message);
  end;

end;

function TServiceServico.ObterRegistro(const aId: Integer): TObject;
begin
  Result := nil;
  //Método sem implementação no momento
end;

procedure TServiceServico.PreencherServicos(const aJsonServicos: String);
var
  xMemTable: TFDMemTable;
  xStatus: byte;
begin
  FServicos.Clear;
  xMemTable := TFDMemTable.Create(nil);

  try
    xMemTable.LoadFromJSON(FRESTResponse.Content);

    while not xMemTable.Eof do
    begin

      xStatus := TUtilsFunctions.IIF<Byte>(
        xMemTable.FieldByName('status').AsString = 'true',
        1, 0);

      FServicos.Add(TServico.Create(xMemTable.FieldByName('id').AsInteger,
                                xMemTable.FieldByName('nome').AsString,
                                //xMemTable.FieldByName('valorUnAtual').As,
                                xMemTable.FieldByName('unMedida').AsString,
                                xStatus));

      xMemTable.Next;
    end;
  finally
    FreeAndNil(xMemTable);
  end;
end;

procedure TServiceServico.Registrar;
begin
   try
    FRESTClient.BaseURL := URL_BASE_SERVICO;
    FRESTRequest.Params.AddBody(FServico.JSON);
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
    on e: exception do
      raise Exception.Create(e.Message);
  end;
end;

end.
