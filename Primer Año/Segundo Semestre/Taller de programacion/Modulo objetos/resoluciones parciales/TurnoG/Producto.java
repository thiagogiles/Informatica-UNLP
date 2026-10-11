package TurnoG;

/**
 *
 * @author Thiago
 */
public class Producto {
    private int codigo;
    private String nomProducto;
    private String marca;
    private int unidades;
    private double precioxunidad;

    public Producto(int codigo, String nomProducto, String marca, int unidades, double precioxunidad) {
        this.codigo = codigo;
        this.nomProducto = nomProducto;
        this.marca = marca;
        this.unidades = unidades;
        this.precioxunidad = precioxunidad;
    }

    public int getCodigo() {
        return codigo;
    }

    public String getNomProducto() {
        return nomProducto;
    }

    public String getMarca() {
        return marca;
    }

    public int getUnidades() {
        return unidades;
    }

    public double getPrecioxunidad() {
        return precioxunidad;
    }
    
    public String toString(){
        return "Producto: " + this.getCodigo() + " Nombre " + this.getNomProducto() + " Marca " + this.getMarca() + " Unidades " + this.getUnidades() + " Precio " + this.getPrecioxunidad();
    }
}
