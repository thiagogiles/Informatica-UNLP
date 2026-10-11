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
public class Gira extends Recital {
    private String nombreGira;
    private Fechas v[];
    private int dimf;
    private int dimFechas;
    private int FechaActual;
    public Gira(String Banda, int N, String nombreGira, int F) {
        super(Banda, N);
        this.nombreGira = nombreGira;
        this.dimf = F;
        this.dimFechas=0;
        this.FechaActual=0;
        this.v = new Fechas [F];
        this.iniciar();
    }
    
    private void iniciar(){
        for(int i=0; i<this.dimf; i++){
            this.v[i]=null;
        }
    }
    
    public void agregarFecha(Fechas f){
        if(this.dimFechas<this.dimf){
            this.v[this.dimFechas]=f;
            this.dimFechas++;
        }
    }
    
    public double calcularCostoRecital(){
        return (30000 * this.dimFechas);
    }
    
    public String actuacion(){
        String aux = super.actuacion();
        aux += "\n";
        aux += "Los esperamos en: " + this.v[this.FechaActual].toString();
        if(this.FechaActual<this.dimFechas){this.FechaActual++;}
      return aux;
}
}
        
