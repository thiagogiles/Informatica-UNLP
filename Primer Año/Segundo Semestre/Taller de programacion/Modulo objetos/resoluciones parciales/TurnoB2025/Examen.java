package TurnoB2025;

/**
 *
 * @author Thiago
 */
public class Examen extends Evaluacion {
    private double notaTeoria;
    private double notaPractica;
    public Examen(String fecha, String evaluador, double notaTeoria, double notaPractica){
        super(fecha,evaluador);
        this.notaTeoria=notaTeoria;
        this.notaPractica=notaPractica;
    }

    public double getNotaTeoria() {
        return notaTeoria;
    }

    public double getNotaPractica() {
        return notaPractica;
    }
    
    public double notaFinal(){
        return this.getNotaPractica() * 0.6 + this.getNotaTeoria() * 0.4;
    }
}
