unit tbj_utils;

interface

uses
  SysUtils, Windows, Classes, XSBuiltIns, RegExpr;

function ValidateIBAN(S:string): Integer;
function ReturnISODate(D: TDateTime): string;
function GetAppVersion: String;
procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings);

function ConvertConvert(S: String): String;
function ReConvertConvert(S: Ansistring): AnsiString;

implementation

uses DateUtils;

function ValidateIBAN(S:string):Integer;
  var
    re: TRegExpr;
begin
  Result := 2;
  if Length(S) <> 20 then
    Result := 1
  else
  begin
    re := TRegExpr.Create;
    try
      re.Expression := '^[L][U][\d]{5}[\w]{13}$';
      if re.Exec(s) then
      if re.MatchPos[0] > 0 then
        Result := 0;
    finally
      re.Free;
    end;
  end;
end;

function ReturnISODate(D: TDateTime): string;
  var xsDate: TXSDate;
begin

  xsDate := TXSDate.Create();

  try
    xsDate.AsDate := D; // convert from TDateTime
    Result := xsDate.NativeToXS; // convert to WideString
  finally
    xsDate.Free;
  end;

end;

function GetAppVersion: String;
var
  VerInfoSize: Cardinal;
  VerValueSize: Cardinal;
  Dummy: Cardinal;
  PVerInfo: Pointer;
  PVerValue: PVSFixedFileInfo;
  iLastError: DWord;
  FileName: TFileName;
begin
  Result := '';
  FileName := ParamStr(0);
  VerInfoSize := GetFileVersionInfoSize(PChar(FileName), Dummy);
  if VerInfoSize > 0 then
  begin
    GetMem(PVerInfo, VerInfoSize);
    try
      if GetFileVersionInfo(PChar(FileName), 0, VerInfoSize, PVerInfo) then
      begin
        if VerQueryValue(PVerInfo, '\', Pointer(PVerValue), VerValueSize) then
          with PVerValue^ do
            Result := Format('%d.%d.%d build %d', [
              HiWord(dwFileVersionMS), //Major
              LoWord(dwFileVersionMS), //Minor
              HiWord(dwFileVersionLS), //Release
              LoWord(dwFileVersionLS)]); //Build
      end
      else
      begin
        iLastError := GetLastError;
        Result := Format('GetFileVersionInfo failed: (%d) %s', 
                      [iLastError, SysErrorMessage(iLastError)]);
      end;
    finally
      FreeMem(PVerInfo, VerInfoSize);
    end;
  end
  else
  begin
    iLastError := GetLastError;
    Result := Format('GetFileVersionInfo failed: (%d) %s', 
                     [iLastError, SysErrorMessage(iLastError)]);
  end;
end;

procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
begin
  ListOfStrings.Clear;
  ListOfStrings.Delimiter     := Delimiter;
  ListOfStrings.DelimitedText := Str;
end;

function ConvertConvert(S: String): String;
var i: integer;
    ArcS: Ansistring;
begin
  ArcS := S;
  result := '';
  for I := 1 to Length(ArcS) do
      result := result + IntToHex(byte(ArcS[i]),2);
end;

function ReConvertConvert(S: Ansistring): AnsiString;
var i: integer;
begin
  i := 1;
  result := '';
  while i <= Length(S) do begin
    result := result + Ansichar(StrToInt('$' + s[i] + s[i+1]));
    i := i + 2;
  end;
  result := result
end;

end.
