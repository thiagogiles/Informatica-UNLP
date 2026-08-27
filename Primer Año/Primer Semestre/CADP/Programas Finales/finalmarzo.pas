program finalmarzo;

var c, d: integer;

procedure calcular (var a: integer; var b: integer; c: integer);
var d: integer;
begin
  writeln('C es:' ,c);
  d := c MOD 2 + 15;
  a := c + a;
  if (a + d) > 21 then b := a + d * 3
  else b := a + d;
  writeln ('Valor a: ', a, ' Valor b: ', b, ' Valor c: ', c, ' Valor d: ', d);
end;

var
  a, b: integer;
begin
  a := 4; b := 6; d := 12;
  writeln(3 mod 4);
  calcular (b, c, a);
  writeln ('Valor a: ', a, ' Valor b: ', b, ' Valor c: ', c, ' Valor d: ', d);
end.
