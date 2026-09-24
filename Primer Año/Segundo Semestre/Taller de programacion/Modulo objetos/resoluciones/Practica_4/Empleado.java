package Practica_4;

/**
 *
 * @author Thiago
 */
public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    
    public Empleado(String nombre, double sueldo, int antiguedad){
        this.setNombre(nombre);
        this.setAntiguedad(antiguedad);
        this.setSueldo(sueldo);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    
    public abstract double calcularEfectividad();
    
    public double calcularSueldoACobrar(){
        return this.getSueldo() + (this.getAntiguedad() * 1.1);
    }
    
    public String toString(){
        String aux= "Nombre del empleado: " + this.getNombre() + " Sueldo:  " + this.calcularSueldoACobrar() +  " Efectividad: " + this.calcularEfectividad();
        return aux;
    }
}
