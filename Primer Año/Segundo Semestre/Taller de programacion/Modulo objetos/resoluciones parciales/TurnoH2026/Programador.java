/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TurnoH2026;

/**
 *
 * @author 52984
 */
public class Programador {
    private int DNI;
    private String nomApe;
    private int añosExperiencia;
    private String lenguajePrincipal;
    
    public Programador(int DNI, String nomApe,String lenguajePrincipal){
        this.DNI=DNI;
        this.nomApe=nomApe;
        this.añosExperiencia=0;
        this.lenguajePrincipal=lenguajePrincipal;
    }

    public void setAñosExperiencia(int añosExperiencia) {
        this.añosExperiencia = añosExperiencia;
    }

    public int getDNI() {
        return DNI;
    }

    public String getNomApe() {
        return nomApe;
    }

    public int getAñosExperiencia() {
        return añosExperiencia;
    }

    public String getLenguajePrincipal() {
        return lenguajePrincipal;
    }
    
    
    
    public String toString(){
        String aux= " DNI: " + this.getDNI() + " Nombre y apellido: " + this.getNomApe() + " Años de experiencia: " + this.getAñosExperiencia() + " Lenguaje principal: " + this.getLenguajePrincipal();
        return aux;
    }
}
