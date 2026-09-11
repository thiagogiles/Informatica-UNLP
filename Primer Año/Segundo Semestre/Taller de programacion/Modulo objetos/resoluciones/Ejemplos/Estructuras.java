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
import PaqueteLectura.GeneradorAleatorio;
public class Estructuras {
    public static void main(String[] args) {
        // FOR
        int i;
          for(i=1; i<=10; i++){
              System.out.println(i);
          }
          System.out.println("----------------------");
          for (i=10; i>0; i--){
              System.out.println(i);
          }
         
      // WHILE
      while(i<=10) {
           if(i % 2 == 0 ) {
                 System.out.println(i  + " es par");
           }
           i++;
          
       // VECTOR
         GeneradorAleatorio.iniciar();
         int [] contador = new int [10];
         for (int j=0; j<10; j++){
          contador[j] = GeneradorAleatorio.generarInt(21);
         }
         
         for (int j=0; j<10; j++){
             System.out.println((j+1) + " Tiene " +  contador[j]);
         }
         
       // MATRIZ
         String [] [] nomAp = new String [3] [4];
         nomAp[0] [0] = "Thiago Giles";
         nomAp[2] [3] = "Santiago";
         int f,c;
         for (f=0; f<3; f++){
             for (c=0; c<4; c++) {
               nomAp[f][c] = GeneradorAleatorio.generarString(15);
             }
         }
         
         for(f=0; f<3; f++){
             System.out.println("-------------------");
             for(c=0; c<4; c++){
                 System.out.print(nomAp[f][c] + " | ");
             }
         }
      }
      
    }
}
