{ Una empresa de logística necesita implementar un programa para procesar los envíos 
realizados durante 2026. De cada envío se conoce el código del cliente, día, mes, código 
postal de destino y peso del paquete. En el  programa se debe: 
a) Implementar un módulo que lea los envíos, genere y retorne un árbol binario de 
búsqueda ordenado por código postal, donde para cada código postal se almacenen la 
cantidad de paquetes enviados por mes. La lectura finaliza con código de cliente 0. 
b) Implementar un módulo que reciba la estructura generada en el inciso a), un código 
postal y un valor entero. El módulo debe retornar la cantidad de meses cuya cantidad 
supere al valor entero recibido para el código postal recibido. 
c) Implementar un módulo que reciba la estructura generada en el inciso a), dos códigos 
postales y retorne los códigos postales dentro de los dos códigos recibidos (incluirlos), 
que tuvieron al menos un mes sin envíos.  
}
program p5ej6;

type
rangodia=1..31;
rangomes=1..12;
  envio=record
    codCli:integer;
    dia:rangodia;
    mes:rangomes;
    codPostal:integer;
    peso:real;
 end;
 vector = array[rangomes] of integer;
 datoArbol = record
    codPostal:integer;
    v:vector;
  end;
  
arbol = ^nodo;
nodo=record
  dato:datoarbol;
  hi:arbol; hd:arbol;
end;

procedure inicializarVector(var v:vector);
var
  i:integer;
begin
  for i:= 1 to 12 do 
    v[i]:=0;
  end;
  
procedure leerEnvio(var e:envio);
begin
  writeln('Ingrese su codigo de cliente');
  readln(e.codCli);
  if(e.codcli<>0 ) then begin
    writeln('Ingrese el dia');
    readln(e.dia);
    writeln('Ingrese el mes');
    readln(e.mes);
    writeln('Ingrese el codigo de postal');
    readln(e.codPostal);
    writeln('Ingrese el peso');
    readln(e.peso);
  end;
end;

procedure iniciar(var d:datoarbol; e:envio);
begin
  d.codPostal:= e.codPostal;
  inicializarVector(d.v);
  d.v[e.mes]:=d.v[e.mes] + 1;
end;

procedure cargarArbol (var a:arbol; e:envio);
begin
  if(a=nil) then begin
    new(a);
    iniciar(a^.dato,e);
    a^.hi:=nil; a^.hd:=nil;
  end
  else if(a^.dato.codPostal < e.codpostal)then
    cargarArbol(a^.hd,e)
  else if(a^.dato.codPostal > e.codPostal) then
    cargarArbol(a^.hi,e)
  else
    a^.dato.v[e.mes]:=a^.dato.v[e.mes] + 1
 end;
 

procedure generarArbol(var a:arbol);
var
  e:envio;
begin
  a:=nil;
  leerEnvio(e);
  while(e.codCli<>0) do begin
    cargarArbol(a,e);
    leerEnvio(e);
 end;
end;

/////////////// INCISO B /////////////////

function contar(v:vector; valor:integer):integer;
var
  cant,i:integer;
begin
  cant:=0;
  for i:= 1 to 12 do begin
    if(v[i] > valor) then
      cant:= cant  +1;
  end;
  contar:=cant;
end;

function meses(a:arbol; cod,valor:integer):integer;
begin
  if(a=nil) then
    meses:=0
  else begin
    if(a^.dato.codPostal = cod) then
      meses:=contar(a^.dato.v, valor)
    else if(a^.dato.codPostal < cod) then
      meses:= meses(a^.hd,cod,valor)
    else
      meses:=meses(a^.hi,cod,valor)
    end;
 end;
function contarMeses(a:arbol):integer;
var
  cod,valor:integer;
begin
  writeln('Ingrese un codigo postal'); readln(cod);
  writeln('Ingrese un valor'); readln(valor);
  contarMeses:= meses(a,cod,valor);
end;


///////////////// INCISO C /////////////////////////

function sumar(v:vector):integer;
var
  cant,i:integer;
begin
  cant:=0; i:=1;
  while(cant = 0) and (i< 12) do begin
    if(v[i]= 0) then
      cant:= cant + 1;
    i:=i + 1;
 end;
sumar:=cant;
end;
    
function contarEnvios(a:arbol; sup,inf:integer):integer;
begin
  if(a=nil) then
    contarEnvios:=0
  else begin
    if(a^.dato.codPostal <= sup) and (a^.dato.codPostal >= inf) then
      contarEnvios:= sumar(a^.dato.v) + contarEnvios(a^.hi,sup,inf) + contarEnvios(a^.hd,sup,inf)
    else if(a^.dato.codPostal > sup) then
      contarEnvios:= contarEnvios(a^.hi,sup,inf)
    else
      contarEnvios:= contarEnvios(a^.hd,sup,inf)
    end;
 end;
 
function sinEnvios(a:arbol):integer;
var
  sup,inf:integer;
begin
  writeln('Ingrese el limite superior'); readln(sup);
  writeln('Ingrese el limite inferior'); readln(inf);
  sinEnvios:=contarEnvios(a,sup,inf);
end;
var
  a:arbol;
begin
  generarArbol(a); writeln('Arbol generado');
  writeln(contarMeses(a), ' para ese codigo postal y valor' );
  writeln(sinEnvios(a), ' vectores con al menos un mes sin envio entre esos limites');
end.
