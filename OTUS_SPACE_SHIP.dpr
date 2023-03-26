program OTUS_SPACE_SHIP;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  JSON,
  System.IOUtils,
  DateUtils,
  Math,
  System.Generics.Collections,
  USource in 'USource.pas';    // Модуль с исходными кодами классов!!!


begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
