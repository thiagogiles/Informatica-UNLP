/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package P2Ej1;
import PaqueteLectura.Lector;


public class Ejercicio_1 {
    public static void main(String[] args) {
    
        Persona p1;
        System.out.println("Ingrese su nombre");
        String nombre = PaqueteLectura.Lector.leerString();
        System.out.println("Ingrese su dni");
        int dni = PaqueteLectura.Lector.leerInt();
        System.out.println("Ingrese su edad");
        int edad = PaqueteLectura.Lector.leerInt();
        p1 = new Persona (nombre,dni,edad);
        System.out.println(p1.toString());
    }
   
}
