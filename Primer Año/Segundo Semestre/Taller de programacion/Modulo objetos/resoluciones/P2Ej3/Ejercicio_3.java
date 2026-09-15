/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package P2Ej3;

import P2Ej4.*;
import PaqueteLectura.Lector;
public class Ejercicio_3 {
    public static void main(String[] args) {
        String nombre = Lector.leerString();
        Persona [] [] matriz = new Persona [5] [8];
        boolean fin = false;
            for(int i=0; i< 5 && !fin; i++){
                for(int j=0; j< 8; j++){
                      if(nombre.equals("ZZZ")){
                          fin = true;
                }
                      else{
                          int dni= Lector.leerInt();
                          int edad= Lector.leerInt();
                          matriz[i][j] = new Persona(nombre,dni,edad);
                          nombre = Lector.leerString();
                      }
            }
        }
       //
       
       for(int i=0; i<5; i++){
           for(int j=0; j<8; j++){
               if(matriz[i][j] != null){
                      System.out.println("El nombre de la persona a entrevistar es: " + matriz[i][j].getNombre() + " en el dia " + (i+1) + " y turno " + (j+1));

               }
           }
       }
     
    }
}
