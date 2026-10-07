/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5ej4;


public class Main {

    
    public static void main(String[] args) {
        Director d1 = new Director("Polenta",123567,60,30);
        Director d2 = new Director("Fabricio",769346,35,5);
        Coro_Hileras ch = new Coro_Hileras("Boluditas",d1,4);
        Coro_Semicircular cs = new Coro_Semicircular("Los Fabricios",d2,5);
        Coristas c1 = new Coristas("Pepe",2034567,20,10);
        Coristas c2 = new Coristas("Juan",230984,15,9);
        Coristas c3 = new Coristas("Martin",1293843,34,3);
        Coristas c4 = new Coristas("Ivan",2308569,18,2);
        ch.agregarCorista(c1);
        ch.agregarCorista(c2);
        ch.agregarCorista(c3);
        ch.agregarCorista(c4);
        cs.agregarCorista(c1);
        cs.agregarCorista(c2);
        cs.agregarCorista(c3);
        cs.agregarCorista(c4);
        System.out.println("Imprimiendo Coro por hileras " + ch.toString());
        if(ch.bienFormado()){ System.out.println("El coro esta bien formado");}
        else{System.out.println("El coro esta mal formado");}
        System.out.println("\n");
        System.out.println("Imprimiendo Coro Semicircular " + cs.toString());
        if(cs.bienFormado()){ System.out.println("El coro esta bien formado");}
        else{System.out.println("El coro esta mal formado");}
    }
    
}
