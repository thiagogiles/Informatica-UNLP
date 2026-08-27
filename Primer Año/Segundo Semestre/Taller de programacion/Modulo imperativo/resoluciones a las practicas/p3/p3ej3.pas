{a. Un módulo que lea información de los préstamos de libros realizados por los socios de una
biblioteca y los almacene en una estructura de datos. De cada préstamo se lee: número de
socio (1 a 60), código de libro (200 a 230), fecha de préstamo y cantidad de días del préstamo.
La lectura de los préstamos finaliza con número de socio 0. La estructura generada debe ser
eficiente para la búsqueda por número de socio y, para cada socio, deben almacenarse en una
lista los préstamos de libros que realizó. Nota: No repetir información.
b. Un módulo que reciba la estructura generada en el inciso a) y retorne la cantidad de socios
cuyo número de socio es múltiplo de 5.
c. Un módulo que reciba la estructura generada en el inciso a) e informe, para cada socio, su
número de socio y la cantidad de préstamos de libros cuya duración fue menor o igual a 7 días.
d. Un módulo que reciba la estructura generada en el inciso a) y un valor real que representa
una cantidad promedio de días. El módulo debe retornar los números de socio y el promedio
de días de préstamo de aquellos socios cuyo promedio supere el valor ingresado.
}
program p3ej3;
type

datoLista = record
  codLibro:200..230;
  fecha:string;
  diasPrestamo:integer;
end;

producto = record
  numSocio:0..60;
  d:datolista;
end;

lista= ^nodo;
  nodo=record
  dato: datoLista;
  sig:lista;
end;

datoArbol= record
  numSocio:0..60;
  l:lista;
end;

arbol = ^nodoA;
nodoa= record
  dato:datoArbol;
  hi:arbol; hd:arbol;
end;

procedure AgregarAdelante(var l:lista; p:datolista);
var
  aux:lista;
begin
  new(aux); aux^.dato:=p; aux^.sig:=l; l:=aux;
end;

procedure leerP(var p:producto);
begin
  writeln('Ingrese num socio');
  readln(p.numSocio);
  if(p.numSocio<>0) then begin
  writeln('Ingrese codigo del libro');
  readln(p.d.codLibro);
  writeln('Ingrese  fecha');
  readln(p.d.fecha);
  writeln('Ingrese dias prestamo ');
  readln(p.d.diasPrestamo);
end;
end;

procedure cargarArbol(var a:arbol; p:producto);
begin
  if(a=nil) then begin
    new(a);
    a^.dato.numSocio:=p.numsocio; 
    agregarAdelante(a^.dato.l,p.d);
    a^.hi:=nil; a^.hd:=nil;
  end
  else
   if(p.numSocio < a^.dato.numSocio) then
     cargarArbol(a^.hi,p)
  else
    if(p.numSocio > a^.dato.numSocio) then
      cargarArbol(a^.hd,p)
  else
    agregarAdelante(a^.dato.l,p.d);
 end;
 
  

procedure generarArbol(var a:arbol);
var
  p:producto;
begin
  a:=nil;
  leerP(p);
  while(p.numSocio<>0) do begin
    cargarArbol(a,p);
    leerP(p);
  end;
end;

procedure buscar(a:arbol; var cant:integer);
begin
  if(a<>nil) then begin
    buscar(a^.hi,cant);
    if((a^.dato.numSocio mod 5 ) = 0) then
      cant:=cant+1;
    buscar(a^.hd,cant);
 end;
end;

function multiplo(a:arbol): integer;
var
  cant:integer;
begin
  cant:=0;
  buscar(a,cant);
  multiplo:=cant;
end;

// c. Un módulo que reciba la estructura generada en el inciso a) e informe, para cada socio, su número de socio y la cantidad de préstamos de libros cuya duración fue menor o igual a 7 días.


function canti(l:lista;cant:integer): integer;
begin
  while(l<>nil) do begin
    if(l^.dato.diasPrestamo <= 7) then
      cant:=cant + 1;
    l:=l^.sig;
    end;
  canti:=cant;
  end;

procedure menorASiete(a:arbol);
var
cant:integer;
begin
  cant:=0;
  if(a<>nil) then begin
    writeln('El socio numero: ', a^.dato.numSocio, ' tiene ', canti(a^.dato.l,cant) ,' prestamos con duracion menor o igual a 7 dias');
    menorASiete(a^.hi);
    menorASiete(a^.hd);
end;
end;

//d. Un módulo que reciba la estructura generada en el inciso a) y un valor real que representa una cantidad promedio de días. El módulo debe retornar los números de socio y el 
//promedio de días de préstamo de aquellos socios cuyo promedio supere el valor ingresado.

procedure leerProm(var p:real);
begin
  writeln('Ingrese un promedio a buscar');
  readln(p);
end;

procedure ver(l:lista; var aux:real; var cant:integer);
begin
  while(l<>nil) do begin
    aux:=aux + l^.dato.diasPrestamo;
    cant:=cant+1;
    l:=l^.sig;
  end;
end;

procedure verifi(a:arbol;prom:real);
var
  cant:integer;
  aux:real;
begin
  aux:=0; cant:=0;
if(a<>nil) then begin
    verifi(a^.hi,prom);
    ver(a^.dato.l,aux,cant);
    if(aux/cant > prom) then writeln ('El socio ',a^.dato.numSocio, ' supero el promedio indicado con un total de ', (aux / cant));
    verifi(a^.hd,prom);
end;
end;

procedure incisoD(a:arbol);
var
  prom:real;
begin
  leerProm(prom);
  verifi(a,prom);
  end;

var
  a:arbol;
begin
  generarArbol(a);
  writeln('Arbol generado');
  writeln(' ------------------------------------------------------------------------------- ');
  writeln('Hay ', multiplo(a), ' socios cuyo numero es multiplo de  5');
  writeln(' ------------------------------------------------------------------------------- ');
  menorASiete(a);
  writeln(' ------------------------------------------------------------------------------- ');
  incisoD(a);
end.


