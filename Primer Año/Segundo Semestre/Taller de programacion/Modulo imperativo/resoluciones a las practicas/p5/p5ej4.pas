{ La Feria del Libro necesita implementar un programa para obtener estadísticas sobre los 
libros presentados. El programa debe contener los siguientes módulos:  
a) Un módulo que lea información de los libros. De cada libro se conoce: ISBN, código del 
autor y código del género (1: literario, 2: filosofía, 3: biología, 4: arte, 5: computación, 
6: medicina, 7: ingeniería) . La lectura finaliza con el valor 0 para el  ISBN (se sugiere 
utilizar el módulo para leer un libro que se especifica más abajo).  
Se debe retornar dos estructuras de datos: 
i) Un árbol binario de búsqueda ordenado por código de autor. Para cada código 
de autor debe almacenarse la cantidad de libros correspondientes al código. 
ii) Un vector que almacena para cada género, el código del género y la cantidad 
de libros del género. 
b) Implementar un módulo que reciba el vector generado en el inciso a) y lo ordene por 
cantidad de libros de mayor a menor. 
c) Implementar un módulo que retorne el nombre de género con mayor cantidad 
cantidad de libros. 
d) Implementar un módulo que reciba el árbol generado en el inciso a) y dos códigos de 
autores. El módulo debe retornar la cantidad total de libros correspondientes a los 
códigos de autores entre los dos códigos ingresados (incluidos ambos). 
}

program p5ej4;

type  
  subGenero = 1..7;  
  libro = record 
    isbn: integer; 
    codAutor: integer; 
    genero: subGenero; 
  end;
  
  datovector = record
    cant:integer;
    cod:subgenero;
 end;
 vector = array [subGenero] of datovector;

 datoarbol= record
    codAutor:integer;
    totalLibros:integer;
 end;
 
arbol = ^nodo;
  nodo=record
    dato:datoarbol;
    hi:arbol; hd:arbol;
 end;
procedure leerLibro(var l:libro);
begin
  writeln('Ingrese un isbn');
  readln(l.isbn);
  if(l.isbn<>0) then begin
    writeln('Ingrese el codigo de autor');
    readln(l.codAutor);
    writeln('Ingrese el genero');
    readln(l.genero);
 end;
end;

procedure inicializarVector(var v:vector);
var
  i:integer;
begin
  for i:= 1 to 7 do 
    v[i].cant:=0;
  end;

procedure actuVec(var v:vector; l:libro);
begin
  v[l.genero].cant := v[l.genero].cant + 1;
  v[l.genero].cod:= l.genero;
end;

procedure inicializar(var a:datoarbol; l:libro);
begin
  a.codAutor := l.codAutor;
  a.totalLibros := 1;
end;

procedure cargarArbol(var a:arbol; l:libro);
begin
  if(a=nil) then begin
    new(a);
    inicializar(a^.dato,l);
    a^.hi:=nil; a^.hd:=nil;
  end
  else if(l.codAutor < a^.dato.codAutor) then
    cargarArbol(a^.hi,l)
  else if(l.codAutor > a^.dato.codAutor) then
    cargarArbol(a^.hd,l)
  else
    a^.dato.totalLibros:= a^.dato.totalLibros + 1
  end;
  
procedure generarArbol(var a:arbol; var v:vector);
var
  l:libro;
begin
  inicializarVector(v);
  a:=nil;
  leerLibro(l);
  while(l.isbn<>0) do begin
    cargarArbol(a,l);
    actuVec(v,l);
    leerLibro(l);
end;
end;

procedure ordenar( var v:vector);
var
  i,j,pos,item:integer;
begin
  for i:= 1 to (7-1) do begin
    pos:=i;
    for j:= (i+1) to 7 do
      if v[j].cant < v[pos].cant then pos:=j;
     item:= v[pos].cant;
     v[pos] := v[i];
     v[i].cant := item;
   end;
end;

procedure recorrerVec(v:vector; var max,codmax:integer);
var
  i:integer;
begin
  for i:= 1 to 7 do begin
    if(v[i].cant > max) then begin
      max:=v[i].cant;
      codmax:=v[i].cod;
    end;
 end;
end;

function maximoLib(v:vector):integer;
var
  max,codmax:integer;
begin
  max:=0; codmax:=0;
  recorrerVec(v,max,codmax);
  maximoLib:=codmax;
end;
var
  a:arbol;
  v:vector;

function buscarEntreDos(a:arbol; sup,inf:integer):integer;
begin
  if(a=nil) then
    buscarEntreDos:=0
  else begin
    if(a^.dato.codAutor <= sup) and (a^.dato.codAutor >= inf) then
      buscarEntreDos:= a^.dato.totalLibros + buscarEntreDos(a^.hi,sup,inf) + buscarEntreDos(a^.hd,sup,inf)
    else if(a^.dato.codAutor > sup) then
      buscarEntreDos:= buscarEntreDos(a^.hi,sup,inf)
    else
      buscarEntreDos:=buscarEntreDos(a^.hd,sup,inf)
   end;
end;

function entreDos(a:arbol):integer;
var
  sup,inf:integer;
begin
  writeln('Ingrese el limite superior');
  readln(sup);
  writeln('Ingrese el limite inferior');
  readln(inf);
  entreDos:=buscarEntreDos(a,sup,inf);
end;

begin
  generarArbol(a,v); writeln('Arbol y vector generados');
  ordenar(v);
  writeln('El codigo de genero con mayor cantidad de libros es: ', maximoLib(v));
  writeln('Hay ' , entredos(a) , ' libros entre ese rango de codigos');
end.
