unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Unit1, Buttons, Unit6, DBCtrls,
   IBDatabase, DB,  Grids, DBGrids,
  IBCustomDataSet, IBTable,   IBUpdateSQL, jpeg;

type
  TFormQUESTION = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBLookupComboBoxTEST: TDBLookupComboBox;
    Panel3: TPanel;
    Label7: TLabel;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    BtnSelectImageSingle: TButton;
    RadioButton4: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    MemQuestionSingle: TMemo;
    SingleScore: TLabeledEdit;
    SingleAnswer4: TLabeledEdit;
    SingleAnswer3: TLabeledEdit;
    SingleAnswer2: TLabeledEdit;
    SingleAnswer1: TLabeledEdit;
    CheckBox1: TCheckBox;
    ImageQuestionSingle: TDBImage;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    CheckMutyRAND: TCheckBox;
    EditMULTYscore: TLabeledEdit;
    EditMULTYans4: TLabeledEdit;
    EditMULTYans3: TLabeledEdit;
    EditMULTYans2: TLabeledEdit;
    EditMULTYans1: TLabeledEdit;
    Button1: TButton;
    MemoMultyTEXT: TMemo;
    CheckAns1: TCheckBox;
    CheckAns3: TCheckBox;
    CheckAns2: TCheckBox;
    CheckAns4: TCheckBox;
    ImageQuestionMulty: TDBImage;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    MemOpenTEXT: TMemo;
    Button2: TButton;
    EditOpenRightAnswer: TLabeledEdit;
    EditOpenScore: TLabeledEdit;
    CheckBoxOpenRand: TCheckBox;
    ImageQuestionEnter: TDBImage;
    EditSingle: TEdit;
    EditMulty: TEdit;
    EditEnter: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnSelectImageSingleClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormQUESTION: TFormQUESTION;


implementation

uses IBQuery;

{$R *.dfm}

