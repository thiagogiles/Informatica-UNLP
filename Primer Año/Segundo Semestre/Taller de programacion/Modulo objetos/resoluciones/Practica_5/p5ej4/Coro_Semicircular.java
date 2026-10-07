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
public class Coro_Semicircular extends Coro {
    private Coristas vector [];
    private int dimlSemi;
    public Coro_Semicircular(String nom,Director dir, int dimf){
        super(nom,dir,dimf);
        this.dimlSemi=0;
        this.vector = new Coristas [dimf];
        this.iniciar();
    }
    
    private void iniciar(){
        for(int i=0; i<this.getDimf(); i++){
            this.vector[i]=null;
        }
    }
    
    public void agregarCorista(Coristas cor){
        if(!estaLleno()){
            this.vector[this.dimlSemi]= cor;
            this.dimlSemi++;
        }
        
    }
    public boolean estaLleno(){
        return this.dimlSemi == this.getDimf(); 
    }
    
    public boolean bienFormado(){
        boolean ok =true;
        int i=0 ; 
        
        while((i<this.dimlSemi-1) && (ok)){
          
        
          if((vector[i].getTono() < vector[i+1].getTono())){
              ok=false;
          }          
          else{
              i++;
          }
        }
        return ok;
    }
    
    public String toString(){
    String aux = super.toString();
    for(int i=0; i<this.dimlSemi; i++){
        aux+= "\n";
        aux+= vector[i].toString();
        
    }
        
    return aux;
    }
}
