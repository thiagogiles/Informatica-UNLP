package Premiaciones;

/**
 *
 * @author Thiago
 */
public class Publicacion extends Premiacion {
    
    
    public Publicacion(int N){
        super(N);
    }
    
    public String otorgarPremio(int X){
        String aux="";
        for(int i=0; i<this.getCargados(); i++){
            if(this.obtenerPostulante(i).getCantPublicaciones() > X){
                aux+= this.obtenerPostulante(i).toString() + "\n";
            }
        }
        return aux;
    }
}
