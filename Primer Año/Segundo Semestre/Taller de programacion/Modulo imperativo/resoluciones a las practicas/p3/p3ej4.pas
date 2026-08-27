{a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. La información que se lee es legajo
(1000 a 1050), código de materia (1 a 25), fecha y nota. La lectura de los alumnos finaliza con
legajo 0. La estructura generada debe ser eficiente para la búsqueda por número de legajo y
para cada alumno deben guardarse los finales que rindió en una lista. Nota: No repetir
información!!!
b. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).
c. Un módulo que reciba la estructura generada en a. y un código de materia. El módulo debe
retornar la cantidad de alumnos que aprobó la materia recibida y la cantidad de alumnos que
desaprobó la materia recibida.
d. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar la cantidad de alumnos con cantidad de finales rendidos igual al valor entero recibido.
}
program p3ej4;
type
  fecha = record
    dia:1..31;
    mes:1..12;
    ano:1..2026;
  end;
  
  finalLista = record
    codMateria:1..25;
    f:fecha;
    nota:1..10;
  end;
  
 final = record
   legajo:0..1050;
   fl:finalLista;
 end; 
  lista = ^nodo;
  nodo=record
    dato:finalLista;
    sig:lista
  end;
  finalArbol = record
    legajo:1000..1050;
    l:lista;
  end;
arbol = ^nodoarbol;
  nodoarbol = record
    dato:finalArbol;
    hi:arbol; hd:arbol;
  end;
  
procedure leerFinal(var f:final);
begin
  writeln('Ingrese un legajo de 1000 a 1050');
  readln(f.legajo);
  if(f.legajo<>0) then begin
    writeln('Ingrese el codigo de la materia 1 a 25');
    readln(f.fl.codMateria);
    writeln('Ingrese el dia en el q rindio el final');
    readln(f.fl.f.dia);
    writeln('Ingrese el mes en el q rindio el final');
    readln(f.fl.f.mes);
    writeln('Ingrese el ano en el q rindio el final');
    readln(f.fl.f.ano);
    writeln('Ingrese la nota que obtuvo');
    readln(f.fl.nota);
 end;
end;

procedure agregarAdelante(var l:lista; fl:finalLista);
var
  aux:lista;
begin
  new(aux); aux^.dato:=fl; aux^.sig:=l; l:=aux;
end;
procedure cargarArb(var a:arbol; f:final);
begin
  if(a=nil) then begin
    new(a); 
    a^.dato.legajo:=f.legajo; 
    agregarAdelante(a^.dato.l,f.fl);
    a^.hi:=nil; a^.hd:=nil;
  end
  else
    if(f.legajo < a^.dato.legajo) then
      cargarArb(a^.hi,f)
  else
    if(f.legajo > a^.dato.legajo) then
      cargarArb(a^.hd,f)
    else
    agregarAdelante(a^.dato.l,f.fl);
 end;
 
procedure generarArb(var a:arbol);
var
  f:final;
begin
  a:=nil;
  leerFinal(f);
  while(f.legajo<>0) do begin
    cargarArb(a,f);
    leerFinal(f);
end;
  writeln('Arbol cargado');
end;


// b. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y su cantidad de finales aprobados (nota mayor o igual a 4).

function aprobados(l:lista):integer;
var
  cant:integer;
begin
  cant:=0;
  while(l<>nil) do begin
    if(l^.dato.nota >= 4) then
      cant:=cant + 1;
    l:=l^.sig;
  end;
 aprobados:=cant;
end;

procedure imprimirAlumno(a:arbol);
begin
  if(a<>nil) then begin
    writeln('El alumno ', a^.dato.legajo , ' tiene ', aprobados(a^.dato.l) , ' finales aprobados ');
    imprimirAlumno(a^.hi);
    imprimirAlumno(a^.hd);
  end;
end;

// c. Un módulo que reciba la estructura generada en a. y un código de materia. El módulo debe retornar la cantidad de alumnos que aprobó la materia recibida y la cantidad de alumnos que
// desaprobó la materia recibida.

procedure contar(l:lista; var aprobado,desaprobado:integer; cod:integer);
begin
  while(l<>nil) do begin
    if(l^.dato.codMateria = cod) then begin
      if(l^.dato.nota >= 4) then
        aprobado:=aprobado + 1
      else
        desaprobado:= desaprobado + 1
     end;
    l:=l^.sig;
  end;
end;

procedure buscarMateria(a:arbol; var aprobado,desaprobado:integer; cod:integer);
begin
  if(a<>nil) then begin
     contar(a^.dato.l,aprobado,desaprobado,cod);
     buscarMateria(a^.hi,aprobado,desaprobado,cod);
     buscarMateria(a^.hd,aprobado,desaprobado,cod);
  end;
end;

procedure imprimirMateria(a:arbol);
var
  aprobado,desaprobado,cod:integer;
begin
  aprobado:=0; desaprobado:=0;
  writeln('Ingrese el codigo de materia a buscar'); readln(cod);
  buscarMateria(a,aprobado,desaprobado,cod);
  writeln('Para la materia ', cod, ' hay ', aprobado , ' alumnos aprobados y ' , desaprobado , ' alumnos desaprobados');
end;

// d. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe retornar la cantidad de alumnos con cantidad de finales rendidos igual al valor entero recibido. 

function cont(l:lista; aux:integer):integer;
begin
  while(l<>nil) do begin
    aux:=aux + 1;
    l:=l^.sig;
  end;
 cont:=aux;
 end;
     
function recorrerArb(a:arbol; cant,val:integer): integer;
var
  aux:integer;
begin
  if(a<>nil) then begin
    aux:=0;
    if(cont(a^.dato.l,aux) = val) then 
      cant:= cant + 1;
    recorrerArb(a^.hi,cant,val);
    recorrerArb(a^.hd,cant,val);
  end;
 recorrerArb:=cant;
end;

function imprimirCantFinales(a:arbol):integer;
var
  cant,val:integer;
begin
  cant:=0;
  writeln('Ingrese un numero de finales a buscar'); readln(val);
  imprimirCantFinales:=recorrerArb(a,cant,val);
end;
var
  a:arbol;
begin
  generarArb(a);
  imprimirAlumno(a);
  imprimirMateria(a);
  writeln('Hay ', imprimirCantFinales(a) ,' alumnos con esa cantidad de finales rendidos');
end.
