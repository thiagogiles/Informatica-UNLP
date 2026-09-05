{Una empresa aérea necesita un programa para procesar los pasajes vendidos en el mes de 
enero de 2026. De cada pasaje se conoce el código de vuelo, día del mes (1..31), DNI del 
pasajero, código ciudad destino y monto del pasaje. En el  programa se debe 
a) Implementar un módulo que lea pasajes, genere y retorne un árbol binario de 
búsqueda por código de ciudad destino y que almacene una lista con los pasajes 
(código de vuelo, día del mes, DNI del pasajero y monto del pasaje) correspondientes. 
La lectura finaliza con dni 0. 
b) Implementar un módulo que reciba la estructura generada en el inciso a), dos códigos 
de destino y un DNI. El módulo debe retornar la cantidad de vuelos que realizó el 
pasajero con el DNI recibido cuyo código de destino está entre los dos códigos de 
destino recibidos (no incluirlos). 
c) Implementar un módulo que reciba la estructura generada en el inciso a) y retornar el 
monto total acumulado en cada día del mes.
}
program p5ej7;

type
  rangodia=1..31;
  pasaje = record
    codigo:integer;
    dia:rangodia;
    dni:integer;
    destino:integer;
    monto:real;
 end;
 
 vector = array [rangodia] of real;
 datolista= record
   dia:rangodia;
   dni:integer;
   codigo:integer;
   monto:real;
end;
 lista = ^nodo;
   nodo=record
    dato:datolista;
    sig:lista;
 end;
 datoArbol = record
    destino:integer;
    l:lista;
 end;
 
 arbol = ^nodoA;
 nodoA= record
    dato:datoarbol;
    hi:arbol; hd:arbol;
end;

{procedure leerPasaje(var p:pasaje);
begin
  writeln('Ingrese su dni');
  readln(p.dni);
  if(p.dni<>0) then begin
    writeln('Ingrese el codigo');
    readln(p.codigo);
    writeln('Ingrese el codigo destino');
    readln(p.destino);
    writeln('Ingrese el dia');
    readln(p.dia);
    writeln('Ingrese el costo');
    readln(p.monto);
  end;
end;
}
procedure leerPasaje(var p:pasaje);
begin
  p.dni:= random(31);
  writeln(p.dni, 'dni');
  if(p.dni<>0) then begin
    p.codigo:= random(51);
    p.destino:= random(81);
    p.dia:=random(31)+ 1;
    writeln(p.dia, ' dia');
    p.monto:=random(100);
    writeln(p.monto, 'monto');
end;
end;

procedure agregarAdelante(var l:lista; dl:datolista);
var
  aux:lista;
begin
  new(aux); aux^.dato:=dl; aux^.sig:=l; l:=aux;
end;

procedure iniciar(var d:datoarbol; p:pasaje);
var
  dl:datolista;
begin
  d.destino:= p.destino;
  dl.codigo:=p.codigo;
  dl.dni:=p.dni;
  dl.dia:=p.dia;
  dl.monto:=p.monto;
  agregarAdelante(d.l,dl);
end;

procedure actu(var l:lista; p:pasaje);
var
  dl:datolista;
begin
  dl.codigo:=p.codigo;
  dl.dni:=p.dni;
  dl.dia:=p.dia;
  dl.monto:=p.monto;
  agregarAdelante(l,dl);
end;
  
procedure cargarArbol(var a:arbol; p:pasaje);
begin
  if(a=nil) then begin
    new(a);
    iniciar(a^.dato,p);
    a^.hi:=nil; a^.hd:=nil;
  end
  else if(p.destino < a^.dato.destino) then
    cargarArbol(a^.hi,p)
  else if(p.destino > a^.dato.destino) then
    cargarArbol(a^.hd,p)
  else
    actu(a^.dato.l,p)
 end;  
procedure generarArbol(var a:arbol);
var
  p:pasaje;
begin
  a:=nil;
  leerPasaje(p);
  while(p.dni<>0)  do begin
    cargarArbol(a,p);
    leerPasaje(p);
 end;
 end;
 /////////// INCISO B //////////////
 
 function contar(l:lista; dni:integer):integer;
 var
   cant:integer;
begin
  cant:=0;
  while(l<>nil) do begin
    if(l^.dato.dni = dni) then
      cant:=cant + 1;
    l:=l^.sig;
  end;
  contar:=cant;
end;

function vue(a:arbol;  sup,inf,dni:integer):integer;
begin
  if(a=nil) then
    vue:=0
  else begin
    if(a^.dato.destino < sup) and (a^.dato.destino > inf) then
      vue:= contar(a^.dato.l,dni) + vue(a^.hi,sup,inf,dni) + vue(a^.hd,sup,inf,dni)
    else if(a^.dato.destino >= sup) then
      vue:= vue(a^.hi,sup,inf,dni)
    else
      vue:= vue(a^.hd,sup,inf,dni)
    end;
  end;
function cantVuelos(a:arbol):integer;
var
  sup,inf,dni:integer;
begin
  writeln('Ingrese el limite inferior'); readln(inf);
  writeln('Ingrese el limite superior'); readln(sup);
  writeln('Ingrese el dni a buscar'); readln(dni);
  cantVuelos:= vue(a,sup,inf,dni);
end;

/////////////////// INCISO C ////////////////////////

procedure inicializarVector(var v:vector);
var 
  i:integer;
begin
  for i:=1 to 31 do 
    v[i]:=0;
  end;
  
procedure sumar(l:lista; var v:vector);
begin
  while(l<>nil) do begin
    v[l^.dato.dia] := v[l^.dato.dia] + l^.dato.monto;
    l:=l^.sig;
  end;
end;
procedure recorrerArbol(a:arbol; var v:vector);
begin
  if(a<>nil) then begin
    sumar(a^.dato.l,v);
    recorrerArbol(a^.hd,v);
    recorrerArbol(a^.hi,v);
 end;
end;
procedure cargarVector(a:arbol; var v:vector);
begin
  inicializarVector(v);
  recorrerArbol(a,v);
end;
 var
   a:arbol;
   v:vector;
   
 procedure imprimirVector(v:vector);
 var
   i:integer;
 begin
   for i:= 1 to 31 do 
     writeln(' dia ', i , ' monto ', v[i]);
   end;
 begin
   Randomize();
   generarArbol(a); writeln('Arbol generado');
   writeln(cantvuelos(a), ' vuelos para ese dni en ese rango');
   cargarVector(a,v);
   imprimirVector(v);
end.
