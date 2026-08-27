{Una librería tiene una estructura de datos con sus 	libros, de cada libro se conoce el titulo y sus paginas, cada pagina tiene numero de pagina y cantidad de palabras. 
Por error, se repitieron algunas hojas en cada libros. Se pide realizar un modulo que elimine las paginas repetidas de cada libro, el modulo debe retornar cuantas paginas se eliminaron por libro. 
Utilizar ese algoritmo para corregir los 1000 libros de la librería, se debe informar cuantos libros no requirieron corrección. 
}

program finalmayo;
type
   datopagina= record
     num:integer;
     cantPalabras:integer;
   end;
   
  pagina = ^nodo;
    nodo= record
      dato:datopagina;
      sig:lista;
    end;
    
  libro = record
    titulo:string;
    infoPagina:pagina;
  end;
  
  libreria = ^nodo;
    nodo= record
      dato:libro;
      sig:lista;
    end;
    
 // Se pide realizar un modulo que elimine las paginas repetidas de cada libro, el modulo debe retornar cuantas paginas se eliminaron por libro
 
 function eliminarRepetidas (var p:pagina): integer;
 var
   cant:integer;
   act,aux:pagina;
begin
  cant:=0;
   act:=p;
   while(act<>nil) and (act^.sig<>nil) do begin
     if(act^.dato.num = act^.sig.dato.num) then begin
         aux:=act^.sig;
         act^.sig:=aux^.sig;
         dispose(aux);
         cant:=cant+1;
       end;
     act:=act^.sig;
    end;
    eliminarRepetidas:=cant;
 end;
 
 // Utilizar ese algoritmo para corregir los 1000 libros de la librería, se debe informar cuantos libros no requirieron corrección. 
 
 procedure librosCorregidos (var l:libreria);
 var
   cant,i:integer;
begin
  cant:=0;
  for i:= 1 to 1000 do begin
    if ((eliminarRepetidas(l^.dato.infopagina)) = 0) then
      cant:= cant + 1;
    l:=l^.sig;
   end;
   writeln(cant);
end;
  
var
  l:libreria;
begin
  l:=nil;
  cargarLista(var l:libreria); // SE DISPONE
  librosCorregidos(l);
end;
         
    
  
