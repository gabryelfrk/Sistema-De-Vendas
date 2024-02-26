unit Utils;

interface

uses
  System.SysUtils,
  System.Classes,
  System.RTTI,
  Vcl.Forms,
  Vcl.Controls,
  Exceptions.FieldName,
  RTTI.FieldName;

type TUtils = class
  private
  public
    class procedure tratarExceptionFieldName(const form: TForm; const E: ExceptionsFieldName);
end;

implementation

{ TUtils }

class procedure TUtils.tratarExceptionFieldName(const form: TForm; const E: ExceptionsFieldName);
var
  RttiContext     : TRttiContext;
  RttiType        : TRttiType;
  RttiField       : TRttiField;
  CustomAttribute : TCustomAttribute;
  vFieldName      : FieldName;
  Component       : TComponent;
begin
  RttiContext := TRttiContext.Create;
  RttiType    :=  RttiContext.GetType(form.ClassInfo); // Tenho acesso as inf. do formul�rio

  for RttiField in RttiType.GetFields do begin

    // Se for diferente desse tipo, s�o os fields das heran�as do formul�rio
    if (RttiField.Parent <> RttiType) then begin
      Continue;
    end;

    for CustomAttribute in RttiField.GetAttributes do begin

      // Se n�o for o FieldName que procura..
      if (not (CustomAttribute is FieldName)) then begin
        Continue;
      end;

      vFieldName := FieldName(CustomAttribute);
      if (vFieldName.nome.ToUpper <> E.fieldName) then begin
        Continue;
      end;

      Component := form.FindComponent(RttiField.Name);
      if (Component = nil) then begin
        Continue;
      end;

      // Se o componente encontrado n�o herda de TWinControl
      if not (Component is TWinControl) then begin
        Continue;
      end;

      TWinControl(Component).SetFocus;
    end;
  end;

  raise Exception.Create(E.Message);
end;

end.