package Practica_3;
import PaqueteLectura.Lector;
/**
 *
 * @author Thiago
 */
public class Ejercicio_5 {
    public static void main(String[] args) {
        System.out.println("Ingrese el radio del circulo");
        double radio = Lector.leerDouble();
        System.out.println("Ingrese el color de relleno del circulo ");
        String relleno = Lector.leerString();
        System.out.println("Ingrese el color de linea del circulo");
        String linea = Lector.leerString();
        Circulo f = new Circulo(radio,relleno,linea);
        System.out.println("El Area del circulo es: " + f.calcularArea(radio));
        System.out.println("El Perimetro del circulo es: " + f.calcularPerimetro(radio));
    }
}
