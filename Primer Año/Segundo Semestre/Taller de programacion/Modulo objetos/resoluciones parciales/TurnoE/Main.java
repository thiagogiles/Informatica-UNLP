package TurnoE;


public class Main {


    public static void main(String[] args) {
        Ticket t1 = new Ticket(1,1824,10,1253.2,"credito");
        Ticket t2 = new Ticket(2,2345,3,2345.5,"debito");
        Ticket t3 = new Ticket(4,2893,7,2384.1,"credito");
        Ticket t4 = new Ticket(5,2138,8,1834.6,"debito");
        Ticket t5 = new Ticket(7,2375,6,1832.6,"credito");
        Ticket t6 = new Ticket(9,2139,5,1823.7,"credito");
        Caja c1 = new Caja("Pedro",4);
        Caja c2 = new Caja("Juan",6);
        Caja c3 = new Caja("Martin",7);
        Caja c4 = new Caja("Ivan",2);
        Caja c5 = new Caja("Jose",3);
      Supermercado s = new Supermercado("La plata");
      c1.agregarTicket(t1);
      c2.agregarTicket(t2);
      c3.agregarTicket(t3);
      c4.agregarTicket(t4);
      c5.agregarTicket(t5);
      c1.agregarTicket(t6);
      s.agregarCaja(c1);
        System.out.println("-------------");
      s.agregarCaja(c2);
      System.out.println("-------------");
      s.agregarCaja(c3);
      System.out.println("-------------");
      s.agregarCaja(c4);
      System.out.println("-------------");
      s.agregarCaja(c5);
      System.out.println("-------------");
        System.out.println("La caja con menos tickets con forma de pago credito es la caja " + s.cajaMenor());
        System.out.println("-------------");
        s.generarTicket(5, 12667, 15, 162373.4, "credito");
        System.out.println(s.toString());
    }
    
}
