{Un centro cultural desea procesar la información de las inscripciones a los talleres que 
ofrece. De cada inscripción se conoce: número de inscripción, código de taller, número de 
documento del participante y cantidad de clases a las que asistió. 
La lectura de las inscripciones finaliza cuando se ingresa el número de inscripción -1. 
Implementar un programa que invoque a los siguientes módulos y  compruebe el correcto 
funcionamiento del mismo. 
a. Un módulo que retorne la información de los talleres en una estructura de datos 
eficiente para la búsqueda por código de taller. De cada taller deben almacenarse: 
código de taller, cantidad total de participantes inscriptos y cantidad total de 
asistencias registradas. 
b. Un módulo que imprima el contenido de la estructura ordenado por código de taller. 
c. Un módulo que retorne el código del taller con mayor cantidad de participantes 
inscriptos. 
d. Un módulo que retorne la cantidad de talleres cuyos códigos sean menores que un 
valor recibido como parámetro. 
e. Un módulo que retorne la cantidad total de asistencias correspondientes a los talleres 
cuyos códigos se encuentren comprendidos entre dos valores recibidos como 
parámetros, sin incluir dichos valores.
}
program p4ej3;
type

taller = record
  cod:integer;
  inscriptos:integer;
  asistencias:integer;
end;

inscripcion = record
  num:integer;
  cod:integer;
  dni:integer;
  asis:integer;
end;

 arbol =  ^nodoArbol;
 nodoArbol = record
   dato:taller;
   hi:arbol; hd:arbol;
 end;
 
procedure leerInscripcion(var i:inscripcion);
begin
  writeln('Ingrese el numero de inscripcion');
    readln(i.num);
    if(i.num<>-1) then begin
    writeln('Ingrese el codigo del taller');
    readln(i.cod);
     writeln('Ingrese su dni');
     readln(i.dni);
     writeln('Ingrese la cantidad de asistencias');
     readln(i.asis);
    end;
 end;
 
 procedure cargarArbol(var a:arbol; i:inscripcion);
 begin
   if(a=nil) then begin
     new(a); a^.dato.cod:=i.cod; a^.dato.inscriptos := 1 ; a^.dato.asistencias := i.asis;
     a^.hi:=nil; a^.hd:=nil;
   end
   else 
     if(i.cod< a^.dato.cod) then
       cargarArbol(a^.hi,i)
   else
     if(i.cod > a^.dato.cod) then
       cargarArbol(a^.hd,i)
    else begin
      a^.dato.inscriptos := a^.dato.inscriptos + 1; a^.dato.asistencias := a^.dato.asistencias + i.asis;
   end;
 end;

     
     
     
 procedure generarArbol(var a:arbol);
 var
   i:inscripcion;
 begin
   a:=nil;
   leerInscripcion(i);
   while(i.num<>-1) do begin
     cargarArbol(a,i);
     leerInscripcion(i);
   end;
 end;

procedure imprimirDatos(t:taller);
begin
  writeln('Codigo ', t.cod);
  writeln('Tiene inscriptos ', t.inscriptos);
  writeln('Y asistencias ',t.asistencias);
end;

procedure imprimirOrdenado(a:arbol);
begin
  if(a<>nil) then begin
    imprimirOrdenado(a^.hi);
    imprimirDatos(a^.dato);
    imprimirOrdenado(a^.hd);
end;
end;

procedure actu(t:taller; var max,codmax:integer);
begin
  if(t.inscriptos > max) then begin
    max:=t.inscriptos;
    codmax:=t.cod;
  end;
end;

procedure busqueda(a:arbol; var max,codmax:integer);
begin
  if(a<>nil) then begin
    busqueda(a^.hi,max,codmax);
      actu(a^.dato,max,codmax);
     busqueda(a^.hd,max,codmax);
  end;
end;
function buscarMaximo(a:arbol):integer;
var
  codmax,max:integer;
begin
  max:=0; codmax:=0;
  busqueda(a,max,codmax);
  buscarMaximo:=codmax;
end;

procedure buscarMin(a:arbol; val:integer; var cant:integer);
begin
  if(a<>nil) then begin
    if(a^.dato.cod < val) then begin
      cant:=cant + 1;
      buscarMin(a^.hi,val,cant);
      buscarMin(a^.hd,val,cant);
    end
    else
      buscarMin(a^.hi,val,cant);
  end;
end;
    
function menores(a:arbol):integer;
var
  val,cant:integer;
begin
  cant:=0;
  writeln('Ingrese un valor para usar como parametro');
  readln(val);
  buscarMin(a,val,cant);
  menores:=cant; 
end;

procedure buscarAsistencias (a:arbol; var total:integer; max,min:integer);
begin
  if(a<>nil) then begin
    if(a^.dato.cod > min) and (a^.dato.cod < max) then begin
      total:= total + a^.dato.asistencias;
      buscarAsistencias(a^.hi,total,max,min);
      buscarAsistencias(a^.hd,total,max,min);
    end
    else  if(a^.dato.cod <= min) then
        buscarAsistencias(a^.hd,total,max,min)
    else
        buscarAsistencias(a^.hi,total,max,min)
end;
end;

function asisTotales (a:arbol):integer;
var
  total,max,min:integer;
begin
  total:=0;
  writeln('Ingrese un parametro maximo');
  readln(max);
  writeln('Ingrese un parametro minimo');
  readln(min);
  buscarAsistencias(a,total,max,min);
  asisTotales:=total;
end;




var
  a:arbol;
begin
  generarArbol(a);
  writeln('Arbol cargado');
  imprimirOrdenado(a);
  writeln('El codigo con mas cantidad de inscriptos es: ' , buscarMaximo(a));
  writeln(menores(a), ' talleres con codigo menor al parametro');
  writeln(asisTotales(a), ' Asistencias entre esos parametros');
end.
