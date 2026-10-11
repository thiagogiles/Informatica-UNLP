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
public class Balanza_Basica {
    private int NumeroCompra;
    private Producto productos[];
    private int maxProductos;
    private int cantProductos;
    public Balanza_Basica(){
        this.NumeroCompra=1;
        this.maxProductos=30;
        this.cantProductos=0;
        this.productos = new Producto [this.maxProductos];
        this.iniciar();
    }
    
    private void iniciar(){
        for(int i=0; i<this.maxProductos; i++){
            productos[i]=null;
        }
    }
    
    public void Reiniciar(){
        this.NumeroCompra++;
        this.iniciar();
    }
    
    public void RegistrarProducto(Producto p){
        if(this.cantProductos<this.maxProductos){
            productos[this.cantProductos]=p;
            this.cantProductos++;
        }
    }
    
    public double montoTotal(){
        double aux=0;
        for(int i=0; i<this.cantProductos; i++){
            aux+= productos[i].getPeso() * productos[i].getPesoKG();
        }
        return aux;
    }
    
    public Ticket finalizarCompra(){
        Ticket aux = new Ticket();
        aux.setNroCompra(this.NumeroCompra);
        for(int i=0; i<this.cantProductos; i++){
            aux.setResumen(aux.getResumen() + "Producto " + productos[i].getDescripcion() + " Precio final "+ (this.productos[i].getPeso() * this.productos[i].getPesoKG()) + "\n");
        }
        aux.setMonto(this.montoTotal());
        return aux;
    }
}
