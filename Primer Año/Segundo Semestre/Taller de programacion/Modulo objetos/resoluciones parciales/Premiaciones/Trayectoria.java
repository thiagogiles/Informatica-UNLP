package Premiaciones;

/**
 *
 * @author Thiago
 */
public class Trayectoria extends Premiacion {
    
    public Trayectoria(int N){
        super(N);
    }
    public String otorgarPremio(int X){
        String aux="";
        for(int i=0; i<this.getCargados(); i++){
            if(this.obtenerPostulante(i).getAntiguedad()> X){
                aux+= this.obtenerPostulante(i).toString() + "\n";
            }
        }
        return aux;
    }
}
