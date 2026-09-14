
package tema3;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class P3Ej1 {
     public static void main(String[] args) {
         Triangulo t = new Triangulo();
         System.out.println("Medida del lado 1: ");
         t.setLado1(Lector.leerDouble());
         System.out.println("Medida del lado 2: ");
         t.setLado2(Lector.leerDouble());
         System.out.println("Medida del lado 3: ");
         t.setLado3(Lector.leerDouble());
         System.out.println("Color de relleno: ");
         t.setRelleno(Lector.leerString());
         System.out.println("Color de linea: ");
         t.setLinea(Lector.leerString());
         System.out.println("Datos del triangulo: "+t.toString());
         System.out.println("El area del triangulo es: " + (t.calcularArea(t.getLado1(), t.getLado2(), t.getLado3())));
         System.out.println("El perimetro del triangulo es: " + (t.calcularPerimetro(t.getLado1(),t.getLado2(), t.getLado3())));
   
                         
                 
                 
         
     }
    
}
