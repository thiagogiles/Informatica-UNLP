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
public abstract class Coro {
    private String nombreCoro;
    private Director dir;
    private int dimf;

    public Coro(String nom,Director dir,int dimf) {
        this.nombreCoro=nom;
        this.dir = dir;
        this.dimf=dimf;
        
    }

    public String getNombreCoro() {
        return nombreCoro;
    }
 
    public Director getDir() {
        return dir;
    }

    public int getDimf() {
        return dimf;
    }
    
  public abstract void agregarCorista(Coristas cor);
  
  public abstract boolean estaLleno();
  
  public abstract boolean bienFormado();
  
  public String toString(){
      String aux;
      aux = " Nombre del coro: " + this.getNombreCoro() + " Director " +  this.getDir().toString();
      return aux;
  }
}
