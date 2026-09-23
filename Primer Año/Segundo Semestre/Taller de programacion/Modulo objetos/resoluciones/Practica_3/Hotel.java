package Practica_3;

/**
 *
 * @author Thiago
 */
public class Hotel {
    private int cant;
    private Habitacion [] habitaciones;
    public Hotel(int N){
        cant = N;
        habitaciones = new Habitacion [N];
        for (int i = 0; i < N; i++) {
            habitaciones [i] = new Habitacion();
        }
    }
    
    public void ingresarCliente(Persona cliente, int x){
         habitaciones[x-1].setCliente(cliente); 
         habitaciones[x-1].setOcupada(true);
        }
    
    public void aumentarCosto(double monto){
        for (int i = 0; i < cant; i++) {
            habitaciones[i].setCosto(habitaciones[i].getCosto() + monto);
        }
    }
    @Override
    public String toString(){
        
            String aux = "";
           for (int i = 0; i < cant; i++) {
                aux+= "Habitacion " + (i+1) + " : " + habitaciones[i].getCosto();
                if(habitaciones[i].isOcupada()){
                    aux+= " Ocupada" + habitaciones[i].getCliente().toString();
                }
                else aux+= " Libre";
               aux += "\n";
            }
    
           return aux;
        }
    }
    

