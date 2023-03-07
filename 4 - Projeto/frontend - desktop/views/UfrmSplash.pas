unit UfrmSplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Ani;

type
  TfrmSplash = class(TForm)
    imgLogo: TImage;
    aniFicarVisivel: TFloatAnimation;
    Timer1: TTimer;
    aniFicarInvisivel: TFloatAnimation;
    procedure FormShow(Sender: TObject);
    procedure aniFicarVisivelFinish(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure aniFicarInvisivelFinish(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

uses
   UfrmLogin;

{$R *.fmx}

procedure TfrmSplash.aniFicarInvisivelFinish(Sender: TObject);
begin
  if not Assigned(frmLogin) then
    frmLogin := TfrmLogin.Create(Application);

  frmLogin.Show;
  Application.MainForm := frmLogin;
  Self.Close;
end;

procedure TfrmSplash.aniFicarVisivelFinish(Sender: TObject);
begin
  Timer1.Enabled := true;
end;

procedure TfrmSplash.FormShow(Sender: TObject);
begin
  aniFicarVisivel.Enabled := true;
  aniFicarVisivel.Start;
end;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin
  timer1.Enabled := false;
  aniFicarInvisivel.enabled := true;
  aniFicarInvisivel.start;
end;

end.
