package TurnoG;

public class Main {


    public static void main(String[] args) {
      Supermercado s = new Supermercado("Las marias","La plata",5,3);
      Producto p1 = new Producto(15,"Sal Fina","Dos anclas",5,1500);
      Producto p2 = new Producto(35,"Galletitas","Bagley",19,3200);
      Producto p3 = new Producto(40,"Arroz","Gallo",0,2100);
      Producto p4 = new Producto(50,"Pan Dulce","Don satur",8,4300);
      Producto p5 = new Producto(10,"Azucar","Ledesma",25,2650);
      Producto p6 = new Producto(7,"Pure de tomate","Marolio",40,1250);
      s.registrarProducto(p1, 1, 1);
      System.out.println("------------------");
      s.registrarProducto(p2, 1, 2);
      System.out.println("------------------");
      s.registrarProducto(p2, 1, 3);
     System.out.println("------------------");
      s.registrarProducto(p4, 2, 3);
     System.out.println("------------------");
      s.registrarProducto(p5, 3, 2);
      System.out.println("------------------");
      s.registrarProducto(p6, 5, 1);
       System.out.println("------------------");
      s.registrarProducto(p3, 3, 1);
      System.out.println("------------------");
        System.out.println("Productos eliminados sin stock: " + "\n" + s.liberarEstante(3));
      System.out.println("------------------");
        System.out.println("La gondola con mas productos de esa marca es: " + s.numGondola("Bagley"));
      System.out.println("------------------");
      System.out.println(s.toString());
    }
    
}
