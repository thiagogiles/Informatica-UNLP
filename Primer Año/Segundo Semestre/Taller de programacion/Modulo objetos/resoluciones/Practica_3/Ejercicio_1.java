/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica_3;
import PaqueteLectura.Lector;
/**
 *
 * @author Thiago
 */
public class Ejercicio_1 {
    public static void main(String[] args) {
        System.out.println("Ingrese el lado 1");
        double l1=Lector.leerDouble();
        System.out.println("Ingrese el lado 2");
        double l2=Lector.leerDouble();
        System.out.println("Ingrese el lado 3");
        double l3=Lector.leerDouble();
        System.out.println("Indique el color de relleno");
        String relleno=Lector.leerString();
        System.out.println("Indique el color de linea");
        String linea=Lector.leerString();
        Triangulo tri = new Triangulo(l1,l2,l3,relleno,linea);
        System.out.println("El perimetro del triangulo es: " + tri.calcularPerimetro());
        System.out.println("El area del triangulo es: " + tri.calcularArea());
       
    }
}
