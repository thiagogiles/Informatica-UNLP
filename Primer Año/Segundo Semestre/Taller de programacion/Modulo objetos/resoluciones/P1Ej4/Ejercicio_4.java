
package P1Ej4;
import PaqueteLectura.Lector;

public class Ejercicio_4 {
    public static void main(String[] args) {
        int [] [] matriz = new int [8] [4];
        
        for (int i = 0; i <= 7; i++) {
            for (int j = 0; j <= 3; j++) {
                matriz[i][j]=0;
                
            }
            
        }
        int piso = PaqueteLectura.Lector.leerInt();
        
        while(piso != 9){ 
            int oficina = PaqueteLectura.Lector.leerInt();
            matriz [piso-1] [oficina-1] ++;
            piso = PaqueteLectura.Lector.leerInt();
        }
        
        
        
        for (int i = 0; i <= 7; i++) {
            for (int j = 0; j <= 3; j++) {
                System.out.println("Hay " + matriz[i][j] + " personas en el piso " + (i+1) + " oficina " + (j+1));
            }

            
        }
        
        
        
        
        
        
        
        
    }
}
