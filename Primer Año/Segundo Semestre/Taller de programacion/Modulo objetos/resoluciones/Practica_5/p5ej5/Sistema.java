/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5ej5;

/**
 *
 * @author 52984
 */
public class Sistema {

    private String plataforma;
    private int suscriptores;
    private Estreno tabla [][];
    private int categorias;
    private int meses = 12;
    private int cont [];
    public Sistema(String plataforma, int suscriptores, int N){
        this.plataforma=plataforma;
        this.suscriptores=suscriptores;
        this.tabla = new Estreno [N][this.meses];
        this.cont = new int [N];
        this.categorias=N;
        this.iniciar();
    }

    public String getPlataforma() {
        return plataforma;
    }

    public int getSuscriptores() {
        return suscriptores;
    }
    
    private void iniciar(){
        for(int i=0; i<this.categorias; i++){
            for(int j=0; j<this.meses; j++){
                this.tabla[i][j]=null;
            }
        }
    }
    
    public void agregarEstreno(int X, Estreno e){
        tabla[X-1][this.cont[X-1]] = e;
        this.cont[X-1]++;
    }
    
    public String listar(int X){
        String aux="";    
        for(int i=0; i<this.cont[X-1]; i++){
                aux+= tabla[X-1][i].toString();
                aux+= "\n";
            }
        return aux;
    }
    
    private double gananciaTotal(){
        double aux =0;
        for(int i=0; i<this.categorias; i++){
            for(int j=0; j<this.cont[i]; j++){
                aux += tabla[i][j].getRecaudacion() / 2.0;
            }
        }
        return aux;
    }
    
    public String toString(){
        String aux= "Plataforma: " + this.getPlataforma() + " Suscriptores: " + this.getSuscriptores();
        for(int i=0; i<this.categorias; i++){
            aux+= "\n";
            aux += "Categoria " + (i+1);
        
            for(int j=0; j<this.cont[i]; j++){
                aux+="\n";
                aux+=tabla[i][j].toString();
                
            }
        
    }
        aux+= "\n";
        aux+= "Ganancia total en estrenos " + this.gananciaTotal();
        return aux;
}
}
