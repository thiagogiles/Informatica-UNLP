
package p5ej6;


public class Main {

    
    public static void main(String[] args) {
       Balanza_Basica bb = new Balanza_Basica();
       Balanza_Avanzada ba = new Balanza_Avanzada();
       Producto p1 = new Producto("Zanahoria","Verdura",1.3,2000);
       Producto p2 = new Producto("Zapallo","Verdura",0.5,4000);
       Producto p3 = new Producto("Tomate","Verdura",3.5,950);
       Producto p4 = new Producto("Mandarina","Fruta",2.0,3000);
       Producto p5 = new Producto("Naranja","Fruta",2.5,1500);
       bb.RegistrarProducto(p1);
       bb.RegistrarProducto(p2);
       bb.RegistrarProducto(p3);
       bb.RegistrarProducto(p4);
       bb.RegistrarProducto(p5);
       ba.RegistrarProducto(p1);
       ba.RegistrarProducto(p2);
       ba.RegistrarProducto(p3);
       ba.RegistrarProducto(p4);
       ba.RegistrarProducto(p5);
       Ticket basico = bb.finalizarCompra();
       Ticket avanzado = ba.finalizarCompra();
        System.out.println("-----------------------------");
        System.out.println("Ticket basico: " + basico.toString());
        System.out.println("-----------------------------");
        System.out.println("Ticket avanzado: " + avanzado.toString());
    }
    
}
