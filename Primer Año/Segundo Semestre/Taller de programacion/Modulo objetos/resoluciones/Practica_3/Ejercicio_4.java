
package Practica_3;

/**
 *
 * @author Thiago
 */
public class Ejercicio_4 {
    public static void main(String[] args) {
        Hotel h = new Hotel(15);
        Persona c1 = new Persona("Juan",4298372,30);
        Persona c2 = new Persona("Martin",290384,65);
        Persona c3 = new Persona("Hugo",1237853,19);
        h.ingresarCliente(c1, 1);
        h.ingresarCliente(c2, 5);
        h.ingresarCliente(c3, 15);
        System.out.println(h.toString());
        h.aumentarCosto(5000);
        System.out.println(h.toString());
    }
   
}
