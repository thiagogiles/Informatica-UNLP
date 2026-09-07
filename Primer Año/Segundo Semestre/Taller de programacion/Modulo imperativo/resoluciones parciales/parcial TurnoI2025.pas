{Una casa de repuestos de automotores necesita un sistema para manejar el stock de repuestos. 
a) Implementar un módulo que lea información de los repuestos y retorne un árbol binario de búsqueda ordenado por código de marca, donde por cada código de marca agrupe los repuestos 
por código de modelo de automóvil
 (cada código de marca podrá tener a lo sumo 15 códigos de modelos de automóviles.) De cada repuesto se lee: código de marca de automóvil, código de modelo (1..15), stock, año fabricación.
 La lectura finaliza al ingresar el código de marca 0. b) Realice un módulo que reciba la estructura generada en a), un código de marca M y retorne una lista ordenada por código con aquellos repuestos 
 pertenecientes al código de marca M cuyo stock es menor a 3. c) Realice un módulo recursivo que reciba la estructura generada en b) y retorne la cantidad de repuestos cuyo stock es igual a 1.
}

program TurnoI2025;
type
  rangomod=1..15;
  datolista = record
    stock:integer;
    fabricacion:integer;
  end;
  repuesto = record
    marca:integer;
    modelo:rangomod;
    dl:datolista;
    end;

datolistaB = record
  modelo:rangomod;
  stock:integer;
  fabricacion:integer;
end;

listaB = ^nodoB;
  nodoB=record
    dato:datolistaB;
    sig:listaB;
 end;
lista = ^nodo;
  nodo=record
    dato:datolista;
    sig:lista;
 end;
 
vector = array [rangomod] of lista;
datoarbol= record
  marca:integer;
  v:vector;
end;

arbol = ^nodoA;
  nodoa=record
    dato:datoarbol;
    hi:arbol; hd:arbol;
end;
procedure inicializarVector(var v:vector);
var
  i:integer;
begin
  for i:= 1 to 15 do
    v[i]:=nil;
  end;
  
procedure leerRepuesto(var r:repuesto);
begin
  writeln('Ingrese codigo de marca');
  readln(r.marca);
  if(r.marca<>0) then begin
    writeln('Ingrese el ano fabricacion');
    readln(r.dl.fabricacion);
    writeln('Ingrese el modelo');
    readln(r.modelo);
    writeln('Ingrese la cantidad en stock');
    readln(r.dl.stock);
 end;
 end;
 
 procedure agregarAdelante(var l:lista; dl:datolista);
 var
   aux:lista;
 begin
   new(aux); aux^.dato:=dl; aux^.sig:=l; l:=aux;
end;

 procedure iniciar(var d:datoarbol; r:repuesto);
 begin
   d.marca:=r.marca;
   inicializarVector(d.v);
   agregarAdelante(d.v[r.modelo], r.dl);
 end;

 procedure cargarArbol(var a:arbol; r:repuesto);
 begin
   if(a=nil) then begin
     new(a);
     iniciar(a^.dato,r);
     a^.hi:=nil; a^.hd:=nil;
   end
   else if(r.marca < a^.dato.marca) then
     cargarArbol(a^.hi,r)
   else if(r.marca > a^.dato.marca) then
     cargarArbol(a^.hd,r)
   else
     agregarAdelante(a^.dato.v[r.modelo],r.dl)
end;
 procedure generarArbol(var a:arbol);
 var
   r:repuesto;
 begin
   a:=nil;
   leerRepuesto(r);
   while(r.marca <>0) do begin
     cargarArbol(a,r);
     leerRepuesto(r);
  end;
 end;
 
 //////////////// INCISO B //////////////////////////
 // b) Realice un módulo que reciba la estructura generada en a), un código de marca M y retorne una lista ordenada por código con aquellos repuestos 
 // pertenecientes al código de marca M cuyo stock es menor a 3. 
 
procedure agregarOrdenado(var lb:listaB; dl:datolista; i:integer);
var
  aux,ant,act:listaB;
begin
  new(aux); aux^.sig:=nil; aux^.dato.stock := dl.stock; aux^.dato.fabricacion:= dl.fabricacion; aux^.dato.modelo:= i;
  act:=lb; ant:=lb;
  while(act<>nil) and (act^.dato.modelo < i) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(act=ant) then
    lb:=aux
  else 
    ant^.sig:=aux;
  aux^.sig:=act;
end;

 procedure recorrerLista(l:lista; var lb:listaB; i:integer);
 begin
   while(l<>nil) do begin
     if(l^.dato.stock < 3) then
       agregarOrdenado(lb,l^.dato,i);
     l:=l^.sig;
   end;
end;

 procedure crearLista(v:vector; var lb:listaB);
 var 
   i:integer;
 begin
   for i:= 1 to 15 do begin
     if(v[i]<>nil) then 
       recorrerLista(v[i],lb,i);
   end;
end;     


procedure ordenar(a:arbol; marca:integer; var l:listaB);
 begin
    if(a<>nil) then begin
      if(a^.dato.marca < marca) then
        ordenar(a^.hd,marca,l)
      else if(a^.dato.marca > marca) then
        ordenar(a^.hi,marca,l)
      else
        crearLista(a^.dato.v,l)
  end;
end;
       
 procedure retornarOrdenada(a:arbol; var l:listaB);
 var
   marca:integer;
begin
  writeln('Ingrese una marca'); readln(marca);
  ordenar(a,marca,l);
end;
  
///////////////// INCISO C //////////////////////////
// c) Realice un módulo recursivo que reciba la estructura generada en b) y retorne la cantidad de repuestos cuyo stock es igual a 1

function contar(l:listaB):integer;
begin
  if(l=nil) then
    contar:=0
  else begin
    if(l^.dato.stock = 1) then
      contar:= 1 + contar(l^.sig);
    contar:= contar + contar(l^.sig);
 end;
end;

/////////////////////// CODIGO PRINCIPAL ////////////////////////////
var
  a:arbol;
  l:listaB;
begin
  generarArbol(a); writeln('Arbol generado');
  retornarOrdenada(a,l);
  writeln(contar(l), ' nodos con stock igual a 1');
end.
