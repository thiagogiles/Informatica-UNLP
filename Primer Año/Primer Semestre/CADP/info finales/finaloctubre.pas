 {
 Una empresa mantiene la información de sus empleados (a lo sumo 1000). De cada empleado conoce apellido, dni y sueldo. La estructura se encuentra ordenada por dni. 
 Se pide realizar un programa que lea dni hasta leer el dni 0 y elimine de la estructura de empleados aquel o aquellos empleado/s cuyo dni es mayor igual al leído.
  }
 
 // Lista ordenada por dni, contiene apellido dni y sueldo // while e.dni<>0  



{program finaloctubre;
type
  dimf = 1..1000;
  empleado = record
    dni: integer;
    apellido: string;
    sueldo: real;
 end;
 
 vector = array [dimf] of empleado;
 
 procedure eliminar(var v:vector; var diml:integer);
 var
   i:integer;
   dni:integer;
 begin
    writeln('Ingrese su dni');
    readln(dni);
    while(dni<>0) do begin
       i:=1;
      while(v[i].dni < dni) and (i< diml) do
          i:= i + 1;
      if (v[i].dni >= dni) then 
          diml:= i
      else
        writeln('El dni ingresado no pertenece a esta empresa');
      writeln('Ingrese su dni');
      readln(dni);
		end;
    end;

      
         
      
 


var
   v:vector;
   diml:integer;
BEGIN
   diml:=1000;
   eliminar(v,diml);
END.
}





{ procedure cargarVector(var v:vector ; var diml:integer);   se dispone
begin
   while(diml<3) do begin
         writeln('----------------');
        diml:= diml + 1;
		leer(v[diml]);
		writeln('sumado');
	end;
end;
* 
* falta ordenar
}


// PUNTO 3

program tres;

var c, b: integer;

procedure numero (var a: integer; var b: integer; var c: integer);  

begin
    b := 10;  
    a := 17 MOD 5 + c;             
    if ((a + b) < 15) then b := a * c + 2  
    else c := a * c + 4;  

    writeln ('Valor a: ', a, ' Valor b: ', b, ' Valor c: ', c);  
end;

var a,b: integer;

begin
    b := 3; c := 4;
    numero (c, a, b);
    writeln ('Valor a: ', a, ' Valor b: ', b, ' Valor c: ', c); 
end.


















