unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Menus, StdCtrls, Buttons, Grids, DBGrids,
  ToolWin;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    DBGridTEST: TDBGrid;
    DBGridRESULT: TDBGrid;
    BitBtnEDITTEST: TBitBtn;
    BitBtnEXPORTTEST: TBitBtn;
    BitBtnLISTQUESTIONS: TBitBtn;
    BitBtnTESTON: TBitBtn;
    BitBtnTESTOFF: TBitBtn;
    ToolBar2: TToolBar;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    procedure BitBtnEDITTESTClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnLISTQUESTIONSClick(Sender: TObject);
    procedure BitBtnTESTONClick(Sender: TObject);
    procedure BitBtnTESTOFFClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBGridRESULTDblClick(Sender: TObject);
    procedure BitBtnEXPORTTESTClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit5, Unit4, Unit2, Unit3, unit6;

{$R *.dfm}

procedure TForm1.BitBtnEDITTESTClick(Sender: TObject);
begin
formTESTEDIT.EditDESCRIPTIONTEST.Text := trim(form1.DBGridTEST.DataSource.DataSet.Fields[1].asstring);
formTESTEDIT.EditTimeLimit.Text := trim(form1.DBGridTEST.DataSource.DataSet.Fields[10].asstring);
formTESTEDIT.EditQuestCOUNT.Text := trim(form1.DBGridTEST.DataSource.DataSet.Fields[8].asstring);
formTESTEDIT.EditMarkA.Text :=  trim(form1.DBGridTEST.DataSource.DataSet.Fields[2].asstring);
formTESTEDIT.EditMarkB.Text :=  trim(form1.DBGridTEST.DataSource.DataSet.Fields[3].asstring);
formTESTEDIT.EditMarkC.Text :=  trim(form1.DBGridTEST.DataSource.DataSet.Fields[4].asstring);
formTESTEDIT.EditMarkD.Text :=  trim(form1.DBGridTEST.DataSource.DataSet.Fields[5].asstring);
if trim(form1.DBGridTEST.DataSource.DataSet.Fields[7].asstring) = '1' then
  formTESTEDIT.CheckBoxRandom.Checked := true
else
  formTESTEDIT.CheckBoxRandom.Checked := false;
if trim(form1.DBGridTEST.DataSource.DataSet.Fields[6].asstring) = '1' then
  formTESTEDIT.CheckBoxVisible.Checked:=true
else
  formTESTEDIT.CheckBoxVisible.Checked:=false;
if trim(form1.DBGridTEST.DataSource.DataSet.Fields[9].asstring) = '1' then
  formTESTEDIT.CheckBoxAdaptive.Checked:=true
else
  formTESTEDIT.CheckBoxAdaptive.Checked := false;
formTESTEDIT.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
{ with datamodule5 do
  begin
  IBDatabase.Params.Clear;
  IBDatabase.LoginPrompt:=False;
  IBDatabase.Connected:=False;
  IBDatabase.DatabaseName:='localhost:D:\test_base.fdb';
  IBDatabase.Params.Add('user_name=SYSDBA');
  IBDatabase.Params.Add('password=masterkey');
  IBDatabase.Params.Add('lc_ctype=win1251');
  IBDatabase.Connected:=True;   
  IBTransaction1.Active:=true;
  IBTransaction2.Active:=true;
  IBQueryTEST.Active := true;
  IBQueryQUESTION.Active := true;
  IBDatasetTEST.Active:=true;
  IBDatasetQUESTION.active:=true
  end;         }
end;

procedure TForm1.BitBtnLISTQUESTIONSClick(Sender: TObject);
begin
formQUESTIONS.ShowModal;
end;

procedure TForm1.BitBtnTESTONClick(Sender: TObject);
begin
with datamodule5 do
  begin
    IBTransaction2.Active:=true;
    IBQueryTEST.SQL.Clear;
    IBQueryTEST.SQL.Add('update TEST set VISIBILITY = :vis where ID_TEST = :id');
    IBQUeryTEST.ParamByName('vis').Value := '1';
    IBQueryTEST.ParamByName('id').Value := form1.DBGridTEST.DataSource.DataSet.Fields[0].AsString;
    IBQueryTEST.Prepare;
    IBQueryTEST.ExecSQL;
    IBTransaction2.Commit;
  end;
   form1.DBGridTEST.DataSource.DataSet.Close;
   form1.DBGridTEST.DataSource.DataSet.Open;
end;

procedure TForm1.BitBtnTESTOFFClick(Sender: TObject);
begin
with datamodule5 do
  begin
    IBTransaction2.Active:=true;
    IBQueryTEST.SQL.Clear;
    IBQueryTEST.SQL.Add('update TEST set VISIBILITY = :vis where ID_TEST = :id');
    IBQUeryTEST.ParamByName('vis').Value := '0';
    IBQueryTEST.ParamByName('id').Value := form1.DBGridTEST.DataSource.DataSet.Fields[0].AsString;
    IBQueryTEST.Prepare;
    IBQueryTEST.ExecSQL;
    IBTransaction2.Commit;
  end;
  form1.DBGridTEST.DataSource.DataSet.Close;
  form1.DBGridTEST.DataSource.DataSet.Open;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
formresults.Memo1.Text:=FORM1.DBGridRESULT.DataSource.DataSet.Fields[9].AsString;
formRESults.ShowModal;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
var
    buttonSelected : Integer;
 begin
    // Show a confirmation dialog
   // buttonSelected := MessageDlg('Вы действительно ходите удалить студента (студентов)',mtConfirmation, mbOKCancel, 0);
     buttonSelected := MessageBox(Application.Handle,'Вы действительно ходите удалить результаты?','Подтверждение удаления', MB_YESNO);
    // Show the button type selected
    if buttonSelected = mrYES then
    begin
      datamodule5.IBTransaction2.Active:=true;
      datamodule5.IBQueryRESULTS.SQL.Clear;
      datamodule5.IBQueryRESULTS.SQL.Add('delete from TESTING where id_testing = :id');
      datamodule5.IBQueryRESULTS.ParamByName('id').Value := form1.DBGridRESULT.DataSource.DataSet.Fields[0].AsInteger;
      datamodule5.IBQueryRESULTS.Prepare;
      datamodule5.IBQueryRESULTS.ExecSQL;
      datamodule5.IBTransaction2.Commit;
    end;
    form1.DBGridRESULT.DataSource.DataSet.Close;
    form1.DBGridRESULT.DataSource.DataSet.Open;
end;

procedure TForm1.DBGridRESULTDblClick(Sender: TObject);
begin
BitBtn6Click(form1.DBGridRESULT);
end;

procedure TForm1.BitBtnEXPORTTESTClick(Sender: TObject);
begin
form6.QuickRepTEST.Preview;
end;

end.
