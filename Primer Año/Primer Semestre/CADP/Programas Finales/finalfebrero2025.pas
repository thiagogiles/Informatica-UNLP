{
* La biblioteca de la Facultad dispone de sus préstamos ordenados por código de tema (1..15). De cada préstamo se conoce: código de tema, fecha y el código del libro prestado. 
* Se pide realizar un programa que informe el código de tema con más cantidad de préstamos y la cantidad total de préstamos para cada tema. 
* Declare todas las estructuras utilizadas para resolver el programa. Considerar: que la solución propuesta debe optimizar el tiempo de ejecución y la memoria estática.
}

program finalfebrero2025;

type
sub= 1..15;
prestamo= record
  codigo:sub;
  fecha:string;
  codLibro:integer;
end;

lista = ^nodo;
nodo= record;
 elem:prestamo;
 sig:lista;
end;
vector = array [sub] of lista;

procedure agregarAdelante(var l:lista; p:prestamo);
var
  nue:lista;
begin
  new(nue);
  nue^.elem:=p;
  nue^.sig:=l;
  l:=nue;
end;

procedure cargarVector(var v:vector);
var
  p:prestamo;
begin
  leer(p);
  while( condicion de corte );
  agregarAdelante(v[p.codigo], p);
  leer(p);
end;

procedure maximo(v:vector);
var
  i,cant,max,ind:integer;
begin
  max:=0;
  for i:= 1 to diml do begin
    cant:=0;
    contar(v[i],cant)
    writeln('La cantidad de libros prestados para el tema: ', i , ' es: ', cant);
    if(cant>=max) then
      max:=cant;
      ind:=i;
  end;
  writeln('El indice maximo es: ', ind);
end;


procedure contar(l:lista; var cant:integer);
begin
  while(l<>nil) do begin
    cant:= cant + 1;
    l:=l^.sig;
  end;
end;
  
