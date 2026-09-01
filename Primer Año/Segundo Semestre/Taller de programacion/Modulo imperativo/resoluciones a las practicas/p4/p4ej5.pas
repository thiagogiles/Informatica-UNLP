{Una veterinaria desea procesar la información de las consultas realizadas durante el año. 
De cada consulta se conoce: número de consulta, número de historia clínica de la mascota, 
fecha, tipo de consulta y costo de la consulta. La lectura de las consultas finaliza cuando se 
ingresa el número de consulta -1.
Implementar un programa que invoque a los siguientes módulos y  compruebe el correcto 
funcionamiento del mismo. 
a. Un módulo que retorne la información de las historias clínicas en un árbol binario de 
búsqueda ordenado por número de historia clínica. Para cada historia clínica se debe 
almacenar una lista con las consultas realizadas a la mascota correspondiente. 
b. Un módulo que imprima recursivamente todas las historias clínicas en orden creciente 
de número. 
c. Un módulo que reciba el árbol y retorne el número de historia clínica con mayor 
cantidad de consultas. 
d. Un módulo que reciba el árbol y un número de historia clínica. Debe retornar la 
cantidad total de consultas realizadas a dicha mascota. En caso  
e. Un módulo que reciba el árbol y un valor de costo. Debe retornar la cantidad de 
consultas cuyo costo supera el valor recibido. 
f. 
Un módulo que reciba el árbol y dos números de historia clínica. Debe retornar el costo 
total de las consultas correspondientes a las historias clínicas comprendidas entre 
ambos números, inclusive. 
g. Un módulo que reciba el árbol y genere una nueva estructura ordenada por número de 
historia clínica, donde cada historia aparezca una única vez junto con el costo total 
acumulado de sus consultas.

}

program p4ej5;

type
  datoarbolB = record
    numHistoria:integer;
    total:real;
end;
  datolista= record
    numConsulta:integer;
    tipoConsulta:string;
    fecha:string;
    costo:real;
  end;
  
  consulta = record
    numHistoria:integer;
    dl:datolista
 end;
lista =  ^nodo;
   nodo=record
   dato:datolista;
   sig:lista;
 end;
 
 
 datoarbol =record
   numHistoria:integer;
   l:lista;
 end;
 arbol = ^nodoarbol;
   nodoarbol= record
     dato:datoarbol;
     hd:arbol; hi:arbol;
  end;

arbolB = ^nodoB;
  nodoB=record
    dato:datoarbolb;
    hd:arbolB; hi:arbolb;
 end;
  procedure agregarAdelante(var l:lista; dl:datolista);
  var
    aux:lista;
  begin
    new(aux);
    aux^.dato:=dl;
    aux^.sig:=l;
    l:=aux;
  end;
  
 procedure leerConsulta(var c:consulta);
 begin
   writeln('Ingrese el numero de historia clinica');
   readln(c.numHistoria);
   if(c.numHistoria<>-1) then begin
   writeln('Ingrese el numero de consulta');
   readln(c.dl.numConsulta);
   writeln('Ingrese la fecha');
   readln(c.dl.fecha);
   writeln('Ingrese el tipo de consulta');
   readln(c.dl.tipoConsulta);
   writeln('Ingrese el costo de la consulta');
   readln(c.dl.costo);
end;
end;

procedure cargarArbol(var a:arbol; c:consulta);
begin
  if(a=nil) then begin
    new(a); a^.dato.l:=nil; a^.dato.numHistoria:=c.numHistoria; agregarAdelante(a^.dato.l,c.dl); a^.hi:=nil; a^.hd:=nil;
  end
  else if(c.numHistoria < a^.dato.numHistoria) then
    cargarArbol(a^.hi,c)
  else if(c.numHistoria > a^.dato.numHistoria) then
    cargarArbol(a^.hd,c)
  else
    agregarAdelante(a^.dato.l,c.dl)
end;

procedure generarArbol(var a:arbol);
var
  c:consulta;
begin
  a:=nil;
  leerConsulta(c);
  while(c.numHistoria<>-1) do begin
    cargarArbol(a,c);
    leerConsulta(c);
end;
end;

////////////////// INCISO B //////////////////////////////////

procedure imprimir(l:lista);
var
  aux:lista;
begin
  aux:=l;
  while(aux<>nil) do begin
    writeln(aux^.dato.numConsulta);
    writeln(aux^.dato.fecha);
    writeln(aux^.dato.tipoConsulta);
    writeln(aux^.dato.costo);
    aux:=aux^.sig;
  end;
end;

procedure imprimirArbol(a:arbol);
begin
  if(a<>nil) then begin
    imprimirArbol(a^.hi);
    imprimir(a^.dato.l);
    imprimirArbol(a^.hd);
end;
end;

////////////////// INCISO C /////////////////////////////

procedure recorrerLista(l:lista; var cantmax,codmax:integer; codHistoria:integer);
var
  cont:integer;
  aux:lista;
begin
  cont:=0;
  aux:=l;
  while(aux<>nil) do begin
    cont:=cont + 1;
    aux:=aux^.sig;
  end;
  if(cont>= cantmax) then begin
    cantmax:=cont;
    codmax:=codHistoria;
  end;
end;

