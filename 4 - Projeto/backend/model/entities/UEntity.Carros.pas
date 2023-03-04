unit UEntity.Carros;

interface

uses
  UEntity.Usuarios,
  System.JSON;

type
  TCarro = class
  private
    FId: Integer;
    FModelo: String;
    FCor: String;
    FPlaca: String;
    FAno: Integer;
    FMarca: String;
    FUsuario: TUsuario;
    FJSON: TJSONObject;

    function GetId: Integer;
    function GetModelo: String;
    function GetCor: String;
    function GetPlaca: String;
    function GetAno: Integer;
    function GetMarca: String;
    function GetUsuario: TUsuario;
    function GetJSON: TJSONObject;

    procedure SetId(const Value: Integer);
    procedure SetModelo(const Value: String);
    procedure SetCor(const Value: String);
    procedure SetPlaca(const Value: String);
    procedure SetAno(const Value: Integer);
    procedure SetMarca(const Value: String);
    procedure SetUsuario(const Value: TUsuario);

  public
    constructor Create; overload;
    constructor Create(const aId: Integer); overload;
    constructor Create(const aUsuario: TUsuario); overload;
    constructor Create(aId, aAno: Integer; aModelo, aCor, aPlaca, aMarca: String;
                        aUsuario: TUsuario); overload;

    destructor Destroy; override;

     property Id: Integer read GetId write SetId;
     property Modelo: String read GetModelo write SetModelo;
     property Cor: String read GetCor write SetCor;
     property Placa: String read GetPlaca write SetPlaca;
     property Ano: Integer read GetAno write SetAno;
     property Marca: String read GetMarca write SetMarca;
     property Usuario: TUsuario read GetUsuario write SetUsuario;

     property JSON: TJSONObject read GetJSON;
  end;

implementation

uses
  System.SysUtils;

{ TCarro }

constructor TCarro.Create;
begin
  FJSON := TJSONObject.Create;
end;

constructor TCarro.Create(const aId: Integer);
begin
  FId := aId;
  Self.Create;
end;


constructor TCarro.Create(const aUsuario: TUsuario);
begin
  FUsuario := aUsuario;
  Self.Create;
end;

constructor TCarro.Create(aId, aAno: Integer; aModelo, aCor, aPlaca, aMarca: String;
  aUsuario: TUsuario);
begin
  FId      := aId;
  FAno     := aAno;
  FModelo  := aModelo;
  FCor     := aCor;
  FPlaca   := aPlaca;
  FMarca   := aMarca;
  FUsuario := aUsuario;
  Self.Create;
end;

destructor TCarro.Destroy;
begin
  FreeAndNil(FUsuario);
  FreeAndNil(FJSON);
  inherited;
end;

function TCarro.GetAno: Integer;
begin
  Result := FAno;
end;

function TCarro.GetCor: String;
begin
  Result := FCor;
end;

function TCarro.GetId: Integer;
begin
  Result := FId;
end;

function TCarro.GetJSON: TJSONObject;
begin
  FJSON.AddPair('id',      FId.ToString);
  FJSON.AddPair('modelo',  FModelo);
  FJSON.AddPair('cor',     FCor);
  FJSON.AddPair('placa',   FPlaca);
  FJSON.AddPair('ano',     FAno.ToString);
  FJSON.AddPair('marca',   FMarca);
  FJSON.AddPair('idusuario', FUsuario.id.ToString);
  Result := FJSON;
end;

function TCarro.GetMarca: String;
begin
  Result := FMarca;
end;

function TCarro.GetModelo: String;
begin
  Result := FModelo;
end;

function TCarro.GetPlaca: String;
begin
  Result := FPlaca;
end;

function TCarro.GetUsuario: TUsuario;
begin
  Result := FUsuario;
end;

procedure TCarro.SetAno(const Value: Integer);
begin
  FAno := Value;
end;

procedure TCarro.SetCor(const Value: String);
begin
  FCor := Value;
end;

procedure TCarro.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCarro.SetMarca(const Value: String);
begin
  FMarca := Value;
end;

procedure TCarro.SetModelo(const Value: String);
begin
  FModelo := Value;
end;

procedure TCarro.SetPlaca(const Value: String);
begin
  FPlaca := Value;
end;

procedure TCarro.SetUsuario(const Value: TUsuario);
begin
  FUsuario := Value;
end;

end.
