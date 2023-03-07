unit UfrmLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit;

type
  TFrmLogin = class(TForm)
    layoutCircle: TLayout;
    circle: TCircle;
    AnimationCircle: TFloatAnimation;
    layoutLogin: TLayout;
    layoutLoginTexto: TLayout;
    layoutLoginCampos: TLayout;
    layoutNovo: TLayout;
    btnCriarConta: TRoundRect;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Layout2: TLayout;
    rectAcessar: TRoundRect;
    Label4: TLabel;
    Label5: TLabel;
    RoundRectSenha: TRoundRect;
    RoundRectLogin: TRoundRect;
    layoutConta: TLayout;
    layoutContaCampos: TLayout;
    layoutContaTexto: TLayout;
    Layout6: TLayout;
    RoundRect10: TRoundRect;
    Label9: TLabel;
    Label10: TLabel;
    RoundRect7: TRoundRect;
    RoundRect8: TRoundRect;
    RoundRect9: TRoundRect;
    Layout4: TLayout;
    btnFazerLogin: TRoundRect;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    imgLogin: TImage;
    imgConta: TImage;
    Rectangle1: TRectangle;
    edtSenhaAcesso: TEdit;
    edtLoginAcesso: TEdit;
    edtUsuarioCriarConta: TEdit;
    edtCPFCriarConta: TEdit;
    edtSenhaCriarConta: TEdit;
    procedure AnimationCircleFinish(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnCriarContaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rectAcessarClick(Sender: TObject);
    procedure RoundRect10Click(Sender: TObject);
  private
    procedure PosicionaObjetos;
    procedure Animar;
    procedure FazerLogin;
    procedure Registrar;
    procedure AbrirHomeCliente;
    procedure AbrirHomeMecanico;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses
  StrUtils,
  UService.Intf,
  UService.Login,
  UEntity.Logins,
  UService.Usuario,
  UEntity.Usuarios, UfrmHomeMecanico, UfrmHomeUsuario;

{$R *.fmx}

procedure TFrmLogin.AbrirHomeCliente;
begin
  if not Assigned(frmHomeUsuario) then
    frmHomeUsuario := TfrmHomeUsuario.Create(Application);

  frmHomeUsuario.Show;
  Application.MainForm := frmHomeUsuario;
  Self.Close;
end;

procedure TFrmLogin.AbrirHomeMecanico;
begin
  if not Assigned(frmHomeMecanico) then
    frmHomeMecanico := TfrmHomeMecanico.Create(Application);

  frmHomeMecanico.Show;
  Application.MainForm := frmHomeMecanico;
  Self.Close;
end;

procedure TFrmLogin.Animar;
begin
  TAnimator.AnimateFloat(layoutLogin, 'Opacity', 0, 0.5);
  TAnimator.AnimateFloat(layoutConta, 'Opacity', 0, 0.5);
  AnimationCircle.Start;
end;

procedure TFrmLogin.AnimationCircleFinish(Sender: TObject);
begin
  layoutLogin.Visible := false;
  layoutConta.Visible := false;

  if AnimationCircle.Inverse then
  begin
    layoutLogin.Visible := true;
    TAnimator.AnimateFloat(layoutLogin, 'Opacity', 1, 0.5);
  end
  else
  begin
    layoutConta.Visible := true;
    TAnimator.AnimateFloat(layoutConta, 'Opacity', 1, 0.5);
  end;

  AnimationCircle.Inverse := NOT AnimationCircle.Inverse;
end;

procedure TFrmLogin.btnCriarContaClick(Sender: TObject);
begin
  Animar;
end;

procedure TFrmLogin.FazerLogin;
var
  xServiceLogin: IService;
begin
  if Trim(edtLoginAcesso.Text) = EmptyStr then
    raise Exception.Create('Informe o Login.');

  if Trim(edtSenhaAcesso.Text) = EmptyStr then
    raise Exception.Create('Informe a Senha');

  xServiceLogin := TServiceLogin.Create(TLogin.Create(Trim(edtLoginAcesso.Text),
    Trim(edtSenhaAcesso.Text)));

  try
    TServiceLogin(xServiceLogin).Autenticar;

    case AnsiIndexStr(edtLoginAcesso.Text, ['mecanico', 'cliente']) of
      0:
        Self.AbrirHomeMecanico;
      1:
        Self.AbrirHomeCliente;
    end;

  except
    on e: Exception do
      raise Exception.Create('Login: ' + e.Message);
  end;
end;

procedure TFrmLogin.FormResize(Sender: TObject);
begin
  PosicionaObjetos;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  AnimationCircle.Inverse := true;
  Animar;
end;

procedure TFrmLogin.PosicionaObjetos;
begin
  // Paisagem...
  if layoutCircle.Width >= layoutCircle.Height then
  begin
    circle.Width := layoutCircle.Width * 1.5;
    circle.Height := circle.Width;
    circle.Margins.Bottom := circle.Width * 0.30;

    AnimationCircle.PropertyName := 'Margins.Right';
    AnimationCircle.StartValue := circle.Width;
    AnimationCircle.StopValue := -circle.Width;

    if NOT AnimationCircle.Inverse then
      circle.Margins.Right := AnimationCircle.StartValue
    else
      circle.Margins.Right := AnimationCircle.StopValue;

    layoutLoginTexto.Align := TAlignLayout.Left;
    layoutLoginTexto.Width := layoutCircle.Width / 2;

    layoutLoginCampos.Width := layoutCircle.Width / 2;
    layoutLoginCampos.Align := TAlignLayout.Right;

    layoutContaTexto.Align := TAlignLayout.Right;
    layoutContaTexto.Width := layoutCircle.Width / 2;

    layoutContaCampos.Width := layoutCircle.Width / 2;
    layoutContaCampos.Align := TAlignLayout.Left;

    imgLogin.Height := layoutCircle.Height * 0.40;
    imgConta.Height := layoutCircle.Height * 0.40;

    imgLogin.Visible := true;
    imgConta.Visible := true;
  end
  else
  // Retrato...
  begin
    circle.Height := layoutCircle.Height * 1.5;
    circle.Width := circle.Height;
    circle.Margins.Right := 0;

    AnimationCircle.PropertyName := 'Margins.Bottom';
    AnimationCircle.StartValue := circle.Width * 1.20;
    AnimationCircle.StopValue := -circle.Width * 1.20;

    if NOT AnimationCircle.Inverse then
      circle.Margins.Bottom := circle.Width * 1.20
    else
      circle.Margins.Bottom := -circle.Width * 1.20;

    layoutLoginTexto.Align := TAlignLayout.Top;
    layoutLoginTexto.Height := 200;

    layoutLoginCampos.Align := TAlignLayout.Client;

    layoutContaTexto.Align := TAlignLayout.Bottom;
    layoutContaTexto.Height := 200;

    layoutContaCampos.Align := TAlignLayout.Client;

    imgLogin.Visible := false;
    imgConta.Visible := false;
  end;

end;

procedure TFrmLogin.rectAcessarClick(Sender: TObject);
begin
  Self.FazerLogin;
end;

procedure TFrmLogin.Registrar;
var
  xServiceUsuario: IService;
begin
  if Trim(edtCPFCriarConta.Text) = EmptyStr then
    raise Exception.Create('Informe o CPF.');

  if Trim(edtUsuarioCriarConta.Text) = EmptyStr then
    raise Exception.Create('Informe o Usuário.');

  if Trim(edtSenhaCriarConta.Text) = EmptyStr then
    raise Exception.Create('Informe a Senha.');

  xServiceUsuario := TServiceUsuario.Create
    (TUsuario.Create(Trim(edtCPFCriarConta.Text),
    Trim(edtUsuarioCriarConta.Text), Trim(edtSenhaCriarConta.Text)));

  try
    xServiceUsuario.Registrar;
    ShowMessage('Usuário registrado com sucesso.');

  except
    on e: Exception do
      raise Exception.Create('Erro: ' + e.Message);
  end;
end;

procedure TFrmLogin.RoundRect10Click(Sender: TObject);
begin
  Registrar;
end;

end.
