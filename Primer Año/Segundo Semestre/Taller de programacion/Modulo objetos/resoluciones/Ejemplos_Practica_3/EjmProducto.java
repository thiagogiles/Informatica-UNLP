/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Thiago
 */
public class EjmProducto {
     public static void main(String[] args) {
         Producto p = new Producto("Prod 1");
         Producto p2;
         
         Fabrica f1= new Fabrica("Arcor","La plata");
         Producto [] productos = new Producto [2];
         productos [0] = new Producto("Prod 2", 102.3,f1);
         
         productos[1] = new Producto();        
         
         
     }
}
