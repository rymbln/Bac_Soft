unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  TFormSTUDENT = class(TForm)
    LabeledEditSURNAME: TLabeledEdit;
    LabeledEditNAME: TLabeledEdit;
    LabeledEditSecNAME: TLabeledEdit;
    LabeledEditPASS: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSTUDENT: TFormSTUDENT;

implementation

uses Unit6, Unit1;

{$R *.dfm}

procedure TFormSTUDENT.BitBtn1Click(Sender: TObject);
begin
if formSTUDENT.Caption = 'Редактировать студента' then
begin
  if ((formSTUDENT.LabeledEditSURNAME.Text<>'') and (formSTUDENT.LabeledEditNAME.Text<>'')
      and (formSTUDENT.LabeledEditSecNAME.Text<>'') 
      and (formSTUDENT.LabeledEditPASS.Text<>''))  then
        begin
              datamodule6.IBTransaction3.Active:=true;
              datamodule6.IBQueryRESPONDENT.SQL.Clear;
              datamodule6.IBQueryRESPONDENT.SQL.Add('update RESPONDENT set SURNAME = :surname, NAME = :name, PATRONIMIC = :secname, PASS = :pass, GROUP_ID_GROUP = :group_id where ID_RESPONDENT = :id');
              datamodule6.IBQueryRESPONDENT.ParamByName('id').Value := strtoint(formSTUDENT.Label1.Caption);
              datamodule6.IBQueryRESPONDENT.ParamByName('group_id').Value := form1.DBGrid2.DataSource.DataSet.Fields[0].AsInteger;
              datamodule6.IBQueryRESPONDENT.ParamByName('surname').Value := TrimRight(formSTUDENT.LabeledEditSURNAME.Text);
              datamodule6.IBQueryRESPONDENT.ParamByName('name').Value := TrimRight(formSTUDENT.LabeledEditNAME.Text);
              datamodule6.IBQueryRESPONDENT.ParamByName('secname').Value := TrimRight(formSTUDENT.LabeledEditSecNAME.Text);
              datamodule6.IBQueryRESPONDENT.ParamByName('pass').Value := TrimRight(formSTUDENT.LabeledEditPASS.Text);
              datamodule6.IBQueryRESPONDENT.Prepare;
              datamodule6.IBQueryRESPONDENT.ExecSQL;
                datamodule6.IBTransaction3.Commit;
              datamodule6.IBDataSetRESPONDENT.Close;
              datamodule6.IBDataSetRESPONDENT.Open;
      end
  else
    showmessage('Проверьте введенные данные');
end
else  if formSTUDENT.Caption = 'Добавить студента' then
begin
 if ((formSTUDENT.LabeledEditSURNAME.Text<>'')
      and (formSTUDENT.LabeledEditNAME.Text<>'')
      and (formSTUDENT.LabeledEditSecNAME.Text<>'')
      and (formSTUDENT.LabeledEditPASS.Text<>''))  then
        begin
              datamodule6.IBTransaction3.Active:=true;
              with datamodule6.IBQueryRESPONDENT do
              begin
                SQL.Clear;
                SQL.Add('INSERT INTO RESPONDENT (SURNAME, NAME, PATRONIMIC, PASS, GROUP_ID_GROUP) values (:surname, :name, :secname, :pass, :group_id)');
                ParamByName('group_id').Value := form1.DBGrid2.DataSource.DataSet.Fields[0].AsInteger;
                ParamByName('surname').Value := Trim(formSTUDENT.LabeledEditSURNAME.Text);
                ParamByName('name').Value := Trim(formSTUDENT.LabeledEditNAME.Text);
                ParamByName('secname').Value := Trim(formSTUDENT.LabeledEditSecNAME.Text);
                ParamByName('pass').Value := Trim(formSTUDENT.LabeledEditPASS.Text);
                Prepare;
                ExecSQL;
              end;
              datamodule6.IBTransaction3.Commit;
              datamodule6.IBDataSetRESPONDENT.Close;
              datamodule6.IBDataSetRESPONDENT.Open;
          end
  else
    showmessage('Проверьте введенные данные');
  end;
end;

procedure TFormSTUDENT.FormShow(Sender: TObject);
begin
  if formSTUDENT.Caption = 'Редактирование студента' then
    begin
      formSTUDENT.LabeledEditSURNAME.Text:= TrimRight(form1.DBGrid1.DataSource.DataSet.Fields[1].asString);
      formSTUDENT.LabeledEditNAME.Text:= TrimRight(form1.DBGrid1.DataSource.DataSet.Fields[2].asString);
      formSTUDENT.LabeledEditSecNAME.Text:= TrimRight(form1.DBGrid1.DataSource.DataSet.Fields[3].asString);

      formSTUDENT.LabeledEditPASS.Text:= TrimRight(form1.DBGrid1.DataSource.DataSet.Fields[5].asString);
    end
else
  if formSTUDENT.Caption = 'Добавление студента' then
    begin
      formSTUDENT.LabeledEditSURNAME.Text:= '';
      formSTUDENT.LabeledEditNAME.Text:= '';
      formSTUDENT.LabeledEditSecNAME.Text:= '';
      
      formSTUDENT.LabeledEditPASS.Text:= '';
    end;

end;

end.
