
package p4ej4;

public class Sistema_Anual extends Sistema {
    private double promedio [];
    
    public Sistema_Anual(String nombre, double  latitud, double  longitud, int A, int N){
        super(nombre,latitud,longitud,A,N);
        promedio = new double [this.getDimF()];
         for(int i=0; i<this.getDimF(); i++){
            for(int j=0; j<12; j++){
                promedio[i] += this.reportarTemperatura(j+1, i+this.getAñoInicio());
            }
        }
    
    }
      
    public String getPromedio(){
        String aux="";
        for (int i = 0; i < this.getDimF(); i++) {
            aux += "Año: " + (i+this.getAñoInicio())  + "   |   " + (promedio[i]/12.0);
            aux += "\n";
                
            }
        return aux;
        }
    }
    

