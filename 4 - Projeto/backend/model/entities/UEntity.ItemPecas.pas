unit UEntity.ItemPecas;

interface

uses
  UEntity.Orcamentos,
  UEntity.Pecas,
  System.JSON;

type
  TItemPeca = class
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

constructor TItemPeca.Create;
begin
  FJSON := TJSONObject.Create;
end;

constructor TItemPeca.Create(aId: Integer);
begin
  FId := aId;
  Self.Create;
end;

constructor TItemPeca.Create(aId, aQnt: Integer; aValorUn, aValorTotal: Double;
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

destructor TItemPeca.Destroy;
begin
  FreeAndNil(FOrcamento);
  FreeAndNil(FPeca);
  FreeAndNil(FJSON);
  inherited;
end;

function TItemPeca.GetId: Integer;
begin
  Result := FId;
end;

function TItemPeca.GetJSON: TJSONObject;
begin
  FJSON.AddPair('id',          FId.ToString);
  FJSON.AddPair('qnt',         FQnt.ToString);
  FJSON.AddPair('valorun',     FValorUn.ToString);
  FJSON.AddPair('valortotal',  FValorTotal.ToString);
  FJSON.AddPair('idorcamento', FOrcamento.id.ToString);
  FJSON.AddPair('idpeca',   FPeca.id.ToString);

  Result := FJSON;
end;

function TItemPeca.GetOrcamento: TOrcamento;
begin
  Result := FOrcamento;
end;

function TItemPeca.GetPeca: TPeca;
begin
  Result := FPeca;
end;

function TItemPeca.GetQnt: Integer;
begin
  Result := FQnt;
end;

function TItemPeca.GetValorTotal: Double;
begin
  Result := FValorTotal;
end;

function TItemPeca.GetValorUn: Double;
begin
  Result := FValorUn;
end;

procedure TItemPeca.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TItemPeca.SetOrcamento(const Value: TOrcamento);
begin
  FOrcamento := Value;
end;

procedure TItemPeca.SetPeca(const Value: TPeca);
begin
  FPeca := Value;
end;

procedure TItemPeca.SetQnt(const Value: Integer);
begin
  FQnt := Value;
end;

procedure TItemPeca.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

procedure TItemPeca.SetValorUn(const Value: Double);
begin
  FValorUn := Value;
end;

end.
