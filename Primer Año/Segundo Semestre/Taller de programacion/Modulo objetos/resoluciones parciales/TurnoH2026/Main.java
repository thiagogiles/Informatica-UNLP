/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TurnoH2026;


public class Main {
    public static void main(String[] args) {
        Programador p1 = new Programador(128345,"Thiago Giles","Java");
        Programador p2 = new Programador(192847,"Santi asd","Pascal");
        Programador p3 = new Programador(972345,"Felipe hkdf","Python");
        Programador p4 = new Programador(27345,"Ivan hrt","Java");
        Programador p5 = new Programador(76234,"Martin garrix","Python");
        Programador p6 = new Programador(528354,"Juan lagrange","Kobold");
        Laboratorio l1 = new Laboratorio("Laboratorio raro",3);
        Laboratorio l2 = new Laboratorio("Laboratorio piola",3);
        Hackaton h = new Hackaton("Otakus","20 de noviembre",28935.0,l1,l2);
        System.out.println(h.agregarProgramador(p1));
        System.out.println("-----------");
        System.out.println(h.agregarProgramador(p2));
        System.out.println("-----------");
        System.out.println(h.agregarProgramador(p3));
        System.out.println("-----------");
        System.out.println(h.agregarProgramador(p4));
        System.out.println("-----------");
        System.out.println(h.agregarProgramador(p5));
        System.out.println("-----------");
        System.out.println(h.agregarProgramador(p6));
        System.out.println("-----------");
        System.out.println(h.toString());
        System.out.println("-----------");
        h.asignarExperiencia(128345, 9);
        h.asignarExperiencia(76234, 10);
        h.asignarExperiencia(192847, 20);
        System.out.println("La cantidad de programadores que usan el lenguaje seleccionado como principal es: " + h.cantidadProgramadores("Python"));
        System.out.println("-----------");
        System.out.println(h.toString());
    }
}
