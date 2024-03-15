unit Utils;

interface

uses
  System.SysUtils,
  System.Classes,
  System.RTTI,
  Vcl.Forms,
  Vcl.Controls,
  Vcl.ComCtrls,
  Exceptions.FieldName,
  RTTI.FieldName;

type TUtils = class
  private
    class procedure setFocusComponente(const winControl: TWinControl);
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
  Componente      : TComponent;
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

      Componente := form.FindComponent(RttiField.Name);
      if (Componente = nil) then begin
        Continue;
      end;

      // Se o componente encontrado n�o herda de TWinControl
      if not (Componente is TWinControl) then begin
        Continue;
      end;

      Self.setFocusComponente(TWinControl(Componente));
    end;
  end;

  raise Exception.Create(E.Message);
end;

class procedure TUtils.setFocusComponente(const winControl: TWinControl);
var
  parent: TComponent;
begin
  parent := winControl.Parent;
  while (parent <> nil) and (parent.ClassParent <> TForm) do begin
    if (parent is TTabSheet) then begin

      // Se a aba n�o estiver selecionada
      if (not (TTabSheet(parent).Showing)) then begin
        TTabSheet(parent).Show;
      end;
    end;
    parent := TWinControl(parent).Parent;
  end;

  if (winControl.CanFocus) then begin
    winControl.SetFocus;
  end;
end;

end.
