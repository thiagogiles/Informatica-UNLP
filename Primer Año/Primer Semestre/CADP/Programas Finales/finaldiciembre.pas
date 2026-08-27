{una empresa dispone de una estructura de datos con informacion de sus empleados. De cada empleado se conoce su nombre, 
año de nacimiento y salario,  y la informacion se encuentra ordenada
por año de nacimiento. Realizar un programa que informe los 10 años en los que nacieron mas empleados, 
y el monto total destinado al pago de salarios dichos empleados nacidos en esos 10 años 

}

program finaldiciembre;

type
  empleado = record
    nacimiento: integer;
    salario:real;
    nombre:string; 
    end;
   datosvec= record
     salariototal:real;
     cant:integer;
     nacimiento:integer;
   end;
   lista = ^nodo;
   nodo = record
   dato: empleado;
   sig:lista;
 end;
 vector = array [1..10] of datosvec;
 
 procedure leer(var e:empleado);
 begin
   readln(e.nacimiento);
   readln(e.salario);
   readln(e.nombre);
 end;
 
 {procedure cargarLista(var l:lista); // SE DISPONE
 begin
 end;}
 procedure inicializarVector( var v:vector);
 var i:integer;
 begin
   for i:= 1 to 10 do begin
       v[i].cant := 0;
       v[i].salariototal:=0;
    end;
    writeln('Vector inicializado');
  end;
  
 procedure actualizarMaximos(var v:vector; n:integer; c:integer; s:real);
 var
   i: integer;
begin
 i:=1;
 while(c < v[i].cant) and (i<10) do
    i:= i + 1;
  if(c > v[i].cant) then begin
     v[i].cant:= c;
     v[i].nacimiento:= n;
     v[i].salariototal:= s;
   end;
end;

procedure informarVector(v:vector);
var
  total:real;
  i:integer;
begin
  total:=0;
  for i:=1 to 10 do begin
    writeln(v[i].nacimiento);
    total:= total + v[i].salariototal;
  end;
  writeln(total);
end;

 procedure cargarVector(var v:vector; l:lista);
 var
   act,cant:integer;
   salariototal:real;
begin
   while(l<>nil) do begin
   act:=l^.dato.nacimiento;
   cant:=0;
   salariototal:=0;
     while(l<>nil) and (l^.dato.nacimiento=act) do begin
          cant:= cant + 1;
          salariototal:= salariototal + l^.dato.salario;
          l:=l^.sig;
    end; 
    actualizarMaximos(v,l^.dato.nacimiento,cant,salariototal);
  end;
end;

var
  v:vector;
  li:lista;
begin
li:=nil;
inicializarVector(v);
cargarVector(v,li);
informarVector(v);
end.
