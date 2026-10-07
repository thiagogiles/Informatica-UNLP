/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5ej4;


public class Coristas {
    
    private String nombreCorista;
    private int DNICorista;
    private int EdadCorista;
    private int Tono;

    public Coristas(String nombreCorista, int DNICorista, int EdadCorista, int Tono) {
        this.nombreCorista = nombreCorista;
        this.DNICorista = DNICorista;
        this.EdadCorista = EdadCorista;
        this.Tono = Tono;
    }

    public String getNombreCorista() {
        return nombreCorista;
    }

    public void setNombreCorista(String nombreCorista) {
        this.nombreCorista = nombreCorista;
    }

    public int getDNICorista() {
        return DNICorista;
    }

    public void setDNICorista(int DNICorista) {
        this.DNICorista = DNICorista;
    }

    public int getEdadCorista() {
        return EdadCorista;
    }

    public void setEdadCorista(int EdadCorista) {
        this.EdadCorista = EdadCorista;
    }

    public int getTono() {
        return Tono;
    }

    public void setTono(int Tono) {
        this.Tono = Tono;
    }
    
    public String toString(){
        String aux;
        aux = " Nombre " + this.getNombreCorista() + " DNI " + this.getDNICorista() +" Edad " + this.getEdadCorista() +  " Tono " + this.getTono();
        return aux;
    }
}
