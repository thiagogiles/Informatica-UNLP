/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5ej1;

/**
 *
 * @author 52984
 */
public class Subsidio {
    private double montoPedido;
    private String motivo;
    private boolean otorgado;

    public Subsidio(double montoPedido, String motivo) {
        this.montoPedido = montoPedido;
        this.motivo = motivo;
        this.otorgado = false;
    }

    public double getMontoPedido() {
        return montoPedido;
    }

    public void setMontoPedido(double montoPedido) {
        this.montoPedido = montoPedido;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean isOtorgado() {
        return otorgado;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
    
    
}
