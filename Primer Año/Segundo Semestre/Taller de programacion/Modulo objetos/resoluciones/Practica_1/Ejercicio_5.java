
package Practica_1;
import PaqueteLectura.Lector;

public class Ejercicio_5 {
    public static void main(String[] args) {
        int [] [] matriz = new int [5] [4];
        int [] suma = new int [4];
        for (int i = 0; i < 5; i++) {
            for(int j=0; j< 4; j++){
                matriz[i][j] = Lector.leerInt();
                suma[j] += matriz[i][j];
            }
        }
        
        for (int i = 0; i < 4; i++) {
              System.out.println("El promedio para el aspecto " + (i+1) + " es " + suma[i] / 5.0);
            
        }
        
        }
      
}
