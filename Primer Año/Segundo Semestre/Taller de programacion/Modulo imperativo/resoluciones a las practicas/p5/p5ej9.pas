{Una biblioteca necesita implementar un programa para procesar la información de los 
libros que administra. De cada libro se conoce: ISBN, código del autor y código de género 
(de 1 a 15). En el  programa se debe: 
a) Implementar un módulo que lea información de los libros y retorne una estructura de 
datos eficiente para la búsqueda por código de autor que contenga código de autor y 
una lista de todos sus libros. La lectura finaliza al ingresar un ISBN con el valor 0. 
b) Implementar un módulo que reciba la estructura generada en el inciso a), un código de 
autor y un código de género. El módulo debe retornar una lista que contenga un código 
de autor y la cantidad de libros para el código de género recibido, para cada autor cuyo 
código sea superior al código de autor recibido. 
c) Realizar un módulo recursivo que reciba la estructura generada en inciso b) y retorne 
cantidad y código de autor con mayor cantidad de libros.
}
program p5ej9;

type
  rangocod=1..15;
  
  datolista=record
    isbn:integer;
    genero:rangocod;
 end;
 
  libro=record
    cod:integer;
    dl:datolista;
  end;
  datolistaB= record
    cod:integer;
    total:integer;
  end;
  listaB = ^nodoB;
    nodoB=record
      dato:datolistaB;
      sig:listaB
    end;
  lista = ^nodo;
    nodo=record
      dato:datolista;
      sig:lista;
    end;
    
  datoarbol = record
    cod:rangocod;
    l:lista;
  end;
  arbol = ^nodoA;
    nodoA=record
      dato:datoarbol;
      hi:arbol; hd:arbol;
    end;
    
procedure leerLibro(var l:libro);
begin
  writeln('Ingrese el isbn');
 readln(l.dl.isbn);
 if(l.dl.isbn<>0) then begin
   writeln('Ingrese el codigo');
     readln(l.cod);
   writeln('Ingrese el codigo de genero');
     readln(l.dl.genero);
   end;
 end;
 procedure agregarAdelante(var l:lista; dl:datolista);
 var
   aux:lista;
 begin
   new(aux); aux^.dato:=dl; aux^.sig:=l; l:=aux;
 end;
 
 procedure iniciar(var dl:datoarbol; li:libro);
begin
  dl.cod:=li.cod;
  agregarAdelante(dl.l,li.dl);
end;

 procedure cargarArbol(var a:arbol; li:libro);
 begin
    if(a=nil) then begin
      new(a);
      iniciar(a^.dato,li);
      a^.hi:=nil; a^.hd:=nil;
    end
    else if(li.cod < a^.dato.cod) then
      cargarArbol(a^.hi,li)
    else if(li.cod > a^.dato.cod) then
      cargarArbol(a^.hd,li)
    else
      agregarAdelante(a^.dato.l,li.dl)
 end;
 procedure generar(var a:arbol);
 var
   li:libro;
 begin
   a:=nil;
   leerLibro(li);
   while(li.dl.isbn<>0) do begin
     cargarArbol(a,li);
     leerLibro(li);
   end;
 end;
// INCISO B ////////

//b) Implementar un módulo que reciba la estructura generada en el inciso a), un código de  autor y un código de género. El módulo debe retornar una lista que contenga un código de autor y 
// la cantidad de libros para el código de género recibido, para cada autor cuyo código sea superior al código de autor recibido. 

procedure agregarAdelanteB(var lb:listaB; dl:datolistaB);
var
  aux:listaB;
begin
  new(aux); aux^.dato:=dl; aux^.sig:=lb; lb:=aux;
end;

procedure crear(l:lista; var lb:listaB; genero,cod:integer);
var
  cant:integer;
  dl:datolistaB;
begin
  cant:=0;
  while(l<>nil) do begin
    if(l^.dato.genero = genero) then
      cant:=cant + 1;
    l:=l^.sig;
  end;
  dl.cod:=cod;
  dl.total:=cant;
  agregarAdelanteB(lb,dl);
end;
      
procedure crearListaB(a:arbol; var lb:listab; cod,genero:integer);
begin
  if(a<>nil) then begin
    if(a^.dato.cod > cod) then begin
      crear(a^.dato.l,lb,genero,a^.dato.cod);
      crearListaB(a^.hi,lb,cod,genero);
      crearListaB(a^.hd,lb,cod,genero);
    end
    else if(a^.dato.cod <= cod) then
      crearListaB(a^.hi,lb,cod,genero)
    end;
  end;
    
procedure cantSuperior(a:arbol; var l:listaB);
var
  cod,genero:integer;
begin
  l:=nil;
  writeln('Ingrese un codigo'); readln(cod);
  writeln('Ingrese un genero'); readln(genero);
  crearListaB(a,l,cod,genero);
end;

///////// INCISO C //////////////
//c) Realizar un módulo recursivo que reciba la estructura generada en inciso b) y retorne  cantidad y código de autor con mayor cantidad de libros.

procedure recorrerLb(l:listaB; var max,cod:integer);
begin
  if(l<>nil) then begin
    if(l^.dato.total > max) then begin
      max:=l^.dato.total;
      cod:=l^.dato.cod;
    end;
  recorrerLb(l^.sig,max,cod);
end;
end;
procedure mayorCant(l:listab);
var
  max,cod:integer;
begin
  max:=-1; cod:=0;
  recorrerLb(l,max,cod);
  writeln('cantidad ', max , ' codigo autor ',  cod);
end;
var
  a:arbol;
  l:listaB;
begin
  generar(a); writeln('Arbol generado');
  cantSuperior(a,l);
  mayorCant(l);
end.
