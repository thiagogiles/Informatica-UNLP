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
        int cant = 0;
        int j,i=0; 
        Persona [] [] matriz = new Persona [5] [8];
        while((!nombre.equals("ZZZ")) && (cant<40)){
            j=0;
            while((!nombre.equals("ZZZ")) && (j<8) && (cant<40) ){
                          int dni= Lector.leerInt();
                          int edad= Lector.leerInt();
                          matriz[i][j] = new Persona(nombre,dni,edad);
                          cant++;
                          j++;
                          if(cant<40){
                               nombre = Lector.leerString();
                          }
                         
          }
           i++;
                      }
        j=0; i=0;
        int cont=0;
        while(cont<cant){
            System.out.println("Dia " + (i+1) + " turno   " + (j+1) + matriz[i][j].getNombre());
            cont++;
            j++;
                if(j==8);{
                  j=0;
                  i++;
        }
        }
    }
}


            
     
    

