{PlayStation Store requiere procesar las compras realizadas por sus clientes durante el año 
2025. Implementar un programa que implemente e invoque los siguientes módulos:  
a) Implementar un módulo que lea compras de videojuegos. De cada compra se lee 
código del videojuego, código de cliente y mes. La lectura finaliza con el código de 
cliente 0 (se sugiere utilizar el módulo para leer una compra, el cual se especifica más 
abajo) y se debe retornar un árbol binario de búsqueda ordenado por código de 
videojuego. En el árbol, para cada código de videojuego debe almacenarse una lista 
con código de cliente y mes perteneciente a cada compra.  
b) Implementar un módulo que reciba el árbol generado en el inciso a) y un código de 
videojuego. Este módulo debe retornar la lista de las compras de ese videojuego. 
c) Implementar un módulo recursivo que reciba la lista generada en el inciso b) y un mes. 
El módulo debe retornar la cantidad de clientes que compraron en el mes ingresado. 
}
program p5ej3;

type
  meses=1..12;
  compra =record
    juego:integer;
    cliente:integer;
    mes:meses;
  end;
  
  compraLista = record
    cliente:integer;
    mes:meses;
  end;
   lista= ^nodo;
   nodo=record
     dato:compraLista;
     sig:lista;
   end;
 compraArbol = record
   juego:integer;
   l:lista;
end;

 arbol =  ^nodoA;
   nodoA=record
     dato:compraArbol;
     hi:arbol; hd:arbol;
   end;
   
 procedure leerCompra(var c:compra);
 begin
   writeln('ingrese el cliente');
   readln(c.cliente);
   if(c.cliente <> 0 )then begin
     writeln('Ingrese el mes');
     readln(c.mes);
     writeln('Ingrese el codigo de juego');
     readln(c.juego);
   end;
 end;
 
 procedure agregarAdelante(var l:lista; cl:compralista);
 var
   aux:lista;
begin
  new(aux); aux^.dato:=cl; aux^.sig:=l; l:=aux;
end;

procedure actu(var a:arbol; c:compra);
var
  cl:compralista;
begin
  cl.cliente:=c.cliente;
  cl.mes:=c.mes;
  agregarAdelante(a^.dato.l,cl);
end;

 procedure iniciar(var a:arbol; c:compra);
 var
   cl:compralista;
begin
  a^.dato.juego:=c.juego;
  cl.cliente:=c.cliente;
  cl.mes:=c.mes;
  a^.dato.l:=nil;
  agregarAdelante(a^.dato.l,cl);
end;

 procedure cargarArbol(var a:arbol; c:compra);
 begin
   if(a=nil) then begin
     new(a);
     iniciar(a,c);
     a^.hi:=nil; a^.hd:=nil;
   end
  else if(c.juego < a^.dato.juego) then
    cargarArbol(a^.hi,c)
  else if(c.juego > a^.dato.juego) then
    cargarArbol(a^.hd,c)
  else
    actu(a,c);
  end;
  
 procedure generarArbol(var a:arbol);
 var
   c:compra;
 begin
   a:=nil;
   leerCompra(c);
   while(c.cliente <> 0) do begin
     cargarArbol(a,c);
     leerCompra(c);
   end;
 end;
 
////////////// INCISO B ///////////////
//b) Implementar un módulo que reciba el árbol generado en el inciso a) y un código de  videojuego. Este módulo debe retornar la lista de las compras de ese videojuego. 

function recorrer(a:arbol; juego:integer):lista;
begin
  if(a=nil) then
    recorrer:=nil
  else begin 
    if(a^.dato.juego = juego) then
      recorrer:=a^.dato.l
    else if(a^.dato.juego < juego) then
      recorrer:= recorrer(a^.hd,juego)
    else
      recorrer:=recorrer (a^.hi,juego)
    end;
  end;

function incisoB(a:arbol):lista;
var
  juego:integer;
begin
  writeln('Ingrese el codigo de juego a buscar');
  readln(juego);
  incisoB:=recorrer(a,juego);
end;

////////////////// INCISO C //////////////////
// c) Implementar un módulo recursivo que reciba la lista generada en el inciso b) y un mes. El módulo debe retornar la cantidad de clientes que compraron en el mes ingresado. 

function contar(l:lista; mes:integer):integer;
begin
  if(l=nil) then begin
    contar:=0;
  end
  else begin
    if(l^.dato.mes = mes) then
      contar:= 1 + contar(l^.sig,mes)
    else
      contar:=contar(l^.sig,mes);
end;
end;

function recorrerLista(l:lista):integer;
var
  mes:integer;
begin
  writeln('Ingrese el mes a buscar');
  readln(mes);
  recorrerLista:= contar(l,mes);
end;
 var
   a:arbol;
   puntero:lista;
 begin
   generarArbol(a);
   writeln('Arbol generado');
   puntero:=incisoB(a);
   writeln('Hay ' ,  recorrerLista(puntero)  , ' clientes que compraron en ese mes');
end.
