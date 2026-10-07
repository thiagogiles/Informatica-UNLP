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
public class Evento_ocasional extends Recital {
    private String motivo;
    private String nombreContratante;
    private int dia;

    public Evento_ocasional(String Banda, int N, String motivo, String nombreContratante, int dia) {
        super(Banda, N);
        this.motivo = motivo;
        this.nombreContratante = nombreContratante;
        this.dia = dia;
    }
    
        
    public double calcularCostoRecital(){
        if(this.motivo.equals("a beneficio")){ return 0;}
        else if(this.motivo.equals("show de TV")) { return 50000;}
        else {return 150000;}
    }
    
    public String actuacion(){
        String aux = super.actuacion();
        aux += "\n";
        if(this.motivo.equals("a beneficio")){ return aux += "Recuerden colaborar con " + this.nombreContratante;}
        else if(this.motivo.equals("show de TV")) { return aux += " aludos amigos televidentes ";}
        else {return aux+= "Un feliz cumpleaños para " + this.nombreContratante;}
        
    }
}
