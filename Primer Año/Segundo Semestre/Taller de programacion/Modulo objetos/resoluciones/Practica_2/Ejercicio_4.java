/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica_2;
import PaqueteLectura.Lector;
/**
 *
 * @author Thiago
 */
public class Ejercicio_4 {
    public static void main(String[] args) {

        System.out.println("Ingrese su nombre");
        String nombre = Lector.leerString();
        int cant = 0;
        int j,i;
        Persona [] [] matriz = new Persona [5] [8];
        while((!nombre.equals("ZZZ")) && (cant<40)){
            System.out.println("Ingrese el dia en el que quiere ser inscripto");
           int dia = Lector.leerInt();
            System.out.println("Ingrese su dni");
           int dni= Lector.leerInt();
            System.out.println("Ingrese su edad");
           int edad= Lector.leerInt();
           boolean esta = false;
            j=0;
            while((j<8 ) && (!esta)){
                 if(matriz[dia-1][j] == null){
                     matriz[dia-1][j] = new Persona(nombre,dni,edad);
                      esta = true;
                      cant++;
                          }
                 j++;
                }
          if(!esta){
                System.out.println("No hay cupos disponibles para ese dia");
          }
         System.out.println("Ingrese su nombre");
         nombre = Lector.leerString();
  }
    
    ////////// INCISO B 
    
        for (i = 0; i < 5; i++) {
            int cantDia=0;
            for (j = 0; j < 8; j++) {
                if(matriz[i][j] != null){
                      cantDia++;
                      System.out.println("En el dia " + (i+1) + " turno " + (j+1) +  " se va a atender a " + matriz[i][j].getNombre());
                }
            }
            System.out.println("En el dia " + (i+1) + " se inscribieron " + cantDia + " personas");
            
        }
    
       
}
}
