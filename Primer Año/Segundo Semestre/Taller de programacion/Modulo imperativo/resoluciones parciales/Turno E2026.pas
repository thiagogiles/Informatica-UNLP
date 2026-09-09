{
Un corralón necesita un sistema para procesar la información de pedidos a proveedores. De cada pedido se conoce: CUIT del proveedor, código de sucursal (1 a 20), fecha de pedido y monto.

a) Implementar un módulo que lea información de los pedidos. La lectura finaliza al ingresar el CUIT 0. Este módulo debe retornar:

i. Una estructura de datos eficiente para la búsqueda por CUIT. Para cada CUIT debe almacenarse una lista de sus pedidos.

ii. Una estructura de datos que almacene la cantidad de pedidos por cada sucursal.

b) Realizar un módulo que reciba la estructura generada en el inciso a) i., un monto y un CUIT. El módulo debe retornar la cantidad de pedidos que superen el monto para dicho CUIT.

c) Realizar un módulo recursivo que reciba la estructura generada en inciso a) ii. y retorne el código de sucursal con mayor cantidad de pedidos.

}
program TurnoE_2026;
const
  dimf=20;
type
  rangocod=1..dimf;
  rangodia=1..31;
  rangomes=1..12;
  rangoanio=1..2026;
  f=record
    dia:rangodia;
    mes:rangomes;
    anio:rangoanio;
  end;
  datolista=record
    cod:rangocod;
    fecha:f;
    monto:real;
 end;
  pedido=record
    cuit:integer;
    dl:datolista;
  end;
  
  vector = array [rangocod] of integer;
  
  lista = ^nodo;
  nodo=record
    dato:datolista;
    sig:lista;
  end;
  
  datoarbol=record
    cuit:integer;
    l:lista;
  end;
    
    arbol=^nodoA;
    nodoA=record
      dato:datoarbol;
      hi:arbol; hd:arbol;
   end;
   
 procedure leerPedido(var p:pedido);
 begin
   writeln('Ingrese el CUIT');
   readln(p.cuit);
   if(p.cuit<>0) then begin
     writeln('Ingrese el codigo de sucursal');
     readln(p.dl.cod);
     writeln('Ingrese el monto');
     readln(p.dl.monto);
     writeln('Ingrese el dia');
     readln(p.dl.fecha.dia);
     writeln('Ingrese el mes');
     readln(p.dl.fecha.mes);
     writeln('Ingrese el anio');
     readln(p.dl.fecha.anio);
 end;
end;

procedure inicializarVector(var v:vector);
var
  i:rangocod;
begin
  for i:= 1 to dimf do 
    v[i]:=0;
  end;
  
procedure agregarAdelante(var l:lista; dl:datolista);
var
  aux:lista;
begin
  new(aux); aux^.dato:=dl; aux^.sig:=l; l:=aux;
end;

procedure iniciar(var d:datoarbol; p:pedido);
begin
  d.cuit:=p.cuit;
  d.l:=nil;
  agregarAdelante(d.l,p.dl);
end;  
procedure cargarArbol(var a:arbol; p:pedido);
begin
  if(a=nil) then begin
    new(a);
    iniciar(a^.dato,p);
    a^.hi:=nil; a^.hd:=nil;
  end
  else if(p.cuit < a^.dato.cuit) then
    cargarArbol(a^.hi,p)
  else if(p.cuit > a^.dato.cuit) then
    cargarArbol(a^.hd,p)
  else
    agregarAdelante(a^.dato.l,p.dl)
 end;
procedure generar(var v:vector; var a:arbol);
var
  p:pedido;
begin
  inicializarVector(v);
  a:=nil;
  leerPedido(p);
  while(p.cuit<>0) do begin
    cargarArbol(a,p);
    v[p.dl.cod] := v[p.dl.cod] + 1;
    leerPedido(p);
 end;
end;

///////////////////// INCISO B ///////////////////////////////
// b) Realizar un módulo que reciba la estructura generada en el inciso a) i., un monto y un CUIT. El módulo debe retornar la cantidad de pedidos que superen el monto para dicho CUIT.

function contar(l:lista; monto:real):integer;
var
  cant:integer;
begin
  cant:=0;
  while(l<>nil) do begin
    if(l^.dato.monto > monto) then
      cant:=cant + 1;
    l:=l^.sig;
  end;
  contar:=cant;
end;

function buscarMonto(a:arbol; monto:real; cuit:integer):integer;
begin
  if(a=nil) then
    buscarMonto:=0
  else begin
    if(a^.dato.cuit < cuit) then
     buscarMonto:= buscarMonto (a^.hd,monto,cuit)
   else if(a^.dato.cuit > cuit) then
     buscarMonto:= buscarMonto(a^.hi,monto,cuit)
   else
     buscarMonto:= contar(a^.dato.l,monto)
end;
end;
function superaMonto(a:arbol):integer;
var
  monto:real;
  cuit:integer;
begin
  writeln('Ingrese el cuit a buscar'); readln(cuit);
  writeln('Ingrese el monto a buscar'); readln(monto);
  superaMonto:=buscarMonto(a,monto,cuit);
end;

////////////// INCISO C ///////////////////////////////////
// c) Realizar un módulo recursivo que reciba la estructura generada en inciso a) ii. y retorne el código de sucursal con mayor cantidad de pedidos

function buscarMax(v:vector; max,codmax,i:integer):integer;
begin
  if(i>dimf) then
    buscarMax:=codmax
  else begin
    if(v[i] > max) then begin
      max:=v[i];
      codmax:=i;
    end;
    buscarMax:= buscarMax(v,max,codmax, i + 1);
end;
end;
function maxSucursal(v:vector):integer;
var
  max,codmax,i:integer;
begin
  i:=1; max:=0; codmax:=0;
  maxSucursal:= buscarMax(v,max,codmax,i);
end;
///////////// PROGRAMA PRINCIPAL /////////////////////
var
  v:vector;
  a:arbol;
begin
  generar(v,a); writeln('Arbol y vector generados');
  writeln(superaMonto(a) , ' pedidos que superan el monto en ese CUIT');
  writeln('la sucursal con mas pedidos es ', maxSucursal(v));
end.
