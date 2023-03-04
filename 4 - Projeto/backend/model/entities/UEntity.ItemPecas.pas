unit UEntity.ItemPecas;

interface

uses
  UEntity.Orcamentos,
  UEntity.Pecas,
  System.JSON;

type
  TItemPecas = class
  private
    FId: Integer;
    FQnt: Integer;
    FValorUn: Double;
    FValorTotal: Double;
    FOrcamento: TOrcamento;
    FPeca: TPeca;
    FJSON: TJSONObject;

    function GetId: Integer;
    function GetQnt: Integer;
    function GetValorUn: Double;
    function GetValorTotal: Double;
    function GetOrcamento: TOrcamento;
    function GetPeca: TPeca;
    function GetJSON: TJSONObject;

    procedure SetId(const Value: Integer);
    procedure SetQnt(const Value: Integer);
    procedure SetValorUn(const Value: Double);
    procedure SetValorTotal(const Value: Double);
    procedure SetOrcamento(const Value: TOrcamento);
    procedure SetPeca(const Value: TPeca);

  public
    constructor Create; overload;
    constructor Create(aId: Integer); overload;

    constructor Create(aId, aQnt: Integer; aValorUn, aValorTotal: Double;
      aOrcamento: TOrcamento; aPeca: TPeca); overload;

    destructor Destroy; override;

    property Id: Integer read GetId write SetId;
    property Qnt: Integer read GetQnt write SetQnt;
    property ValorUn: Double read GetValorUn write SetValorUn;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;
    property Orcamento: TOrcamento read GetOrcamento write SetOrcamento;
    property Peca: TPeca read GetPeca write SetPeca;

    property JSON: TJSONObject read GetJSON;

  end;

implementation

uses
  SysUtils;

{ TItemPecas }

constructor TItemPecas.Create;
begin
  FJSON := TJSONObject.Create;
end;

constructor TItemPecas.Create(aId: Integer);
begin
  FId := aId;
  Self.Create;
end;

constructor TItemPecas.Create(aId, aQnt: Integer; aValorUn, aValorTotal: Double;
  aOrcamento: TOrcamento; aPeca: TPeca);
begin
  FId          := aId;
  FQnt         := aQnt;
  FValorUn     := aValorUn;
  FValorTotal  := aValorTotal;
  FOrcamento   := aOrcamento;
  FPeca        := aPeca;

  Self.Create;
end;

destructor TItemPecas.Destroy;
begin
  FreeAndNil(FOrcamento);
  FreeAndNil(FPeca);
  FreeAndNil(FJSON);
  inherited;
end;

function TItemPecas.GetId: Integer;
begin
  Result := FId;
end;

function TItemPecas.GetJSON: TJSONObject;
begin
  FJSON.AddPair('id',          FId.ToString);
  FJSON.AddPair('qnt',         FQnt.ToString);
  FJSON.AddPair('valorUn',     FValorUn.ToString);
  FJSON.AddPair('valorTotal',  FValorTotal.ToString);
  FJSON.AddPair('idOrcamento', FOrcamento.id.ToString);
  FJSON.AddPair('idPeca',   FPeca.id.ToString);

  Result := FJSON;
end;

function TItemPecas.GetOrcamento: TOrcamento;
begin
  Result := FOrcamento;
end;

function TItemPecas.GetPeca: TPeca;
begin
  Result := FPeca;
end;

function TItemPecas.GetQnt: Integer;
begin
  Result := FQnt;
end;

function TItemPecas.GetValorTotal: Double;
begin
  Result := FValorTotal;
end;

function TItemPecas.GetValorUn: Double;
begin
  Result := FValorUn;
end;

procedure TItemPecas.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TItemPecas.SetOrcamento(const Value: TOrcamento);
begin
  FOrcamento := Value;
end;

procedure TItemPecas.SetPeca(const Value: TPeca);
begin
  FPeca := Value;
end;

procedure TItemPecas.SetQnt(const Value: Integer);
begin
  FQnt := Value;
end;

procedure TItemPecas.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

procedure TItemPecas.SetValorUn(const Value: Double);
begin
  FValorUn := Value;
end;

end.
