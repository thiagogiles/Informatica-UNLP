package TurnoB2025;

/**
 *
 * @author Thiago
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Examen e = new Examen("2024","Profe",7,7);
        Alumno a = new Alumno("Thiago","23987/3",e);
        Entrega e1= new Entrega("2025","Profe",6,6,6);
        Entrega e2= new Entrega("2025","Profe",3,5,6);
        Entrega e3= new Entrega("2025","Profe",10,10,8);
        Entrega e4= new Entrega("2025","Profe",7,8,9);
        Entrega e5= new Entrega("2025","Profe",3,2,3);
        Entrega e6= new Entrega("2025","Profe",4,3,4);
        a.registrarEntrega(1, e1);
        System.out.println("------------------");
        a.registrarEntrega(2, e2);
            System.out.println("------------------");
        a.registrarEntrega(3, e3);
            System.out.println("------------------");
        a.registrarEntrega(4, e4);
            System.out.println("------------------");
        a.registrarEntrega(5, e5);
            System.out.println("------------------");
        a.registrarEntrega(6, e6);
            System.out.println("------------------");
        if(a.estaAprobado()){
            System.out.println("El alumno esta aprobado");
        }
        else{
            System.out.println("El alumno no esta aprobado");
        }
    }
    
}
