package TurnoL;


public class Main {

 
    public static void main(String[] args) {
      ProgramadorLider pl = new ProgramadorLider ("Thiago",47216040,1238795,500,"Python",5,15);
     Empresa e = new Empresa("1XBET",pl,10);
     Programador p1 = new Programador("Santi",47216040,2350,150,"Python");
     Programador p2 = new Programador("Martin",1235054,5495,200,"Java");
     Programador p3 = new Programador("Juan",239458,2374,125,"Kobol");
     Programador p4 = new Programador("Ivan",89470,2394,163,"Pascal");
     Programador p5 = new Programador("Brad",2938572,1238,178,"R-INFO");
     Programador p6 = new Programador("Paul",127455,9235,195,"Pascal");
     Programador p7 = new Programador("Marcos",23098454,7231,103,"Java");
     Programador p8 = new Programador("Jose",238974,1293,172,"Python");
     e.asignarProgramador(p1, 1);
        System.out.println("----------------------");
     e.asignarProgramador(p2, 2);
      System.out.println("----------------------");
     e.asignarProgramador(p3, 3);
      System.out.println("----------------------");
     e.asignarProgramador(p4, 4);
      System.out.println("----------------------");
     e.asignarProgramador(p5, 5);
      System.out.println("----------------------");
     e.asignarProgramador(p6, 6);
      System.out.println("----------------------");
     e.asignarProgramador(p7, 7);
      System.out.println("----------------------");
     e.asignarProgramador(p8, 10);
      System.out.println("----------------------");
        System.out.println("Dinero total destinado al sueldo de los programadores:" +  e.montoTotal());
         System.out.println("----------------------");
         System.out.println(e.toString());
          System.out.println("----------------------");
          System.out.println("Aumentando sueldos ");
          e.aumentarSueldo(5000);
           System.out.println("----------------------");
           System.out.println("Dinero total destinado al sueldo de los programadores:" +  e.montoTotal());
           System.out.println(e.toString());
    }
    
}
