unit USource;

interface

uses System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, JSON, System.IOUtils, DateUtils, Math,
  System.Generics.Collections;

type

  IMove = interface // Интерфейс движения
    procedure Move(StepX, StepY: Integer); // На сколько сдвинуть?
  end;

  // Класс адаптер, реализующий методы движения
  TMoveObject = class(TInterfacedObject, IMove)
  public
    PosX, PosY: Integer;
    procedure Move(StepX, StepY: Integer);
  end;

  IRotate = interface // Интерфейс вращения
    procedure Rotate(Rotation: Integer); // На сколько повернуть?
  end;

  // Класс адаптер, реализующий методы поворота
  TRotateObject = class(TInterfacedObject, IRotate)
  public
    Direction: Integer;
    procedure Rotate(Rotation: Integer);
  end;

  // Космический карабль
  TSpaceShip = class
  private

  public
    constructor Create;
  end;

implementation

// uses ;

{ TSpaceShip }

{ TFuel }

{ TMoveObject }

procedure TMoveObject.Move(StepX, StepY: Integer);
begin
  PosX := PosX + StepX;
  PosY := PosY + StepY;
end;

{ TRotateObject }

procedure TRotateObject.Rotate(Rotation: Integer);
begin
  Direction := Direction + Rotation;
end;

{ TSpaceShip }

constructor TSpaceShip.Create;
begin

end;

end.
