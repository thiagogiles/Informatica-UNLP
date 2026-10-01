package Practica_4;

/**
 *
 * @author Thiago
 */
public class Trabajador extends Persona {
    private String oficio;
    public Trabajador(String nombre, int dni, int edad, String oficio){
        super(nombre,dni,edad);
       this.setOficio(oficio);
    }

    public String getOficio() {
        return oficio;
    }

    public void setOficio(String oficio) {
        this.oficio = oficio;
    }
    
    public String toString(){
        String aux = super.toString() +  " Soy " + this.getOficio();
        return aux;
    }
}