procedure TFormQUESTION.BitBtn2Click(Sender: TObject);
begin
if formQUESTION.Caption = 'Добавить вопрос' then
  begin
    case formQUESTION.PageControl1.ActivePageIndex of
    // Одиночный выбор
    0: begin
   
       if (formQUestion.MemQuestionSingle.Text<>'') and (formQUestion.SingleAnswer1.Text<>'') and
          (formQUestion.SingleAnswer2.Text<>'') and (formQUestion.SingleAnswer3.Text<>'') and
          (formQUestion.SingleAnswer4.Text<>'') and (formQUestion.SingleScore.Text<>'') then
          begin
              datamodule6.IBTransaction3.Active:=true;
              with datamodule6.IBQueryRESPONDENT do
              begin
                SQL.Clear;
                SQL.Add('INSERT INTO QUESTION (text, answer_1, answer_2, answer_3, answer_4, right_answer, score, type_id_type, test_id_test, randomizing, image)');
                SQL.Add('values (:text, :ans1, :ans2, :ans3, :ans4, :right_ans, :score, :type, :test, :rand, :img)');
                ParamByName('text').Value := Trim(FOrmQUESTION.MemQuestionSingle.Text);
                ParamByName('ans1').Value := Trim(FOrmQUESTION.SingleAnswer1.Text);
                ParamByName('ans2').Value := Trim(FOrmQUESTION.SingleAnswer2.Text);
                ParamByName('ans3').Value := Trim(FOrmQUESTION.SingleAnswer3.Text);
                ParamByName('ans4').Value := Trim(FOrmQUESTION.SingleAnswer4.Text);
                ParamByname('score').Value := trim(formQuestion.SingleScore.Text);
                ParamByName('type').Value := '1';
                if editSingle.Text<>'' then
                ParamByName('img').LoadFromFile( editSingle.Text,ftBlob);
                ParamByName('test').Value := form1.DBGridTest.DataSource.DataSet.Fields[0].Value;
                if formQUESTION.RadioButton1.Checked then PAramByName('right_ans').Value := '1';
                if formQUESTION.RadioButton2.Checked then PAramByName('right_ans').Value := '2';
                if formQUESTION.RadioButton3.Checked then PAramByName('right_ans').Value := '3';
                if formQUESTION.RadioButton4.Checked then PAramByName('right_ans').Value := '4';
                if formQUESTION.CheckBox1.Checked then
                  ParamByNAme('rand').Value := '1'
                else
                 ParamByNAme('rand').Value := '0';
                Prepare;
                ExecSQL;
              end;
             datamodule6.IBTransaction3.Commit;
              datamodule6.IBDataSetTEST.Close;
              datamodule6.IBDataSetTEST.Open;
              datamodule6.IBDataSetQUESTIONS.close;
              datamodule6.IBDataSetQUESTIONS.Open;
          end
          else
            begin
            showmessage('Проверьте правильность ввода данных!');
         //   formQUESTION.ShowModal;
            end;
       end;
    //  Множественный выбор
    1: begin
       if (formQUestion.MemoMultyTEXT.Text<>'') and (formQUestion.EditMULTYans1.Text<>'') and
          (formQUestion.EditMULTYans2.Text<>'') and (formQUestion.EditMULTYans3.Text<>'') and
          (formQUestion.EditMULTYans4.Text<>'') and (formQUestion.EditMULTYscore.Text<>'') then
          begin
              datamodule6.IBTransaction3.Active:=true;
              with datamodule6.IBQueryRESPONDENT do
              begin
                SQL.Clear;
                SQL.Add('INSERT INTO QUESTION (text, answer_1, answer_2, answer_3, answer_4, right_answer, score, type_id_type, test_id_test, randomizing, image)');
                SQL.Add('values (:text, :ans1, :ans2, :ans3, :ans4, :right_ans, :score, :type, :test, :rand, :img)');
                ParamByName('text').Value := Trim(FOrmQUESTION.MemoMultyTEXT.Text);
                ParamByName('ans1').Value := Trim(FOrmQUESTION.EditMULTYans1.Text);
                ParamByName('ans2').Value := Trim(FOrmQUESTION.EditMULTYans2.Text);
                ParamByName('ans3').Value := Trim(FOrmQUESTION.EditMULTYans3.Text);
                ParamByName('ans4').Value := Trim(FOrmQUESTION.EditMULTYans4.Text);
                ParamByname('score').Value := trim(formQuestion.EditMULTYscore.Text);
                ParamByName('type').Value := '2';
                    if editMulty.Text<>'' then
                     ParamByName('img').LoadFromFile( editMulty.Text,ftBlob);

                ParamByName('test').Value := form1.DBGridTest.DataSource.DataSet.Fields[0].Value;
                PAramByName('right_ans').Value := '';
                if formQUESTION.CheckAns1.Checked then PAramByName('right_ans').Value := PAramByName('right_ans').Value + '1';
                if formQUESTION.CheckAns2.Checked then PAramByName('right_ans').Value :=PAramByName('right_ans').Value + '2';
                if formQUESTION.CheckAns3.Checked then PAramByName('right_ans').Value :=PAramByName('right_ans').Value + '3';
                if formQUESTION.CheckAns4.Checked then PAramByName('right_ans').Value :=PAramByName('right_ans').Value + '4';
                if formQUESTION.CheckMutyRAND.Checked then
                  ParamByNAme('rand').Value := '1'
                else
                 ParamByNAme('rand').Value := '0';
                Prepare;
                ExecSQL;
              end;
              datamodule6.IBTransaction3.Commit;
              datamodule6.IBDataSetTEST.Close;
              datamodule6.IBDataSetTEST.Open;
              datamodule6.IBDataSetQUESTIONS.close;
              datamodule6.IBDataSetQUESTIONS.Open;
          end
              else
            begin
            showmessage('Проверьте правильность ввода данных!');
   //         formQUESTION.ShowModal;
            end;
       end;
       // Открытый ответ
       2: begin
       if (formQUestion.MemOpenTEXT.Text<>'') and (formQUestion.EditOpenRightAnswer.Text<>'') and
          (formQUestion.EditOpenScore.Text<>'')  then
          begin
              datamodule6.IBTransaction3.Active:=true;
              with datamodule6.IBQueryRESPONDENT do
              begin
                SQL.Clear;
                SQL.Add('INSERT INTO QUESTION (text, right_answer, score, type_id_type, test_id_test, randomizing, image)');
                SQL.Add('values (:text, :right_ans, :score, :type, :test, :rand, :img)');
                ParamByName('text').Value := Trim(FOrmQUESTION.MemOpenTEXT.Text);
                ParamByname('score').Value := trim(formQuestion.EditOpenScore.Text);
                ParamByName('type').Value := '3';
                    if editEnter.Text<>'' then
                     ParamByName('img').LoadFromFile( editEnter.Text,ftBlob);
                ParamByName('test').Value := form1.DBGridTest.DataSource.DataSet.Fields[0].Value;
                PAramByName('right_ans').Value := trim(formQUestion.EditOpenRightAnswer.Text);
                if formQUESTION.CheckBoxOpenRand.Checked then
                  ParamByNAme('rand').Value := '1'
                else
                 ParamByNAme('rand').Value := '0';
                Prepare;
                ExecSQL;
              end;
              datamodule6.IBTransaction3.Commit;
              datamodule6.IBDataSetTEST.Close;
              datamodule6.IBDataSetTEST.Open;
              datamodule6.IBDataSetQUESTIONS.close;
              datamodule6.IBDataSetQUESTIONS.Open;
          end
              else
            begin
            showmessage('Проверьте правильность ввода данных!');
 //           formQUESTION.ShowModal;
            end;
       end;
    end;
  
  end
