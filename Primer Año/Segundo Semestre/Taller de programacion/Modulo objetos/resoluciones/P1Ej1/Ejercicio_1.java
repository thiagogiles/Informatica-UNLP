package P1Ej1;
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio_1 {
    public static void main(String[] args) {
        // DECLARACION DE VARIABLES
        
        int [] vector = new int [10];
        GeneradorAleatorio.iniciar();
        int random = GeneradorAleatorio.generarInt(12);
        int i = 0;
        
        
        // RESOLUCION
        
        while(random != 11){ 
            vector[i] = random;
            System.out.println("I es: " + (i+1));
            i++;
            random = GeneradorAleatorio.generarInt(12);
        }
        
        // IMPRIMIR POR 2 LOS NODOS DEL VECTOR
        
        for(i=0; i<10; i++) {
            System.out.println(vector[i] * 2);
        }
        
    }
}
