program untitled;
var c:integer;
procedure sumar(a:integer; var b:integer);
begin
  writeln('empieza ', a,' ',b,' ' ,c);
  b:=c+a;
  writeln(b);
  a:= b-a;
  writeln(a);
  if(c>b)
    then c:=a+b
    else c:= a - b;
  writeln('A es',a,'B es',b,'C es',c);
  end;
var
 a,b:integer;
 
begin
  c:=8; a:=4; b:=9;
  sumar(b,c);
  writeln('a',a,'b',b,'c',c)
END.

