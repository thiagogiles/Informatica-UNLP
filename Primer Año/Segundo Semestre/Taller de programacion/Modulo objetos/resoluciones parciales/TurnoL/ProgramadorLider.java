package TurnoL;

/**
 *
 * @author Thiago
 */
public class ProgramadorLider extends Programador {
    private int antiguedad;
    private int proyectos;

    public ProgramadorLider(String nombre, int DNI, double sueldoBasico, int lineasPorHora, String lenguaje, int antiguedad, int proyectos) {
        super(nombre, DNI, sueldoBasico, lineasPorHora, lenguaje);
        this.antiguedad = antiguedad;
        this.proyectos = proyectos;
    }
 
     
    public double calcularSueldo(){
     double aux= super.calcularSueldo();
     aux+= 10000 * this.antiguedad;
     aux+= 20000 * this.proyectos;
     return aux;
}
    
    public String toString(){
        String aux= super.toString() + " Años de antiguedad: " + this.antiguedad + " Proyectos dirigidos: " + this.proyectos;
        return aux;
    }
}
