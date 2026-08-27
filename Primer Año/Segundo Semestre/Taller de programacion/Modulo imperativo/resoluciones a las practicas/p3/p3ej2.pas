{a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto (entre 1 y 100), fecha (dia, mes, año) y cantidad de
unidades vendidas. Finalizar con el código de producto 0. Un producto puede estar en más de
una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.
iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto. Nota: No repetir información!!!
Nota: El módulo debe retornar TRES árboles.
b. Implemente un módulo que reciba el árbol generado en i. y una fecha (día, mes y año) y
retorne la cantidad total de productos vendidos en la fecha recibida.
c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.
d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas.
}
program p3ej2;
type
  rangocod=0..100;
  rangodia=1..31;
  rangomes=1..12;
  rangoano=1..2026;
  fe= record
   dia:rangodia;
   mes:rangomes;
   ano:rangoano;
 end;
 //////////////////////////////////////////////////////////////// DECLARACION DE REGISTROS ///////////////////////////////////////////////////////////////
    fecha= record
     f:fe;
  end;

  prodA = record
    fec:fe;
    codigo:rangocod;
    cantVendida:integer;
 end;
 prodB = record
   codigo:rangocod;
   cantVendida:integer;
 end;
 
 lista = ^nodo;
  nodo = record
  dato:integer;
  sig:lista;
end;

 
 prodC = record
   codigo: rangocod;
   cantVendida:integer;
   l:lista;
 end;
 
 ///////////////////////////////////////////////////////////////// DECLARACION DE ARBOLES ////////////////////////////////////////////////
  arbol = ^nodoA;
  nodoA = record
    dato:prodA;
    hi:arbol; hd:arbol;
  end;

  arbolB = ^nodoB;
  nodoB = record
    dato:prodB;
    hi:arbolB; hd:arbolB;
  end;

  arbolC = ^nodoC;
  nodoC= record
  dato: prodC;
  hi:arbolC; hd:arbolC;	
end;
procedure leerA(var p:prodA);
begin
  writeln('Ingrese un codigo');
  readln(p.codigo);
  if(p.codigo<>0) then begin
    writeln('Ingrese un dia');
    readln(p.fec.dia);
    writeln('Ingrese un mes');
    readln(p.fec.mes);
    writeln('Ingrese un ano');
    readln(p.fec.ano);
    writeln('Ingrese la cantidad de ventas');
    readln(p.cantVendida);
 end;
 end;
 // i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto. Los códigos repetidos van a la derecha. 
 
 ///////////////////////////////////////////// INCISO I //////////////////////////////////////////////////////////////////////////////////////////
 procedure cargar(var a:arbol; p:prodA);
 begin
   if(a=nil) then begin
     new(a);
     a^.dato:=p;
     a^.hi:=nil;
     a^.hd:=nil;
   end
   else
     if(p.codigo < a^.dato.codigo) then 
      cargar(a^.hi,p)
  else
    cargar(a^.hd,p);
 end;
 
 procedure generarArb(var a:arbol);
 var
   p:prodA;
 begin
   a:=nil;
   leerA(p);
   while(p.codigo<>0) do begin
     cargar(a,p);
     leerA(p);
   end;
 end;
 
 /////////////////////////////////////////////////////////////////// INCISO II //////////////////////////////////////////////////////////////////////////////////////////
 //ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
 // código de producto. Cada nodo del árbol debe contener el código de producto y la cantidad total de unidades vendidas.
 
procedure leerB(var p:prodb);
begin
  writeln('Ingrese un codigo');
  readln(p.codigo);
  if(p.codigo<>0) then begin
    writeln('Ingrese la cantidad de unidades vendidas');
    readln(p.cantVendida);
  end;
end;

procedure cargarB(var ab:arbolB; p:prodB);
begin
  if(ab=nil) then begin
    new(ab);
    ab^.dato:=p;
    ab^.hi:=nil;
    ab^.hd:=nil;
  end
 else
   if(p.codigo < ab^.dato.codigo) then
     cargarB(ab^.hi,p)
 else
   if(p.codigo > ab^.dato.codigo) then
   cargarB(ab^.hd,p)
 else
   ab^.dato.cantVendida:= ab^.dato.cantVendida + p.cantVendida;
end;
procedure generarArbolB(var ab:arbolB);
var
  p:prodB;
begin
  ab:=nil;
  leerB(p);
  while(p.codigo<>0) do begin
    cargarB(ab,p);
    leerB(p);
  end;
end;

 /////////////////////////////////////////////////////////////////// INCISO III //////////////////////////////////////////////////////////////////////////////////////////
// iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
// las ventas realizadas del producto.

procedure leerC(var p:prodC);
begin
  writeln('Ingrese un codigo de 0 a 100');
  readln(p.codigo);
  if(p.codigo<>0) then begin
    writeln('Ingrese la cantidad vendida');
    readln(p.cantvendida);
