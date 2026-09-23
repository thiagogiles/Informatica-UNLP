package Practica_3;


public class Circulo {
    private double radio;
    private String relleno;
    private String linea;

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getRelleno() {
        return relleno;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public String getLinea() {
        return linea;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }

    public Circulo(double radio, String relleno, String linea) {
        this.radio = radio;
        this.relleno = relleno;
        this.linea = linea;
    }
    
    public double calcularPerimetro(double radio){
        return (2*radio)*(Math.PI);
    }
    
    public double calcularArea(double radio){
        return (Math.PI)*(radio*radio);
    }
}
