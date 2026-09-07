{Un supermercado necesita implementar un programa para procesar la información de sus 
ventas. De cada venta se conoce: DNI de cliente, código de sucursal (1..10), número de 
factura y monto total de la venta. En el  programa se debe: 
a) Implementar un módulo que lea información de las ventas. La lectura finaliza al 
ingresar DNI de cliente igual a  0 y se debe retornar dos estructuras de datos: 
i) 
Una estructura de datos eficiente para la búsqueda por DNI de cliente. Para cada 
DNI debe almacenarse una lista de todas sus compras (número de factura y monto 
total). 
ii) 
Una estructura de datos que almacene la cantidad de ventas para cada sucursal. 
b) Implementar un módulo que reciba la estructura generada en el inciso a) i), un monto y 
un DNI. El módulo debe retornar  la cantidad de facturas cuyo monto es superior al 
monto recibido para el DNI recibido. 
c) Implementar un módulo recursivo que reciba la estructura generada en inciso a) ii) y 
retorne el código de sucursal con mayor cantidad de ventas.
}
program p5ej8;
type
  rangocod=1..10;
 venta=record
    dni:integer;
    cod:rangocod;
    num:integer;
    monto:real;
 end;
 
vector = array [rangocod] of integer;

  datolista=record
    num:integer;
    monto:real;
  end;

lista = ^nodo;
  nodo=record
    dato:datolista;
    sig:lista;
 end;
 
datoarbol= record
  dni:integer;
  l:lista;
end;

 
arbol= ^nodoA;
  nodoA = record
    dato:datoarbol;
    hi:arbol; hd:arbol;
  end;
  
procedure leerVenta(var ve:venta);
begin
  writeln('Ingrese el dni');
  readln(ve.dni);
  if(ve.dni<>0) then begin
    writeln('Ingrese el codigo de sucursal');
    readln(ve.cod);
    writeln('Ingrese el numero de factura');
    readln(ve.num);
    writeln('Ingrese el monto total');
    readln(ve.monto);
 end;
 end;
 
 procedure iniciarVector(var v:vector);
 var
   i:integer;
begin
  for i:= 1 to 10 do begin
    v[i]:=0;
 end;
end;

procedure agregarAdelante(var l:lista; dl:datolista);
var
  aux:lista;
begin
  new(aux); aux^.dato:=dl; aux^.sig:=l; l:=aux;
end;

procedure iniciar(var d:datoarbol; ve:venta);
var
  dl:datolista;
begin
  d.dni:=ve.dni;
  dl.num:=ve.num;
  dl.monto:=ve.monto;
  agregarAdelante(d.l,dl);
end;

procedure actu(var l:lista; ve:venta);
var
  dl:datolista;
begin
  dl.num:=ve.num;
  dl.monto:=ve.monto;
  agregarAdelante(l,dl);
end;
procedure cargarArbol(var a:arbol;  ve:venta);
begin
  if(a=nil) then begin
    new(a);
    iniciar(a^.dato,ve);
    a^.hi:=nil; a^.hd:=nil;
  end
  else if(ve.dni < a^.dato.dni) then
    cargarArbol(a^.hi,ve)
  else if(ve.dni > a ^.dato.dni) then
    cargarArbol(a^.hd,ve)
  else
    actu(a^.dato.l,ve);
end;

 procedure generar(var a:arbol; var v:vector);
 var
   ve:venta;
 begin
   a:=nil;
   iniciarVector(v);
   leerVenta(ve);
   while(ve.dni<>0) do begin
     cargarArbol(a,ve);
     v[ve.cod]:= v[ve.cod] + 1;
     leerVenta(ve);
   end;
end;

/////////////// INCISO B //////////////////
//Implementar un módulo que reciba la estructura generada en el inciso a) i), un monto y  un DNI. El módulo debe retornar  la cantidad de facturas cuyo monto es superior al monto recibido para el DNI recibido. 

function contar(l:lista; monto:real):integer;
begin
  if(l=nil) then 
    contar:=0
  else begin
    if(l^.dato.monto > monto) then
      contar:= 1 + contar(l^.sig,monto)
    else
      contar:= contar(l^.sig,monto)
    end;
end;
function contarMayor(a:arbol; monto:real; dni:integer):integer;
begin
  if(a=nil) then 
    contarMayor:=0
  else begin
    if(a^.dato.dni = dni) then
      contarMayor:=contar(a^.dato.l,monto)
    else if(a^.dato.dni < dni) then
      contarMayor:= contarMayor(a^.hd,monto,dni)
    else
      contarMayor:= contarMayor(a^.hi,monto,dni)
 end;
end;
function esMayor(a:arbol):integer;
var
  monto:real;
  dni:integer;
begin
  writeln('Ingrese un monto a buscar'); readln(monto);
  writeln('Ingrese un dni a buscar'); readln(dni);
  esMayor:=contarMayor(a,monto,dni);
end;

////////////////////////////// INCISO C ////////////////////////////////

function buscarMayor(v:vector; i,max,codmax:integer):integer;
begin
  if(i> 10 ) then
    buscarMayor:=codmax
  else begin
    if(v[i] > max) then begin
      max:=v[i];
      codmax:=i;
    end;
    buscarMayor:=buscarMayor(v,i+1,max,codmax)
  end
end;

function codMayor(v:vector):integer;
var
  i,max,codmax:integer;
begin
  i:=1; max:=-1; codmax:=0;
  codMayor:=buscarMayor(v,i,max,codmax);
end;

var
  a:arbol;
  v:vector;
begin
  generar(a,v); writeln('Arbol y vector generados');
  writeln(esMayor(a), 'facturas con monto mayor al pasado para ese dni');
  writeln(codMayor(v), ' es el codigo con mayor cantidad de ventas');
end.
