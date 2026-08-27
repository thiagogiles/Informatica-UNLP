{El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas. Implementar un programa que invoque a
módulos para cada uno de los siguientes puntos: 
A) Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa el código de identificación, DNI del propietario y valor
de la expensa. La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
B) Ordene el vector aplicando el método de selección, por código de identificación de la oficina.

 
}

Program p1ej2;
const
 dimF = 300;

type
 oficina = record
  codigo: integer;
  dni: integer;
  valor: real;
 end;
 
 vector = array [1..dimF] of oficina;
 
 procedure leer (var o:oficina);
 begin
   writeln('Ingrese su codigo de identificacion: ');
   readln(o.codigo);
   if(o.codigo<>-1) then begin
     writeln('Ingrese su dni: ');
     readln(o.dni);
     writeln('Ingrese el valor: ');
     readln(o.valor);
   end;
 end;
 
 {procedure inicializarVector(var v:vector);
 var
   i:integer;
 begin
   for i:= 1 to dimf do
     v[i].codigo:=0;
     v[i].dni:=0;
     v[i].valor:=0;
 end;
}
 procedure cargarVector(var v:vector; diml:integer; o:oficina);
 begin
    v[diml].codigo:= o.codigo;
    v[diml].dni:= o.dni;
    v[diml].valor:=o.valor;
end;
 
 procedure incisoA(var v:vector; var diml:integer);
 var
   o:oficina;
begin
  leer(o);
  while(o.codigo<>-1) and (diml <300) do begin
    diml:=diml + 1;
    cargarVector(v,diml,o);
    leer(o);
  end;
end;

procedure ordenar( var v:vector; diml:integer);
var
  i,j,pos,item:integer;
begin
  for i:= 1 to (diml-1) do begin
    pos:=i;
    for j:= (i+1) to diml do
      if v[j].codigo < v[pos].codigo then pos:=j;
     item:= v[pos].codigo;
     v[pos] := v[i];
     v[i].codigo := item;
   end;
end;

procedure imprimirVector(v:vector; diml:integer);
var
  i:integer;
begin
  i:=0;
  for i:= 1 to diml do begin
    writeln('Su codigo es:');
    writeln(v[i].codigo);
    writeln('Su dni es:');
    writeln(v[i].dni);
    writeln('Su valor es:');
    writeln(v[i].valor);
end;
end;
var
  v:vector;
  diml:integer;
begin
  diml:=0;
  incisoA(v,diml);
  writeln(' -------------------------------------------- ');
  writeln(' -------------------------------------------- ');
  writeln(' -------------------------------------------- ');
  writeln('Imprimiendo desordenado');
  imprimirVector(v,diml);
  ordenar(v,diml);
  writeln(' -------------------------------------------- ');
  writeln(' -------------------------------------------- ');
  writeln(' -------------------------------------------- ');
  writeln('Imprimiendo ordenado');
  imprimirVector(v,diml);
END.