procedure buscarMax(a:arbol; var cantmax,codmax:integer);
begin
  if(a<>nil) then begin
    recorrerLista(a^.dato.l,cantmax,codmax,a^.dato.numHistoria);
    buscarMax(a^.hi,cantmax,codmax);
    buscarMax(a^.hd,cantmax,codmax);
  end;
end;

function calcularMax(a:arbol):integer;
var
  codMax,cantMax:integer;
begin
  codMax:=0;
  cantmax:=0;
  buscarMax(a,cantmax,codmax);
  calcularMax:=codmax;
end;

/////////////// INCISO D //////////////////////////

function contarNodos(l:lista):integer;
var
   aux:lista;
   cont:integer;
begin
  cont:=0;
  aux:=l;
  while(aux<>nil) do begin
    cont:= cont + 1;
    aux:=aux^.sig;
 end;
 contarNodos:=cont;
end;

procedure contarConsultas(a:arbol; valor:integer; var cant:integer);
begin
  if(a<>nil) then begin
    if(a^.dato.numHistoria = valor) then 
      cant:=contarNodos(a^.dato.l)
    else if(a^.dato.numHistoria < valor) then
      contarConsultas(a^.hd,valor,cant)
    else
      contarConsultas(a^.hi,valor,cant)
  end;
end;
function cantidadConsultas(a:arbol; v:integer):integer;
var
  cant:integer;
begin
  cant:=0;
  contarConsultas(a,v,cant);
  cantidadConsultas:=cant;
end;


///////////////// INCISO E //////////////////////////////

procedure cantSupera(l:lista; cos:real; var cant:integer);
var
  aux:lista;
begin
  aux:=l;
  while(aux<>nil) do begin
    if(aux^.dato.costo > cos) then
      cant:= cant + 1;
    aux:=aux^.sig;
  end;
end;


procedure recorrerSupera(a:arbol; cos:real; var cant:integer);
begin
  if(a<>nil) then begin
    recorrerSupera(a^.hi,cos,cant);
    recorrerSupera(a^.hd,cos,cant);
    cantSupera(a^.dato.l,cos,cant);
end;
end;
function superaCosto(a:arbol; cos:real):integer;
var
  cant:integer;
begin
  cant:=0;
  recorrerSupera(a,cos,cant);
  superaCosto:=cant;
end;

///////////////////////// INCISO F ///////////////////////////////////

function sumarT(l:lista):real;
var
  aux:lista;
  total:real;
begin
  total:=0;
  aux:=l;
  while(aux<>nil) do begin
    total:=total + aux^.dato.costo;
    aux:=aux^.sig;
      end;
    sumarT:=total;
end;

procedure recorrerTotales(a:arbol; v,f:integer; var total:real);
begin
   if(a<>nil) then begin
     if(a^.dato.numHistoria >= v) and (a^.dato.numHistoria <=f) then begin
       total:= total + sumarT(a^.dato.l);
       recorrerTotales(a^.hi,v,f,total);
      recorrerTotales(a^.hd,v,f,total);
      end
     else if(a^.dato.numHistoria < v) then
       recorrerTotales(a^.hd,v,f,total)
     else if(a^.dato.numHistoria > f) then 
       recorrerTotales(a^.hi,v,f,total)
    end;
 end;
function costosTotales(a:arbol; v,f:integer):real;
var
  total:real;
begin
  total:=0;
  recorrerTotales(a,v,f,total);
  costosTotales:=total;
end;
///////////// INCISO G /////////////////////

procedure cargarArboltotal(var ab:arbolb; a:datoarbol);
begin
  if(ab=nil) then begin
  new(ab); ab^.hi:=nil; ab^.hd:=nil; ab^.dato.numHistoria:= a.numHistoria; ab^.dato.total:= sumarT(a.l);
  end
  else if(a.numHistoria < ab^.dato.numHistoria) then
    cargarArboltotal(ab^.hi,a)
  else if(a.numHistoria > ab^.dato.numHistoria) then
    cargarArboltotal(ab^.hd,a)
  else
    ab^.dato.total:= ab^.dato.total + sumarT(a.l)
  end;

procedure cargarArb(var ab:arbolb; a:datoarbol);
var
  aux:lista;
begin
  aux:=a.l;
  while(aux<>nil) do begin
    cargarArboltotal(ab,a);
    aux:=aux^.sig;
  end;
end;
procedure generarArboltotal(var ab:arbolb; a:arbol);
begin
  if(a<>nil) then begin
    cargarArb(ab,a^.dato);
    generarArboltotal(ab,a^.hi);
    generarArboltotal(ab,a^.hd);
end;
end;
var
  a:arbol;
  ab:arbolb;
  v,f:integer;
  cos:real;
begin
  generarArbol(a);
  writeln('Arbol principal generado');
  imprimirArbol(a);
  writeln(calcularMax(a));
  writeln('Ingrese un valor');
  readln(v); 
  writeln(cantidadConsultas(a,v));
  writeln('Ingrese un valor de costo');
  readln(cos);
  writeln(superaCosto(a,cos));
  writeln('Ingrese dos valores');
  readln(v); readln(f);
  writeln(costosTotales(a,v,f));
  ab:=nil;
  generarArboltotal(ab,a);
  writeln('Arbol con totales generado');
end.  
  
  
///// Preguntar como recorrer la lista en el imprimirarbol, se puede igualando aux antes de entrar y hacerlo recursivo o con while mas simple
