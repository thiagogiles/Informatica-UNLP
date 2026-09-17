/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica_3;


public class Ejercicio_3 {
    public static void main(String[] args) {
        // CARGO 3 LIBROS ALEATORIOS PERO REALES
        
 Autor autor1 = new Autor(
    "Julio Cortázar",
    "Escritor argentino",
    "Argentina"
);

Autor autor2 = new Autor(
    "Gabriel García Márquez",
    "Escritor colombiano",
    "Colombia"
);

Autor autor3 = new Autor(
    "Jorge Luis Borges",
    "Escritor argentino",
    "Argentina"
);
        
        
        Libro libro1 = new Libro(
    "Rayuela",
    "Editorial Sudamericana",
    1963,
    autor1,
    "978-950-07-0895-3",
    25000
);

Libro libro2 = new Libro(
    "Cien años de soledad",
    "Editorial Sudamericana",
    1967,
    autor2,
    "978-950-07-0731-5",
    30000
);

Libro libro3 = new Libro(
    "Mujercitas",
    "Editorial Sur",
    1944,
    autor3,
    "978-987-566-163-1",
    22000
);
        
        
/////////////////// INSTANCIO ESTANTES Y AGREGO LOS LIBROS        
        
        Estante aux = new Estante();
        aux.agregarLibro(libro1);
        aux.agregarLibro(libro2);
        aux.agregarLibro(libro3);
        System.out.println("Hay " + aux.getCantidad() +  " libros cargados");
        Libro encontrado = aux.buscarTitulo("Mujercitas");
        if(encontrado != null) {
             System.out.println(encontrado.getPrimerAutor());
        }
       int cant= 15;
       Estante N = new Estante (15);
        System.out.println(N.estaLleno(cant));
    }
}
