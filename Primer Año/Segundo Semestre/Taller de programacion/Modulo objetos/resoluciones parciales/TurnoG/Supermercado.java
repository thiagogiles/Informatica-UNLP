package TurnoG;

/**
 *
 * @author Thiago
 */
public class Supermercado {
    private String nombre;
    private String direccion;
    private Producto productos [][];
    private int gondolas;
    private int estantes;

    
    public Supermercado(String nombre, String direccion, int G, int E){
        this.nombre=nombre;
        this.direccion=direccion;
        this.gondolas=G;
        this.estantes=E;
        productos = new Producto [G][E];

        this.iniciar();
    }
    
    private void iniciar(){
        for(int i=0; i<this.gondolas; i++){
            for(int j=0; j<this.estantes; j++){
                this.productos[i][j]= null;
            }
        }
        
    }
    
    public void registrarProducto(Producto p, int X, int Y){
        if(this.productos[X-1][Y-1]==null){
            this.productos[X-1][Y-1] = p;
            System.out.println("Producto ingresado correctamente");
        }
        else{System.out.println("No hay espacio en el lugar indicado");}
    }
    
    public String liberarEstante(int X){
        String aux = "";
        for(int i=0; i<this.estantes; i++){
            if((this.productos[X-1][i] != null) &&(this.productos[X-1][i].getUnidades() == 0)){
                aux += this.productos[X-1][i].toString();
                this.productos[X-1][i] = null;
            }
        }
       return aux;
    }
    
    public int numGondola(String M){
        int gon=0,cont,max=0;
        for(int i=0; i<this.gondolas; i++){
            cont =0;
            for(int j=0; j<this.estantes; j++){
                if((this.productos[i][j] != null) && (this.productos[i][j].getMarca().equals(M))){
                    cont += this.productos[i][j].getUnidades();
                }
            }
            if(cont>max){
                max=cont;
                gon= (i+1);
            }
        }
        return gon;
    }
    
    public String toString(){
   String aux= "";
    aux += "Supermercado: " + this.nombre + " Direccion " + this.direccion;
    aux += "\n";
    for(int i=0; i<this.gondolas; i++){
        aux+= "Gondola: " + (i+1);
        for(int j=0; j<this.estantes; j++)
            if(productos[i][j] != null){
                aux+= "\n";
                aux+= " Estante " + (j+1) + productos[i][j].toString();
            }
        
        aux+= "\n";
    }
    return aux;
}
}


