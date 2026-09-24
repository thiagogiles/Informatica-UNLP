package Practica_4;

/**
 *
 * @author Thiago
 */
public abstract class Figura {
    private String colorRelleno;
    private String colorLinea;
    
    public Figura(String linea, String relleno){
        this.setColorLinea(linea);
        this.setColorRelleno(relleno);
    }
    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public abstract double calcularArea();
    
    public abstract double calcularPerimetro();
        
    public String toString(){
        String aux = "Color de relleno " + this.getColorRelleno() + " Color de linea " + this.getColorLinea() + " Area: " + this.calcularArea() + " Perimetro: " + this.calcularPerimetro();
        return aux;
    }
    
    public void despintar(){
        this.setColorLinea("Negra");
        this.setColorRelleno("Blanco");
    }
}
