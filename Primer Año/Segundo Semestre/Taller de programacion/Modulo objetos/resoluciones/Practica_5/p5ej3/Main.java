/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5ej3;


public class Main {

  
    public static void main(String[] args) {
       Gira g = new Gira("Pepitos",10,"Locura",4);
       Evento_ocasional ev = new Evento_ocasional("Eso brad",5,"show privado","Brad",15);
       Fechas f1 = new Fechas("La plata",12);
       Fechas f2 = new Fechas("Jujuy",20);
       Fechas f3 = new Fechas("Beriso",25);
       Fechas f4 = new Fechas("City bell",29);
       g.agregarFecha(f1);
       g.agregarFecha(f2);
       g.agregarFecha(f3);
       g.agregarFecha(f4);
       g.agregarTema("My fault");
       g.agregarTema("Sisi");
       g.agregarTema("Okok");
       ev.agregarTema("Asi nomas");
       ev.agregarTema("Por mil noches");
       ev.agregarTema("My fault");
       System.out.println("--------------------------------");
        System.out.println("La gira cuesta " + g.calcularCostoRecital());
        System.out.println("--------------------------------");
        System.out.println("El evento ocasional cuesta " + ev.calcularCostoRecital());
        System.out.println("--------------------------------");
        System.out.println(g.actuacion());
        System.out.println("--------------------------------");
        
        System.out.println(ev.actuacion());
        System.out.println("--------------------------------");
        System.out.println(g.actuacion());
    }
    
    
    
    
}
