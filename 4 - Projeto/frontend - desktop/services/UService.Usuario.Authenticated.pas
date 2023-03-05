unit UService.Usuario.Authenticated;

interface

uses
  UEntity.Usuarios;

type
  TUsuarioAuthenticated = class
    private
      FUsuario: TUsuario;

      function GetUsuario: TUsuario;
      procedure SetUsuario(const Value: TUsuario);
    public
      constructor Create;
      destructor  Destroy; override;

      class function GetInstance: TUsuarioAuthenticated;
      class function NewInstance: TObject; override;

      property Usuario: TUsuario read GetUsuario write SetUsuario;
  end;

var
  GbInstance: TUsuarioAuthenticated;

implementation

uses
  System.SysUtils;

{ TUsuarioAuthenticated }

constructor TUsuarioAuthenticated.Create;
begin
  // Tela de Login irá passar usuário criado
end;

function TUsuarioAuthenticated.GetUsuario: TUsuario;
begin
  Result := FUsuario;
end;

class function TUsuarioAuthenticated.NewInstance: TObject;
begin
  if not Assigned(GbInstance) then
    GbInstance := TUsuarioAuthenticated(Inherited NewInstance);

  Result := GbInstance;
end;

procedure TUsuarioAuthenticated.SetUsuario(const Value: TUsuario);
begin
  FUsuario := Value;
end;

destructor TUsuarioAuthenticated.Destroy;
begin
  FreeAndNil(FUsuario);
  inherited;
end;

class function TUsuarioAuthenticated.GetInstance: TUsuarioAuthenticated;
begin
  Result := TUsuarioAuthenticated.Create;
end;

initialization

finalization
  FreeAndNil(GbInstance);

end.
