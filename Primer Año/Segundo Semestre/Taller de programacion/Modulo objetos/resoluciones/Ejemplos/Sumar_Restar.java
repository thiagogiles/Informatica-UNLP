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
public class Sumar_Restar {
    
  public static void main (String[] args ){
      // SUMAR Y RESTAR
      
      int i = 3;
      System.out.println("I es: " + i);
      i++;
      System.out.println("I es: " + i);
      i-- ; i--;
      System.out.println("I es: " + i);
      
      // ARITMETICAS 
      
      int resultado = 1 + 5;
      System.out.println("El resultado inicial es: " + resultado);
      resultado -= 1;
      System.out.println("Resultado ahora es: " + resultado);
      resultado *= 2;
      System.out.println("Resultado ahora es: " + resultado);
      resultado /= 2;
      System.out.println("Resultado ahora es: " + resultado);
      resultado %= 2;
      System.out.println("Resultado ahora es: " + resultado);
      
      // REALES
      
      int f = 4/3;
      System.out.println("f es: " + f);
      double r1 = 4.0/3.0; 
      System.out.println("R1 es " + r1);
      double r2 = 4/3;
      System.out.println("R2 es " + r2);
      double r3 = (double) 4/3;
      System.out.println("R3 es " + r3);
  }    
}
