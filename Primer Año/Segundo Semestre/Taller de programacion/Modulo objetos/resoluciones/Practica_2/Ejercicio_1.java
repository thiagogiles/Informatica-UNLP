/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica_2;
import PaqueteLectura.Lector;


public class Ejercicio_1 {
    public static void main(String[] args) {
    
        System.out.println("Ingrese su nombre");
        String nombre = Lector.leerString();
        System.out.println("Ingrese su dni");
        int dni = Lector.leerInt();
        System.out.println("Ingrese su edad");
        int edad = Lector.leerInt();
        Persona p1 = new Persona (nombre,dni,edad);
        System.out.println(p1.toString());
    }
   
}
