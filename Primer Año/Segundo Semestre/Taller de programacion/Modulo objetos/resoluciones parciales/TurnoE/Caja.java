package TurnoE;

/**
 *
 * @author Thiago
 */
public class Caja {
    private String nombreCajero;
    private Ticket tickets[];
    private int maxTickets;
    private int cargados;
    
    public Caja(String nombreCajero, int T){
        this.nombreCajero=nombreCajero;
        this.tickets= new Ticket[T];
        this.cargados=0;
        this.maxTickets=T;
        this.iniciar();
    }
    
    private void iniciar(){
        for(int i=0; i<this.maxTickets; i++){
            this.tickets[i]=null;
        }
    }
    
    public void agregarTicket(Ticket t){
        if(this.cargados < this.maxTickets){
            this.tickets[this.cargados]=t;
            this.cargados++;
            System.out.println("Ticket cargado correctamente");
        }
        else{System.out.println("Se llego al maximo de tickets");}
    }
    
    public int cantCredito(){
        int cont=0;
        for(int i=0; i<this.cargados; i++){
            if(this.tickets[i].getMetodo().equals("credito")){
                cont++;
            }
  
    }
        return cont;
}
    
    public String toString(){
        String aux=" Tickets emitidos: ";
        for(int i=0; i<this.cargados; i++){
            aux+= this.tickets[i].toString() + "\n";
        }
        return aux;
    }
}
