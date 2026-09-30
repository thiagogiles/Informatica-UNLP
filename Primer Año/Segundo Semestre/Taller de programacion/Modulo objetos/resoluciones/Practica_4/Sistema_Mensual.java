/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p4ej4;

/**
 *
 * @author 52984
 */
public class Sistema_Mensual extends Sistema {
    private double promedio [];
    
    public Sistema_Mensual(String nombre, double  latitud, double  longitud, int A, int N){
        super(nombre,latitud,longitud,A,N);
        promedio = new double [12];
        for(int i=0; i<this.getDimF(); i++){
            for(int j=0; j<12; j++){
                promedio[j] += this.reportarTemperatura(j+1, i+this.getAñoInicio());
            }
        }
    }
    
    
    public String getPromedio(){
        String aux= "";
        for(int i=0; i<12; i++){
            aux += "Mes " + (i+1) + "    |    "+ ((double) (promedio[i]/this.getDimF()));
            aux += "\n";
        }
        return aux;
    }
}
