program finalfebrero;
var c, d: integer;

procedure calcular (var a: integer; b: integer; var c: integer);
var d: integer;
begin
  d := (b MOD 2) + c;
  b := (d MOD 10) + d;
  if ((a + b) > 25) then
    b := b + (a * 2)
  else
    c := (b + a) * 3;
  c := (a - b) + c;
  writeln ('Valor a: ', a, ' Valor b: ', b, ' Valor c: ', c, ' Valor d: ', d);
end;

var a, b: integer;
begin
  a := 5;
  b := 3;
  c := 2;
  d := 9;
  calcular(b, c, a);
  writeln ('Valor a: ', a, ' Valor b: ', b, ' Valor c: ', c, ' Valor d: ', d);
end.
