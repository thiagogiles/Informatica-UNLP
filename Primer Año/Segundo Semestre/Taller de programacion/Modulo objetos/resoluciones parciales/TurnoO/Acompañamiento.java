package TurnoO;

/**
 *
 * @author Thiago
 */
public class Acompañamiento extends DatosEnComun {
    private int unidades;
    
    public Acompañamiento(String nombre, double costoBasico, String categoria,int unidades) {
        super(nombre,costoBasico,categoria);
        this.unidades=unidades;
    }

    public int getUnidades() {
        return unidades;
    }
    
    public double calcularCosto(){
        return super.calcularCosto() * this.getUnidades();
    }
}
