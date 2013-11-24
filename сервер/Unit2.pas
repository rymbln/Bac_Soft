unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ToolWin, ComCtrls;

type
  TFormQuestions = class(TForm)
    ToolBar1: TToolBar;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBGridQUESTIONS: TDBGrid;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormQuestions: TFormQuestions;

implementation
uses Unit1, Unit3, unit4, unit5;
{$R *.dfm}

procedure TFormQuestions.BitBtn1Click(Sender: TObject);
begin
FormQUESTIONS.Close;
end;

procedure TFormQuestions.BitBtn4Click(Sender: TObject);
begin
with datamodule5 do
  begin
    IBTransaction2.Active:=true;
    IBQueryQUESTION.SQL.Clear;
    IBQueryQUESTION.SQL.Add('update QUESTION set RANDOMIZING = :rand where ID_QUESTION = :id');
    IBQueryQUESTION.ParamByName('rand').Value := '1';
    IBQueryQUESTION.ParamByName('id').Value := formQUESTIONS.DBGridQUESTIONS.DataSource.DataSet.Fields[0].AsString;
    IBQueryQUESTION.Prepare;
    IBQueryQUESTION.ExecSQL;
    IBTransaction2.Commit;
  end;
  formQUESTIONS.DBGridQUESTIONS.DataSource.DataSet.Close;
  formQUESTIONS.DBGridQUESTIONS.DataSource.DataSet.Open;
end;

procedure TFormQuestions.BitBtn5Click(Sender: TObject);
begin
with datamodule5 do
  begin
    IBTransaction2.Active:=true;
    IBQueryQUESTION.SQL.Clear;
    IBQueryQUESTION.SQL.Add('update QUESTION set RANDOMIZING = :rand where ID_QUESTION = :id');
    IBQueryQUESTION.ParamByName('rand').Value := '0';
    IBQueryQUESTION.ParamByName('id').Value := formQUESTIONS.DBGridQUESTIONS.DataSource.DataSet.Fields[0].AsString;
    IBQueryQUESTION.Prepare;
    IBQueryQUESTION.ExecSQL;
    IBTransaction2.Commit;
  end;
  formQUESTIONS.DBGridQUESTIONS.DataSource.DataSet.Close;
  formQUESTIONS.DBGridQUESTIONS.DataSource.DataSet.Open;
  
end;

end.
