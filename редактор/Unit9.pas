unit Unit9;

interface

uses
  QuickRpt,   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ToolWin, IBDatabase, DB,  Grids, DBGrids,
  ExtCtrls, DBCtrls, IBCustomDataSet, IBTable, StdCtrls, Buttons,
  IBUpdateSQL, QRCtrls;

type
  TTGridReport = class(TForm)
    GridRep: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TGridReport: TTGridReport;

implementation

uses Unit3, Unit6, Unit4, Unit5, Unit2, Unit7, Unit1;

{$R *.dfm}

end.
