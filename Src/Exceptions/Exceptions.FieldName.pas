unit Exceptions.FieldName;

interface

uses
  System.SysUtils;

type
  ExceptionsFieldName = class(Exception)
  private
    fFieldName: string;
  public
    constructor Create(const msg, fieldName: string); reintroduce;
    property fieldName: string read fFieldName write fFieldName;
  end;

implementation

{ ExceptionsFieldName }

constructor ExceptionsFieldName.Create(const msg, fieldName: string);
begin
  Self.Message := msg;
  fFieldName   := fieldName;
end;

end.
