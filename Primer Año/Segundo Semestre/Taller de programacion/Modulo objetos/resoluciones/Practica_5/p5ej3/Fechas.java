/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5ej3;

/**
 *
 * @author 52984
 */
public class Fechas {
  private String ciudad;
  private int diaFecha;

    public Fechas(String ciudad, int diaFecha) {
        this.ciudad = ciudad;
        this.diaFecha = diaFecha;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public int getDiaFecha() {
        return diaFecha;
    }

    public void setDiaFecha(int diaFecha) {
        this.diaFecha = diaFecha;
    }
  
    public String toString(){
        return this.getCiudad() + " El dia " + this.getDiaFecha();
    }
}
