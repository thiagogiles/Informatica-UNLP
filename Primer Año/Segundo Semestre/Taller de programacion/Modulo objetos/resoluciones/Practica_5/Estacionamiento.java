/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5ej2;


public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private Auto matriz [][];
    private int d1,d2;
   
      
    public Estacionamiento(String nombre,String direccion, String horaApertura,String horaCierre, int N, int M){
        this.nombre=nombre;
        this.direccion=direccion;
        this.horaApertura=horaApertura;
        this.horaCierre=horaCierre;
        this.matriz = new Auto [N][M];
        this.iniciar(N, M);
        this.d1= N;
        this.d2= M;
    }
    
    public Estacionamiento(String nombre, String direccion){
        this.horaApertura = "8:00";
        this.horaCierre = "21:00";
        this.matriz = new Auto [5] [10];
        this.iniciar(5,10);
    }
  
    
    private void iniciar(int N, int M){
        for(int i=0; i<N; i++){
            for(int j=0; j<M; j++){
                matriz[i][j] = null;
            }
        }
    }

    public int getD1() {
        return d1;
    }

    public int getD2() {
        return d2;
    }

    
    
    public void registrarAuto(int X, int Y, Auto A){
        this.matriz[X-1][Y-1]=A;
    }
    
    public String buscarPatente(String patente){
        boolean encontro=false;
        int i=0;
        String aux= "";
        while((!encontro) && (i < (this.d1 * this.d2))){
            
            if(matriz[i/this.d2][i%this.d2] != null){
            
                if(matriz[i/this.d2][i%this.d2].getPatente().equals(patente)){
                encontro=true;
                aux = "Piso: " + ((i/this.d2) +1) + " Plaza: " + ((i%this.d2)+1);
        
                System.out.println("Entra");
            }
            }
                    i++;
        }
        if(encontro){
            return aux;
        }
        else{
            return "Auto inexistente";
        }
    }
    
    
    public String toString(){
        String aux = "";
        for(int i=0; i<this.d1; i++){
            for(int j=0; j<this.d2; j++){
                aux += "Piso: " + (i+1) + " Plaza: " + (j+1);
                if(matriz[i][j] == null){
                    aux += " Libre";
                }
                else{
                    aux += matriz[i][j].toString();
                }
             aux += "\n";   
            }
        }
      return aux;
    }
    
    public int contarPlaza(int Y){
        int aux = 0;
        for(int i=0; i<this.d1; i++){
            if(matriz[i][Y-1] != null){
            aux ++;}
        }
        return aux;
    }
}
