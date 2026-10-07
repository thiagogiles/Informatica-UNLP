/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5ej4;

/**
 *
 * @author 52984
 */
public class Director {
    private String nombreDirector;
    private int DNIdirector;
    private int EdadDirector;
    private int antiguedadDirector;

    public Director(String nombreDirector, int DNIdirector, int EdadDirector, int antiguedadDirector) {
        this.nombreDirector = nombreDirector;
        this.DNIdirector = DNIdirector;
        this.EdadDirector = EdadDirector;
        this.antiguedadDirector = antiguedadDirector;
    }
    
    
    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public int getDNIdirector() {
        return DNIdirector;
    }

    public void setDNIdirector(int DNIdirector) {
        this.DNIdirector = DNIdirector;
    }

    public int getEdadDirector() {
        return EdadDirector;
    }

    public void setEdadDirector(int EdadDirector) {
        this.EdadDirector = EdadDirector;
    }

    public int getAntiguedadDirector() {
        return antiguedadDirector;
    }

    public void setAntiguedadDirector(int antiguedadDirector) {
        this.antiguedadDirector = antiguedadDirector;
    }
    
    
    public String toString(){
        String aux;
        aux = "Nombre " + this.getNombreDirector() + " DNI " + this.getDNIdirector() + " Edad " + this.getEdadDirector() + " Antiguedad " + this.getAntiguedadDirector();
        return aux;
    }
}
