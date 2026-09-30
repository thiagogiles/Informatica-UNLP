/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p4ej5;

/**
 *
 * @author 52984
 */
public class Dibujo { 
  private String titulo; 
  private Figura [] vector; 
  private int guardadas; 
  private int capacidadMaxima=10; 
 
  //inicia el dibujo, sin figuras    
  public Dibujo (String titulo){ 
      this.titulo=titulo;
      vector = new Figura [this.capacidadMaxima];
      for(int i=0; i<10; i++){
          vector [i] = null;
      }
      this.guardadas= 0;
  } 
     
  //agrega la figura al dibujo 
  public void agregar(Figura f){ 
      vector [this.guardadas] = f;
      this.guardadas++;
      System.out.println("la figura "+ f.toString() +  " se ha guardado"); 
  } 
     
  //calcula el área del dibujo: 
  //suma de las áreas de sus figuras 
  public double calcularArea(){ 
      //completar
      double at =0;
      for(int i=0; i<this.guardadas; i++){
          at+= vector[i].calcularArea();
      }
      return at;
  } 
 
  //sigue a la derecha ->
   //imprime el título, representación 
  //de cada figura, y área del dibujo 
  public void mostrar(){ 
      //completar
      String aux ="Titulo: " + this.titulo;
      aux += "\n";
      for(int i=0; i<this.guardadas; i++){
      
      aux += vector[i].toString();
      aux+= "\n";
              }
      aux += " Area total: " + this.calcularArea();
      System.out.println(aux);
  } 
 
  //retorna está lleno el dibujo           
  public boolean estaLleno() { 
    return (guardadas == capacidadMaxima); 
  }   
}