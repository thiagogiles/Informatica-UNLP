program Libreria;

type

  { Representa una pagina de un libro }
  pagina = record
    nroPagina: integer;
    cantPalabras: integer;
  end;


  { Lista enlazada de paginas }
  listaPaginas = ^nodoPagina;

  nodoPagina = record
    dato: pagina;
    sig: listaPaginas;
  end;


  { Representa un libro.
    Cada libro tiene un titulo y una lista de paginas }
  libro = record
    titulo: string;
    paginas: listaPaginas;
  end;


  { Lista enlazada de libros }
  listaLibros = ^nodoLibro;

  nodoLibro = record
    dato: libro;
    sig: listaLibros;
  end;



{-------------------------------------------------------------}
{ ELIMINAR PAGINAS REPETIDAS                                  }
{-------------------------------------------------------------}

{ La funcion elimina las paginas repetidas de un libro.
  Se supone que las paginas repetidas aparecen
  inmediatamente despues de la original.

  Ejemplo:
  1 -> 1 -> 2 -> 3 -> 3 -> 4 -> 4

  Queda:
  1 -> 2 -> 3 -> 4

  La funcion retorna la cantidad de paginas eliminadas. }

procedure eliminarRepetidas(var l: listaPaginas; var cant:integer)

var
  act, borrar: listaPaginas;

begin

  { Inicialmente no eliminamos ninguna pagina }
  cant := 0;

  { Comenzamos desde la primera pagina }
  act := l;


  { Recorremos la lista mientras haya paginas }
  while (act <> nil) and (act^.sig <> nil) do
  begin

    { Comparamos la pagina actual con la siguiente }
    if act^.dato.nroPagina = act^.sig^.dato.nroPagina then
    begin

      { Guardamos la pagina que vamos a eliminar }
      borrar := act^.sig;

      { Salteamos la pagina repetida }
      act^.sig := borrar^.sig;

      { Eliminamos el nodo de memoria }
      dispose(borrar);

      { Contamos la pagina eliminada }
      cant := cant + 1;
    end

    else
    begin

      { Si no son iguales, avanzamos a la siguiente pagina }
      act := act^.sig;
    end;

  end;


  { Retornamos la cantidad de paginas eliminadas }
  eliminarRepetidas := cant;

end;



{-------------------------------------------------------------}
{ CORREGIR LOS 1000 LIBROS                                    }
{-------------------------------------------------------------}

{ Recorre todos los libros y aplica la funcion
  eliminarRepetidas a cada uno.

  Tambien cuenta cuantos libros no necesitaron
  ninguna correccion. }

procedure corregirLibros(l: listaLibros);

var
  act: listaLibros;
  eliminadas: integer;
  librosSinCorreccion: integer;

begin

  { Comenzamos desde el primer libro }
  act := l;

  { Inicialmente ningun libro fue contado }
  librosSinCorreccion := 0;


  { Recorremos todos los libros }
  while act <> nil do
  begin

    { Eliminamos las paginas repetidas
      del libro actual }
    eliminadas := eliminarRepetidas(act^.dato.paginas);


    { Si no se elimino ninguna pagina,
      el libro no requirio correccion }
    if eliminadas = 0 then
      librosSinCorreccion := librosSinCorreccion + 1;


    { Informamos cuantas paginas se eliminaron
      de este libro }
    writeln('Libro: ', act^.dato.titulo);
    writeln('Paginas eliminadas: ', eliminadas);


    { Pasamos al siguiente libro }
    act := act^.sig;

  end;


  { Informamos el total de libros que no necesitaron
    ninguna correccion }
  writeln('Libros que no requirieron correccion: ',
          librosSinCorreccion);

end;



{-------------------------------------------------------------}
{ PROGRAMA PRINCIPAL                                           }
{-------------------------------------------------------------}

var
  lista: listaLibros;

begin

  { Se supone que aca ya tenemos cargados
    los 1000 libros de la libreria }

  corregirLibros(lista);

end.
