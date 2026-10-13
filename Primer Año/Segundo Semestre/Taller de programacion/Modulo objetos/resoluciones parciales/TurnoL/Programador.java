package TurnoL;

/**
 *
 * @author Thiago
 */
public class Programador {
    private String nombre;
    private int DNI;
    private double sueldoBasico;
    private int lineasPorHora;
    private String lenguaje;

    public Programador(String nombre, int DNI, double sueldoBasico, int lineasPorHora, String lenguaje) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.sueldoBasico = sueldoBasico;
        this.lineasPorHora = lineasPorHora;
        this.lenguaje = lenguaje;
    }

    public String getNombre() {
        return nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public double getLineasPorHora() {
        return lineasPorHora;
    }

    public String getLenguaje() {
        return lenguaje;
    }
    
    
    public double calcularSueldo(){
        double aux = this.sueldoBasico;
        if(this.lineasPorHora > 200){
            aux += 50000;
        }
        return aux;
    }
    
    public String toString(){
        String aux = "Nombre: " + this.getNombre() + " DNI: " + this.getDNI() + " Sueldo basico: " + this.getSueldoBasico() + " Lineas por hora: " + this.getLineasPorHora() + " Lenguaje de preferencia: " + this.getLenguaje();
      return aux;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }
    
    
}
