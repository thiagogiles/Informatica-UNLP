package TurnoO;

/**
 *
 * @author Thiago
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
      Infusion i = new Infusion("Te helado",2350,"Premium","L");
      Acompañamiento a1 = new Acompañamiento("Brownie",3500,"Comun",1);
      Acompañamiento a2 = new Acompañamiento("Tarta de limon",6100,"Premium",2);
      Acompañamiento a3 = new Acompañamiento("Lemon pie",4200,"Comun",3);
      Acompañamiento a4 = new Acompañamiento("Cheesecake",5400,"Premium",5);
      Acompañamiento a5 = new Acompañamiento("Selva negra",8200,"Comun",6);
      Desayuno d = new Desayuno("Desayuno express",i,5);
      d.agregarAcompañamiento(a1);
        System.out.println("------------------------");
      d.agregarAcompañamiento(a2);
       System.out.println("------------------------");
      d.agregarAcompañamiento(a3);
       System.out.println("------------------------");
      d.agregarAcompañamiento(a4);
       System.out.println("------------------------");
      d.agregarAcompañamiento(a5);
       System.out.println("------------------------");
      d.agregarAcompañamiento(a5);
       System.out.println("------------------------");
        System.out.println("Costo total del desayuno: " + d.costoTotal());
         System.out.println("------------------------");
         System.out.println(d.toString());
    }
    
}
