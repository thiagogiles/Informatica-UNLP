{Una empresa de turismo necesita un sistema para manejar las reservas de sus cabañas durante el año 2026. a) Implementar un módulo que lea información de las reservas de las cabañas y 
retorne un vector que agrupe dichas reservas de acuerdo al nro. de cabaña. Para cada cabaña, las reservas deben quedar almacenadas en un árbol binario de búsqueda ordenado por dni de la persona 
que la reservó. De cada reserva se lee: dni del titular, día reserva, mes reserva, cantidad de días reservados y código de cabaña (1..20). La lectura finaliza con "cantidad de días reservados" igual a 0. 
b) Realizar un módulo que reciba la estructura generada a) y retorne cuál es la cabaña que tiene más cantidad de días reservados. c) Realizar un módulo que reciba la estructura generada en a), un dni D1,
 un dni D2 y retorne la cantidad de reservas realizadas entre todas las cabañas por los dni mayores que D1 y menores que D2.
}

program TurnoJ2025;
type
  rangonum=1..20;
  rangodia=1..31;
  rangomes=1..12;
  datoarbol= record
    dni:integer;
    dia:rangodia;
    mes:rangomes;
    cantDias:integer;
 end;
  reserva = record
    numero:rangonum;
    d:datoarbol;
end;

arbol = ^nodoA;
  nodoA=record
    dato:datoarbol;
    hi:arbol; hd:arbol;
end;
vector = array [rangonum] of arbol;

procedure leerReserva(var r:reserva);
begin
  writeln('Ingrese la cantidad de dias');
  readln(r.d.cantDias);
  if(r.d.cantDias<>0) then begin
    writeln('Ingrese el dni');
    readln(r.d.dni);
    writeln('Ingrese el numero de cabaña');
    readln(r.numero);
    writeln('Ingrese el dia');
    readln(r.d.dia);
    writeln('Ingrese el mes');
    readln(r.d.mes);
 end;
end;
  
procedure inicializarVector(var v:vector);
var 
  i:integer;
begin
  for i:= 1 to 20 do 
    v[i]:=nil;
  end;
  
procedure cargarArbol(var a:arbol; d:datoarbol);
begin
  if(a=nil) then begin
    new(a);
    a^.dato:=d;
    a^.hi:=nil; a^.hd:=nil;
  end
  else if(d.dni < a^.dato.dni) then
    cargarArbol(a^.hi,d)
  else if(d.dni > a^.dato.dni) then
    cargarArbol(a^.hd,d)
  else
    cargarArbol(a^.hd,d)
 end;
 
procedure generarArbol(var v:vector);
var
  r:reserva;
begin
  inicializarVector(v);
  leerReserva(r);
  while(r.d.cantDias<>0) do begin
    cargarArbol(v[r.numero],r.d);
    leerReserva(r);
  end;
end;

// INCISO B //
// b) Realizar un módulo que reciba la estructura generada a) y retorne cuál es la cabaña que tiene más cantidad de días reservados. 

procedure ac(dias:integer; var cant:integer);
begin
  cant:=cant + dias;
  end;

    
procedure actu(a:arbol; var cant:integer);
begin
  if(a<>nil) then begin
    ac(a^.dato.cantDias,cant);
    actu(a^.hi,cant);
    actu(a^.hd,cant);
 end;
end;

procedure verificarMax(var max,codmax:integer; cant,i:integer);
begin
  if(cant > max) then begin
    max:=cant;
    codmax:=i;
  end;
end;

function buscarMax(v:vector; max,codmax:integer):integer;
var
  i,cant:integer;
begin
  for i:= 1 to 20 do begin
    cant:=0; 
    actu(v[i],cant);
    verificarMax(max,codmax,cant,i);
  end;
  buscarMax:=codmax;
  end;
  
function incisoB(v:vector):integer;
var
  max,codmax:integer;
begin
  max:=0; codmax:=0;
  incisoB:=buscarMax(v,max,codmax);
end; 

//////////////////// INCISO C ///////////////////////////
//c) Realizar un módulo que reciba la estructura generada en a), un dni D1,  un dni D2 y retorne la cantidad de reservas realizadas entre todas las cabañas por los dni mayores que D1 y menores que D2.

procedure contar(a:arbol; var cant:integer; d1,d2:integer);
begin
  if(a<>nil) then begin
    if(a^.dato.dni > d1) and (a^.dato.dni < d2) then begin
      cant:=cant + 1;
      contar(a^.hi,cant,d1,d2);
      contar(a^.hi,cant,d1,d2);	
    end
    else if(a^.dato.dni < d1) then
      contar(a^.hd,cant,d1,d2)
    else 
      contar(a^.hi,cant,d1,d2)
  end;
end;

function totalReservas(v:vector; var cant:integer; d1,d2:integer):integer;
var
  i:integer;
begin
  for i:= 1 to 20 do begin
    contar(v[i],cant,d1,d2);
  end;
  totalReservas:= cant;
end;

function incisoC(v:vector):integer;
var
  cant,D1,D2:integer;
begin
  cant:=0;
  writeln('Ingrese el dni 1'); readln(d1);
  writeln('Ingrese el dni 2'); readln(d2);
  totalReservas(v,cant,d1,d2);
  incisoC:=cant;
end;





/////////////// PROGRAMA PRINCIPAL /////////////////  
var
  v:vector;
begin
  generarArbol(v); writeln('Arbol generado');
  writeln(incisoB(v));
  writeln(incisoC(v));
end.
