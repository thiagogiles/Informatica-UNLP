package TurnoE;

/**
 *
 * @author Thiago
 */
public class Ticket {
    private int nroTicket;
    private int cuitCliente;
    private int comprados;
    private double abonado;
    private String metodo;
    
    public Ticket(int nroTicket, int cuitCliente, int comprados, double abonado, String metodo){
        this.nroTicket=nroTicket;
        this.cuitCliente=cuitCliente;
        this.comprados=comprados;
        this.abonado=abonado;
        this.metodo=metodo;
    }

    public String getMetodo() {
        return metodo;
    }

    public int getNroTicket() {
        return nroTicket;
    }

    public int getCuitCliente() {
        return cuitCliente;
    }

    public int getComprados() {
        return comprados;
    }

    public double getAbonado() {
        return abonado;
    }
    
    
    public String toString(){
        String aux= " Numero: " + this.getNroTicket() + " Cuit: " + this.getCuitCliente() + " Cantidad de productos: " + this.getComprados() +  " Monto abonado: " + this.getAbonado() + " Medio de pago: " + this.getMetodo() + "\n";
      return aux;
    } 
}
