/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package Practica_3;



/**
 *
 * @author vsanz
 */
public class Demo01ConstructoresLibro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Autor autor1= new Autor("Jose hernandez" , "Poeta mendocino" , "Argentina");
        Libro libro1= new  Libro("Martin Fierro" , "Ediciones Colihue"  , 2025 , autor1 , "978-950-563-115-5" , 40900 );
        Autor autor2= new Autor("John Horton" , "Musico" , "Estados Unidos");
        Libro libro2= new Libro("Learning Java by Building Android Games", "CreateSpace Independent Publishing", autor2 , "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        Libro libro3= new Libro(); 
        System.out.println("Autor del libro 2" + libro2.getPrimerAutor().toString());
    }
    
}
