/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5ej4;

/**
 *
 * @author 52984
 */
public class Coro_Hileras extends Coro{
    private Coristas matriz [][];
    private int diml;
    private int total;
    public Coro_Hileras(String nom,Director dir, int dimf){
        super(nom,dir,dimf);
        this.diml=0;
        this.total = dimf * dimf;
        this.matriz = new Coristas [this.getDimf()][this.getDimf()];
        this.iniciar();
    }
    
    private void iniciar(){
        for(int i=0; i<this.getDimf(); i++){
            for(int j=0; j<this.getDimf(); j++){
                this.matriz[i][j]=null;
            }
        }
    }
    
    public void agregarCorista(Coristas cor){
        if(this.diml < this.total){
            matriz[this.diml / this.total][this.diml % this.total] = cor;
           this.diml++;
        }
    }
    
    public boolean estaLleno(){
        return this.diml == this.total;
    }
    
    public boolean bienFormado(){
        boolean ok=true;
        int i=0, j=0;
        while((ok)&& (i<this.getDimf())){
            j=0;
            int aux= matriz[i][j].getTono();
            while((ok) && (i<this.total) && (j<this.getDimf())){
                if((matriz[i][j+1] != null) && (aux != matriz[i][j+1].getTono())){
                    ok=false;
                }
                j++;
            }

            
    }
        return ok;
    }
    
    public String toString(){
        String aux = super.toString();
       
        for(int i=0; i<this.diml; i++){
            aux+= "\n";
            aux+= matriz[i/this.getDimf()][i%this.getDimf()].toString();
            
        }
        return aux;
    }
}

