/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejemplos;

/**
 *
 * @author Thiago
 */
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class Paquete_Lectura {
    public static void main(String[] args) {
        // LECTURAS
        System.out.println("Ingrese el nombre");
        String nombre = Lector.leerString();
        System.out.println("Ingrese si trabaja");
        boolean trabaja = Lector.leerBoolean();
        System.out.println("Ingrese la edad");
        int edad = Lector.leerInt();

        
      if(trabaja) {
           System.out.println("Ingrese el sueldo");
           double sueldo = Lector.leerDouble();
            System.out.println("Nombre: " + nombre + " Edad: " + edad + " Sueldo: " + sueldo);
    }
      else {
          System.out.println("Nombre: " + nombre + " Edad: " + edad + " No trabaja ");
      }
        
    // GENERADOR ALEATORIO
      GeneradorAleatorio.iniciar();
      int i= GeneradorAleatorio.generarInt(10);
        System.out.println(i); // Del 0 al 9
        System.out.println(GeneradorAleatorio.generarDouble(10));
        System.out.println(GeneradorAleatorio.generarBoolean());
        String random = GeneradorAleatorio.generarString(4);
        System.out.println(random); // String original
        random = random.toLowerCase(); // Transformo todo en minuscula
        System.out.println(random); // String de longitud 4
        random = random.toUpperCase(); // Transformo todo en mayuscula
        System.out.println(random); // String de longitud 4
    }
}
