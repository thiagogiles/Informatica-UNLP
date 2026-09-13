
package P1Ej2;
import PaqueteLectura.Lector;

public class Ejercicio_2 {
    public static void main(String[] args) {
        double altura,promedio, suma = 0;
        double [] vector = new double [3];
        
        for (int i = 0; i <= 2; i++) {
            altura = PaqueteLectura.Lector.leerDouble();
            vector[i]= altura;
            suma += altura;   
        }
      promedio =  suma / 15.0; 
        System.out.println("El promedio de alturas es : " + promedio );
       int supera = 0;
        for (int i = 0; i <= 2; i++) {
            if (vector[i] >= promedio ) {
                supera ++;
                
            }
            
        }
        System.out.println("Hay " + supera + " jugadores con altura superior al promedio");
    }
}
