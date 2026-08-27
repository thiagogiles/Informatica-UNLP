{4.- Implementar un programa que invoque a los siguientes módulos. 
A) Un módulo recursivo que retorne un vector de 30 números enteros “random” mayores a 300 
y menores a 550 (incluidos ambos).  
B) Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado 
en la práctica anterior) 
C) Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente 
encabezado: 
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);  
Nota: El parámetro “pos” debe retornar la posición del dato o el valor -1 si el dato no se 
encuentra en el vector.
}
program p2ej4;
const
  dimf=30;
type
  vector = array [1..dimf] of integer;

procedure cargarVector(var v:vector; i:integer);
var
  num:integer;
begin
  num:=random(251)+300;
  if(i<=dimf) then begin
    v[i]:=num;
    cargarVector(v,i+1);
  end;
end;

procedure imprimirVector(v:vector; i:integer);
begin
  if(i<=dimf) then begin
    writeln(i,' ',v[i]);
    imprimirVector(v,i+1);
  end;
end;

procedure ordenarVector(var v:vector; i:integer);
var
  j,pos,item:integer;
begin
  if (i <= dimf) then begin
    pos:=i;
    for j:= (i+1) to dimf do
      if v[j]< v[pos]then pos:=j;
     item:= v[pos];
     v[pos] := v[i];
     v[i] := item;
     writeln(v[i]);
     ordenarVector(v, i+1);
end;
end;

var
 v:vector;
 i:integer;
begin
  i:=1;
  randomize;
  cargarVector(v,i);
  imprimirVector(v,i);
  ordenarVector(v,i);
  writeln('---------------------------------------');
  imprimirVector(v,i);
 end.
