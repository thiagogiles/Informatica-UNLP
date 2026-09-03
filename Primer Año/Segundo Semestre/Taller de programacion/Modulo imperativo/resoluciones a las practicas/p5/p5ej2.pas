{ Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de 
los autos en venta. Implementar un programa que: 
a) Genere la información de los autos (patente, año de fabricación (2015..2026), marca, 
color y modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de 
datos: 
i) Una estructura eficiente para la búsqueda por patente. 
ii) Una estructura eficiente para la búsqueda por marca. 
b) Invoque un módulo que reciba la estructura generada en el inciso a) i) y una marca y 
retorne la cantidad de autos de dicha marca que posee la agencia.  
c) Invoque a un módulo que reciba la estructura generada en el inciso a) ii) y una marca y 
retorne la cantidad de autos de dicha marca que posee la agencia.  
d) Invoque a un módulo que reciba el árbol generado en el inciso a) i) y retorne una 
estructura con la información de los autos agrupados por año de fabricación. 
e) Invoque a un módulo que reciba el árbol generado en el inciso a) i) y una patente y 
devuelva el modelo del auto con dicha patente.   
f) 
Invoque a un módulo que reciba el árbol generado en el inciso a) ii) y una patente y 
devuelva el color del auto con dicha patente. 

}
program p5ej2;

type
  datolista=record
    fabricacion:2015..2026;
     patente:string;
     marca:string;
     color:string;
    modelo:integer;
 end;
 
  auto=record
    patente:string;
    d:datolista;
end;


    
  lista =  ^nodo;
  
  nodo= record
    dato:datolista;
    sig:lista;
 end;
 
  datoarbol = record
    fabricacion:2015..2026;
    l:lista;
  end;
 arbolA = ^nodoA;
   nodoA=record
     dato:auto;
     hi:arbolA; hd:arbolA;
   end;
   
 arbolB = ^nodoB;
   nodoB=record
     dato:auto;
     hd:arbolB; hi:arbolB;
  end;

arbolC = ^nodoC;
  nodoC= record
    dato:datoarbol;
    hd:arbolC; hi:arbolC;
 end;
procedure leerAuto(var a:auto);
begin
   writeln('Ingrese la marca del auto');
   readln(a.d.marca);
   if(a.d.marca <> 'MMM') then begin
   writeln('Ingrese la patente');
   readln(a.patente);
   writeln('Ingrese el anio de fabricacion del 2015 al 2026');
   readln(a.d.fabricacion);
   writeln('Ingrese el color del auto');
   readln(a.d.color);
   writeln('Ingerese el modelo del auto');
   readln(a.d.modelo);
  end;
end;

procedure cargarArbolA(var a:arbolA; au:auto);
begin
  if(a=nil) then begin
    new(a); a^.dato:=au; a^.hi:=nil; a^.hd:=nil;
  end
  else if(au.patente < a^.dato.patente) then
    cargarArbolA(a^.hi,au)
  else if(au.patente > a^.dato.patente) then
    cargarArbolA(a^.hd,au)
  else
    cargarArbolA(a^.hd,au)
  end;


procedure cargarArbolB(var ab:arbolB; au:auto);
begin
   if(ab=nil) then begin
    new(ab); ab^.dato:=au; ab^.hi:=nil; ab^.hd:=nil;
  end
  else if(au.d.marca < ab^.dato.d.marca) then
    cargarArbolB(ab^.hi,au)
  else if(au.d.marca > ab^.dato.d.marca) then
    cargarArbolB(ab^.hd,au)
  else
    cargarArbolB(ab^.hd,au)
  end;

procedure generarArboles(var a:arbolA; var ab:arbolB);
var
  au:auto;
begin
  a:=nil;
  ab:=nil;
  leerAuto(au);
  while(au.d.marca<>'MMM') do begin
    cargarArbolA(a,au);
    cargarArbolB(ab,au);
    leerAuto(au);
  end;
end;

/////////////////// INCISO B ///////////////////////////////////

function contarMarca(a:arbolA; marca:string):integer;
begin
  if(a=nil) then
    contarMarca:=0
  else begin
    if(a^.dato.d.marca = marca) then
      contarMarca:= 1 + contarMarca(a^.hi,marca) + contarMarca(a^.hd,marca)
    else
      contarMarca:= contarMarca(a^.hi,marca) + contarMarca(a^.hd,marca)
    end;
 end;
  
function incisoB(a:arbolA):integer;
var
  marca:string;
