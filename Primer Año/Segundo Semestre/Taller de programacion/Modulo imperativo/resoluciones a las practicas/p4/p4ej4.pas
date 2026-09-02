{ Una empresa de alquiler de bicicletas desea procesar la información de los alquileres 
realizados durante un mes. De cada alquiler se conoce: código de bicicleta, número d
cliente, día del alquiler, cantidad de horas alquiladas e importe abonado. La lectura de los 
alquileres finaliza cuando se ingresa el código de bicicleta 0. 
Implementar un programa que invoque a los siguientes módulos y  compruebe el correcto 
funcionamiento del mismo. 
a. Un módulo que lea los alquileres y genere dos estructuras de datos, ambas eficientes 
para la búsqueda por código de bicicleta: 
i. En la primera estructura, cada alquiler debe almacenarse en un nodo diferente del 
árbol. Si se ingresa nuevamente un alquiler para una bicicleta cuyo código ya se 
encuentra en el árbol, el nuevo alquiler deberá insertarse a la derecha. 
ii. En la segunda estructura, cada nodo debe contener un código de bicicleta una sola 
vez y una lista con todos los alquileres realizados para dicha bicicleta. 
Nota: Prestar especial atención a los datos que se almacenan en cada estructura para 
evitar repetir información innecesariamente. 
b. Un módulo recursivo que reciba la estructura generada en i) y retorne el código de 
bicicleta más grande. 
c. Un módulo recursivo que reciba la estructura generada en ii) y retorne el código de 
bicicleta más pequeño. 
d. Un módulo recursivo que reciba la estructura generada en i) y un número de cliente. 
Debe retornar la cantidad de alquileres realizados por dicho cliente. 
e. Un módulo recursivo que reciba la estructura generada en ii) y un número de cliente. 
Debe retornar la cantidad de alquileres realizados por dicho cliente. 
f. 
Un módulo que reciba la estructura generada en i) y genere una nueva estructura 
ordenada por código de bicicleta, donde cada código aparezca una única vez junto con 
la cantidad total de horas alquiladas. 
g. Un módulo que reciba la estructura generada en ii) y genere una nueva estructura 
ordenada por código de bicicleta, donde cada código aparezca una única vez junto con 
la cantidad total de horas alquiladas. 
h. Un módulo recursivo que reciba la estructura generada en g) y muestre su contenido. 
i. 
Un módulo recursivo que reciba la estructura generada en i) y dos códigos de bicicleta. 
Debe retornar el importe total recaudado por los alquileres de las bicicletas cuyos 
códigos se encuentren comprendidos entre los dos valores recibidos, inclusive. 
j. 
Un módulo recursivo que reciba la estructura generada en ii) y dos códigos de bicicleta. 
Debe retornar el importe total recaudado por los alquileres de las bicicletas cuyos 
códigos se encuentren comprendidos entre los dos valores recibidos, inclusive. 

}

program p4ej4;
type

alquilerC = record
  cod:integer;
  totalHoras:integer;
end;

arbolC = ^nodoC;
  nodoC = record
    dato:alquilerC;
    hi:arbolC; hd:arbolC;
  end;
  
alquilerLista = record
 num:integer;
  dia:integer;
  cantHoras:integer;
  abonado:real;
end;

lista = ^nodo;
  nodo=record
    dato:alquilerLista;
    sig:lista;
  end;
  
alquilerB = record
  cod:integer;
  l:lista;
end;


alquiler = record
  cod:integer;
  a:alquilerLista;
end;


arbolA = ^nodoA;
  nodoA=record
    dato:alquiler;
    hd:arbolA; hi:arbolA;
  end;
  
arbolB = ^nodoB;
  nodoB = record
    dato:alquilerB;
    hi:arbolB; hd:arbolB;
 end;
 
 arbolD = ^nodoD;
  nodoD= record
    dato:alquilerC;
    hd:arbolD; hi:arbolD;
  end;
 procedure leerAlquiler(var a:alquiler);
 begin
   writeln('Ingrese el codigo de bicicleta');
   readln(a.cod);
   if(a.cod <> 0) then begin
   writeln('Ingrese el numero de cliente');
   readln(a.a.num);
   writeln('Ingrese el dia que se alquilo');
   readln(a.a.dia);
   writeln('Ingrese la cantidad de horas que se alquilo');
   readln(a.a.cantHoras);
   writeln('Ingrese el monto abonado');
   readln(a.a.abonado);
 end;
 end;
 
 procedure cargarArbolA (var arbA:arbolA; a:alquiler);
 begin
   if(arbA=nil) then begin
     new(arbA); arbA^.dato:=a; arbA^.hi:=nil; arbA^.hd:=nil;
   end
   else if(a.cod < arbA^.dato.cod) then
     cargarArbolA(arbA^.hi,a)
   else
     cargarArbolA(arbA^.hd,a)
 end;
 
procedure agregarAdelante(var l:lista; al:alquilerlista);
var
  aux:lista;
