package TurnoO;

/**
 *
 * @author Thiago
 */
public class Infusion extends DatosEnComun {
    private String tamañoTaza;

    public Infusion(String nombre, double costoBasico, String categoria,String tamañoTaza) {
        super(nombre,costoBasico,categoria);
        this.tamañoTaza = tamañoTaza;
    }

    public String getTamañoTaza() {
        return tamañoTaza;
    }
    
    public double calcularCosto(){
        double aux= super.calcularCosto();
        if(this.getTamañoTaza().equals("XL")){
            aux += 1000;
        }
      return aux;
    }
}
