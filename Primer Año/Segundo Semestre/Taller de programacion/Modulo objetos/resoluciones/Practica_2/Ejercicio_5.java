
package Practica_2;
import PaqueteLectura.Lector;

public class Ejercicio_5 {
    public static void main(String[] args) {
        Partido [] vector = new Partido [20];
        int cantLocal,cantVisitante,i=0;
        String nomLocal,nomVisitante = Lector.leerString();
        while(!nomVisitante.equals("ZZZ") && (i<20)){
            nomLocal= Lector.leerString();
            cantLocal= Lector.leerInt();
            cantVisitante= Lector.leerInt();
            vector[i]= new Partido(nomLocal,nomVisitante,cantLocal,cantVisitante);
            i++;
            nomVisitante= Lector.leerString();
 
        }
        int river=0;
        int boca=0;
     for(int j=0; j<i; j++){
         System.out.println(vector[j].getLocal() + vector[j].getGolesLocal() + " VS " + vector[j].getGolesVisitante() + vector[j].getVisitante());
         if(vector[j].getGanador().equals("River")){
             river++;
         }
        if(vector[j].getLocal().equals("Boca")){
            boca += vector[j].getGolesLocal();
        }
     }
        System.out.println("Cantidad de partidos que gano river: " + river);
        System.out.println("Cantidad de goles que hizo boca jugando de local: " + boca);
    }
}
