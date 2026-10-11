
package p5ej2;


public class Main {

    
    public static void main(String[] args) {
       
        Estacionamiento e = new Estacionamiento("Estacion nueva", "Avenida 3525 N 523", "7:30", "20:30",3,3);
        Auto a1 = new Auto("Thiago","ABC356");
        Auto a2 = new Auto("Santi","KLJ234");
        Auto a3 = new Auto("Martin","MNY623");
        Auto a4 = new Auto("Sofia","XPA267");
        Auto a5 = new Auto("Juan","PAE245");
        Auto a6 = new Auto("Pepe","LQW835");
        e.registrarAuto(1, 1, a1);
        e.registrarAuto(2, 2, a2);
        e.registrarAuto(2, 1, a3);
        e.registrarAuto(3, 1, a4);
        e.registrarAuto(3, 3, a5);
        e.registrarAuto(2, 3, a6);
        System.out.println(e.toString());
        System.out.println(e.contarPlaza(1));
        System.out.println(e.buscarPatente("MNY623"));
    }
    
}
