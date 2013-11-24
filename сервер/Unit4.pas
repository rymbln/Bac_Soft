unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFormREsults = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    SaveDialog1: TSaveDialog;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormREsults: TFormREsults;

implementation
uses unit7;
{$R *.dfm}

procedure TFormREsults.BitBtn2Click(Sender: TObject);
var f:file ;
begin
if savedialog1.Execute then
  begin
 // assignfile(f,savedialog1.FileName);
formRESULTS.Memo1.Lines.SaveToFile(savedialog1.FileName);
  end;
end;

procedure TFormREsults.BitBtn3Click(Sender: TObject);
begin
formRESults.Close;
end;

procedure TFormREsults.BitBtn1Click(Sender: TObject);
begin
form7.QRMemo1.Lines.Text:=formRESULTS.Memo1.Lines.Text;
form7.QuickRep1.Preview;
end;

end.
