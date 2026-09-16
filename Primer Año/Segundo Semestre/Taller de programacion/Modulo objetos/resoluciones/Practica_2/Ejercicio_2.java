/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica_2;

import PaqueteLectura.GeneradorAleatorio;
public class Ejercicio_2 {
    public static void main(String[] args) {
        PaqueteLectura.GeneradorAleatorio.iniciar();
        int i=1;
        Persona [] vector = new Persona [15];

        int edad = GeneradorAleatorio.generarInt(101);
        while((edad != 0) && (i < 15)){
            String nombre = GeneradorAleatorio.generarString(20);
            int dni = GeneradorAleatorio.generarInt(25000);
            Persona p1 = new Persona(nombre,dni,edad);
            vector [i-1] = p1;
            edad = GeneradorAleatorio.generarInt(101);
            i++;
        }
        System.out.println("Indices " + i);
        int mayores = 0;
        int menor = 99999;
        Persona menorP;
        menorP = new Persona("a",0,0);
        for(int j=0; j< i-1; j++){
            System.out.println("Edad: " + (j+1) + " es : " + vector[j].getEdad());
            if(vector[j].getEdad() > 65){
                mayores++;
            }
            if(vector[j].getDNI() < menor){
                menor = vector[j].getDNI();
                menorP = new Persona(vector[j].getNombre(),vector[j].getEdad(),vector[j].getDNI());
            }
        }
        System.out.println("Cantidad de personas con edad mayor a 65: " + mayores);
        System.out.println(menorP.toString());
    }
}
