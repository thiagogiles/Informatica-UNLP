/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p4ej4;

/**
 *
 * @author 52984
 */
public class Ejercicio_4 {
    public static void main(String[] args) {
        Sistema_Anual lp = new Sistema_Anual("La plata",-34.921,57.955,2021,3);
        Sistema_Mensual mdp = new Sistema_Mensual("Mar del Plata",-38.002,-57.556,2020,4);


        System.out.println(lp.getPromedio());
        System.out.println(lp.maxTemp());
        System.out.println(mdp.getPromedio());
        System.out.println(mdp.maxTemp());
    }
    
}
