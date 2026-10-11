/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5ej1;

/**
 *
 * @author 52984
 */
public class Investigador  {
    private String nombreinv;
    private int categoria;
    private String especialidad;
    private Subsidio vector [];
    private int dimf = 5, diml;
    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombreinv = nombreinv;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.diml=0;
        this.iniciar();
    }
    
    private void iniciar(){
        for (int i=0; i<5; i++){
            vector[i]=null;
        }
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        if(this.diml<this.dimf){
            vector[this.diml]=unSubsidio;
            this.diml++;
        }
    }
    
    public void otorgarSubsidio(int X){
        if(vector[X-1] != null){
            vector[X-1].setOtorgado(true);
        }
    }
    
    public double sumarOtorgado(){
        double aux = 0;
        for (int i=0; i<this.diml; i++){
            if(vector[i].isOtorgado()){
                aux += vector[i].getMontoPedido();
            }
        }
        return aux;
    }
}
