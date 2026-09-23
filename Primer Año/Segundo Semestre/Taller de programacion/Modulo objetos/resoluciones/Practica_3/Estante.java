/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica_3;

/**
 *
 * @author Thiago
 */
public class Estante {
      private Libro [] libros;
      private int cantidad;
      private int maximo;
      
      public Estante(){
          libros = new Libro[20];
          cantidad = 0;
          maximo = 20;
      }
      
      public Estante(int N){
          libros = new Libro[N];
          cantidad = 0;
          maximo = N;
      }

      public int getCantidad() { 
          return cantidad;
      }
      
      public boolean estaLleno(){
          return this.cantidad == this.maximo;
      }
      

      public void agregarLibro(Libro unLibro){
          if (!estaLleno()){
          libros[this.cantidad] = unLibro;
          cantidad++;
          }
      }
      
      public Libro buscarTitulo(String Titulo){
          for(int i=0; i<cantidad; i++){
              if(libros[i].getTitulo().equals(Titulo)) {
                  return libros[i];    }    
      }
   return null;
}
      
}

