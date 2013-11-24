unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm10 = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Memo1: TMemo;
    SaveDialog1: TSaveDialog;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

procedure TForm10.BitBtn2Click(Sender: TObject);
var f:file ;
begin
if savedialog1.Execute then
  begin
 // assignfile(f,savedialog1.FileName);
form10.Memo1.Lines.SaveToFile(savedialog1.FileName);
  end;
end;

end.
