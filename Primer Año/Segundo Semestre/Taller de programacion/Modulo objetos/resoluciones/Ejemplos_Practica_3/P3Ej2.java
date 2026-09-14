
package tema3;
import PaqueteLectura.Lector;
public class P3Ej2 {
     public static void main(String[] args) {
    Autor autor = new Autor();
        autor.setNombre("Gabriel García Márquez");
        autor.setBiografia("Escritor colombiano, ganador del Nobel");
        autor.setOrigen("Colombia");

        Libro libro = new Libro("Cien años de soledad", "Sudamericana", 1967, autor, "978-3-16-148410-0", 450.0);

        System.out.println(libro);
     }
     
}
