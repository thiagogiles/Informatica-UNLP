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
          
      }
      
    }
}
