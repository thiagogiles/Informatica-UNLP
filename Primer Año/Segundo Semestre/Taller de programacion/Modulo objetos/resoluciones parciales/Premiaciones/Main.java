package Premiaciones;

/**
 *
 * @author Thiago
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Postulado p1 = new Postulado("Thiago",50,15);
        Postulado p2 = new Postulado("Juan",43,10);
        Postulado p3 = new Postulado("Ivan",32,25);
        Postulado p4 = new Postulado("Jose",28,6);
        Postulado p5 = new Postulado("Saul",25,8);
        Postulado p6 = new Postulado("Martin",15,9);
      
        Publicacion p = new Publicacion(5);
        Trayectoria t = new Trayectoria(3);
        
        p.agregarPostulante(p1);
        System.out.println("-----------------------");
        p.agregarPostulante(p2);
               System.out.println("-----------------------");
        p.agregarPostulante(p3);
               System.out.println("-----------------------");
               t.agregarPostulante(p4);
                      System.out.println("-----------------------");
               t.agregarPostulante(p5);
                      System.out.println("-----------------------");
               t.agregarPostulante(p6);
                      System.out.println("-----------------------");
                      System.out.println(t.otorgarPremio(7));
                             System.out.println("-----------------------");
                             System.out.println(p.otorgarPremio(10));
    }
    
}
