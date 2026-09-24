package Practica_4;

/**
 *
 * @author Thiago
 */
public class Entrenador extends Empleado {
    private int campeonatos;
    
    public Entrenador(int campeonatos, String nombre, double sueldo, int antiguedad){
        super(nombre,sueldo,antiguedad);
        this.setCampeonatos(campeonatos);
    }
    
    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }
    
    public double calcularEfectividad(){
        return (double) this.getCampeonatos()/this.getAntiguedad();
    }
    
    
    public double calcularSueldoACobrar(){
        if(this.getCampeonatos() <= 0) {
            return super.calcularSueldoACobrar();
        }
        else if(this.getCampeonatos() >= 1  && this.getCampeonatos() <= 4){
          return super.calcularSueldoACobrar() + 5000;
    }
       else if(this.getCampeonatos() >= 5 && this.getCampeonatos() <= 10){
        return super.calcularSueldoACobrar() + 30000;
    }      
   else
           return super.calcularSueldoACobrar() + 50000 ;
}
}