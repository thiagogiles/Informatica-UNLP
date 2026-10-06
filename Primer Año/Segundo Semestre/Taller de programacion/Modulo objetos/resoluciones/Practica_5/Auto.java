/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5ej2;

/**
 *
 * @author 52984
 */
public class Auto {
    private String dueño;
    private String patente;
    
    public Auto(String dueño, String patente){
        this.dueño=dueño;
        this.patente=patente;
    }
    public String getDueño() {
        return dueño;
    }

    public String getPatente() {
        return patente;
    }
    
    
    public String toString(){
        return " Dueño: " + this.getDueño() + " Patente: " + this.getPatente();
    }
}
