/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Thiago
 */
public class Triangulo {
    
    
    private double lado1;
    private double S;

    public double getS() {
        return S;
    }

    public void setS(double S) {
        this.S = S;
    }
    private double lado2;
    private double lado3;
    private String relleno;
    private String linea;

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

    public String getRelleno() {
        return relleno;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public String getLinea() {
        return linea;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }
    
    public double calcularArea(double lado1, double lado2, double lado3){
        S=(lado1+lado2+lado3)/2;
        return Math.sqrt(S*(S-lado1)*(S-lado2)*(S-lado3));
    }
    
    public double calcularPerimetro(double lado1, double lado2, double lado3){
        return lado1+lado2+lado3;
        
    }

    @Override
    public String toString() {
        return "\nlado1: " + lado1+ "\nlado2: " + lado2 + "\nlado3: " + lado3 + "\nColor de relleno: " + relleno + "\nColor de linea: " + linea;
    }
            
}
