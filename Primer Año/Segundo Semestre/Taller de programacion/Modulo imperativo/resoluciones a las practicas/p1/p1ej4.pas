{Una librería requiere el procesamiento de la información de sus productos. De cada producto se conoce el código del producto, código de rubro (del 1 al 6) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
A) Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura de datos adecuada. El
ingreso de los productos finaliza cuando se lee el precio -1.

B) Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.

C) Genere un vector (de a lo sumo 20 elementos) con los productos del rubro 3. Considerar que puede haber más o menos de 20 productos del rubro 3. Si la
cantidad de productos del rubro 3 es mayor a 20, se debe almacenar los primeros 20 que están en la lista e ignore el resto.

D) Ordenar, por precio, los elementos del vector generado en c) utilizando el método visto en la teoría.

E) Muestre los precios del vector resultante del punto d).

F) Calcule el promedio de los precios del vector resultante del punto d).

}
program p1ej4;
const
  dimf=20;
type
   rangorubro=1..6;
   producto=record
     cod:integer;
     rubro:rangorubro;
     precio:real;
   end;
  lista = ^nodo;
   nodo=record
   dato:producto;
   sig:lista;
 end;
 vector = array [rangorubro] of lista;
 vectres = array[1..dimf] of producto;
 
 procedure inicializarVector(var v:vector);
 var
   i:integer;
 begin
   for i:= 1 to 6 do 
     v[i]:=nil;
   end;

procedure leer(var p:producto);
begin
  writeln('Ingrese el precio: ');
  readln(p.precio);
  if(p.precio<>-1) then begin
    writeln('Ingrese el codigo: ');
    readln(p.cod);
    writeln('Ingrese el rubro: ');
    readln(p.rubro);
  end;
end;

procedure agregarOrdenado(var l:lista; p:producto);
var
  aux,ant,act:lista;
begin
  new(aux);
  aux^.dato:=p;
  act:=l; ant:=l;
  while(act<>nil) and (act^.dato.cod < p.cod) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(act=ant) then
    l:=aux
  else
    ant^.sig:=aux;
  aux^.sig:=act;
end;

procedure incisoA(var v:vector);
var
  p:producto;
begin
  inicializarVector(v);
  leer(p);
  while(p.precio<>-1) do begin
    agregarOrdenado(v[p.rubro],p);
    leer(p);
  end;
end;

procedure incisoB(v:vector);
var
  i:integer;
begin
  for i:=1 to 6 do begin
    while(v[i]<>nil) do begin
      writeln('Rubro ', i, ' codigo: ', v[i]^.dato.cod);
      v[i]:=v[i]^.sig;
    end;
 end;
end;

procedure incisoC(v:vector; var vt:vectres; var cont:integer);
var
  i:integer;
begin
  i:=3; cont:=0;
  while(v[i]<>nil) and (cont<20) do begin
    cont:=cont + 1;
    vt[cont]:=v[i]^.dato;
    v[i]:=v[i]^.sig;
  end;
end;

procedure incisoD(var v:vectres; cont:integer);
var
  i,j,pos:integer;
  item:real;
begin
  for i:= 1 to (cont-1) do begin
    pos:=i;
    for j:= (i+1) to cont do
      if v[j].precio < v[pos].precio then pos:=j;
     item:= v[pos].precio;
     v[pos] := v[i];
     v[i].precio := item;
   end;
end;
  
procedure incisoEF(v:vectres; cont:integer);
var
  i,cant:integer;
  tot,prom:real;
begin
  cant:=0; tot:=0;
  if(cont > 0) then begin
  for i:= 1 to cont do  begin
    writeln('El precio en la posicion ', i, 'es: ', v[i].precio);
    cant:=cant + 1;
    tot:= tot + v[i].precio;
   end;
  end;
    prom:=tot/cant;
    writeln('El promedio es: ', prom);
  end;
var
  v:vector;
  vtres:vectres;
  cont:integer;
begin
  incisoA(v);
  writeln('Inciso A');
  incisoB(v);
    writeln('Inciso B');
  incisoC(v,vtres,cont);
    writeln('Inciso C');
  incisoD(vtres,cont);
    writeln('Inciso D');
  incisoEF(vtres,cont);
    writeln('Inciso EF');
end.

 
