package TurnoO;

/**
 *
 * @author Thiago
 */
public class Desayuno {
    private String nombreDesayuno;
    private Infusion infusion;
    private Acompañamiento acompañamiento[];
    private int totalAcompañamientos;
    private int almacenados;
    
    public Desayuno(String nombre, Infusion infusion, int N){
        this.nombreDesayuno=nombre;
        this.infusion=infusion;
        this.totalAcompañamientos=N;
        this.almacenados=0;
        this.acompañamiento = new Acompañamiento [N];
        this.iniciar();
    }
    
    private void iniciar(){
        for(int i=0; i<this.totalAcompañamientos; i++){
            this.acompañamiento[i]=null;
        }
    }
    
    public void agregarAcompañamiento(Acompañamiento a){
        if(this.almacenados < this.totalAcompañamientos){
            this.acompañamiento[this.almacenados]=a;
            this.almacenados++;
            System.out.println("Acompañamiento agregado correctamente");
        }
        else{System.out.println("No hay lugar para guardar mas acompañamientos");}
    }
    
    public double costoTotal(){
        double aux=0;
        aux+= this.infusion.calcularCosto();
        for(int i=0; i<this.almacenados; i++){
            aux+= this.acompañamiento[i].calcularCosto();
        }
        return aux;
    }
    
    public String toString(){
        String aux= "Nombre: " + this.nombreDesayuno + "\n";
        aux+= "Infusion: " + this.infusion.toString() + "\n";
        for(int i=0; i<this.almacenados; i++){
            aux+= "Acompañamiento: " + this.acompañamiento[i].toString();
            aux+= "\n";
        }
        return aux;
        
    }
}
