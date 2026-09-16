
package Ejemplos;

public class Producto {
    private double precio= 10;
    private String nombre;
    private String descripcion = "sin descripcion";
    private Fabrica fabricante;
    public Producto(String unNombre,double unPrecio, Fabrica unFabricante){
        nombre= unNombre;
        precio = unPrecio;
        fabricante = unFabricante;
        
    }
    
    public Producto(String unNombre){
        nombre= unNombre;
    }
    
    public Producto(){
        nombre="vacio";
        precio=0.01;
    }
    public String toString(){
        String aux= "Producto: " + nombre + "vale " + precio;
        aux += fabricante;
        return aux;
    }    
}
