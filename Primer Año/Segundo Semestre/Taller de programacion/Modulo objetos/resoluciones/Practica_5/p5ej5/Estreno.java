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
public class Estreno {
    private String titulo;
    private String contenido;
    private double recaudacion;
    private int visualizaciones;
    
    public Estreno(String titulo, String contenido, double recaudacion, int visualizaciones){
        this.titulo=titulo;
        this.contenido=contenido;
        this.recaudacion=recaudacion;
        this.visualizaciones=visualizaciones;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getContenido() {
        return contenido;
    }

    public double getRecaudacion() {
        return recaudacion;
    }

    public int getVisualizaciones() {
        return visualizaciones;
    }
    
    public String toString(){
        return  "Titulo: " + this.getTitulo() + " Contenido: " + this.getContenido() + " Recaudado: " + this.getRecaudacion() + " Vistas: " + this.getVisualizaciones();
    }
}
