{Netflix ha publicado la lista de películas que estarán disponibles durante el mes de septiembre de 2025. De cada película se conoce: código de película, código de género
(1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. Implementar un programa que
invoque a módulos para cada uno de los siguientes puntos:

A) Lea los datos de películas, almacenarlos por orden de llegada y agrupados por código de género, y retornar en una estructura de datos adecuada. La lectura
 finaliza cuando se lee el código de la película -1.
B) Genere y retorne en un vector, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas, a partir de la estructura generada en a).
C) Ordene los elementos del vector generado en b) por puntaje utilizando el método visto en la teoría.
D) Muestre el código de película con mayor puntaje y el código de película conmenor puntaje, del vector obtenido en el punto c)
}

program p1ej3;
type
  numgenero= 1..8;
    pelicula = record
    codigo:integer;
    genero: numgenero;
    puntaje:real;
 end;
 
  lista = ^nodo;
    nodo=record
    dato:pelicula;
    sig:lista;
  end;
  
  vector = array [1..8] of lista;
   vmax = array [1..8] of pelicula;
 procedure leer(var p:pelicula);
 begin
   writeln('Ingrese el codigo de pelicula');
   readln(p.codigo);
   if(p.codigo<>-1) then begin
     writeln('Ingrese el numero de genero');
     readln(p.genero);
     writeln('Ingrese el puntaje promedio');
     readln(p.puntaje);
   end;
 end;

procedure inicializar(var v:vector);
var
  i:integer;
begin
  for i:=1 to 8 do begin
      v[i]:=nil;
     end;
  end;

procedure inicializarV(var v:vmax);
var
  i:integer;
begin
  for i:=1 to 8 do begin
    v[i].codigo:=0;
    v[i].puntaje:=0;
  end;
end;
procedure agregarAtras(var l,ult:lista; p:pelicula);
var
  aux:lista;
begin
  new(aux);
  aux ^.dato:=p;
  if(l=nil) then
    l:=aux
  else 
    ult^.sig:=aux;
  ult:=aux;
 end;

 procedure incisoA(var v:vector);
 var
   p:pelicula;
   ult:lista;
 begin
   inicializar(v);
   leer(p);
   while(p.codigo<>-1) do begin
     agregarAtras(v[p.genero],ult,p);
     leer(p);
   end;
 end;
 
 procedure leerLista(l:lista; var max:integer; var punt:real);
 begin
   max:=0; punt:=0;
   while(l<>nil) do begin
     if(l^.dato.puntaje > punt) then begin
         punt:=l^.dato.puntaje;
         max:=l^.dato.codigo;
     end;
   l:=l^.sig;
  end;
end;

 procedure incisoB(v:vector; var vm:vmax);
 var
   i,max:integer;
   punt:real;
begin
  for i:= 1 to 8 do begin
        leerLista(v[i],max,punt);
        vm[i].codigo:=max;
        vm[i].puntaje:=punt;
    end;
end;

procedure incisoC( var v:vmax);
var
  i,j,pos,diml:integer;
  item:real;
begin
  diml:=8;
  for i:= 1 to (diml-1) do begin
    pos:=i;
    for j:= (i+1) to diml do
      if v[j].puntaje < v[pos].puntaje then pos:=j;
     item:= v[pos].puntaje;
     v[pos] := v[i];
     v[i].puntaje := item;
   end;
end;
   
procedure incisoD(v:vmax);
begin
  writeln(v[1].codigo);
  writeln(v[8].codigo);
end;

var
  v:vector;
  vm:vmax;
begin
  inicializarV(vm);
  incisoA(v);
  incisoB(v,vm);
  incisoC(vm);
  incisoD(vm);
end.
 
