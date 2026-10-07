/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5ej1;

public class Proyecto {
    
    private String nombre;
    private int codigo;
    private String nombreDirector;
    private Investigador vector[];
    private int diml;
    
    public Proyecto(String nombre, int codigo, String nombreDirector) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        this.diml=0;
        this.iniciar();
    }
    
    private void iniciar(){
        for (int i=0; i<50; i++){
            this.vector[i]=null;
        }
    }
    
    public void agregarInvestigador(Investigador unInvestigador){
        if(this.diml<50){
            this.vector[this.diml]= unInvestigador;
            this.diml++;
        }
    }
    
    public double dineroTotalOtorgado(){
        double aux = 0;
        for(int i=0; i<this.diml; i++){
            aux += this.vector[i].sumarOtorgado();
        }
        return aux;
    }
}
