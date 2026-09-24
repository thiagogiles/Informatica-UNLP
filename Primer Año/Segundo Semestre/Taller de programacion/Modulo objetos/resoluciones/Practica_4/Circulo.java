package Practica_4;

/**
 *
 * @author Thiago
 */
public class Circulo extends Figura {
    private double radio;
    
    
    public Circulo(double radio, String colorRelleno, String colorLinea){
        super(colorLinea,colorRelleno);
        this.setRadio(radio);
       
        
    }
    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
     public double calcularPerimetro(){
        return (2*radio)*(Math.PI);
    }
    
    public double calcularArea(){
        return (Math.PI)*(radio*radio);
    }
    
    public String toString(){
        String aux = super.toString() + " Radio: " + this.getRadio();
        return aux;
    }
}