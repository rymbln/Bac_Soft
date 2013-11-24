unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Printers;

type
  TFormRESULTS = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    MemoRESULT: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    SaveDialog1: TSaveDialog;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRESULTS: TFormRESULTS;

implementation

uses Unit1, Unit2, Unit4, Unit5, unit7;

{$R *.dfm}

procedure TFormRESULTS.BitBtn2Click(Sender: TObject);
var f:file ;
begin
if savedialog1.Execute then
  begin
 // assignfile(f,savedialog1.FileName);
formRESULTS.MemoRESULT.Lines.SaveToFile(savedialog1.FileName);
  end;
end;

procedure TFormRESULTS.BitBtn3Click(Sender: TObject);
begin
FormAUTORIZATION.Show;
formRESULTS.Close;
end;

procedure TFormRESULTS.BitBtn4Click(Sender: TObject);
begin
FormAUTORIZATION.Show;
formRESULTS.Close;
end;

procedure TFormRESULTS.FormShow(Sender: TObject);
begin
form1.Close;
end;

procedure PrintStrings(Strings: TStrings);
var
  Prn: TextFile;
  i: word;
begin
  AssignPrn(Prn);
  try
    Rewrite(Prn);
    try
      for i := 0 to Strings.Count - 1 do
        writeln(Prn, Strings.Strings[i]);
    finally
      CloseFile(Prn);
    end;
  except
    on EInOutError do
      MessageDlg('Error Printing text.', mtError, [mbOk], 0);
  end;
end;

procedure TFormRESULTS.BitBtn1Click(Sender: TObject);
begin
form7.QRMemo1.Lines.Text:=formRESULTS.MemoRESULT.Lines.Text;
form7.QuickRep1.Preview;
end;

end.
