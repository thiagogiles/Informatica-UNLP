package Practica_4;

/**
 *
 * @author Thiago
 */
public class Cuadrado extends Figura{
    private double  lado;

    public Cuadrado(double unlado, String relleno, String linea){
        super(linea,relleno);
        this.setLado(unlado);
        
    }
    
    public double  getLado() {
        return lado;
    }

    public void setLado(double unlado) {
        this.lado = unlado;
    }
    
    public double calcularArea(){
        return lado*lado;
    }
    
    public double calcularPerimetro(){
        return 4*lado;
    }
    
    public String toString(){
        String aux = super.toString() + " Lado: " + this.getLado();
        return aux;
    }
}
