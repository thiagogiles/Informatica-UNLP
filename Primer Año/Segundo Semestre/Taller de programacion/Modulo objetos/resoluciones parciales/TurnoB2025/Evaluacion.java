package TurnoB2025;

/**
 *
 * @author Thiago
 */
public abstract class Evaluacion {
    private String fecha;
    private String evaluador;
    
    public Evaluacion(String fecha, String evaluador){
        this.fecha=fecha;
        this.evaluador=evaluador;
    }

    public String getFecha() {
        return fecha;
    }

    public String getEvaluador() {
        return evaluador;
    }
    
    
    public abstract double notaFinal();
    
    public boolean estaAprobado(){
        if(this.notaFinal() <4){
            return false;
        }
        else{return true;}
    }
}
