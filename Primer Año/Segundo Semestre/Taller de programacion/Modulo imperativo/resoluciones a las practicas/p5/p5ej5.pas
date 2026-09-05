{La Feria del Artesano necesita implementar un programa para obtener estadísticas sobre 
las artesanías presentadas. En el programa se pide: 
a) Implementar un módulo que lea información de las artesanías. De cada artesanía se 
conoce: código de identificación de la artesanía, DNI del artesano y nombre del 
material base. La lectura finaliza con el valor 0 para el  DNI. Este módulo debe retornar 
dos estructuras de datos: 
i) 
ii) 
Un árbol binario de búsqueda ordenado por el DNI del artesano. Para cada DNI del 
artesano debe almacenarse la cantidad de artesanías correspondientes. 
Una lista que almacene en cada nodo el nombre del material base y la cantidad 
total de artesanías de ese material. 
b) Implementar un módulo que reciba el árbol generado en el inciso a)i), y un DNI. El 
módulo debe retornar la cantidad de artesanos con DNI menor al DNI ingresado. 
c) Implementar un módulo recursivo que reciba la lista generada en el inciso a)ii) y 
retorne el nombre de material base con mayor cantidad de artesanías. 
}
program p5ej5;

type
  artesania= record
    cod:integer;
    dni:integer;
    nombre:string;
 end;
 
  datoarbol = record
    dni:integer;
    total:integer;
 end;
 
 datolista= record
    nombre:string;
    total:integer;
end;

lista = ^nodo;
  nodo=record
    dato:datolista;
    sig:lista;
  end;
  
  arbol =  ^nodoA;
  nodoA=record
    dato:datoarbol;
    hi:arbol; hd:arbol;
  end;
  
procedure leerArtesania(var art:artesania);
begin
  writeln('Ingrese el dni');
  readln(art.dni);
  if(art.dni<>0) then begin
    writeln('Ingrese el codigo');
    readln(art.cod);
    writeln('Ingrese el nombre');
    readln(art.nombre);
  end;
end;

procedure iniciar(var d:datoarbol; art:artesania);
begin
  d.dni:= art.dni;
  d.total:= 1;
end;

procedure cargarArbol(var a:arbol; art:artesania);
begin
  if(a=nil) then begin
    new(a);
    iniciar(a^.dato,art);
    a^.hi:=nil;
    a^.hd:=nil;
  end
  else if(art.dni < a^.dato.dni) then
    cargarArbol(a^.hi,art)
  else if(art.dni > a^.dato.dni) then
    cargarArbol(a^.hd,art)
  else
    a^.dato.total:= a^.dato.total + 1
  end;

procedure agregarAdelante(var l:lista; n:string);
var
  aux:lista;
begin
  new(aux); aux^.dato.nombre:=n; aux^.dato.total:= 1; aux^.sig:=l; l:=aux;
end;

procedure cargarLista(var l:lista; art:artesania);
var
  aux:lista;
begin
  aux:=l;
  while(aux<>nil) and (aux^.dato.nombre <> art.nombre) do begin
    aux:=aux^.sig;
  end;
    if(aux<>nil) then
      aux^.dato.total:= aux^.dato.total + 1
    else 
      agregarAdelante(l,art.nombre)
  end;

procedure generar(var a:arbol; var l:lista);
var
  art:artesania;
begin
  a:=nil;
  l:=nil;
  leerArtesania(art);
  while(art.dni<>0) do begin
    cargarArbol(a,art);
    cargarLista(l,art);
    leerArtesania(art);
 end;
 end;

///////////// INCISO B /////////////////////

function contarMenores(a:arbol; dni:integer):integer;
begin
  if(a=nil) then
     contarMenores:=0
   else begin
     if(a^.dato.dni >= dni) then
       contarMenores := contarMenores(a^.hi,dni)
     else 
        contarMenores := 1 + contarMenores(a^.hi,dni) + contarMenores(a^.hd,dni)
  end;
end;

function menores(a:arbol):integer;
var
  dni:integer;
begin
  writeln('Ingrese el dni');
  readln(dni);
  menores:=contarMenores(a,dni);
end;

//////// INCISO C ///////////

procedure recorrerLista(l:lista; var max:integer; var nombremax:string);
begin
  if(l<>nil) then begin
    if(l^.dato.total > max) then begin
      max:=l^.dato.total;
      nombremax:=l^.dato.nombre;
    end;
    recorrerLista(l^.sig,max,nombremax);
 end;
end;

function masNodos(l:lista):string;
var
  max:integer;
  nombreMax:string;
begin
  max:=0;
  recorrerLista(l,max,nombremax);
  masNodos:=nombremax;
end;

var
  l:lista;
  a:arbol;
begin
  generar(a,l); writeln('Arbol y lista generados');
  writeln(menores(a) , ' nodos con dni menor al ingresado');
  writeln('El nombre con mas nodos es ', masNodos(l));
end.
