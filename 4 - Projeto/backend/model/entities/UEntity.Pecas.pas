unit UEntity.Pecas;

interface

uses
  System.JSON;

type
  TPeca = class
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
    property ValorUnatual: Double read GetValorUnatual write SetValorUnatual;
    property UnMedida: String read GetUnMedida write SetUnMedida;

    property JSON: TJSONObject read GetJSON;

  end;

implementation

uses
  System.SysUtils;

{ TPecas }

constructor TPeca.Create;
begin
  FJSON := TJSONObject.Create;
end;

constructor TPeca.Create(const aId: Integer);
begin
  FId := aId;
  Self.Create;
end;

constructor TPeca.Create(aId: Integer; aNome, aUnMedida: String; aValorUnAtual: Double);
begin
  FId           := aId;
  FNome         := aNome;
  FunMedida     := aUnMedida;
  FValorUnAtual := aValorUnAtual;

  Self.Create;
end;

destructor TPeca.Destroy;
begin
  FreeAndNil(FJSON);
  inherited;
end;

function TPeca.GetId: Integer;
begin
  Result := FId;
end;

function TPeca.GetJSON: TJSONObject;
begin
  FJSON.AddPair('id',         FId.ToString);
  FJSON.AddPair('nome',       FNome);
  FJSON.AddPair('unmedida',   FUnMedida);
  FJSON.AddPair('valoratual', FValorUnAtual.ToString);

  Result := FJSON;
end;

function TPeca.GetNome: String;
begin
  Result := FNome;
end;

function TPeca.GetUnMedida: String;
begin
  Result := FUnMedida;
end;

function TPeca.GetValorUnAtual: Double;
begin
  Result := FValorUnAtual;
end;

procedure TPeca.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPeca.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TPeca.SetUnMedida(const Value: String);
begin
  FUnMedida := Value;
end;

procedure TPeca.SetValorUnAtual(const Value: Double);
begin
  FValorUnAtual := Value;
end;

end.
