unit UEntity.Orcamentos;

interface

uses
  UEntity.Usuarios,
  UEntity.Carros,
  System.JSON;

type
  TOrcamento = class
  private
    FId: Integer;
    FTotalPeca: Double;
    FTotalServico: Double;
    FValorTotal: Double;
    FDescricao: String;
    FStatus: String;
    FCarro: TCarro;
    FUsuario: TUsuario;
    FJSON: TJSONObject;

    function GetId: Integer;
    function GetTotalPeca: Double;
    function GetTotalServico: Double;
    function GetValorTotal: Double;
    function GetDescricao: String;
    function GetStatus: String;
    function GetCarro: TCarro;
    function GetUsuario: TUsuario;
    function GetJSON: TJSONObject;

    procedure SetId(const Value: Integer);
    procedure SetTotalPeca(const Value: Double);
    procedure SetTotalServico(const Value: Double);
    procedure SetValorTotal(const Value: Double);
    procedure SetDescricao(const Value: String);
    procedure SetStatus(const Value: String);
    procedure SetCarro(const Value: TCarro);
    procedure SetUsuario(const Value: TUsuario);

  public
    constructor Create; overload;
    constructor Create(const aId: Integer); overload;
    constructor Create(const aId: Integer; const aTotalPeca, aTotalServico,
      aValorTotal: Double; const aUsuario: TUsuario;
      const aCarro: TCarro); overload;

    destructor Destroy; override;

    property Id: Integer read GetId write SetId;
    property TotalPeca: Double read GetTotalPeca write SetTotalPeca;
    property TotalServico: Double read GetTotalServico write SetTotalServico;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;
    property Descricao: String read GetDescricao write SetDescricao;
    property Status: String read GetStatus write SetStatus;
    property Carro: TCarro read GetCarro write SetCarro;
    property Usuario: TUsuario read GetUsuario write SetUsuario;

  end;

implementation

uses
  System.SysUtils;

{ TOrcamento }

constructor TOrcamento.Create;
begin
  FJSON := TJSONObject.Create;
end;

constructor TOrcamento.Create(const aId: Integer);
begin
  FId := aId;
  Self.Create;
end;

constructor TOrcamento.Create(const aId: Integer;
  const aTotalPeca, aTotalServico, aValorTotal: Double;
  const aUsuario: TUsuario; const aCarro: TCarro);
begin
  FId           := aId;
  FTotalPeca    := aTotalPeca;
  FTotalServico := aTotalServico;
  FValorTotal   := aValorTotal;
  FUsuario      := aUsuario;
  FCarro        := aCarro;
  Self.Create;
end;

destructor TOrcamento.Destroy;
begin
  FreeAndNil(FUsuario);
  FreeAndNil(FCarro);
  inherited;
end;

function TOrcamento.GetCarro: TCarro;
begin
  Result := FCarro;
end;

function TOrcamento.GetDescricao: String;
begin
  Result := FDescricao;
end;

function TOrcamento.GetId: Integer;
begin
  Result := FId;
end;

function TOrcamento.GetJSON: TJSONObject;
begin
  FJSON.AddPair('id',           FId.ToString);
  FJSON.AddPair('totalPeca',    FTotalPeca.ToString);
  FJSON.AddPair('totalServico', FTotalServico.ToString);
  FJSON.AddPair('valorTotal',   FValorTotal.ToString);
  FJSON.AddPair('descricao',    FDescricao);
  FJSON.AddPair('status',       FStatus);
  FJSON.AddPair('idusuario',    FUsuario.id.ToString);
  FJSON.AddPair('idcarro',      FCarro.id.ToString);
  Result := FJSON;
end;

function TOrcamento.GetStatus: String;
begin
  Result := FStatus;
end;

function TOrcamento.GetTotalPeca: Double;
begin
  Result := FTotalPeca;
end;

function TOrcamento.GetTotalServico: Double;
begin
  Result := FTotalServico;
end;

function TOrcamento.GetUsuario: TUsuario;
begin
  Result := FUsuario;
end;

function TOrcamento.GetValorTotal: Double;
begin
  Result := FValorTotal;
end;

procedure TOrcamento.SetCarro(const Value: TCarro);
begin
  FCarro := Value;
end;

procedure TOrcamento.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TOrcamento.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrcamento.SetStatus(const Value: String);
begin
  FStatus := Value;
end;

procedure TOrcamento.SetTotalPeca(const Value: Double);
begin
  FTotalPeca := Value;
end;

procedure TOrcamento.SetTotalServico(const Value: Double);
begin
  FTotalServico := Value;
end;

procedure TOrcamento.SetUsuario(const Value: TUsuario);
begin
  FUsuario := Value;
end;

procedure TOrcamento.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

end.
