/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5ej5;


public class Main {

    
    public static void main(String[] args) {
     Estreno e1 = new Estreno("Spiderman","Pelicula",10000,2137483);
     Estreno e2 = new Estreno("Batman","Pelicula",50000,457923489);
     Estreno e3 = new Estreno("Iron man","Pelicula",15000,239840);
     Estreno e4 = new Estreno("Hulk","Pelicula",25000,123456);
     Sistema s = new Sistema("Marvel Studios",1820938324,2);
     s.agregarEstreno(1, e1);
     s.agregarEstreno(1, e2);
     s.agregarEstreno(1, e3);
     s.agregarEstreno(2, e4);
        System.out.println("----------------------");
        System.out.println(s.listar(1));
        System.out.println("----------------------");
        System.out.println(s.listar(2));
        System.out.println("----------------------");
        System.out.println(s.toString());
    }
    
}
