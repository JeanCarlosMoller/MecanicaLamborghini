unit UEntity.ItemServicos;

interface

uses
  UEntity.Servicos,
  UEntity.Orcamentos,
  System.JSON;

type
  TItemServico = class
  private
    FId: Integer;
    FQnt: Integer;
    FValorUn: Double;
    FValorTotal: Double;
    FServico: TServico;
    FOrcamento: TOrcamento;
    FJSON: TJSONObject;

    function GetId: Integer;
    function GetQnt: Integer;
    function GetValorUn: Double;
    function GetValorTotal: Double;
    function GetServico: TServico;
    function GetOrcamento: TOrcamento;
    function GetJSON: TJSONObject;

    procedure SetId(const Value: Integer);
    procedure SetQnt(const Value: Integer);
    procedure SetValorUn(const Value: Double);
    procedure SetValorTotal(const Value: Double);
    procedure SetServico(const Value: TServico);
    procedure SetOrcamento(const Value: TOrcamento);

  public
    constructor Create; overload;
    constructor Create(const aId: Integer); overload;

    constructor Create(aId, aQnt: Integer; aValorUn, aValorTotal: Double;
        aServico: TServico; aOrcamento: TOrcamento); overload;

    destructor Destroy; override;

    property Id: Integer read GetId write SetId;
    property Qnt: Integer read GetQnt write SetQnt;
    property ValorUn: Double read GetValorUn write SetValorUn;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;
    property Servico: TServico read GetServico write SetServico;
    property Orcamento: TOrcamento read GetOrcamento write SetOrcamento;

    property JSON: TJSONObject read GetJSON;

  end;

implementation

uses
  SysUtils;

{ TItemServico }

constructor TItemServico.Create;
begin
  FJSON := TJSONObject.Create;
end;

constructor TItemServico.Create(const aId: Integer);
begin
  FId := aId;
  Self.Create;
end;

constructor TItemServico.Create(aId, aQnt: Integer; aValorUn, aValorTotal: Double;
    aServico: TServico; aOrcamento: TOrcamento);
begin
   FId          := aId;
   FQnt         := aQnt;
   FValorUn     := aValorUn;
   FValorTotal  := aValorTotal;
   FServico     := aServico;
   FOrcamento   := aOrcamento;

   Self.Create;
end;

destructor TItemServico.Destroy;
begin
  FreeAndNil(FServico);
  FreeAndNil(FOrcamento);
  FreeAndNil(FJSON);
  inherited;
end;

function TItemServico.GetId: Integer;
begin
  Result := FId;
end;

function TItemServico.GetJSON: TJSONObject;
begin
  FJSON.AddPair('id',          FId.ToString);
  FJSON.AddPair('qnt',         FQnt.ToString);
  FJSON.AddPair('valorun',     FValorUn.ToString);
  FJSON.AddPair('valortotal',  FValorTotal.ToString);
  FJSON.AddPair('idservico',   FServico.id.ToString);
  FJSON.AddPair('idorcamento', FOrcamento.id.ToString);

  Result := FJSON;
end;

function TItemServico.GetOrcamento: TOrcamento;
begin
  Result := FOrcamento;
end;

function TItemServico.GetQnt: Integer;
begin
  Result := FQnt;
end;

function TItemServico.GetServico: TServico;
begin
  Result := FServico;
end;

function TItemServico.GetValorTotal: Double;
begin
  Result := FValorTotal;
end;

function TItemServico.GetValorUn: Double;
begin
  Result := FValorUn;
end;

procedure TItemServico.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TItemServico.SetOrcamento(const Value: TOrcamento);
begin
  FOrcamento := Value;
end;

procedure TItemServico.SetQnt(const Value: Integer);
begin
  FQnt := Value;
end;

procedure TItemServico.SetServico(const Value: TServico);
begin
  FServico := Value;
end;

procedure TItemServico.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

procedure TItemServico.SetValorUn(const Value: Double);
begin
  FValorUn := Value;
end;

end.
