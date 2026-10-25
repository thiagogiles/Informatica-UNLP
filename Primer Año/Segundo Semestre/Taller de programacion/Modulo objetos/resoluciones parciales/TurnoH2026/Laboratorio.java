/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TurnoH2026;

/**
 *
 * @author 52984
 */
public class Laboratorio {
    private String nombre;
    private int capacidadMaxima;
    private Programador programadores[];
    private int cargados;
    
    public Laboratorio(String nombre, int N){
        this.nombre=nombre;
        this.capacidadMaxima=N;
        this.cargados=0;
        this.programadores= new Programador[N];
        this.iniciar();
    }
    
    private void iniciar(){
        for(int i=0; i<this.capacidadMaxima; i++){
            this.programadores[i]=null;
        }
    }

    public int getCargados() {
        return cargados;
    }

    public String getNombre() {
        return nombre;
    }
    
    public void cargarProgramador(Programador p){
        if(this.cargados<this.capacidadMaxima){
            this.programadores[this.cargados]=p;
            this.cargados++;
        }
        else{System.out.println("El laboratorio esta lleno");}
    }
    
    public boolean  asignarExperiencia(int DNI, int años){
        int i=0; boolean ok=false;
        while((i<this.cargados) && (!ok)){
        if(this.programadores[i].getDNI() == DNI){
            this.programadores[i].setAñosExperiencia(años);
            ok=true;
        }
        i++;
    }
        return ok;
    }
    
    public int contarProgramadores(String X){
        int aux=0;
        for(int i=0; i<this.cargados; i++){
            if(this.programadores[i].getLenguajePrincipal().equals(X)){
                aux++;
            }
        }
       return aux;
    }
    
    public String toString(){
        String aux= "Nombre: " + this.getNombre() + " Programadores asignados: " + this.getCargados() + "\n";
        for(int i=0; i<this.cargados; i++){
            aux+=" Programador " + (i+1) + this.programadores[i].toString() + "\n";
        }
        return aux;
    }
}
