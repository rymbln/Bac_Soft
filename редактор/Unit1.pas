unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ToolWin, IBDatabase, DB,  Grids, DBGrids,
  ExtCtrls, DBCtrls, IBCustomDataSet, IBTable, StdCtrls, Buttons,
  IBUpdateSQL;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    StatusBar1: TStatusBar;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    TabSheet2: TTabSheet;
    DBGridTest: TDBGrid;
    DBGridQuestions: TDBGrid; 
    DBGrid2: TDBGrid;
    BitBtnADDGROUP: TBitBtn;
    BitBtnDELGROUP: TBitBtn;
    BitBtnEDITGROUP: TBitBtn;
    BitBtn3: TBitBtn;
    ToolBar1: TToolBar;
    BitBtn5: TBitBtn;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    Panel3: TPanel;
    ToolBar2: TToolBar;
    BitBtnADDSTUDENT: TBitBtn;
    BitBtnEDITSTUDENT: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtnDELSTUDENT: TBitBtn;
    Panel1: TPanel;
    Panel4: TPanel;
    ToolBar3: TToolBar;
    ToolBar4: TToolBar;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BtnAddGroupClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnDeleteGroupClick(Sender: TObject);
    procedure Button1Enter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ButtonAddPESPONDENTClick(Sender: TObject);
    procedure ButtonEditRESPONDENTClick(Sender: TObject);
    procedure ButtonDelRESPONDENTClick(Sender: TObject);
    procedure BtnShowAllStudentsClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure BitBtnADDGROUPClick(Sender: TObject);
    procedure BitBtnEDITGROUPClick(Sender: TObject);
    procedure BitBtnDELGROUPClick(Sender: TObject);
    procedure BitBtnDELSTUDENTClick(Sender: TObject);
      procedure BitBtnADDSTUDENTClick(Sender: TObject);
    procedure BitBtnEDITSTUDENTClick(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure DBGridTestDblClick(Sender: TObject);
    procedure DBGridQuestionsDblClick(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SetMultiLineButton(AParent: TWinControl);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  i:integer;
  s:string;
  sort_group_asc, sort_test_asc, sort_resp_asc, sort_quest_asc: boolean;


implementation


uses Unit3, Unit6, Unit4, Unit5, Unit2, Unit7, unit9, unit10, unit11;
{$R *.dfm}

{ TForm1 }

procedure refreshTables;
begin
with datamodule6 do
  begin
  IBDataSetGROUP.Close;
  IBDataSetGROUP.Open;
  IBDataSetRESPONDENT.Close;
  IBDataSetRESPONDENT.Open;
  IBdatasetTEST.Close;
  IBDatasetTEST.OPen;
  IBDatasetQUESTIONS.Close;
  IBDatasetQUESTIONS.Open;
  end;
end;

procedure TForm1.SetMultiLineButton(AParent: TWinControl);
var j : integer;
 ah : THandle;
begin
for j := 0 to AParent.ControlCount - 1 do
if (AParent.Controls[j] is TButton) then
begin
 ah := (AParent.Controls[j] as TButton).Handle;
 SetWindowLong(ah, GWL_STYLE,
 GetWindowLong(ah, GWL_STYLE) OR
 BS_MULTILINE) ;
end;
 end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  SetMultiLineButton (Panel1);
  SetMultiLineButton (Panel2);
  with datamodule6 do
  begin
  IBDatabase1.Params.Clear;
  IBDatabase1.LoginPrompt:=False;
  IBDatabase1.Connected:=False;
  IBDatabase1.DatabaseName:='localhost:D:\test_base.fdb';
  IBDatabase1.Params.Add('user_name=SYSDBA');
  IBDatabase1.Params.Add('password=masterkey');
  IBDatabase1.Params.Add('lc_ctype=win1251');
  IBDatabase1.Connected:=True;
  IBTransaction1.Active:=true;
  IBTransaction2.Active:=true;
  IBTransaction3.Active:=true;
  IBQueryTEST.Active := true;
  IBQueryQUESTION.Active := true;
  IBQueryRESPONDENT.Active:= true;
  IBDataSetGROUP.Active:=true;
  IBDataSetRESPONDENT.Active:=true;
  IBDatasetTEST.Active:=true;
  IBDatasetQUESTIONs.active:=true
  end;
end;

procedure TForm1.BtnAddGroupClick(Sender: TObject);
begin
formGROUP.Caption:='Добавить группу';
formGROUP.ShowModal;


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
//form5.Visible := true;
end;

procedure TForm1.BtnDeleteGroupClick(Sender: TObject);
begin
datamodule6.IBTransaction2.Active:=true;
datamodule6.IBQueryAddGroup.SQL.Clear;
datamodule6.IBQueryAddGroup.SQL.Add('delete from GROUPS where id_group = :id');
datamodule6.IBQueryAddGroup.ParamByName('id').Value := form1.DBGrid2.DataSource.DataSet.Fields[0].AsInteger;
datamodule6.IBQueryAddGroup.Prepare;
datamodule6.IBQueryAddGroup.ExecSQL;
datamodule6.IBTransaction2.Commit;
refreshTables;
end;

procedure TForm1.Button1Enter(Sender: TObject);
begin
FormGROUP.ShowModal;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
formGROUP.Caption:='Редактирование группы';
formGROUP.ShowModal;

end;

procedure TForm1.ButtonAddPESPONDENTClick(Sender: TObject);
begin
  formSTUDENT.Caption:='Добавить студента';
   formSTUDENT.Label1.Caption:='';
   formSTUDENT.LabeledEditSURNAME.Text:='';
   formSTUDENT.LabeledEditNAME.Text:='';
   formSTUDENT.LabeledEditSecNAME.Text:='';
 
   formSTUDENT.LabeledEditPASS.Text:=   '';
formSTUDENT.ShowModal;
end;

procedure TForm1.ButtonEditRESPONDENTClick(Sender: TObject);
begin
   formSTUDENT.Caption:='Редактировать студента';
   formSTUDENT.Label1.Caption:=form1.DBGrid1.DataSource.DataSet.Fields[0].AsString;
   formSTUDENT.LabeledEditSURNAME.Text:=form1.DBGrid1.DataSource.DataSet.Fields[1].AsString;
   formSTUDENT.LabeledEditNAME.Text:=form1.DBGrid1.DataSource.DataSet.Fields[2].AsString;
   formSTUDENT.LabeledEditSecNAME.Text:=form1.DBGrid1.DataSource.DataSet.Fields[3].AsString;
    formSTUDENT.LabeledEditPASS.Text:=form1.DBGrid1.DataSource.DataSet.Fields[4].AsString;

formSTUDENT.ShowModal;
end;

procedure TForm1.ButtonDelRESPONDENTClick(Sender: TObject);

var
    buttonSelected : Integer;
 begin
    // Show a confirmation dialog
   // buttonSelected := MessageDlg('Вы действительно ходите удалить студента (студентов)',mtConfirmation, mbOKCancel, 0);
     buttonSelected := MessageBox(Application.Handle,'Вы действительно ходите удалить студента (студентов)','Подтверждение удаления', MB_YESNO);
    // Show the button type selected
    if buttonSelected = mrYES then
    begin
      datamodule6.IBTransaction3.Active:=true;
      datamodule6.IBQueryRESPONDENT.SQL.Clear;
      datamodule6.IBQueryRESPONDENT.SQL.Add('delete from RESPONDENT where id_respondent = :id');
      datamodule6.IBQueryRESPONDENT.ParamByName('id').Value := form1.DBGrid1.DataSource.DataSet.Fields[0].AsInteger;
      datamodule6.IBQueryRESPONDENT.Prepare;
      datamodule6.IBQueryRESPONDENT.ExecSQL;
      datamodule6.IBTransaction3.Commit;
      refreshTAbles;

 end;
end;

procedure TForm1.BtnShowAllStudentsClick(Sender: TObject);
begin
//datamodule6.IBTransaction3.Active:=true;
   datamodule6.IBQueryShowAllRepondents.Close;
      datamodule6.IBQueryShowAllRepondents.SQL.Clear;
      datamodule6.IBQueryShowAllRepondents.SQL.Add('SELECT ID_RESPONDENT, SURNAME, NAME, PATRONIMIC, LOGIN, PASS, GROUP_DESCRIPTION FROM RESPONDENT, GROUPS WHERE GROUP_ID_GROUP=ID_GROUP');

      datamodule6.IBQueryShowAllRepondents.Open;

      form1.DBGrid1.DataSource.DataSet :=  datamodule6.IBQueryShowAllRepondents;





      refresh;
refresh;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
ButtonEditRESPONDENTClick(DBGrid1);
end;

procedure TForm1.DBGrid2DblClick(Sender: TObject);
begin
Button1Click(DBgrid2);
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
    datamodule6.IBTransaction3.Active:=true;
    datamodule6.IBQueryRESPONDENT.Close;
      datamodule6.IBQueryRESPONDENT.SQL.Clear;
      datamodule6.IBQueryRESPONDENT.SQL.Add('SELECT * FROM RESPONDENT ORDER BY :id ASC');
     case radiogroup1.ItemIndex of
     0:   datamodule6.IBQueryRESPONDENT.ParamByName('id').Value := 'SURNAME';
     1:   datamodule6.IBQueryRESPONDENT.ParamByName('id').Value := 'NAME';
     end;
      datamodule6.IBQueryRESPONDENT.Prepare;
      datamodule6.IBQueryRESPONDENT.ExecSQL;
      datamodule6.IBTransaction3.Commit;
      refreshTAbles;
end;

procedure TForm1.BitBtnADDGROUPClick(Sender: TObject);
begin
formGROUP.Caption:='Добавить группу';
formGROUP.ShowModal;
end;

procedure TForm1.BitBtnDELGROUPClick(Sender: TObject);
var
    buttonSelected : Integer;
 begin
    buttonSelected := MessageBox(Application.Handle,'Вы действительно ходите удалить группу?','Подтверждение удаления', MB_YESNO);
    // Show the button type selected
    if buttonSelected = mrYES then
    begin
   datamodule6.IBTransaction2.Active:=true;
      datamodule6.IBQueryAddGroup.SQL.Clear;
      datamodule6.IBQueryAddGroup.SQL.Add('delete from RESPONDENT where group_id_group = :id');
      datamodule6.IBQueryAddGroup.ParamByName('id').Value := form1.DBGrid2.DataSource.DataSet.Fields[0].AsInteger;
      datamodule6.IBQueryAddGroup.Prepare;
      datamodule6.IBQueryAddGroup.ExecSQL;
      datamodule6.IBQueryAddGroup.SQL.Clear;
      datamodule6.IBQueryAddGroup.SQL.Add('delete from GROUPS where id_group = :id');
      datamodule6.IBQueryAddGroup.ParamByName('id').Value := form1.DBGrid2.DataSource.DataSet.Fields[0].AsInteger;
      datamodule6.IBQueryAddGroup.Prepare;
      datamodule6.IBQueryAddGroup.ExecSQL;
      datamodule6.IBTransaction2.Commit;
    end;

end;
 
procedure TForm1.BitBtnEDITGROUPClick(Sender: TObject);
begin
formGROUP.Caption:='Редактирование группы';
formGROUP.ShowModal;
end;
procedure TForm1.BitBtnDELSTUDENTClick(Sender: TObject);

var
    buttonSelected : Integer;

 begin
    buttonSelected := MessageBox(Application.Handle,'Вы действительно ходите удалить студента (студентов)','Подтверждение удаления', MB_YESNO);
    if buttonSelected = mrYES then
    begin
      datamodule6.IBTransaction3.Active:=true;
      datamodule6.IBQueryRESPONDENT.SQL.Clear;
      datamodule6.IBQueryRESPONDENT.SQL.Add('delete from RESPONDENT where id_respondent = :id');
      datamodule6.IBQueryRESPONDENT.ParamByName('id').Value := form1.DBGrid1.DataSource.DataSet.Fields[0].AsInteger;
      datamodule6.IBQueryRESPONDENT.Prepare;
      datamodule6.IBQueryRESPONDENT.ExecSQL;
      datamodule6.IBTransaction3.Commit;
      refreshTAbles;
    end;

end;


procedure TForm1.BitBtnADDSTUDENTClick(Sender: TObject);
begin
  formSTUDENT.Caption:='Добавить студента';
   formSTUDENT.Label1.Caption:='';
   formSTUDENT.LabeledEditSURNAME.Text:='';
   formSTUDENT.LabeledEditNAME.Text:='';
   formSTUDENT.LabeledEditSecNAME.Text:='';

   formSTUDENT.LabeledEditPASS.Text:=   '';
formSTUDENT.ShowModal;
end;
procedure TForm1.BitBtnEDITSTUDENTClick(Sender: TObject);
begin
   formSTUDENT.Caption:='Редактировать студента';
   formSTUDENT.Label1.Caption:=Trim(form1.DBGrid1.DataSource.DataSet.Fields[0].AsString);
   formSTUDENT.LabeledEditSURNAME.Text:=Trim(form1.DBGrid1.DataSource.DataSet.Fields[1].AsString);
   formSTUDENT.LabeledEditNAME.Text:=Trim(form1.DBGrid1.DataSource.DataSet.Fields[2].AsString);
   formSTUDENT.LabeledEditSecNAME.Text:=Trim(form1.DBGrid1.DataSource.DataSet.Fields[3].AsString);
 //  formSTUDENT.DBLookupComboBox1.KeyValue:=TRim(Form1.DBGrid2.DataSource.DataSet.Fields[1].AsString);
   formSTUDENT.LabeledEditPASS.Text:=Trim(form1.DBGrid1.DataSource.DataSet.Fields[4].AsString);

formSTUDENT.ShowModal;
end;

procedure TForm1.BitBtn10Click(Sender: TObject);
begin

    datamodule6.IBTransaction3.Active:=true;
    with datamodule6.IBQuerySORT do
    begin
    close;
    sql.Clear;
    sql.Add('select * from respondent order by :id');
    ParamByName('id').Value := 'SURNAME';
     prepare;
    ExecSQL;
    end;
    datamodule6.IBTransaction3.Commit;
    refreshTables;
end;

procedure TForm1.BitBtn18Click(Sender: TObject);
begin
with formTEST do
  begin
  Caption:='Добавить тест';
  labelededit1.Text:='';
  labelededit2.Text:='';
  labelededit3.Text:='';
  labelededit4.Text:='';
  labelededit5.Text:='';
  labelededit6.Text:='';
  ShowModal;
  end;
end;

procedure TForm1.BitBtn20Click(Sender: TObject);
begin
with formTEst do
  begin
    Caption:='Редактировать тест';
    labeledEDIT1.Text:=trim(form1.DBGridTest.DataSource.DataSet.Fields[1].AsString);
    labeledEdit2.Text:=trim(form1.DBGridTest.DataSource.DataSet.Fields[2].AsString);
    labeledEdit3.Text:=trim(form1.DBGridTest.DataSource.DataSet.Fields[3].AsString);
    labeledEDIT4.Text:=trim(form1.DBGridTest.DataSource.DataSet.Fields[4].AsString);
    labeledEDiT5.Text:=trim(form1.DBGridTest.DataSource.DataSet.Fields[5].AsString);
    labeledEDiT6.Text:=trim(form1.DBGridTest.DataSource.DataSet.Fields[10].AsString);
    ShowModal;
  end;
end;

procedure TForm1.BitBtn19Click(Sender: TObject);
var
    buttonSelected : Integer;
 begin
    buttonSelected := MessageBox(Application.Handle,'Вы действительно ходите удалить тест?','Подтверждение удаления', MB_YESNO);
    if buttonSelected = mrYES then
    begin
with datamodule6 do
begin
IBTransaction2.Active:=true;
IBQueryAddGroup.SQL.Clear;
IBQueryAddGroup.SQL.Add('delete from QUESTION where test_id_test = :id');
IBQueryAddGroup.ParamByName('id').Value := form1.DBGridTEST.DataSource.DataSet.Fields[0].AsInteger;
IBQueryAddGroup.Prepare;
IBQueryAddGroup.ExecSQL;
IBQueryAddGroup.SQL.Clear;
IBQueryAddGroup.SQL.Add('delete from TEST where id_test = :id');
IBQueryAddGroup.ParamByName('id').Value := form1.DBGridTEST.DataSource.DataSet.Fields[0].AsInteger;
IBQueryAddGroup.Prepare;
IBQueryAddGroup.ExecSQL;
IBTransaction2.Commit;
IBdatasetTEST.Close;
IBDatasetTEST.OPen;
refreshtables;
end;
end;
end;

procedure TForm1.BitBtn14Click(Sender: TObject);
begin
with formQuestion do
begin
Caption:='Добавить вопрос';
MemQuestionSingle.Text:='';
SingleAnswer1.Text:='';
SingleAnswer2.Text:='';
SingleAnswer3.Text:='';
SingleAnswer4.Text:='';
SingleScore.Text:='';
MemoMultyTEXT.Text:='';
EditMULTYans1.Text:='';
EditMULTYans2.Text:='';
EditMULTYans3.Text:='';
EditMULTYans4.Text:='';
EditMULTYscore.Text:='';
MemOpenTEXT.Text:='';
EditOpenRightAnswer.Text:='';
EditOpenScore.Text:='';
ImageQuestionSingle.Visible:=false;
ImageQuestionMulty.Visible:=false;
ImageQuestionEnter.Visible:=false;
ShowModal;
end;
end;

procedure TForm1.BitBtn16Click(Sender: TObject);
var activeItem:integer;
begin
formQUESTION.Caption :='Редактировать вопрос';
 activeItem := strtoint(trim(form1.DBGridQuestions.DataSource.DataSet.Fields[8].AsString));
case activeItem of
1:begin
  formQUESTION.PageControl1.ActivePageIndex:=0;
  formQUESTION.MemQuestionSingle.Text:=trim(form1.DBGridQuestions.DataSource.DataSet.Fields[1].AsString);
  formQUESTION.SingleAnswer1.Text:=trim(form1.DBGridQuestions.DataSource.DataSet.Fields[2].AsString);
  formQUESTION.SingleAnswer2.Text:=trim(form1.DBGridQuestions.DataSource.DataSet.Fields[3].AsString);
  formQUESTION.SingleAnswer3.Text:=trim(form1.DBGridQuestions.DataSource.DataSet.Fields[4].AsString);
  formQUESTION.SingleAnswer4.Text:=trim(form1.DBGridQuestions.DataSource.DataSet.Fields[5].AsString);
  formQUESTION.SingleScore.Text:=trim(form1.DBGridQuestions.DataSource.DataSet.Fields[7].AsString);
  formQuestion.ImageQuestionSingle.Field.Assign(form1.dbgridquestions.DataSource.DataSet.Fields[11]);
  case strtoint(trim(form1.DBGridQuestions.DataSource.DataSet.Fields[6].AsString)) of
  1:  formQuestion.RadioButton1.Checked:=true;
    2:  formQuestion.RadioButton2.Checked:=true;
      3:  formQuestion.RadioButton3.Checked:=true;
        4:  formQuestion.RadioButton4.Checked:=true;
        end;
  if strtoint(trim(form1.DBGridQuestions.DataSource.DataSet.Fields[10].AsString)) = 1 then
    formQUESTION.CheckBox1.Checked:=true
  else
    formQUESTION.CheckBox1.Checked:=false;
  end;
2: begin
  formQUESTION.PageControl1.ActivePageIndex:=1;
  formQUESTION.MemoMultyTEXT.Text:=trim(form1.DBGridQuestions.DataSource.DataSet.Fields[1].AsString);
  formQUESTION.EditMULTYans1.Text:=trim(form1.DBGridQuestions.DataSource.DataSet.Fields[2].AsString);
  formQUESTION.EditMULTYans2.Text:=trim(form1.DBGridQuestions.DataSource.DataSet.Fields[3].AsString);
  formQUESTION.EditMULTYans3.Text:=trim(form1.DBGridQuestions.DataSource.DataSet.Fields[4].AsString);
  formQUESTION.EditMULTYans4.Text:=trim(form1.DBGridQuestions.DataSource.DataSet.Fields[5].AsString);
  formQUESTION.EditMULTYscore.Text:=trim(form1.DBGridQuestions.DataSource.DataSet.Fields[7].AsString);
    formQuestion.ImageQuestionSingle.Field.Assign(form1.dbgridquestions.DataSource.DataSet.Fields[11]);
  s:=trim(form1.DBGridQuestions.DataSource.DataSet.Fields[6].AsString);
  for i:=1 to length(s) do
    begin
      case strtoint(s[i]) of
      1: formQUESTION.CheckAns1.Checked:=true;
      2: formQUESTION.CheckAns2.Checked:=true;
      3: formQUESTION.CheckAns3.Checked:=true;
      4: formQUESTION.CheckAns4.Checked:=true;
      end;
    end;
  if strtoint(trim(form1.DBGridQuestions.DataSource.DataSet.Fields[10].AsString)) = 1 then
    formQUESTION.CheckMutyRAND.Checked:=true
  else
    formQUESTION.CheckMutyRAND.Checked:=false;
  end;

3: begin
   formQUESTION.PageControl1.ActivePageIndex:=2;
   formQUESTION.MemOpenTEXT.Text:=trim(form1.DBGridQuestions.DataSource.DataSet.Fields[1].AsString);
   formQUESTION.EditOpenScore.Text:=trim(form1.DBGridQuestions.DataSource.DataSet.Fields[7].AsString);
   formQUESTION.EditOpenRightAnswer.Text:=trim(form1.DBGridQuestions.DataSource.DataSet.Fields[6].AsString);
     formQuestion.ImageQuestionSingle.Field.Assign(form1.dbgridquestions.DataSource.DataSet.Fields[11]);
  if strtoint(trim(form1.DBGridQuestions.DataSource.DataSet.Fields[10].AsString)) = 1 then
    formQUESTION.CheckBoxOpenRand.Checked:=true
  else
    formQUESTION.CheckBoxOpenRand.Checked:=false;
   end;
end;

formQUESTION.ShowModal;
end;

procedure TForm1.DBGridTestDblClick(Sender: TObject);
begin
BitBtn20Click(DBGridTEST);
end;

procedure TForm1.DBGridQuestionsDblClick(Sender: TObject);
begin
 BitBtn16Click(DBGridQuestions);
end;

procedure TForm1.BitBtn15Click(Sender: TObject);
var
    buttonSelected : Integer;
 begin
    // Show a confirmation dialog
   // buttonSelected := MessageDlg('Вы действительно ходите удалить студента (студентов)',mtConfirmation, mbOKCancel, 0);
     buttonSelected := MessageBox(Application.Handle,'Вы действительно ходите удалить вопрос?','Подтверждение удаления', MB_YESNO);
    // Show the button type selected
    if buttonSelected = mrYES then
    begin
      datamodule6.IBTransaction3.Active:=true;
      datamodule6.IBQueryRESPONDENT.SQL.Clear;
      datamodule6.IBQueryRESPONDENT.SQL.Add('delete from QUESTION where id_question = :id');
      datamodule6.IBQueryRESPONDENT.ParamByName('id').Value := form1.DBGridQuestions.DataSource.DataSet.Fields[0].AsInteger;
      datamodule6.IBQueryRESPONDENT.Prepare;
      datamodule6.IBQueryRESPONDENT.ExecSQL;
      datamodule6.IBTransaction3.Commit;
      refreshTAbles;

 end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
{if  sort_group_asc then
  begin
     with datamodule6 do
      begin
      IBTransaction1.Active:=true;
      IBDatasetGroup.SelectSQL.Clear;
      IBDatasetGROUP.SelectSQL.Add('select * from GROUPS order by GROUP_DESCRIPTION asc');
      IBDatasetGROUP.RefreshSQL.Clear;
      IBDatasetGROUP.RefreshSQL.Add('select * from GROUPS order by GROUP_DESCRIPTION asc');
      end;
     Form1.DBGrid2.DataSource.DataSet.Close;
     Form1.DBGrid2.DataSource.DataSet.Open;
     sort_group_asc:=false;
  end
else
  begin
    with datamodule6 do
      begin
      IBTransaction1.Active:=true;
      IBDatasetGroup.SelectSQL.Clear;
      IBDatasetGROUP.SelectSQL.Add('select * from GROUPS order by GROUP_DESCRIPTION desc');
      IBDatasetGROUP.RefreshSQL.Clear;
      IBDatasetGROUP.RefreshSQL.Add('select * from GROUPS order by GROUP_DESCRIPTION desc');
      end;
     Form1.DBGrid2.DataSource.DataSet.Close;
     Form1.DBGrid2.DataSource.DataSet.Open;
     sort_group_asc:=true;
  end;   }
end;

procedure TForm1.BitBtn13Click(Sender: TObject);
begin
 form1.DBGrid1.DataSource.DataSet.Open;
 TGRidReport.GridRep.Preview;
end;

procedure TForm1.BitBtn12Click(Sender: TObject);
begin
form10.Caption:='Список студентов';
form10.Memo1.Lines.Clear;
form10.Memo1.Lines.Add('Список студентов группы '+Form1.DBGrid2.DataSource.DataSet.Fields[1].AsString);

form1.DBGrid1.DataSource.DataSet.First;
for i:=1 to form1.DBGrid1.DataSource.DataSet.RecordCount do
  begin
    form10.Memo1.Lines.Add(Form1.DBGrid1.DataSource.DataSet.Fields[0].AsString+'   '+Form1.DBGrid1.DataSource.DataSet.Fields[1].AsString+Form1.DBGrid1.DataSource.DataSet.Fields[2].AsString+Form1.DBGrid1.DataSource.DataSet.Fields[3].AsString+Form1.DBGrid1.DataSource.DataSet.Fields[4].AsString);
    form1.DBGrid1.DataSource.DataSet.Next;
  end;
form10.Visible:=true;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
Form1.DBGridQuestions.DataSource.DataSet.Open;
form11.QuickRep1.Preview;
end;

end.




