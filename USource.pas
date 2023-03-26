unit USource;

interface

uses System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, JSON, System.IOUtils, DateUtils, Math,
  System.Generics.Collections;

type

  TDirection = (dUp, dDown, dLeft, dRight); // Направление: вверх, вниз, налево, направо
  TRotate = (toLeft, toRight); // Поворот:по часовой или против часовой стрелки

  IMove = interface  // Интерфейс движения
    procedure Move(Steps: Integer);
  end;

  IRotate = interface  // Интерфейс вращения
    procedure Rotate(Rotation: TRotate);
  end;

  // Космический карабль
  TSpaceShip = class(TInterfacedObject, IMove, IRotate)
  private
    PosX, PosY: Integer; // Текущие координаты
    Direction: TDirection; // Текущее направление: вверх, вниз, налево, направо
  public
    Constructor Create;
    procedure Move(Steps: Integer); // Сдвинуть на указанное число шагов
    procedure Rotate(Rotation: TRotate); // Повернуть по часовой или против часовой стрелки
  end;

  TFuel = class
  private
    FFuel: Integer; // Уровень топлива
    FFuelSpeed: Integer; // Расход топлива на шаг
  public
    Constructor Create;
    procedure CheckFuelCommand; // Проверяет уровень топлива
    procedure BurnFuelCommand; // Сжигает топливо
  end;

  TMacroCommand = class
  private
    FCommands: TList<String>;
  public
    Constructor Create(Commands: TList<String>);
    procedure Execute;
  end;

implementation

// uses ;

{ TSpaceShip }

constructor TSpaceShip.Create;
begin
  Direction := dUp; // Изначально движемся вверх
  PosX := 0; // Начальные координаты
  PosY := 0; // Начальные координаты
end;

procedure TSpaceShip.Move(Steps: Integer);
begin
  // Смещаемся на заданное число шагов в зависимоси от текущего направления
  case Direction of
    dUp:
      Inc(PosX, Steps);
    dDown:
      Dec(PosX, Steps);
    dLeft:
      Dec(PosY, Steps);
    dRight:
      Inc(PosY, Steps);
  end;
end;

procedure TSpaceShip.Rotate(Rotation: TRotate);
begin
  // Поворачиваемся налево или направо
  case Direction of
    dUp:
      if Rotation = toRight then
        Direction := dRight
      else
        Direction := dLeft;
    dDown:
      if Rotation = toRight then
        Direction := dLeft
      else
        Direction := dRight;
    dLeft:
      if Rotation = toRight then
        Direction := dUp
      else
        Direction := dDown;
    dRight:
      if Rotation = toRight then
        Direction := dDown
      else
        Direction := dUp;
  end;
end;

{ TFuel }

constructor TFuel.Create;
begin
  FFuel := 100; // Начальный запас топлива
end;

procedure TFuel.BurnFuelCommand;
begin
  Dec(FFuel, FFuelSpeed);
end;

procedure TFuel.CheckFuelCommand;
// Проверяет уровень топлива
begin
  if FFuel <= 0 then
    Raise Exception.Create('CommandException')
end;

{ TMacroCommand }

constructor TMacroCommand.Create(Commands: TList<String>);
begin
  FCommands := Commands;
end;

procedure TMacroCommand.Execute;
begin
  for var Command in FCommands do
    if True then
end;

end.
