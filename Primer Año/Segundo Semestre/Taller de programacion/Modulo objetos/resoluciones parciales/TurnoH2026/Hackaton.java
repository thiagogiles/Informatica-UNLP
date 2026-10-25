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
public class Hackaton {
    private String tematica;
    private String fecha;
    private double montoGanador;
    private Laboratorio lab1;
    private Laboratorio lab2;
    
    public Hackaton(String tematica, String fecha, double montoGanador, Laboratorio lab1, Laboratorio lab2){
        this.tematica=tematica;
        this.fecha=fecha;
        this.montoGanador=montoGanador;
        this.lab1=lab1;
        this.lab2=lab2;
    }
    
    public String agregarProgramador(Programador p){
     
        if(this.lab1.getCargados() < this.lab2.getCargados()){
            this.lab1.cargarProgramador(p);
            return this.lab1.getNombre();
        }
        else{this.lab2.cargarProgramador(p);
        return this.lab2.getNombre();
        }
    }
    
    public void asignarExperiencia(int DNI, int años){
        if(!this.lab1.asignarExperiencia(DNI,años)){
        this.lab2.asignarExperiencia(DNI,años);}
    }
    
    public int cantidadProgramadores(String X){
        int aux=0;
        aux+= this.lab1.contarProgramadores(X);
        aux+= this.lab2.contarProgramadores(X);
        return aux;
    }
    
    public String toString(){
        String aux= "HACKATON: " + " " +this.tematica + " " + this.fecha+ " " + this.montoGanador + "\n";
        aux+= "Laboratorio: " + this.lab1.toString();
        aux+= "Laboratorio: " + this.lab2.toString();
        return aux;
    }
}
