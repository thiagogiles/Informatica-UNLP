package TurnoO;

/**
 *
 * @author Thiago
 */
public abstract class DatosEnComun {
    private String nombre;
    private double costoBasico;
    private String categoria;

    public DatosEnComun(String nombre, double costoBasico, String categoria) {
        this.nombre = nombre;
        this.costoBasico = costoBasico;
        this.categoria = categoria;
    }

    public double getCostoBasico() {
        return costoBasico;
    }

    public String getCategoria() {
        return categoria;
    }
 
    
    public double calcularCosto(){
        if(this.categoria.equals("Premium")){
            return this.getCostoBasico() + (this.getCostoBasico() * 0.1);
        }
        else{ return this.getCostoBasico();}
    }
    
    public String toString(){
        String aux= "Nombre: " + this.nombre + " Categoria: " + this.getCategoria() + " Costo basico: " + this.getCostoBasico();
        return aux;
    }
}
