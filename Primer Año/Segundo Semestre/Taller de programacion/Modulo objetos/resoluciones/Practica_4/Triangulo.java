package Practica_4;

/**
 *
 * @author Thiago
 */
public class Triangulo extends Figura {
    private double lado1;
    private double lado2;
    private double lado3;
    
    
    public Triangulo(double l1,double l2,double l3,String linea,String relleno){
        super(linea,relleno);
        this.setLado1(l1);
        this.setLado2(l2);
        this.setLado3(l3);
       
    }
    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    public double calcularArea(){
        double s= (this.lado1+this.lado2+this.lado3) / 2.0;
  double area =  (Math.sqrt(s*(s-this.lado1)*(s-this.lado2)*(s-this.lado3)));
  return area;
    }
    
    public double calcularPerimetro(){
         return this.lado1+this.lado2+this.lado3;
    }
    
    public String toString(){
        String aux= super.toString() + " Lado 1 : " + this.getLado1() + " Lado 2 : " + this.getLado2() + " Lado 3 : " + this.getLado3();
        return aux;
    }
    

}
