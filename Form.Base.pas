unit Form.Base;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.InertialMovement,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.ListBox;

type
  TBaseForm = class(TForm)
  private
  protected
    ControlledScrollBox: TCustomScrollBox;
    function GetActiveScrollBox: TCustomScrollBox; virtual;
  public
    function ObjectAtPoint(AScreenPoint: TPointF): IControl; override;
  end;

implementation

{$R *.fmx}

type
  TAniCalculationsAccess = class(TAniCalculations);

function ControlMoved(ScrollBox: TCustomScrollBox): Boolean;
begin
  Result:=False;
  if Assigned(ScrollBox) then
  if ScrollBox is TCustomListBox then
    Result:=ScrollBox.AniCalculations.Moved
  else
    Result:=ScrollBox.AniCalculations.Moved and TAniCalculationsAccess(ScrollBox.AniCalculations).Enabled and
      (ScrollBox.AniCalculations.LastTimeCalc>0);
end;

function TBaseForm.GetActiveScrollBox: TCustomScrollBox;
begin
  Result:=ControlledScrollBox;
end;

function TBaseForm.ObjectAtPoint(AScreenPoint: TPointF): IControl;
var ScrollBox: TCustomScrollBox;
begin

  var P:=ScreenToClient(AScreenPoint);

  ScrollBox:=GetActiveScrollBox;

  if ControlMoved(ScrollBox) and ScrollBox.PointInObject(P.X,P.Y) then
  begin
    Result:=ScrollBox;
    if Assigned(Captured) and (Captured<>Result) then
    begin
      Captured.MouseUp(TMouseButton.mbLeft,[],-1,-1);
      SetCaptured(nil);
    end;
  end else
    Result:=inherited;

end;

end.
