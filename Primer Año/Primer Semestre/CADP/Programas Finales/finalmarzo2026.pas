{Suponga que se quiere implementar un juego de cartas. De cada carta se conoce su número (1..12) y palo al que pertenece (oro, copa, espada o basto). 
* Hay dos niños que van a jugar a este juego y para eso se disponen de su conjunto de cartas (como máximo 15). En cada ronda del juego los dos niños comparan entre sí la primera carta de su conjunto, 
* y el niño que tiene la carta más chica pone al final de su conjunto de cartas su carta y la del oponente (suponga que siempre una carta es más baja). 
* El juego finaliza cuando alguno de los dos niños se queda sin cartas para jugar. MODULARICE.

}
program finalmarzo2026;
type

sub= (oro, copa, espada, basto);
carta = record
   num:integer;
   palo:sub;
end;

lista= ^nodo
 nodo= record
 elem: carta;
 sig:lista;
 end;
 
 procedure cargarLista(var l:lista); // Se dispone
 var
   c:carta;
 begin
    leer(c);
 end;
 
 procedure sacarCarta(var l1:lista; var l2:lista; var c1:carta; var c2:carta);
var
  pri:lista;
begin
  c1:=l1^.elem;
  c2:=l2^.elem;
  pri:=l1^.sig;
  dispose(l1);
  l1:=pri;
  pri:=l2^.sig;
  dispose(l2);
  l2:=pri;
end;
 
 procedure agregarAtras(var l:lista; c:carta);
 var
   nue,pri:lista;
 begin
    pri:=l;
   while(l^.sig<>nil) then
     l:=l^.sig;
    new(nue);
    nue^.elem:=c;
    l^.sig:=nue;
    l:=pri;
end;
    
 
 procedure comparar(var l1:lista; var l2:lista);
 var
   c1,c2:carta
begin
  while(l1<>nil) and (l2<>nil) then begin
    sacarCarta(l1,l2,c1,c2);
    if(c1.num < c2.num) then
        agregarAtras(l1,c1)
        agregarAtras(l1,c2)
    else
       agregarAtras(l2,c2); 
       agregarAtras(l2,c1)
   end;
 end;

var
l1:lista;
l2:lista;
begin
l1:=nil;
l2:=nil;
cargarLista(l1);
cargarLista(l2);
comparar(l1,l2);
end.
