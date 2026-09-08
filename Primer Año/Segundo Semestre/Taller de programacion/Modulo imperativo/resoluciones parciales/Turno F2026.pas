{Una agencia de alquiler de vehículos necesita un sistema para procesar la información de sus alquileres. De cada alquiler se conoce: patente, fecha, DNI del cliente y cantidad de días alquilados.

a) Implementar un módulo que lea información de los alquileres y retorne una estructura de datos eficiente para la búsqueda por DNI y 
que para cada DNI contenga sus alquileres. La lectura finaliza al ingresar el valor 0 para un DNI.

b) Realizar un módulo que reciba la estructura generada en el inciso a) y retorne otra estructura que almacene para patente, la cantidad total de días que se alquiló.

c) Realizar un módulo recursivo que reciba la estructura generada en inciso b) y retorne patente del vehículo con mayor cantidad de días alquilados.

NOTA: Implementar el programa principal, que invoque a los incisos a, b y c. En caso de ser necesario, puede utilizar los módulos que se encuentran a continuación.
}
program TurnoF2026;

type
  rangodia= 1..31;
  rangomes=1..12;
  rangoanio=1950..2026;
  fecha=record
    dia:rangodia;
    mes:rangomes;
    anio:rangoanio;
 end;
  datolista= record
    patente:string;
    f:fecha;
    dias:integer;
 end;
  alquiler = record
    dni:integer;
    dl:datolista;
  end;
  
 lista= ^nodo;
 nodo=record
   dato:datolista;
   sig:lista;
end;

datoarbol = record
  dni:integer;
  l:lista;
end;
arbol = ^nodoA;
  nodoA=record
    dato:datoarbol;
    hi:arbol; hd:arbol;
 end;
 
  datolistaB=record
    patente:string;
    totalDias:integer;
  end;
listab = ^nodoB;
  nodoB=record
    dato:datolistaB;
    sig:listab;
  end;
procedure leerAlquiler(var al:alquiler);
begin
  writeln('Ingrese el dni');
  readln(al.dni);
  if(al.dni<>0) then begin
    writeln('Ingrese su patente');
    readln(al.dl.patente);
    writeln('Ingrese la cantidad de dias alquilados');
    readln(al.dl.dias);
    writeln('Ingrese el dia'); readln(al.dl.f.dia);
    writeln('Ingrese el mes'); readln(al.dl.f.mes);
    writeln('Ingrese el anio'); readln(al.dl.f.anio);
 end;
end;

procedure agregarAdelante(var l:lista; dl:datolista);
var
  aux:lista;
begin
  new(aux); aux^.dato:=dl; aux^.sig:=l; l:=aux;
end;
procedure iniciar(var d:datoarbol; al:alquiler);
begin
  d.dni:=al.dni;
  d.l:=nil;
  agregarAdelante(d.l,al.dl);
end;

procedure cargarArbol(var a:arbol; al:alquiler);
begin
  if(a=nil) then begin
    new(a);
    iniciar(a^.dato,al);
    a^.hi:=nil; a^.hd:=nil;
  end
  else if(al.dni < a^.dato.dni) then
    cargarArbol(a^.hi,al)
  else if(al.dni > a^.dato.dni) then
    cargarArbol(a^.hd,al)
  else
    agregarAdelante(a^.dato.l,al.dl)
 end;
 
procedure generarArbol(var a:arbol);
var
  al:alquiler;
begin
  a:=nil;
  leerAlquiler(al);
  while(al.dni<>0) do begin
    cargarArbol(a,al);
    leerAlquiler(al);
 end;
end;

/////////////// INCISO B /////////////////////
//b) Realizar un módulo que reciba la estructura generada en el inciso a) y retorne otra estructura que almacene para patente, la cantidad total de días que se alquiló.

procedure agregarAdelanteB(var lb:listaB; patente:string; dias:integer);
var
  aux:listab;
begin
  new(aux); aux^.dato.patente:= patente; aux^.dato.totaldias:= dias; aux^.sig:=lb; lb:=aux;
end;

procedure actu(var lb:listab; patente:string; dias:integer);
var
  aux:listab;
begin
  aux:=lb;
  while(aux<>nil) and (aux^.dato.patente <> patente) do
    aux:=aux^.sig;
  if(aux = nil) then
    agregarAdelanteB(lb,patente,dias)
  else
    aux^.dato.totalDias := aux^.dato.totalDias + dias;
end;

procedure genLista(var lb:listab; l:lista);
begin
  while(l<>nil) do begin
    actu(lb,l ^.dato.patente,l^.dato.dias);
    l:=l^.sig;
  end;
end;

procedure generarLista(var lb:listab; a:arbol);
begin
  if(a<>nil) then begin
    genLista(lb,a^.dato.l);
    generarLista(lb,a^.hi);
    generarLista(lb,a^.hd);
 end;
end;

/////////////// INCISO C ///////////////////
// c) Realizar un módulo recursivo que reciba la estructura generada en inciso b) y retorne patente del vehículo con mayor cantidad de días alquilados

procedure contarMax(l:listaB; var max:integer; var patente:string);
begin
  if(l<>nil) then begin 
    if(l^.dato.totalDias > max) then begin
      max:=l^.dato.totalDias;
      patente:= l^.dato.patente;
    end;
   contarMax(l^.sig,max,patente);
  end;
end;
procedure maxDias(l:listaB);
var
  max:integer;
  patente:string;
begin
  max:=0;
  patente:='Lista vacia';
  contarMax(l,max,patente);
  if(patente <> 'Lista vacia') then 
        writeln('La patente con mayor cantidad de dias alquilados es: ', patente)
  else
       writeln('La lista esta vacia');
end;

//////////// PROGRAMA PRINCIPAL /////////////
var
  a:arbol;
  lb:listaB;
begin
  generarArbol(a); writeln('Arbol generado');
  generarLista(lb,a); writeln('Lista generada');
  maxDias(lb);
end.