else
  if formQUESTION.Caption = 'Редактировать вопрос' then
  begin
    case formQUEstion.PageControl1.ActivePageIndex of
    // Одиночный выбор
    0: begin
       if (formQUestion.MemQuestionSingle.Text<>'') and (formQUestion.SingleAnswer1.Text<>'') and
          (formQUestion.SingleAnswer2.Text<>'') and (formQUestion.SingleAnswer3.Text<>'') and
          (formQUestion.SingleAnswer4.Text<>'') and (formQUestion.SingleScore.Text<>'') then
          begin
              datamodule6.IBTransaction3.Active:=true;
              with datamodule6.IBQueryRESPONDENT do
              begin
                SQL.Clear;
                SQL.Add('UPDATE question SET text = :text, answer_1 = :ans1, answer_2 = :ans2, answer_3 = :ans3, answer_4 = :ans4, right_answer = :right_ans,');
                SQL.Add(' score = :score, type_id_type = :type, test_id_test = :test, randomizing = :rand, image = :img WHERE id_question = :id');
                ParamByName('text').Value := Trim(FOrmQUESTION.MemQuestionSingle.Text);
                ParamByName('ans1').Value := Trim(FOrmQUESTION.SingleAnswer1.Text);
                ParamByName('ans2').Value := Trim(FOrmQUESTION.SingleAnswer2.Text);
                ParamByName('ans3').Value := Trim(FOrmQUESTION.SingleAnswer3.Text);
                ParamByName('ans4').Value := Trim(FOrmQUESTION.SingleAnswer4.Text);
                ParamByname('score').Value := trim(formQuestion.SingleScore.Text);
                ParamByName('type').Value := '1';
                    if editSingle.Text<>'' then
                ParamByName('img').LoadFromFile( editSingle.Text,ftBlob);
                ParamByName('id').Value := trim(form1.DBGridQuestions.DataSource.DataSet.Fields[0].AsString);
                ParamByName('test').Value := form1.DBGridTest.DataSource.DataSet.Fields[0].Value;
                if formQUESTION.RadioButton1.Checked then PAramByName('right_ans').Value := '1';
                if formQUESTION.RadioButton2.Checked then PAramByName('right_ans').Value := '2';
                if formQUESTION.RadioButton3.Checked then PAramByName('right_ans').Value := '3';
                if formQUESTION.RadioButton4.Checked then PAramByName('right_ans').Value := '4';
                if formQUESTION.CheckBox1.Checked then
                  ParamByNAme('rand').Value := '1'
                else
                 ParamByNAme('rand').Value := '0';
                Prepare;
                ExecSQL;
              end;
              datamodule6.IBTransaction3.Commit;
              datamodule6.IBDataSetTEST.Close;
              datamodule6.IBDataSetTEST.Open;
              datamodule6.IBDataSetQUESTIONS.close;
              datamodule6.IBDataSetQUESTIONS.Open;
          end
              else
            begin
            showmessage('Проверьте правильность ввода данных!');
