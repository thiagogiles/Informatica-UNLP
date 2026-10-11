/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5ej6;

/**
 *
 * @author 52984
 */
public class Ticket {
    private int NroCompra;
    private String resumen;
    private double monto;
    
    public Ticket(){
        this.resumen = "";
    }
   
    public void setNroCompra(int NroCompra) {
        this.NroCompra = NroCompra;
    }

    public void setResumen(String resumen) {
        this.resumen = resumen;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public int getNroCompra() {
        return NroCompra;
    }

    public String getResumen() {
        return resumen;
    }

    public double getMonto() {
        return monto;
    }

    
    public String toString() {
        return "NroCompra: " + this.NroCompra + " Resumen: " + this.resumen + " Monto a pagar: " + this.monto;
    }
    
    
}
