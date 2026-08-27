
{ Se lee información de películas. De cada película se lee número, título de la película, nombre del género y nombre
del director. Se pide realizar un programa que genere una estructura de datos adecuada para almacenar cada nombre
de director y la cantidad de películas dirigidas por el director. La lectura finaliza cuando se lee el número 0.
Información se lee ordenada por el nombre del género}


program finalagosto;
type
   pelicula = record
   num:integer;
   titulo:string;
   genero:string;
   director:string;
   end;
   guardar = record
   director:string;
   cantidad:integer;
   end;
   lista=^nodo;
   nodo=record
    dato:guardar;
    sig:lista;
 end;


procedure  leer(var p:pelicula);
begin
  readln(p.num);
  if(p.num<>0) then begin
    readln(p.titulo);
    readln(p.genero);
    readln(p.director);
  end;
end;

procedure agregarAdelante(var l:lista; p:pelicula);
var
  nue:lista;
begin
  new(nue);
  nue^.dato.director:=p.director;
  nue^.dato.cantidad:=1;
  nue^.sig:=l;
  l:=nue;
end;

procedure buscarDirector(var l:lista; p:pelicula);
begin
    while (l<>nil)  and  (l^.dato.director<>p.director) do
      l:=l^.sig;
    if(l=nil) then  begin
      agregarAdelante(l,p);
      writeln('Director Sumado');
     end
    else begin
        l^.dato.cantidad:=l^.dato.cantidad + 1;
        writeln('Pelicula Sumada');
     end;
  end;







var
l:lista;
p:pelicula;
begin
 l:=nil;
 leer(p);
 while (p.num<>0) do begin
   buscarDirector(l,p);
   leer(p);
  end;
end.









{
program tres;

var c: integer;

procedure numero (var a: integer; var b: integer);  // A= 7 B= 5
begin
  b:= 30 DIV 4 + a;  // B= 7 + 7 = 14  --> 30/4 = 7
  writeln(C);
  a:= 29 MOD 5 + c;  // COMO C NO ESTA DEFINIDO NO SE PUEDE SEGUIR CON EL CALCULO, PORQUE TIENE UN VALOR BASURA
  writeln(b);
  if ((a + c) > 10) then b:= b - c * 2 
  else b:= b - c * 3;
  c:= b + c; 
  writeln ('Valor a: ', a, ' Valor b: ', b, ' Valor c: ', c); 
end;

var a, b: integer;
begin
  b:= 7; c:= 5;
  numero (b, c);  // Mando 7 y 5 en los primeros 2 parametros
  writeln ('Valor a: ', a, ' Valor b: ', b, ' Valor c: ', c);
end.
}
