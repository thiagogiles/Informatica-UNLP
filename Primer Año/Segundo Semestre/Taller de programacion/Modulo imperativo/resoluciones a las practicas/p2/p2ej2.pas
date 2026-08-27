{2.- Escribir un programa que: 
a. Implemente un módulo recursivo que genere y retorne una lista de números enteros  “random” en el rango 200-230. Finalizar con el número 200. 

b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el  mismo orden que están almacenados. 

c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en orden inverso al que están almacenados. 

d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo valor de la lista.  

e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva  verdadero si dicho valor se encuentra en la lista o falso en caso contrario. }
program p2ej2;
type
 lista = ^nodo;
   nodo=record
   dato:integer;
   sig:lista;
 end;

procedure agregarAdelante(var l:lista; d:integer);
var
  aux:lista;
begin
  new(aux);
  aux^.dato:=d;
  aux^.sig:=l;
  l:=aux;
end;

procedure cargarLista(var l:lista); // INCISO A
var
  num:integer;
begin
  num:=random(31) +200;
  if(num<>200) then begin
    agregaradelante(l,num);
    cargarLista(l);
    end
  else 
    agregarAdelante(l,num);
  end;


procedure imprimirLista(l:lista); // INCISO B
begin
  if(l<>nil) then begin
    writeln(l^.dato);
    imprimirLista(l^.sig);
  end;
end;

procedure incisoC(l:lista);
begin
  if(l<>nil) then begin
    incisoC(l^.sig);
    writeln(l^.dato);
  end;
end;

procedure incisoD(l:lista; var min:integer);
begin
  if(l<>nil) then begin
    if(l^.dato<min) then
      min:=l^.dato;
    incisoD(l^.sig,min);
end;
end;

function incisoE(l:lista; val:integer): boolean;
begin
  if(l=nil) then
    incisoE:=false
  else if(l^.dato=val) then 
    incisoE:=true
  else
    incisoE:=incisoE(l^.sig,val);
end;


var
  l:lista;
  min,val:integer;
begin
  l:=nil;
  randomize;
  cargarLista(l);
  imprimirLista(l);
  incisoC(l);
  min:=9999;
  incisoD(l,min);
  writeln('El dato menor es: ', min);
  writeln('Ingrese el valor a buscar');
  readln(val);
  if incisoE(l,val) then 
    writeln('Se encontro el valor buscado')
  else
    writeln('El valor buscado no se encuentra en la lista');
end.
  
