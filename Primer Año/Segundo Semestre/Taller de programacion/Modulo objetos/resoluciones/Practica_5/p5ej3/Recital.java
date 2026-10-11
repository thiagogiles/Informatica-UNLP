/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5ej3;

/**
 *
 * @author 52984
 */
public abstract class Recital {
    private String Banda;
    private String temas[];
    private int dimf;
    private int dimTemas;
    public Recital(String Banda, int N) {
        this.Banda = Banda;
        this.dimf=N;
        this.dimTemas=0;
        this.temas = new String [N];
        this.iniciar();
    }

    public String getBanda() {
        return Banda;
    }
       public void agregarTema(String untema){
        if(this.dimTemas<this.dimf){
            temas[this.dimTemas]= untema;
            this.dimTemas++;
        }
    }
    private void iniciar(){
        for(int i=0; i<this.dimf; i++){
            this.temas[i]="";
        }
    }
    
    public abstract double calcularCostoRecital();
        
    
    public String actuacion(){
        String aux = "Somos " + this.getBanda() + " tocaremos ";
      
        for(int i=0; i<this.dimTemas; i++){
            aux += "\n";
            aux += this.temas[i];
        }
        return aux;
    }
}
