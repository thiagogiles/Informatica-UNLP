/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica_2;

/**
 *
 * @author Thiago
 */
public class PersonaMia {
   private String Nombremio;
    private int edadmia;
    private int DNImio;
    
    public PersonaMia(String Nombre, int edad, int DNI) {
       Nombremio = Nombre;
        edadmia = edad;
        DNImio = DNI;
    }

    public String getNombremio() {
        return Nombremio;
    }

    public void setNombremio(String Nombremio) {
        this.Nombremio = Nombremio;
    }

    public int getEdadmia() {
        return edadmia;
    }

    public void setEdadmia(int edadmia) {
        this.edadmia = edadmia;
    }

    public int getDNImio() {
        return DNImio;
    }

    public void setDNImio(int DNImio) {
        this.DNImio = DNImio;
    }

    @Override
    public String toString() {
        return "Datos de la persona: " + "Nombremio=" + Nombremio + ", edadmia=" + edadmia + ", DNImio=" + DNImio;
    }
 
    
    
    
}
