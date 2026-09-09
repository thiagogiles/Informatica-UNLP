{La fiesta nacional de la empanada artesanal necesita un sistema para obtener estadísticas sobre los tipos de empanadas presentadas.

a) Implementar un módulo que lea información de las empanadas. De cada empanada se conoce: categoría de empanada (1..10), DNI del chef, materia prima principal y forma de cocción. 
La lectura finaliza con DNI del chef 0. Se sugiere utilizar el módulo leerEmpanada(). El módulo deber retornar dos estructuras:

i. Un árbol binario de búsqueda ordenado por el DNI del chef. Para cada DNI debe almacenarse la cantidad de empanadas correspondientes a dicho chef.

ii. Una lista que almacene en cada nodo el nombre de la materia prima principal y la cantidad total de empanadas con esa materia prima. Esta estructura debe quedar ordenada por el nombre de 
materia prima.

b) Implementar un módulo que reciba el árbol generado en a)i., y un DNI. El módulo debe retornar la cantidad de chefs menor al DNI ingresado.

c) Implementar un módulo recursivo que reciba la lista generada en a)ii, y retorne el nombre de la materia prima con mayor cantidad de empanadas.
}

program TurnoH_2026;

type
  rangocategoria=1..10;
  
  empanada=record
    categoria:rangocategoria;
    dni:integer;
    materia:string;
    forma:string;
  end;
  
  datoarbol= record
    dni:integer;
    cantEmpanadas:integer;
 end;
 
 datolista = record
   materia:string;
   total:integer;
end;
 lista = ^nodo;
   nodo=record
     dato:datolista;
     sig:lista;
  end;
  
  arbol= ^nodoA;
    nodoA=record
      dato:datoarbol;
      hi:arbol; hd:arbol;
    end;
    
procedure leerEmpanada(var e:empanada);
begin
  writeln('Ingrese el dni del chef');
  readln(e.dni);
  if(e.dni<>0) then begin
    writeln('Ingrese la categoria');
    readln(e.categoria);
    writeln('Ingrese la materia prima principal');
    readln(e.materia);
    writeln('Ingrese la forma de coccion');
    readln(e.forma);
 end;
end;

procedure iniciar(var d:datoarbol; e:empanada);
begin
  d.dni:=e.dni;
  d.cantEmpanadas:=1;
end;
procedure cargarArbol(var a:arbol; e:empanada);
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
    a^.dato.cantEmpanadas:= a^.dato.cantEmpanadas + 1;
end;

procedure agregarOrdenado(var l:lista; dl:datolista);
var
  aux,ant,act:lista;
begin
  new(aux); aux^.dato:=dl;
  ant:=l; act:=l;
  while(act<>nil) and (act^.dato.materia < dl.materia) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(act=l) then
    l:=aux
  else
    ant^.sig:=aux;
  aux^.sig:=act;
end;

procedure crearReg(var l:lista; e:empanada);
var
  dl:datolista;
begin
  dl.materia:=e.materia;
  dl.total:=1;
  agregarOrdenado(l,dl);
end;
procedure actu(var l:lista; e:empanada);
var
  aux:lista;
begin
  aux:=l;
  while(aux<>nil) and (aux^.dato.materia <> e.materia) do
    aux:=aux^.sig;
  if(aux=nil) then 
    crearReg(l,e)
  else
    aux^.dato.total:= aux^.dato.total + 1;
end;
procedure generar(var a:arbol; var l:lista);
var
  e:empanada;
begin
  a:=nil;
  l:=nil;
  leerEmpanada(e);
  while(e.dni<>0) do begin
    cargarArbol(a,e);
    actu(l,e);
    leerEmpanada(e);
 end;
 end;
 
//////////////////////// INCISO B /////////////////////////////////
//b) Implementar un módulo que reciba el árbol generado en a)i., y un DNI. El módulo debe retornar la cantidad de chefs menor al DNI ingresado.

function contarChefs(a:arbol; val:integer):integer;
begin
  if(a=nil) then
    contarChefs:=0
  else begin
    if(a^.dato.dni < val) then
      contarChefs:= 1 + contarChefs(a^.hi,val) + contarChefs(a^.hd,val)
   else 
     contarChefs:= contarChefs(a^.hi,val)
 end;
end;

function totalChefs(a:arbol):integer;
var
  val:integer;
begin
  writeln('Ingrese un dni a buscar'); readln(val);
  totalChefs:=contarChefs(a,val);
end;

//////////////// INCISO C ////////////////////////////
//c) Implementar un módulo recursivo que reciba la lista generada en a)ii, y retorne el nombre de la materia prima con mayor cantidad de empanadas

procedure buscarMayor(l:lista; var max:integer; var mayor:string);
begin
  if(l<>nil) then begin
    if(l^.dato.total > max) then begin
      max:=l^.dato.total;
      mayor:=l^.dato.materia;
    end;
   buscarMayor(l^.sig,max,mayor);
 end;
end;

function materiaMayor(l:lista):string;
var
  max:integer;
  mayor:string;
begin
  max:=0; 
  buscarMayor(l,max,mayor);
  materiaMayor:= mayor;
end;  
//////////////////// PROGRAMA PRINCIPAL /////////////////////
var
  a:arbol;
  l:lista;
begin
  generar(a,l); writeln('Arbol y lista generados');
  writeln(totalChefs(a) , ' chefs con el dni menor a ese');
  writeln(materiaMayor(l) , ' es la materia prima con mayor cantidad de empanadas');  
end.
