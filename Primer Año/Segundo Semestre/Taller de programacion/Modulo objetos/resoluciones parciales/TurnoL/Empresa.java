package TurnoL;

/**
 *
 * @author Thiago
 */
public class Empresa {
    private String nomEmpresa;
    private ProgramadorLider lider;
    private Programador programadores [];
    private int totalProgramadores;
    
    public Empresa(String nomEmpresa, ProgramadorLider lider, int N){
        this.nomEmpresa=nomEmpresa;
        this.lider=lider;
        this.programadores = new Programador [N];
        this.totalProgramadores=N;
        this.iniciar();
    }
    
    private void iniciar(){
        for(int i=0; i<this.totalProgramadores; i++){
            this.programadores[i]=null;
        }
    }
    
    public void asignarProgramador(Programador p, int X){
        if(programadores[X-1] == null){
        this.programadores[X-1]= p;
            System.out.println("Programador asignado");
    }
        else{System.out.println("No hay lugar en el puesto indicado");}
    
}
    
    public double montoTotal(){
        double aux =0;
        aux+= this.lider.calcularSueldo();
        for(int i=0; i<this.totalProgramadores; i++){
            if(this.programadores[i]!=null){aux+= this.programadores[i].calcularSueldo();};
        }
       return aux;
    }
    
    public void aumentarSueldo(double M){
        for(int i=0; i<this.totalProgramadores; i++){
            if(this.programadores[i]!=null){this.programadores[i].setSueldoBasico(this.programadores[i].getSueldoBasico() + M);
        }
    }
}
 
    public String toString(){
        String aux= "Empresa: " + this.nomEmpresa;
        aux+= "\n";
        aux += " Programador lider " + this.lider.toString();
        for(int i=0; i<this.totalProgramadores; i++){
            if(this.programadores[i]!=null){ aux+= "\n" + " Programador asignado al puesto " + (i+1) + this.programadores[i].toString();
        }
        
    }
        return aux;
}
}
