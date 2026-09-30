/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p4ej4;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author 52984
 */
public abstract class Sistema {
    private Estacion e;
    private double temperaturas [] [];
    private int añoInicio;
    private int dimF;
    
    Sistema(String nombre, double  latitud, double  longitud, int A, int N){
        GeneradorAleatorio.iniciar();
        this.e = new Estacion(nombre,latitud,longitud);
        this.añoInicio = A;
        this.dimF = N;
        temperaturas = new double [N][12];
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < 12; j++) {
                temperaturas[i][j]= GeneradorAleatorio.generarDouble(5000)+15000;
            }
        }
    }

    public int getAñoInicio() {
        return añoInicio;
    }

    public void setAñoInicio(int añoInicio) {
        this.añoInicio = añoInicio;
    }

    public int getDimF() {
        return dimF;
    }

    public void setDimF(int dimF) {
        this.dimF = dimF;
    }
    
    
   public void registrarTemperatura(int mes, int año, double temperatura){
     this.temperaturas[año-this.añoInicio][mes-1] = temperatura;  
   }
   
   public double reportarTemperatura(int mes, int año){
       return this.temperaturas[año-this.añoInicio][mes-1];
   }    
   
   public String maxTemp(){
       String aux = "";
       double  max= 0;
       for(int i=0; i<this.dimF; i++){
           for(int j=0; j<12; j++){
               if(this.temperaturas[i][j] > max){
                   max = this.temperaturas[i][j];
                   aux = "El Año con mayor temperatura es : " + (i+this.añoInicio) + " En el mes " + ( j+1);
               }
                   
           }
       }
       return aux; 
   }
   
 public abstract String getPromedio();
 public String toString(){
     return "Nombre: " + this.e.getNombre() + " Latitud: " + this.e.getLatitud() + " Longitud: " + this.e.getLongitud() + "\n" + this.getPromedio();
 }  
}