begin
  new(aux);
  aux^.dato:=al;
  aux^.sig:=l;
  l:=aux;
end; 

procedure cargarArbolB(var ab:arbolB; a:alquiler);
begin
  if(ab=nil) then begin
    new(ab); ab^.dato.l:=nil; ab^.dato.cod:= a.cod; agregarAdelante(ab^.dato.l,a.a); ab^.hi:=nil; ab^.hd:=nil;
  end
  else if(a.cod < ab^.dato.cod) then
    cargarArbolB(ab^.hi,a)
  else if (a.cod > ab^.dato.cod) then
    cargarArbolB(ab^.hd,a)
  else
    agregarAdelante(ab^.dato.l,a.a)
end;

procedure generarArbol(var arbA:arbolA; var ab:arbolB);
var
  a:alquiler;
begin
  arbA:=nil;
  ab:=nil;
  leerAlquiler(a);
  while(a.cod<>0) do begin
    cargarArbolA(arbA,a);
    cargarArbolB(ab,a);
    leerAlquiler(a);
end;
end;

////////////////// INCISO B ///////////////////////////////////
function maxArbolA(a:arbolA):integer;
begin
 if(a<>nil) then begin
  if(a^.hd =nil) then
    maxArbolA:= a^.dato.cod
else
  maxArbolA:=maxArbolA(a^.hd)
 end
else
  maxArbolA:=-1;
end;


//////////////////////////// INCISO C /////////////////////////////////
function minArbolB(ab:arbolB):integer;
begin
  if(ab<>nil) then begin
  if(ab^.hi = nil) then
    minArbolB:= ab^.dato.cod
  else
    minArbolB:= minArbolB(ab^.hi);
  end
 else
   minArbolB:=-1;
end;

///////////////////////// INCISO D ///////////////////////////////////

{procedure recorrerCliente(a:arbolA; var cant:integer; val:integer);
begin
  if(a<>nil) then begin
    if(a^.dato.a.num = val) then
      cant:=cant + 1;
    recorrerCliente(a^.hi,cant,val);
    recorrerCliente(a^.hd,cant,val);
end;
end;

function contarCliente (a:arbolA):integer;
var
  cant,val:integer;
begin
  cant:=0;
  writeln('Ingrese un codigo de cliente');
  readln(val);
  recorrerCliente(a,cant,val);
  contarCliente:=cant;
end;}

function contarCliente(a:arbolA; val:integer):integer;
begin
  if(a=nil) then
    contarCliente:=0
  else if(a^.dato.a.num = val) then
    contarCliente := 1 + contarCliente(a^.hi,val) + contarCliente(a^.hd,val)
  else
    contarCliente:= contarCliente(a^.hi,val) + contarCliente(a^.hd,val)
 end;
///////////////////////// INCISO E //////////////////////////////////

function recorrerLista(l:lista; val:integer):integer;
var
  cant:integer;
begin
  cant:=0;
  while(l<>nil) do begin
    if(l^.dato.num = val ) then
      cant:= cant + 1;
    l:=l^.sig;
  end;
 recorrerLista:=cant;
end;

{procedure recorrerClienteB(a:arbolB; var cant:integer; val:integer);
begin
  if(a<>nil) then begin
    recorrerLista(a^.dato.l,cant,val);
    recorrerClienteB(a^.hi,cant,val);
    recorrerClienteB(a^.hd,cant,val);
end;
end;

function contarClienteB (ab:arbolB):integer;
var
  cant,val:integer;
begin
  cant:=0;
  writeln('Ingrese un codigo de cliente');
  readln(val);
  recorrerClienteB(ab,cant,val);
  contarClienteB:=cant;
end;
}

function contarClienteB(a:arbolB; val:integer):integer;
begin
  if(a=nil) then
    contarClienteB:=0
  else
    contarClienteB:= recorrerLista(a^.dato.l,val) + contarClienteB(a^.hi,val) + contarClienteB(a^.hd,val);
end;

//////////////////////////// INCISO F /////////////////////////////////////////
procedure cargarArbolC(var ac:arbolc; alq:alquiler);
begin
  if(ac=nil) then begin
    new(ac); ac^.hd:=nil; ac^.hi:=nil; ac^.dato.cod:=alq.cod; ac^.dato.totalHoras:= alq.a.cantHoras;
  end
  else if (alq.cod < ac^.dato.cod) then
    cargarArbolC(ac^.hi,alq)
  else if (alq.cod > ac^.dato.cod) then
    cargarArbolC(ac^.hd,alq)
  else
    ac^.dato.totalHoras:= ac^.dato.totalHoras + alq.a.cantHoras
end;
procedure generarArbolC(var ac:arbolC; a:arbolA);
begin
  if(a<>nil) then begin
    cargarArbolC(ac,a^.dato);
    generarArbolC(ac,a^.hi);
    generarArbolC(ac,a^.hd);
end;
end;

//////////////////////// INCISO G ////////////////////////////////////////

