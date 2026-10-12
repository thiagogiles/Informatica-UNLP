package TurnoB2025;

/**
 *
 * @author Thiago
 */
public class Alumno {
    private String nomAlumno;
    private String legajo;
    private Examen examen;
    private Entrega entregas[];
    private int maxEntregas;
    
    public Alumno(String nomAlumno, String legajo, Examen examen){
        this.nomAlumno=nomAlumno;
        this.legajo=legajo;
        this.maxEntregas=9;
        this.entregas= new Entrega[9];
        this.examen=examen;
        this.iniciar();
    }
    
    private void iniciar(){
        for(int i=0; i<this.maxEntregas; i++){
            this.entregas[i]=null;
        }
    }
    
    public void registrarEntrega(int I, Entrega e){
        if(this.entregas[I-1] == null){
            this.entregas[I-1] = e;
            System.out.println("Entrega registrada");
        }
        else{System.out.println("Ya hay una entrega registrada en la posicion " + (I+1));
    }
}
    
   public boolean estaAprobado(){
       if(this.examen.estaAprobado()){
           int cont=0;
           for(int i=0; i<this.maxEntregas; i++){
               if((this.entregas[i]!=null) && (this.entregas[i].estaAprobado()))
                   cont++;
           }
          if(cont >=3){return true;}
          else{return false;}
       }
       else{return false;}
   }
}
