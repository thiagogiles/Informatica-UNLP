{3.- Escribir un programa que invoque a los siguientes módulos e informe el resultado: 
a. Un módulo recursivo que retorne un vector de a lo sumo 20 caracteres que conformen una  palabra. La lectura de los caracteres termina en ‘.’ 
b. Un módulo recursivo que reciba la “palabra” generada en a) y determine si dicha palabra es  un palíndromo, es decir, si puede leerse de la misma manera de izquierda a derecha que de 
* derecha a izquierda.  Este módulo debe retornar el valor booleano correspondiente. 
}
program p2ej3;
const
  dimf=20;
type
vector = array [1..dimf] of char;

procedure cargarVector(var v:vector; var diml:integer);
var
  letra:char;
begin
  writeln('Ingrese una letra');
  readln(letra);
  if(letra <>'.') and (diml<20) then begin
    diml:=diml+1;
    v[diml]:=letra;
    cargarVector(v,diml);
  end;
end;

procedure imprimir(v:vector; diml:integer);
var
  i:integer;
begin
  for i:= 1 to diml do
    writeln(v[i]);
  end;
 
function palindromo(v:vector; i,diml:integer): boolean;
begin
  if(i >= diml) then
     palindromo:=true
  else if (v[i] <> v[diml]) then
    palindromo:=false
  else
    palindromo:=palindromo(v, i+1, diml -1);
  end;
var
  diml,i:integer;
  v:vector;
begin
  diml:=0;
  cargarVector(v,diml);
  imprimir(v,diml);
  i:=1;
  if (palindromo(v,i,diml)) then
    writeln('La palabra es palindromo')
  else
    writeln('La palabra no es palindromo');
end.

  
