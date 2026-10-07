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
public class Balanza_Avanzada extends Balanza_Basica {
    private int Verduras;
    private int Frutas;
    
    public Balanza_Avanzada(){
        this.Verduras=0;
        this.Frutas=0;
    }
    
    public void Reiniciar(){
        super.Reiniciar();
        this.Verduras=0;
        this.Frutas=0;
    }
    
    public void RegistrarProducto(Producto p){
        super.RegistrarProducto(p);
        if(p.getRubro().equals("Verdura")){this.Verduras++;}
        else{this.Frutas++;}
    }
    
    public Ticket finalizarCompra(){
        Ticket aux =super.finalizarCompra();
        aux.setResumen(aux.getResumen() + " Cantidad de verduras: " + this.Verduras + " Cantidad de frutas: " + this.Frutas);
        return aux;
    }
}
