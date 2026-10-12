package TurnoB2025;

/**
 *
 * @author Thiago
 */
public class Entrega extends Evaluacion{
    private double notaPresentacion;
    private double notaContenido;
    private double notaOriginalidad;
    
    public Entrega(String fecha, String evaluador, double notaPresentacion, double notaContenido, double notaOriginalidad){
        super(fecha,evaluador);
        this.notaPresentacion=notaPresentacion;
        this.notaContenido=notaContenido;
        this.notaOriginalidad=notaOriginalidad;
    }

    public double getNotaPresentacion() {
        return notaPresentacion;
    }

    public double getNotaContenido() {
        return notaContenido;
    }

    public double getNotaOriginalidad() {
        return notaOriginalidad;
    }
    
    public double notaFinal(){
        return (this.getNotaContenido() + this.getNotaOriginalidad() + this.getNotaPresentacion()) / 3.0;
    }
}
