{Una librería tiene una estructura de datos con sus 	libros, de cada libro se conoce el titulo y sus paginas, cada pagina tiene numero de pagina y cantidad de palabras. 
las paginas estan ennumeradas de 1 a 500. Se pide realizar un modulo que cuente para cada libro las paginas repetidas o vacias y retorne el total de ambas por libro.
 Utilizar ese algoritmo para corregir los 1000 libros de la librería, se debe informar cuantos libros... algo q no me acuerdo.}
 
program final;
const
  dimf=500;
type
  vector = array [1..dimf] of integer;
  
  datopagina=record
    numPagina:integer;
    cantPalabras:integer;
  end;

  pagina = ^nodopagina;
  nodopagina = record;
    dato:datopagina;
    sig:pagina;
  end;
  
  libro = record
    titulo:string;
    pagina:lista;
  end;
  
  libreria = ^nodolibreria
   nodolibreria=record
    dato:libro;
    sig:libreria;
  end;
  
procedure contarPaginas(l:libro; var v:vector);
var
  cant:integer;
begin
  while(l<>nil) do begin
    v[l^.dato.numPagina] := v[l^.dato.numPagina] + 1;
    l:=l^.sig;
  end;
  recorrerVector(v);
end;

procedure  recorrerVector(v:vector);
var
  total,i:integer;
begin
  total:=0;
  for i:= 1 to dimf do begin
    if(v[i] <> 1) then
      total:= total + 1;
    end;
  writeln('El libro tiene una cantidad de ', total , ' paginas repetidas y vacias');
end;

procedure repetir(l:libreria);
var
  v:vector;
  i:integer;
begin
  for i:= 1 to 1000 do begin
    inicializarVector(v);
    contarPaginas(l^.dato,v);
  end;
end;
var
  l:libreria;
begin
  l:nil;
  cargarLibreria(l);
  repetir(l);
end;


