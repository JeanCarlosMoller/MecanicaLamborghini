unit UfraCadastroCarrosCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Edit,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TfraCadastroCarrosCliente = class(TFrame)
    rectFundo: TRectangle;
    logoLamborhini: TImage;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    lytCadCarro: TLayout;
    Label1: TLabel;
    Rectangle6: TRectangle;
    rectAcessar: TRoundRect;
    lblCadastrar: TLabel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Layout2: TLayout;
    RoundRectSenha: TRoundRect;
    edtSenhaAcesso: TEdit;
    RoundRectLogin: TRoundRect;
    edtLoginAcesso: TEdit;
    Rectangle3: TRectangle;
    Layout1: TLayout;
    RoundRect2: TRoundRect;
    Edit1: TEdit;
    RoundRect3: TRoundRect;
    Edit2: TEdit;
    RoundRect1: TRoundRect;
    Edit3: TEdit;
    lytPrincipal: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  fraCadastroCarrosCliente: TfraCadastroCarrosCliente;
implementation

{$R *.fmx}

end.
