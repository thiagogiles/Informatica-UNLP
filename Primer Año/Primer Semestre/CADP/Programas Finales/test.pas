program test;

procedure actualizar(ant:integer; var nuevo:integer; var max:integer);
begin
  max:= ant mod 100; ant:=nuevo div 2;
  if(max>nuevo) then nuevo:= max * 3 + ant
  else nuevo:= ant * 2 + max;
  writeln(ant,' ',nuevo,' ',max);
end;

var
   max,inf,sup:integer;
BEGIN
   max:=23; inf:=160; sup:=40;
 actualizar(max,inf,sup);
 writeln(inf,' ',sup,' ',max);
END.