begin
  writeln('Ingrese la marca a buscar');
  readln(marca);
  incisoB:= contarMarca(a,marca)
end;

/////////////// INCISO C //////////////////////

function contarOrden(ab:arbolB; marca:string):integer;
begin
  if(ab=nil) then
    contarOrden:=0
  else begin
    if(ab^.dato.d.marca = marca) then
      contarOrden:= 1 + contarOrden(ab^.hd,marca)
    else if(ab^.dato.d.marca < marca) then
      contarOrden := contarOrden + contarOrden(ab^.hd,marca)
    else
      contarOrden:= contarOrden + contarOrden(ab^.hi,marca)
    end;
 end;
 
function incisoC(ab:arbolB):integer;
var
  marca:string;
begin
  writeln('Ingrese la marca a buscar');
  readln(marca);
  incisoC:= contarOrden(ab,marca);
end;

///////////// INCISO D /////////////////////

procedure agregarAdelante(var l:lista; a:datolista);
var
  aux:lista;
begin
  new(aux); aux^.dato:=a; aux^.sig:=l; l:=aux;
end;

procedure iniciar(var ac:arbolc; a:auto);
begin
  ac^.dato.l:=nil;
  ac^.dato.fabricacion:= a.d.fabricacion;
  agregarAdelante(ac^.dato.l,a.d);
  end;
  
procedure cargarC(var ac:arbolc; a:auto);
begin
  if(ac=nil) then begin
    new(ac);
    iniciar(ac,a);
    ac^.hi:=nil; ac^.hd:=nil;
  end
  else if(a.d.fabricacion < ac^.dato.fabricacion) then
    cargarC(ac^.hi,a)
   else if(a.d.fabricacion > ac^.dato.fabricacion) then
     cargarC(ac^.hd,a)
   else
     agregarAdelante(ac^.dato.l,a.d)
   end;
   
procedure genC(var ac:arbolc; a:arbola);
begin
  if(a<>nil) then begin
    cargarC(ac,a^.dato);
    genC(ac,a^.hi);
    genC(ac,a^.hd);
  end;
end;
procedure generarArbolC(var ac:arbolc; a:arbola);
begin
  ac:=nil;
  genC(ac,a);
end;

//////////// INCISO E /////////////////////
// e) Invoque a un módulo que reciba el árbol generado en el inciso a) i) y una patente y  devuelva el modelo del auto con dicha patente.   

function buscarPatente(a:arbolA; patente:string):integer;
begin
  if(a=nil) then
    buscarPatente:=0
  else begin
    if(a^.dato.patente = patente) then
      buscarPatente:= a^.dato.d.modelo
    else if(a^.dato.patente < patente) then
      buscarPatente:= buscarPatente(a^.hd,patente)
    else 
      buscarPatente:= buscarPatente(a^.hi,patente)
    end;
 end;
 
function incisoE(a:arbolA):integer;
var
  patente:string;
begin
  writeln('Ingrese la patente a buscar en el arbol A');
  readln(patente);
  incisoE:=buscarPatente(a,patente);
end;

////////////////////// INCISO F /////////////////////
// Invoque a un módulo que reciba el árbol generado en el inciso a) ii) y una patente y  devuelva el color del auto con dicha patente. 

procedure buscarSO(ab:arbolb; patente:string; var color:string);
begin
  if(ab<>nil) then begin
    if(ab^.dato.patente = patente) then
      color:= ab^.dato.d.color;
    buscarSO(ab^.hi,patente,color);
    buscarSO(ab^.hd,patente,color);
 end;
end;
procedure incisoF(ab:arbolb);
var
  patente,color:string;
begin
  color:='Ninguno';
  writeln('Ingrese la patente a buscar en el arbol B');
  readln(patente);
  buscarSO(ab,patente,color);
  if(color<>'Ninguno') then
    writeln('El color de la patente es', color)
  else
    writeln('No se encontro ningun auto con esa patente');
end;
var
  a:arbolA;
  ab:arbolB;
  ac:arbolC;
begin
  generarArboles(a,ab);
  writeln('Arboles A y B generados');
  writeln('Hay ', incisoB(a) , ' autos de esa marca en el arbol A');
  writeln('Hay ', incisoC(ab), ' autos de esa marca en el arbol B');
  generarArbolC(ac,a);
  writeln('Arbol C generado');
  writeln('El modelo del auto buscado en base a la patente dada es ', incisoE(a));
  incisoF(ab);
end.
