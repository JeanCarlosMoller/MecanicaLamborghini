unit UEntity.Servicos;

interface

uses
  System.JSON;

type
  TServico = class
  private
    FId: Integer;
    FNome: String;
    FValorUnAtual: Double;
    FUnMedida: String;
    FJSON: TJSONObject;

    function GetId: Integer;
    function GetNome: String;
    function GetValorUnAtual: Double;
    function GetUnMedida: String;
    function GetJSON: TJSONObject;

    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetValorUnAtual(const Value: Double);
    procedure SetUnMedida(const Value: String);

  public
    constructor Create; overload;
    constructor Create(const aId: Integer); overload;

    constructor Create(aId: Integer; aNome, aUnMedida: String;
                        aValorUnAtual: Double); overload;

    destructor Destroy; override;

    property Id: Integer read GetId write SetId;
    property Nome: String read GetNome write SetNome;
    property ValorUnAtual: Double read GetValorUnAtual write SetValorUnAtual;
    property UnMedida: String read GetUnMedida write SetUnMedida;

    property JSON: TJSONObject read GetJSON;
  end;

implementation

uses
  System.SysUtils;

{ TServico }

constructor TServico.Create;
begin
  FJSON := TJSONObject.Create;
end;

constructor TServico.Create(const aId: Integer);
begin
  FId := aId;
  Self.Create;
end;

constructor TServico.Create(aId: Integer; aNome, aUnMedida: String; aValorUnAtual: Double);
begin
  FId           := aId;
  FNome         := aNome;
  FUnMedida     := aUnMedida;
  FValorUnAtual := aValorUnAtual;
  Self.Create;
end;

destructor TServico.Destroy;
begin
  FreeAndNil(FJSON);
  inherited;
end;

function TServico.GetNome: String;
begin
  Result := FNome;
end;

function TServico.GetId: Integer;
begin
  Result := FId;
end;

function TServico.GetJSON: TJSONObject;
begin
  FJSON.AddPair('nome', FNome);
  FJSON.AddPair('valoratual', FValorUnAtual.ToString);
  FJSON.AddPair('unmedida', FUnMedida);
  Result := FJSON;
end;

function TServico.GetUnMedida: String;
begin
  Result := FUnMedida;
end;

function TServico.GetValorUnAtual: Double;
begin
  Result := FValorUnAtual;
end;

procedure TServico.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TServico.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TServico.SetUnMedida(const Value: String);
begin
  FUnMedida := Value;
end;

procedure TServico.SetValorUnAtual(const Value: Double);
begin
  FValorUnAtual := Value;
end;

end.
