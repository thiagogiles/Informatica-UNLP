/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica_4;

/**
 *
 * @author 52984
 */
public class MainDibujo {   
 public static void main(String[] args) { 
  Dibujo d = new Dibujo("Pinturas"); 
         
  Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa"); 
  Triangulo t= new Triangulo(15,20,10,"Azul","Celeste"); 
  Cuadrado c2= new Cuadrado(30,"Rojo","Naranja"); 
         
  d.agregar (c1); 
  d.agregar (t); 
  d.agregar (c2); 
         
  d.mostrar(); 
 }  
}