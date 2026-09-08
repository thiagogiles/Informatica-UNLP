{Una empresa de delivery requiere el procesamiento de sus entregas durante el mes de julio de 2026.

a) Implementar un módulo que lea las entregas. De cada entrega se lee código de entrega, DNI de cliente, día y categoría de la entrega (de 1 a 10). La lectura finaliza con el DNI de cliente 0. 
Se sugiere utilizar el módulo leerEntrega(). Se deben retornar 2 estructuras de datos:

i. Un árbol binario de búsqueda ordenado por DNI del cliente. Para cada cliente deben almacenarse las entregas que le fueron realizadas.

ii. Un vector que almacena la cantidad de entregas por categoría.

b) Implementar un módulo que reciba el árbol generado en a)i y dos DNI. El módulo debe retornar la cantidad total de entregas que fueron realizadas a los clientes que se encuentren entre ambos 
DNI (inclusive).

c) Implementar un módulo recursivo que reciba el vector generado en a)ii, un valor entero y retorne si existe (o no) una categoría con cantidad de entregas igual al valor recibido.
}
program Turno_G2026;

type
  rangocategoria=1..10;
  rangodia=1..31;
  datolista = record
    codigo:integer;
    dia:rangodia;
    categoria:rangocategoria;
  end;
  entrega = record
    dni:integer;
    dl:datolista;
  end;
  
  lista = ^nodoA;
    nodoA=record
      dato:datolista;
      sig:lista;
   end;
datoarbol=record
  dni:integer;
  l:lista;
end;  
  arbol = ^nodo;
  nodo=record
    dato:datoarbol;
    hi:arbol; hd:arbol;
 end;
 
 vector = array [rangocategoria] of integer;
procedure leerEntrega(var e:entrega);
begin
  writeln('Ingrese el dni');
  readln(e.dni);
  if(e.dni<>0) then begin
    writeln('Ingrese el codigo de cliente');
    readln(e.dl.codigo);
    writeln('Ingrese el dia');
    readln(e.dl.dia);
    writeln('Ingrese la categoria');
    readln(e.dl.categoria);
 end;
end;

procedure inicializarVector(var v:vector);
var
  i:integer;
begin
  for i:= 1 to 10 do
    v[i]:=0;
  end;
  
procedure agregarAdelante(var l:lista; dl:datolista);
var
  aux:lista;
begin
  new(aux); aux^.dato:=dl; aux^.sig:=l; l:=aux;
end;

procedure iniciar(var d:datoarbol; e:entrega);
begin
  d.dni:=e.dni;
  d.l:=nil;
  agregarAdelante(d.l,e.dl);
end;
procedure cargarArbol(var a:arbol; e:entrega);
begin
  if(a=nil) then begin
    new(a);
    iniciar(a^.dato,e);
    a^.hi:=nil; a^.hd:=nil;
  end
  else if(e.dni < a^.dato.dni) then
    cargarArbol(a^.hi,e)
  else if(e.dni > a^.dato.dni) then
    cargarArbol(a^.hd,e)
  else
    agregarAdelante(a^.dato.l,e.dl)
 end;

procedure generar(var a:arbol; var v:vector);
var
  e:entrega;
begin
  a:=nil;
  inicializarVector(v);
  leerEntrega(e);
  while(e.dni<>0) do begin
    cargarArbol(a,e);
    v[e.dl.categoria]:=v[e.dl.categoria] + 1;
    leerEntrega(e);
  end;
end;

///////////// INCISO B /////////////////////
// Implementar un módulo que reciba el árbol generado en a)i y dos DNI. El módulo debe retornar la cantidad total de entregas que fueron realizadas a los clientes que se encuentren entre ambos 
// DNI (inclusive).

function lis(l:lista):integer;
var
  cant:integer;
begin
  cant:=0;
  while(l<>nil) do begin
    cant:=cant + 1;
    l:=l^.sig;
  end;
  lis:=cant;
end;

function cont(a:arbol; sup,inf:integer):integer;
begin
  if(a=nil) then
    cont:=0
  else begin
    if(a^.dato.dni >= inf) and (a^.dato.dni <= sup) then
      cont:= lis(a^.dato.l) + cont(a^.hi,sup,inf) + cont(a^.hd,sup,inf)
    else if(a^.dato.dni < inf) then
      cont:= cont(a^.hd,sup,inf)
    else
      cont:= cont(a^.hi,sup,inf)
   end;
end;
function totalEntregas(a:arbol):integer;
var
  sup,inf:integer;
begin
  writeln('Ingrese el primer dni'); readln(sup);
  writeln('Ingrese el segundo dni mas chico'); readln(inf);
  totalEntregas:=cont(a,sup,inf);
end;

///////////////// INCISO C //////////////////////////////
//Implementar un módulo recursivo que reciba el vector generado en a)ii, un valor entero y retorne si existe (o no) una categoría con cantidad de entregas igual al valor recibido

function recorrerVec(v:vector; i,valor:integer):boolean;
begin
  if(i> 10) or (not recorrerVec) then
    recorrerVec:=false
  else begin
    if(v[i] = valor) then
      recorrerVec:=true;
    recorrerVec(v,i+1,valor)
end;
end;   
function existe(v:vector):boolean;
var
  valor,i:integer;
begin
  writeln('Ingrese el valor a buscar'); readln(valor);
  i:=1;
  existe:=recorrerVec(v,i,valor);
end;
//////////////// PROGRAMA PRINCIPAL //////////////////////
var
  a:arbol;
  v:vector;
begin
  generar(a,v); writeln('Arbol y vector generados');
  writeln(totalEntregas(a), ' entregas para ese rango de dnis');
  if(existe(v)) then writeln('El valor existe en el vector') else writeln('El valor no existe en el vector');
end.