procedure cargarArbolD(var ad:arbolD; alqb:alquilerB);
begin
  if(ad=nil) then begin
    new(ad); ad^.hd:=nil; ad^.hi:=nil; ad^.dato.cod:=alqb.cod; ad^.dato.totalHoras:= alqb.l^.dato.cantHoras;
  end
  else if(alqb.cod < ad^.dato.cod) then
    cargarArbolD(ad^.hi,alqb)
  else if (alqb.cod > ad^.dato.cod) then
    cargarArbolD(ad^.hd,alqb)
  else
    ad^.dato.totalHoras:= ad^.dato.totalHoras + alqb.l^.dato.cantHoras;
end;


procedure generarArbolD(var ad:arbolD; ab:arbolB);
var
  aux:lista;
begin
  if(ab<>nil) then begin
    aux:=ab^.dato.l;
    while(aux<>nil) do begin
      cargarArbolD(ad,ab^.dato);
      aux:=aux^.sig;
    end;
    generarArbolD(ad,ab^.hi);
    generarArbolD(ad,ab^.hd);
 end;
end;

procedure genD(var aD:arbolD; ab:arbolB);
begin
  aD:=nil;
  generarArbolD(aD,ab);
enD;
///////////////// INCISO H /////////////////////////////////

procedure imprimirD(ad:arbolD);
begin
  if(ad<>nil) then begin
    writeln('Codigo de bicicleta ' , ad^.dato.cod );
    writeln(ad^.dato.totalHoras , ' Horas totales');
    imprimirD(ad^.hi);
    imprimirD(ad^.hd);
end;
end;

////////////////////////// INCISO I /////////////////////////////////

procedure buscarAbonado(a:arbolA; max,min:integer; var total:real);
begin
  if(a<>nil) then begin
    if(a^.dato.cod >= min) and (a^.dato.cod <= max) then begin
      total:= total + a^.dato.a.abonado;
      buscarAbonado(a^.hi,max,min,total);
      buscarAbonado(a^.hd,max,min,total);
    end
    else if(a^.dato.cod < min) then
      buscarAbonado(a^.hd,max,min,total)
    else
     buscarAbonado(a^.hi,max,min,total)
 end;
end;

function totalAbonado(a:arbolA):real;
var
  total:real;
  min,max:integer;
begin
  total:=0;
  writeln('Ingrese un parametro maximo');
  readln(max);
  writeln('Ingrese un parametro minimo');
  readln(min);
  buscarAbonado(a,max,min,total);
  totalAbonado:=total;
end;


//////////////////////// INCISO J ///////////////////////////////////////////////////
{function actu(l:lista; total:real):real;
begin
  while (l<>nil) do begin
    total:= total + l^.dato.abonado;
    l:=l^.sig;
  end;
 actu:=total;
end;}

function actu(l:lista):real;
begin
  if(l<>nil) then 
    actu:= l^.dato.abonado + actu(l^.sig)
  else
    actu:=0
end;

procedure buscarRecaudado (ab:arbolb; max,min:integer);
begin
  if(ab<>nil) then begin
    if(ab^.dato.cod >= min) and (ab^.dato.cod <= max) then begin
        buscarRecaudado:= actu(ab^.dato.l) + buscarRecaudado(ab^.hd,max,min,total) + buscarRecaudado(ab^.hi,max,min)
     end
    else if(ab^.dato.cod < min) then
      buscarRecaudado(ab^.hd,max,min)
    else
     buscarRecaudado(ab^.hi,max,min)
 end;
end;

function recaudado(ab:arbolB):real;
var
  total:real;
  min,max:integer;
begin
  total:=0;
  writeln('Ingrese un parametro maximo');
  readln(max);
  writeln('Ingrese un parametro minimo');
  readln(min);
  buscarRecaudado(ab,max,min,total);
  recaudado:=total;
end;
var
  a:arbolA;
  ab:arbolB;
  ac:arbolC;
  ad:arbolD;
  val:integer;
begin
  generarArbol(a,ab);
  writeln('Arboles generados');
  writeln('El codigo mayor es: ' , maxArbolA(a));
  writeln('El codigo menor es: ', minArbolB(ab));
  writeln('Ingrese un valor');
  readln(val);
  writeln(contarCliente(a,val), ' Alquileres para ese cliente');
  writeln('Ingrese un valor');
  readln(val);
  writeln(contarClienteB(ab,val), 'Alquileres para ese cliente');
  ac:=nil;
  generarArbolC(ac,a);
  ad:=nil;
  genD(ad,ab);
  writeln('Imprimiendo arbol d');
  imprimirD(ad);
  writeln(totalAbonado(a));
  writeln(recaudado(ab));
end.


// Preguntar que hacer con la lista en generard que hace que quede en nil si no pongo auxiliar
// Inicializar valores en el programa o adentro de una funcion
// Recorrer las listas iterativamente con auxiliar o recursivas sin auxiliar para no perder el nodo
// Hacer un proceso aparte para inicializar los arboles o en el programa
// 
