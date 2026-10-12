package Premiaciones;

/**
 *
 * @author Thiago
 */
public class Postulado {
    private String nombre;
    private int cantPublicaciones;
    private int antiguedad;
    
    public Postulado(String nombre, int cantPublicaciones, int antiguedad){
        this.nombre=nombre;
        this.cantPublicaciones=cantPublicaciones;
        this.antiguedad=antiguedad;
    }

    public String getNombre() {
        return nombre;
    }

    public int getCantPublicaciones() {
        return cantPublicaciones;
    }

    public int getAntiguedad() {
        return antiguedad;
    }
    
    public String toString(){
        String aux = " Nombre: " + this.getNombre() + " Publicaciones: " + this.getCantPublicaciones() + " Antiguedad: " + this.antiguedad;
        return aux;
    }
}
