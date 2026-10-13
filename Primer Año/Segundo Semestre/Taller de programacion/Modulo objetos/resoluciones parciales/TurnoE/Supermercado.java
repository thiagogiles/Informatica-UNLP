package TurnoE;

/**
 *
 * @author Thiago
 */
public class Supermercado {
    private String direccion;
    private int ventaActual;
    private Caja caja[];
    private int cajasAlmacenadas;
    private int maxCajas=5;
    
    public Supermercado(String direccion){
        this.direccion=direccion;
        this.ventaActual=0;
        this.caja= new Caja [this.maxCajas];
        this.cajasAlmacenadas=0;
        this.iniciar();
    }
    
    private void iniciar(){
        for(int i=0; i<5; i++){
            this.caja[i]=null;
        }
    }
    
    public void agregarCaja(Caja c){
        if(this.cajasAlmacenadas < this.maxCajas){
            this.caja[this.cajasAlmacenadas]=c;
            this.cajasAlmacenadas++;
            System.out.println("Caja almacenada correctamente");
        }
        else{System.out.println("No hay espacio para ingresar mas cajas");}
    }
    
    public void generarTicket(int N, int CUIT, int cant, double monto, String forma){
       Ticket aux = new Ticket(this.ventaActual,CUIT,cant,monto,forma);
       this.ventaActual++;
       this.caja[N-1].agregarTicket(aux);
       
    }
    
    public int cajaMenor(){
        int num=0, min=9999;
        for(int i=0; i<this.cajasAlmacenadas; i++){
            if(this.caja[i].cantCredito() < min){
                num=(i+1);
                min=this.caja[i].cantCredito();
            }
        }
       return num;
    }
    
    public String toString(){
        String aux = " Supermercado: " + this.direccion + " Cantidad de cajas: " + this.cajasAlmacenadas + "\n";
        for(int i=0; i<this.cajasAlmacenadas; i++){
            aux+= "Caja : " + (i+1) + this.caja[i].toString() + "\n";

        }
        return aux;
    }
}
