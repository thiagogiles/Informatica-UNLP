package Practica_4;


public class Ejercicio_1 {


    public static void main(String[] args) {
      Figura f1 = new Cuadrado(15,"Azul","Amarillo");
      Figura f2 = new Circulo(5.6,"Rojo","Verde");
      Figura f3 = new Triangulo(1.7,2.4,3.8,"Violeta","Naranja");
        System.out.println(f1.toString());
        System.out.println(f2.toString());
        System.out.println(f3.toString());
        f1.despintar();
        f2.despintar();
        f3.despintar();
        System.out.println("Todas las figuras fueron despintadas");
        System.out.println(f1.toString());
        System.out.println(f2.toString());
        System.out.println(f3.toString());
    }
    
}
