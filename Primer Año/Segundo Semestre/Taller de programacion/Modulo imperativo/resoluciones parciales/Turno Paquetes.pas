{Correo Argentino desea analizar la información de los paquetes enviados durante 2024. De cada paquete enviado se conoce: código de envío, DNI del emisor, DNI del receptor,
 cantidad de objetos en el paquete y peso del paquete en gramos. Realice un programa que contenga e invoque a:  

a. Un módulo que lea la información de paquetes enviados y retorne una estructura con todos los paquetes leídos. La estructura debe ser eficiente para buscar por peso del paquete en gramos. 
La lectura finaliza al leer un paquete con código de envío 0.  

b. Un módulo que reciba la estructura generada en a) y dos valores, y retorne una lista con todos los paquetes enviados cuyo peso está entre los dos valores recibidos.  

c. Un módulo que reciba la estructura generada en a) y retorne toda la información del paquete enviado con mayor cantidad de objetos.
}
program Turno_correo;

type

  paquete= record
    cod:integer;
    emisor:integer;
    receptor:integer;
    objetos:integer;
    peso:real;
  end;
  
  lista = ^nodo;
    nodo=record
    dato:paquete;
    sig:lista;
  end;
  arbol = ^nodoA;
   nodoA=record
   dato:paquete;
   hi:arbol; hd:arbol;
 end;
 
 
 procedure leerPaquete(var p:paquete);
 begin
   writeln('Ingrese el codigo de envio');
   readln(p.cod);
   if(p.cod<>0) then begin
     writeln('Ingrese el dni del emisor');
     readln(p.emisor);
     writeln('Ingrese el dni del receptor');
     readln(p.receptor);
     writeln('Ingrese la cantidad de objetos');
     readln(p.objetos);
     writeln('Ingrese el peso en gramos');
     readln(p.peso);
   end;
end;

procedure cargarArbol(var a:arbol; p:paquete);
begin
  if(a=nil) then begin
    new(a);
    a^.dato:=p;
    a^.hi:=nil; a^.hd:=nil;
  end
  else if(p.peso < a^.dato.peso) then
    cargarArbol(a^.hi,p)
  else 
    cargarArbol(a^.hd,p)
end;
procedure generarArbol(var a:arbol);
var
  p:paquete;
begin
  a:=nil;
  leerPaquete(p);
  while(p.cod<>0) do begin
    cargarArbol(a,p);
    leerPaquete(p);
 end;
 end;
 
 ////// INCISO B ///////////
 // b. Un módulo que reciba la estructura generada en a) y dos valores, y retorne una lista con todos los paquetes enviados cuyo peso está entre los dos valores recibidos.  
 procedure agregarAdelante(var l:lista; p:paquete);
 var
   aux:lista;
 begin
   new(aux); aux^.dato:=p; aux^.sig:=l; l:=aux;
 end;
 procedure recorrerArbol(a:arbol; var l:lista; inf,sup:real);
 begin
   if(a<>nil) then begin
     if(a^.dato.peso > inf) and (a^.dato.peso < sup) then begin
       agregarAdelante(l,a^.dato);
       recorrerArbol(a^.hi,l,inf,sup);
       recorrerArbol(a^.hd,l,inf,sup);
     end
     else if(a^.dato.peso <= inf) then
       recorrerArbol(a^.hd,l,inf,sup)
     else 
       recorrerArbol(a^.hi,l,inf,sup)
 end;
 end;
 procedure generarLista(a:arbol; var l:lista);
 var
   sup,inf:real;
begin
  l:=nil;
  writeln('Ingrese el limite superior'); readln(sup);
  writeln('Ingrese el limite inferior'); readln(inf);
  recorrerArbol(a,l,inf,sup);
end;


///////////// INCISO C //////////////
// c. Un módulo que reciba la estructura generada en a) y retorne toda la información del paquete enviado con mayor cantidad de objetos.

procedure imprimirPmax(pmax:paquete);
begin
  writeln('codigo', pmax.cod);
  writeln('emisor', pmax.emisor);
  writeln('receptor', pmax.receptor);
  writeln('objetos', pmax.objetos);
  writeln('peso', pmax.peso);
end;

procedure actu(p:paquete; var pmax:paquete; var max:integer);
begin
  if(p.objetos > max) then begin
    max:=p.objetos;
    pmax:=p;
  end;
end;

procedure paqMayor(a:arbol; var pmax:paquete; var max:integer);
begin
  if(a<>nil) then begin
    actu(a^.dato,pmax,max);
    paqMayor(a^.hi,pmax,max);
    paqMayor(a^.hd,pmax,max);
 end;
end;
procedure mayor(a:arbol);
var
  pmax:paquete;
  max:integer;
begin
  max:=0;
  paqMayor(a,pmax,max);
  imprimirPmax(pmax);
end;
/////////// PROGRAMA PRINCIPAL ///////////////
 var
   a:arbol;
   l:lista;
begin
  generarArbol(a); writeln('Arbol generado');
  generarLista(a,l); writeln('Lista generada');
  Mayor(a);
end.
