{Una empresa gastronómica requiere el procesamiento de las entregas de comida realizadas a sus clientes durante el mes de mayo de 2025.  

a) Implementar un módulo que lea entregas de comidas. De cada compra se lee código de comida, código de cliente, día y categoría de la entrega (de 1 a 5).
 La lectura finaliza con el código de cliente 0. Se sugiere utilizar el módulo leerEntrega(). Se deben retornar 2 estructuras de datos:  

i. Un árbol binario de búsqueda ordenado por código de comida. Para cada código de comida deben almacenarse las entregas realizadas a ese código.  

ii. Un vector que almacene, para cada categoría, la cantidad de entregas realizadas.  

b) Implementar un módulo que reciba el árbol generado en a)i y dos códigos de comida y un valor entero. El módulo debe retornar la cantidad de entregas realizadas al cliente con código
 igual al valor ingresado para comidas con códigos entre los dos códigos ingresados (sin incluir).  

c) Implementar un módulo recursivo que reciba el vector generado en a)ii y un valor entero. El módulo debe retornar si existe o no una categoría con cantidad de entregas igual al valor ingresado.
}
program TurnoN2025;

type
  rangodia=1..31;
  rangoentrega=1..5;
 datolista = record
   cliente:integer;
    dia:rangodia;
    entrega:rangoentrega;
end;
  compra= record
    comida:integer;
    dl:datolista
 end;
  
  vector = array [rangoentrega] of integer;
  lista = ^nodoA;
    nodoA=record
      dato:datolista;
      sig:lista;
    end;
  datoarbol= record
    comida:integer;
    l:lista;
  end;
 arbol = ^nodo;
   nodo=record
     dato:datoarbol;
     hi:arbol; hd:arbol;
   end;
 
procedure inicializarVector(var v:vector);
var
  i:rangoentrega;
begin
  for i:= 1 to 5 do 
    v[i]:=0;
  end;
  
procedure leerCompra(var c:compra);
begin
 writeln('Ingrese el codigo de cliente');
 readln(c.dl.cliente);
 if(c.dl.cliente<>0) then begin
   writeln('Ingrese el codigo de comida');
   readln(c.comida);
   writeln('Ingrese el dia');
   readln(c.dl.dia);
   writeln('Ingrese el codigo de entrega');
   readln(c.dl.entrega);
 end;
end;

procedure agregarAdelante(var l:lista; dl:datolista);
var 
  aux:lista;
begin
  new(aux); aux^.dato:=dl; aux^.sig:=l; l:=aux;
end;
procedure iniciar(var d:datoarbol; c:compra);
begin
  d.comida:=c.comida;
  d.l:=nil;
  agregarAdelante(d.l,c.dl);
end;
procedure cargarArbol(var a:arbol; c:compra);
begin
  if(a=nil) then begin
    new(a);
    iniciar(a^.dato,c);
    a^.hi:=nil; a^.hd:=nil;
  end
  else if(c.comida < a^.dato.comida) then
    cargarArbol(a^.hi,c)
  else if(c.comida > a^.dato.comida) then
    cargarArbol(a^.hd,c)
   else
     agregarAdelante(a^.dato.l,c.dl)
end;

procedure generar(var v:vector; var a:arbol);
var
  c:compra;
begin
  a:=nil;
  inicializarVector(v);
  leerCompra(c);
  while(c.dl.cliente<>0) do begin
    cargarArbol(a,c);
    v[c.dl.entrega]:=v[c.dl.entrega] + 1;
    leerCompra(c);
  end;
end;

////////////////// INCISO B ////////////////////
//b) Implementar un módulo que reciba el árbol generado en a)i y dos códigos de comida y un valor entero. El módulo debe retornar la cantidad de entregas realizadas al cliente con código
 //igual al valor ingresado para comidas con códigos entre los dos códigos ingresados (sin incluir).  

function lis(l:lista; val:integer):integer;
var
  cant:integer;
begin
  cant:=0;
  while(l<>nil) do begin
    if(l^.dato.cliente = val) then
      cant:=cant + 1;
    l:=l^.sig;
  end;
  lis:=cant;
end;
function contar(a:arbol; sup,inf,val:integer):integer;
begin
  if(a=nil) then
    contar:=0
  else begin
    if(a^.dato.comida > inf) and (a^.dato.comida < sup) then
      contar:= lis(a^.dato.l,val) + contar(a^.hi,sup,inf,val) + contar(a^.hd,sup,inf,val)
    else if(a^.dato.comida <= inf) then
      contar:= contar (a^.hd,sup,inf,val)
    else
      contar:= contar(a^.hi,sup,inf,val)
   end;
end;

function cantEntregas(a:arbol):integer;
var
  sup,inf,val:integer;
begin
  writeln('Limite superior'); readln(sup);
  writeln('Limite inferior'); readln(inf);
  writeln('Valor a buscar'); readln(val);
  cantEntregas:=contar(a,sup,inf,val);
end;

///////////////// INCISO C ////////////////////////////////
//c) Implementar un módulo recursivo que reciba el vector generado en a)ii y un valor entero. El módulo debe retornar si existe o no una categoría con cantidad de entregas igual al valor ingresado.

function Vec(v:vector; i,val:integer):boolean;
begin
  if(i > 5) and (not vec) then
    vec:=false
  else begin
    if(v[i] = val) then
      vec:=true;
    vec:=vec(v,i + 1,val);
 end;
end;
function existe(v:vector):boolean;
var
  val,i:integer;
begin
  writeln('Ingrese el valor a buscar'); readln(val);
  i:=1;
  existe:=Vec(v,i,val);
end;
////////////// PROGRAMA PRINCIPAL ////////////////

var
  a:arbol;
  v:vector;
begin
  generar(v,a); writeln('Arbol y vector generados');
  writeln(cantEntregas(a), ' para los valores ingresados');
  if(existe(v)) then writeln(' Existe ese valor en el vector') else writeln('No existe ese valor en el vector');
end.
