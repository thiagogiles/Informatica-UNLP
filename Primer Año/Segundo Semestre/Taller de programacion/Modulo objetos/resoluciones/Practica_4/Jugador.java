package Practica_4;

/**
 *
 * @author Thiago
 */
public class Jugador extends Empleado {
    private int partidos;
    private int goles;
    
    public Jugador(int partidos, int goles, String nombre, double sueldo, int antiguedad){
        super(nombre,sueldo,antiguedad);
        this.setGoles(goles);
        this.setPartidos(partidos);
    }

    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    
    public double calcularEfectividad(){
        return (double) this.getGoles() / this.getPartidos();
    }
    
    public double calcularSueldoACobrar(){
        if(this.calcularEfectividad() > 0.5){
        return super.calcularSueldoACobrar() + this.getSueldo();
    }
        else { return super.calcularSueldoACobrar(); }
}
    

}