unit UDAO.Pecas;

interface

uses
  UDAO.Base;

type
  TDAOPecas = class(TDAOBase)
  public
    constructor Create;
  end;

implementation

{ TDAOPecas }

constructor TDAOPecas.Create;
begin
  FTabela := 'peca';
end;


end.
