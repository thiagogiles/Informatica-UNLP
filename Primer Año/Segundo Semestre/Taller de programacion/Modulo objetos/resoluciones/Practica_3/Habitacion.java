package Practica_3;
import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {
    
    private double costo;
    private boolean ocupada;
    private Persona cliente;
    
    public Habitacion(){
        costo = GeneradorAleatorio.generarDouble(6001)+2000;
        ocupada = false;
        cliente=null;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public Persona getCliente() {
        return cliente;
    }

    public void setCliente(Persona cliente) {
        this.cliente = cliente;
    }
}
