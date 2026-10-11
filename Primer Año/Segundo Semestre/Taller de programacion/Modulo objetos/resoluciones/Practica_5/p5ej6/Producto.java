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
public class Producto {
    private String descripcion;
    private String rubro;
    private double peso;
    private double precioKG;

    public Producto(String descripcion, String rubro, double peso, double precioKG) {
        this.descripcion = descripcion;
        this.rubro = rubro;
        this.peso = peso;
        this.precioKG = precioKG;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getRubro() {
        return rubro;
    }

    public double getPeso() {
        return peso;
    }

    public double getPesoKG() {
        return precioKG;
    }
    
    
}
