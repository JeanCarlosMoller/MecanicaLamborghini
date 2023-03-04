unit UService.Usuario;

interface

uses
  UService.Base, UEntity.Usuarios;

type
  TServiceUser = class(TServiceBase)
    private
      FUsuario: TUsuario;
    public
      constructor Create; overload;
      constructor Create(aUsuario: TUsuario); overload;
      destructor  Destroy; override;

      procedure Registrar; override;
      procedure Listar; override;
      procedure Excluir; override;

      function ObterRegistro(const aId: Integer): TObject; override;
  end;

implementation

uses
  REST.Types,
  System.JSON, System.SysUtils,
  System.Classes, FireDAC.comp.Client, DataSet.Serialize;

{ TServiceUser }

constructor TServiceUser.Create;
begin

end;

constructor TServiceUser.Create(aUsuario: TUsuario);
begin

end;

destructor TServiceUser.Destroy;
begin

  inherited;
end;

procedure TServiceUser.Excluir;
begin
  inherited;

end;

procedure TServiceUser.Listar;
begin
  inherited;

end;

function TServiceUser.ObterRegistro(const aId: Integer): TObject;
begin

end;

procedure TServiceUser.Registrar;
begin
  inherited;

end;

end.
