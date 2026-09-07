{Una clínica odontológica necesita un sistema para el procesamiento de las atenciones realizadas a los pacientes en julio de 2025.

a) Implementar un módulo que lea información de las atenciones. De cada atención se lee: matrícula del odontólogo, DNI del paciente, día y diagnóstico (valor entre 1 y 10). 
La lectura finaliza con el DNI 0. Se sugiere utilizar el módulo leerAtencion(). El módulo debe retornar un árbol binario de búsqueda ordenado por matrícula del odontólogo. 
Para cada matrícula de odontólogo deben almacenarse las atenciones realizadas.

b) Implementar un módulo que reciba el árbol generado en a), dos matrículas y un valor entero. El módulo debe retornar la cantidad total de atenciones al paciente con DNI igual al valor ingresado
 por odontólogos con matrículas entre las dos matrículas ingresadas (sin incluir).

c) Realizar un módulo que reciba el árbol generado en a), y retorne, para cada diagnóstico, la cantidad de atenciones realizadas.
}
program TurnoM2025;

type
  rangodia=1..31;
  rangodiagnostico=1..10;
  datolista= record
    dni:integer;
    dia:rangodia;
    diagnostico:rangodiagnostico;
  end;
  
  atencion=record
    matricula:integer;
    dl:datolista;
  end;
  
 lista = ^nodo;
   nodo=record
     dato:datolista;
     sig:lista;
   end; 
 datoarbol= record
   matricula:integer;
   l:lista;
 end;
 arbol = ^nodoA;
   nodoA = record
     dato:datoarbol;
     hi:arbol; hd:arbol;
   end;
 vector = array [rangodiagnostico] of integer;
 procedure leerAtencion(var at:atencion);
 begin
   writeln('Ingrese el dni');
   readln(at.dl.dni);
   if(at.dl.dni<>0) then begin
     writeln('Ingrese la matricula');
     readln(at.matricula);
     writeln('Ingrese el dia');
     readln(at.dl.dia);
     writeln('Ingrese el diagnostico');
     readln(at.dl.diagnostico);
  end;
 end;
 
 procedure agregarAdelante(var l:lista; dl:datolista);
 var
   aux:lista;
 begin
   new(aux); aux^.dato:=dl; aux^.sig:=l; l:=aux;
 end;
 
 procedure iniciar(var d:datoarbol; at:atencion);
 begin
   d.matricula:=at.matricula;
   d.l:=nil;
   agregarAdelante(d.l,at.dl);
 end;
 procedure cargarArbol(var a:arbol; at:atencion);
 begin
   if(a=nil) then begin
     new(a);
     iniciar(a^.dato,at);
     a^.hi:=nil;
     a^.hd:=nil;
   end
   else if(at.matricula < a^.dato.matricula) then
     cargarArbol(a^.hi,at)
   else if(at.matricula > a^.dato.matricula) then
     cargarArbol(a^.hd,at)
   else
     agregarAdelante(a^.dato.l,at.dl)
   end;
 procedure generarArbol(var a:arbol);
 var
   at:atencion;
 begin
   a:=nil;
   leerAtencion(at);
   while(at.dl.dni<>0) do begin
     cargarArbol(a,at);
     leerAtencion(at);
   end;
 end;
/////////////////////// INCISO B /////////////////
//b) Implementar un módulo que reciba el árbol generado en a), dos matrículas y un valor entero. El módulo debe retornar la cantidad total de atenciones al paciente con DNI igual al valor ingresado
// por odontólogos con matrículas entre las dos matrículas ingresadas (sin incluir).

function recorrerLista(l:lista; val:integer):integer;
var
  cant:integer;
begin
  cant:=0;
  while(l<>nil) do begin
    if(l^.dato.dni = val) then
      cant:=cant + 1;
    l:=l^.sig;
  end;
  recorrerLista:=cant;
end;

function buscarEntre(a:arbol; inf,sup,val:integer):integer;
begin
  if(a=nil) then 
    buscarEntre:=0
  else begin
    if(a^.dato.matricula > inf) and (a^.dato.matricula < sup) then 
      buscarEntre:=  recorrerLista(a^.dato.l,val) + buscarEntre(a^.hi,inf,sup,val) + buscarEntre(a^.hd,inf,sup,val)
    else if(a^.dato.matricula <= inf) then
      buscarEntre(a^.hd,inf,sup,val)
    else
      buscarEntre(a^.hi,inf,sup,val)
  end;
end;
      
function incisoB(a:arbol):integer;
var
  inf,sup,val:integer;
begin
  writeln('Ingrese el limite superior'); readln(sup);
  writeln('Ingrese el limite inferior'); readln(inf);
  writeln('Ingrese el valor a buscar'); readln(val);
  incisoB:= buscarEntre(a,inf,sup,val);
end;

////// INCISO C //////////////////////////
// c) Realizar un módulo que reciba el árbol generado en a), y retorne, para cada diagnóstico, la cantidad de atenciones realizadas.

procedure cargar(l:lista; var v:vector);
begin
  while(l<>nil) do begin
    v[l^.dato.diagnostico]:= v[l^.dato.diagnostico] +  1;
    l:=l^.sig;
  end;
end;

procedure recorrerArbol(a:arbol; var v:vector);
begin
  if(a<>nil) then begin
    cargar(a^.dato.l,v);
    recorrerArbol(a^.hi,v);
    recorrerArbol(a^.hd,v);
end;
end;
  
  
  procedure inicializarVector(var v:vector);
var
  i:rangodiagnostico;
begin
  for i:=1 to 10 do 
    v[i]:=0;
  end;

procedure imprimirVector(v:vector);
var
  i:integer;
begin
  for i:= 1 to 10 do 
    writeln('posicion ', i , ' valor ',  v[i]);
  end;
procedure cargarVector(a:arbol; var v:vector);
begin
  inicializarVector(v);
  recorrerArbol(a,v);
  imprimirVector(v);
end;


/////////// PROGRAMA PRINCIPAL //////////////////// 
 var
   a:arbol;
   v:vector;
 begin
   generarArbol(a); writeln('Arbol generado');
  writeln(incisoB(a));
  cargarVector(a,v);
 end.