end;
end;

procedure agregaradelante(var l:lista; num:integer);
var
  aux:lista;
begin
  new(aux); aux^.dato:=num; aux^.sig:=l; l:=aux;
end;

procedure cargarC(var ac:arbolc; p:prodC);
begin
  if(ac=nil) then begin
    new(ac); ac^.hd:=nil; ac^.hi:=nil;
    agregaradelante(ac^.dato.l,p.cantVendida); ac^.dato.codigo:=p.codigo;
  end
  else
    if(p.codigo < ac^.dato.codigo) then
      cargarC(ac^.hi, p)
 else
   if(p.codigo > ac^.dato.codigo) then
     cargarC(ac^.hd,p)
 else
   agregaradelante(ac^.dato.l,p.cantVendida);
 end;
 
procedure  generarArbolC(var ac:arbolc);
var
  p:prodC;
begin
  ac:=nil;
  leerC(p);
  while(p.codigo<>0) do begin
    cargarC(ac,p);
    leerC(p);
 end;
end;

// b. Implemente un módulo que reciba el árbol generado en i. y una fecha (día, mes y año) y
//  retorne la cantidad total de productos vendidos en la fecha recibida.

procedure leerFecha(var f:fecha);
begin
  writeln('Ingrese un dia');
  readln(f.f.dia);
  writeln('Ingrese un mes');
  readln(f.f.mes);
  writeln('Ingrese un ano');
  readln(f.f.ano);
end;

function buscarEnFecha(a:arbol; f:fecha): integer;
var
  cant:integer;
begin
  cant:=0;
  if(a<>nil) then begin
    buscarEnFecha(a^.hi,f);
    if(a^.dato.fec.dia = f.f.dia) and (a^.dato.fec.mes = f.f.mes) and (a^.dato.fec.ano = f.f.ano) then
      cant:= cant + a^.dato.cantVendida;
   buscarEnFecha(a^.hd,f);
 end;
 buscarEnFecha:=cant;
end;

procedure buscar(a:arbol);
var
  f:fecha;
begin
   leerFecha(f);
   writeln('Hay ' , buscarEnFecha(a,f) , ' productos vendidos en la fecha indicada');
 end;
 
// c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto con mayor cantidad total de unidades vendidas.

procedure incisoC(ab:arbolb; var codmax,maxtotal:integer);
begin
  if(ab<>nil) then begin
    if(ab^.dato.cantVendida > maxTotal) then begin
       codMax:=ab^.dato.codigo;
      maxTotal:=ab^.dato.cantVendida;
    end;
    incisoC(ab^.hi,codmax,maxtotal);
    incisoC(ab^.hd,codmax,maxtotal);
end;
end;

procedure maxVentas(ab:arbolb);
var
  codmax,maxtotal:integer;
begin
  codmax:=0;
  maxtotal:=0;
  incisoC(ab,codmax,maxtotal);
  writeln('El codigo del arbol con mas ventas es: ', codmax , ' con ' , maxtotal ,' ventas');
end;
//////////////////////////////////////////////////////////////////////////////////////////////////////// INCISO d //////////////////////////////////////////////////

function contar (l:lista): integer;
begin
  if(l<>nil)then
    contar:= 1 + contar(l^.sig)
  else
    contar:=0;
end;

procedure comparar(ac:arbolc; var codigo,maxventas:integer);
var
 aux:integer;
begin
  aux:=contar(ac^.dato.l);
  if(aux>maxventas) then begin
    maxventas:=aux;
    codigo:=ac^.dato.codigo;
  end;
end;

procedure incisoD(ac:arbolc; var codmax,maxtotal:integer);
begin
  if(ac<>nil) then begin
    comparar(ac,codmax,maxTotal);
  incisoD(ac^.hd,codmax,maxtotal);
  incisoD(ac^.hi,codmax,maxtotal);
  end;
end;
 
procedure comp(ac:arbolc);
var
  codmax,maxtotal:integer;
begin
  codmax:=0;
  maxtotal:=0;
  incisod(ac,codmax,maxtotal);
  writeln('El codigo del producto con mas nodos de ventas es: ', codmax);
end;
  
/////////////////////////////////////////////// PROGRAMA PRINCIPAL /////////////////////////////////////////////
 var
   a:arbol;
   ab:arbolb;
   ac:arbolc;
 begin
   generarArb(a);
   writeln('Arbol A cargado');
   writeln(' --------------------------------------------------------------------------------------------------- ');
   generarArbolB(ab);
   writeln('Arbol B cargado');
     writeln(' --------------------------------------------------------------------------------------------------- ');
   generarArbolC(ac);
   writeln('Arbol C cargado');
   buscar(a);
    writeln(' --------------------------------------------------------------------------------------------------- ');
   maxVentas(ab);
    writeln(' --------------------------------------------------------------------------------------------------- ');
    comp(ac);
end.
