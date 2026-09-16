
package Practica_1;
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio_3 {
    public static void main(String[] args) {
        int [] [] matriz = new int [5] [5];
 
        GeneradorAleatorio.iniciar();
        
        for (int i=0; i<=4; i++){
            for  (int j = 0; j <= 4; j++) {
                matriz [i][j] = GeneradorAleatorio.generarInt(31);
                }
        }
   
        // INCISO A 
        for (int i=0; i<=4; i++){
            for (int j = 0; j <= 4; j++) {
                System.out.println(matriz[i][j]);
    }
        }
       // INCISO B 
        int suma = 0;
        for (int i=0; i<=4; i++){
            suma += matriz[0][i];
        }
        System.out.println("La suma de los elementos en la fila 1 es: " + suma);
            
    // INCISO C
     int [] vector = new int [5];
        for (int j = 0; j <= 4; j++) {
            for (int i = 0; i <=4; i++) {
                  vector[j] += matriz[i][j];
                
            }
            
        }
      for(int i= 0; i<= 4; i++){
          System.out.println(vector[i]);
      }
      
      
    // INCISO D 
    
    int valor = PaqueteLectura.Lector.leerInt();
    int f=0;
    int c=0;
    boolean esta = false;
    for(int i=0; i<=4; i++){
        for(int j=0; j<=4; j++){
              if(matriz[i][j] == valor){
                    f=(i+1);
                    c=(j+1);
                    esta = true;
              }
        }
    }
    if(esta){
         System.out.println("Se encontro el valor en la posicion " + f + " | " + c);
    }
    else{
          System.out.println("No se encontro el valor en la matriz");
    }
    }
  
}
