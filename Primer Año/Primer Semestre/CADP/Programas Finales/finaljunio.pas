program finaljunio;

var c, d: integer;

procedure calcular (var a: integer; b: integer; var x: integer);
var d: integer;
begin
  d := (b MOD 4) + c;
  b := (d MOD 10) + d;
  if ((a + b) > 25) then
    b := b + (a * 4)
  else
    x := (b + a) * 3;
  c := (a - b) + c;
  writeln ('Valor a: ', a, ' Valor b: ', b, ' Valor x: ', x, ' Valor d: ', d);
end;

var a, b: integer;
begin
  a := 4; 
  b := 6; 
  c := 3; 
  d := 12;
  calcular(d, c, a);
  writeln ('Valor a: ', a, ' Valor b: ', b, ' Valor c: ', c, ' Valor d: ', d);
end.

