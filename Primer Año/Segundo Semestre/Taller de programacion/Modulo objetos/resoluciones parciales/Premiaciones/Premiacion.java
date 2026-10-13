package Premiaciones;

/**
 *
 * @author Thiago
 */
public abstract class Premiacion {
    private Postulado postulados[];
    private int maxPostulados;
    private int cargados;
    public Premiacion(int N){
      this.postulados= new Postulado[N];
      this.maxPostulados=N;
      this.cargados=0;
      this.iniciar();
    }
    
    private void iniciar(){
        for(int i=0; i<this.maxPostulados; i++){
            this.postulados[i]=null;
        }
    }
    
    public void agregarPostulante(Postulado p){
        if(this.cargados < this.maxPostulados){
            this.postulados[this.cargados]=p;
            this.cargados++;
            System.out.println("Postulante agregado correctamente");
        }
        else{System.out.println("No hay espacio para agregar mas postulantes");}
    }
    
    public abstract String otorgarPremio(int X);

    public int getMaxPostulados() {
        return maxPostulados;
    }

    public int getCargados() {
        return cargados;
    }
    
    public Postulado obtenerPostulante(int i){
        return this.postulados[i];
    }
}