//            formQUESTION.ShowModal;
            end;
       end;
    //  Множественный выбор
    1: begin
       if (formQUestion.MemoMultyTEXT.Text<>'') and (formQUestion.EditMULTYans1.Text<>'') and
          (formQUestion.EditMULTYans2.Text<>'') and (formQUestion.EditMULTYans3.Text<>'') and
          (formQUestion.EditMULTYans4.Text<>'') and (formQUestion.EditMULTYscore.Text<>'') then
          begin
              datamodule6.IBTransaction3.Active:=true;
              with datamodule6.IBQueryRESPONDENT do
              begin
                SQL.Clear;
                SQL.Add('UPDATE question SET text = :text, answer_1 = :ans1, answer_2 = :ans2, answer_3 = :ans3, answer_4 = :ans4, right_answer = :right_ans,');
                SQL.Add(' score = :score, type_id_type = :type, test_id_test = :test, randomizing = :rand, image = :img WHERE id_question = :id');
                ParamByName('text').Value := Trim(FOrmQUESTION.MemoMultyTEXT.Text);
                ParamByName('ans1').Value := Trim(FOrmQUESTION.EditMULTYans1.Text);
                ParamByName('ans2').Value := Trim(FOrmQUESTION.EditMULTYans2.Text);
                ParamByName('ans3').Value := Trim(FOrmQUESTION.EditMULTYans3.Text);
                ParamByName('ans4').Value := Trim(FOrmQUESTION.EditMULTYans4.Text);
                ParamByname('score').Value := trim(formQuestion.EditMULTYscore.Text);
                ParamByName('type').Value := '2';
                    if editMulty.Text<>'' then
                ParamByName('img').LoadFromFile( editMulty.Text,ftBlob);
                ParamByName('test').Value := form1.DBGridTest.DataSource.DataSet.Fields[0].Value;
                ParamByName('id').Value := trim(form1.DBGridQuestions.DataSource.DataSet.Fields[0].AsString);
                PAramByName('right_ans').Value := '';
                if formQUESTION.CheckAns1.Checked then PAramByName('right_ans').Value := PAramByName('right_ans').Value + '1';
                if formQUESTION.CheckAns2.Checked then PAramByName('right_ans').Value :=PAramByName('right_ans').Value + '2';
                if formQUESTION.CheckAns3.Checked then PAramByName('right_ans').Value :=PAramByName('right_ans').Value + '3';
                if formQUESTION.CheckAns4.Checked then PAramByName('right_ans').Value :=PAramByName('right_ans').Value + '4';
                if formQUESTION.CheckMutyRAND.Checked then
                  ParamByNAme('rand').Value := '1'
                else
                 ParamByNAme('rand').Value := '0';
                Prepare;
                ExecSQL;
              end;
              datamodule6.IBTransaction3.Commit;
              datamodule6.IBDataSetTEST.Close;
              datamodule6.IBDataSetTEST.Open;
              datamodule6.IBDataSetQUESTIONS.close;
              datamodule6.IBDataSetQUESTIONS.Open;
          end
              else
            begin
            showmessage('Проверьте правильность ввода данных!');
  //          formQUESTION.ShowModal;
            end;
       end;
       // Открытый ответ
       2: begin
       if (formQUestion.MemOpenTEXT.Text<>'') and (formQUestion.EditOpenRightAnswer.Text<>'') and
          (formQUestion.EditOpenScore.Text<>'')  then
          begin
              datamodule6.IBTransaction3.Active:=true;
              with datamodule6.IBQueryRESPONDENT do
              begin
                SQL.Clear;
                SQL.Add('UPDATE question SET text = :text, right_answer = :right_ans,');
                SQL.Add(' score = :score, type_id_type = :type, test_id_test = :test, randomizing = :rand, image = :img WHERE id_question = :id');
                ParamByName('text').Value := Trim(FOrmQUESTION.MemOpenTEXT.Text);
                ParamByname('score').Value := trim(formQuestion.EditOpenScore.Text);
                ParamByName('type').Value := '3';
                    if editEnter.Text<>'' then
              ParamByName('img').LoadFromFile( editEnter.Text,ftBlob);
                ParamByName('test').Value := form1.DBGridTest.DataSource.DataSet.Fields[0].Value;
                PAramByName('right_ans').Value := trim(formQUestion.EditOpenRightAnswer.Text);
                ParamByName('id').Value := trim(form1.DBGridQuestions.DataSource.DataSet.Fields[0].AsString);
                if formQUESTION.CheckBoxOpenRand.Checked then
                  ParamByNAme('rand').Value := '1'
                else
                 ParamByNAme('rand').Value := '0';
                Prepare;
                ExecSQL;
              end;
              datamodule6.IBTransaction3.Commit;
              datamodule6.IBDataSetTEST.Close;
              datamodule6.IBDataSetTEST.Open;
              datamodule6.IBDataSetQUESTIONS.close;
              datamodule6.IBDataSetQUESTIONS.Open;
          end
              else
            begin
            showmessage('Проверьте правильность ввода данных!');
 //           formQUESTION.ShowModal;
            end;
       end;
    end;

  end;
end;

procedure TFormQUESTION.BtnSelectImageSingleClick(Sender: TObject);
begin
 if OpenDialog1.Execute then
  begin
 // assignfile(f,savedialog1.FileName);
 editSingle.Text:=opendialog1.FileName;
  formQUESTION.ImageQuestionSingle.Picture.LoadFromFile(opendialog1.FileName);
  end;
ImageQuestionSingle.Visible:=true;

end;

procedure TFormQUESTION.Button1Click(Sender: TObject);
begin
 if OpenDialog1.Execute then
  begin
   editMulty.Text:=opendialog1.FileName;
 // assignfile(f,savedialog1.FileName);
  formQUESTION.ImageQuestionMulty.Picture.LoadFromFile(opendialog1.FileName);
  end;

ImageQuestionMulty.Visible:=true;

end;

procedure TFormQUESTION.Button2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
   editEnter.Text:=opendialog1.FileName;
 // assignfile(f,savedialog1.FileName);
  formQUESTION.ImageQuestionEnter.Picture.LoadFromFile(opendialog1.FileName);
  end;

ImageQuestionEnter.Visible:=true;
end;

end.
