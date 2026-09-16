/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica_3;

/**
 *
 * @author Thiago
 */
public class Triangulo {
    private double l1,l2,l3;
    private String relleno,linea;

    public double getL1() {
        return l1;
    }

    public void setL1(double l1) {
        this.l1 = l1;
    }

    public double getL2() {
        return l2;
    }

    public void setL2(double l2) {
        this.l2 = l2;
    }

    public double getL3() {
        return l3;
    }

    public void setL3(double l3) {
        this.l3 = l3;
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
    
    public double calcularPerimetro(){
        return this.l1+this.l2+this.l3;
    }


public double calcularArea(){
  double s= (this.l1+this.l2+this.l3) / 2.0;
  double area =  (Math.sqrt(s*(s-this.l1)*(s-this.l2)*(s-this.l3)));
  return area;
}

    public Triangulo(double unl1, double unl2, double unl3, String unrelleno, String unalinea) {
        l1 = unl1;
        l2 = unl2;
        l3 = unl3;
        relleno = unrelleno;
        linea = unalinea;
    }

}