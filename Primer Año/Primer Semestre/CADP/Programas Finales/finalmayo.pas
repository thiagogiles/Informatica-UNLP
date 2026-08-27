program finalmayo;

var c: integer;

procedure calcular (d: integer; var b: integer; var c: integer);  // 
var a: integer;

begin
  b := (45 MOD 3) + d;  //  
  a := b + 3 - c;  // 
  if (a >= 14) then b := b + a * 4
  else b := b + a * 2;
  c := a + b + c;
  writeln ('Valor a: ', a, ' valor b: ', b, ' valor c: ', c);
end;

var a, b: integer;
begin
  a := 8; b := 6; 
  calcular (b, c, a);  // 
  writeln ('Valor a: ', a, ' valor b: ', b, ' valor c: ', c);
end.
