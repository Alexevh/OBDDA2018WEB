/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vistas;

import controlador.ControladorJuego;
import controlador.VistaJuego;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.AsyncContext;
import javax.servlet.http.HttpServletRequest;
import javax.swing.ImageIcon;
import modelo.Carta;
import modelo.Juego;
import modelo.Participante;

/**
 *
 * @author alex
 */
public class VistaJuegoWeb implements VistaJuego {

    private PrintWriter out;
    private HttpServletRequest request;
    private ControladorJuego controlador;

    public VistaJuegoWeb() {
    }

    @Override
    public void mostrarParticipantes(int cantidadFaltante) {
        enviar("mostrarParticipantes", "Esperando el inicio faltan "+cantidadFaltante+" participantes");
    }

    @Override
    public void inicioJuego(List<Participante> lista) {
       
        
        enviar("mostrarParticipantes", "Inicio el juego");
        ArrayList lista2 = new ArrayList(lista);
        
        enviar("actualizarListaParticipantes",utiles.Componentes.lista(true, "listaParticipantes", lista2));
    }

    @Override
    public void mostrarError(String mensaje) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void inicioNuevaMano() {
        
       /* Aca lo que hacemos es, vemos que cartas tiene en la mano el participante y las mostramos
        en imagenes*/
       String div = " <input type=\"button\" id=\"apostar\" value=\"Apostar\" onclick=\"apostar()\" disabled=\"false\"/>\n" +
"            <input type=\"button\" id=\"pagar\" value=\"Pagar\" onclick=\"pagar()\" disabled=\"false\"/>\n" +
"            <input type=\"button\" id=\"pasar\" value=\"Pasar\" onclick=\"pasar()\" disabled=\"false\"/>";
       
       
        enviar("inicioNuevaMano", div);
        
        enviar("listaPagan", "");
//listaPagan.removeAll();

    }

    @Override
    public void inicioNuevaApuesta(String jugadorNombre, int monto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void actualizarMesa(List<Participante> activos) {
        
        Participante p = (Participante)request.getSession(false).getAttribute("participante");
        int saldo = p.getJugador().getSaldo();
        
        String div = "<div><img src='/imagenes/saldo.png'><br>"
                + "<span>Su saldo es"+saldo+"</span></div>";
        
        enviar("actualizarMesa", div);
        
        ArrayList lista = new ArrayList(activos);
        
        enviar("actualizarListaParticipantes",utiles.Componentes.lista(true, "listaParticipantes", lista));
        

        
    }

    @Override
    public void actualizarPozo(int pozo) {
        enviar("actualizarPozo", "Pozo actual $:"+pozo);
    }

    @Override
    public void actualizarPagan(List<Participante> pagan) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void seguirJugando() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void salirJuego() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void mostrarGanador(String nombre, String figura, List<Carta> cartas) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void fuiExpulsado() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void actualizarMano(List<Carta> cartasMano, String figura) {
        
        /*
        ImageIcon carta1 = new ImageIcon(new ImageIcon("src/imagenes/cartas/" + cartas.get(0).getImagen()).getImage());
        // ImageIcon carta1 = new ImageIcon(new ImageIcon("src/imagenes/cartas/10c.gif").getImage().getScaledInstance(100, 100, Image.SCALE_DEFAULT));
        c1.setIcon(carta1);
        c2.setIcon(new ImageIcon(new ImageIcon("src/imagenes/cartas/" + cartas.get(1).getImagen()).getImage()));
        c3.setIcon(new ImageIcon(new ImageIcon("src/imagenes/cartas/" + cartas.get(2).getImagen()).getImage()));
        c4.setIcon(new ImageIcon(new ImageIcon("src/imagenes/cartas/" + cartas.get(3).getImagen()).getImage()));
        c5.setIcon(new ImageIcon(new ImageIcon("src/imagenes/cartas/" + cartas.get(4).getImagen()).getImage()));*/
        enviar("mostrarParticipantes", "En la mano actual tenes :"+figura);
        
        
    }

    @Override
    public void actualizarTimer(int timer) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void inicializar() {
        Juego j = (Juego) request.getSession().getAttribute("juego");
        Participante p = (Participante) request.getSession().getAttribute("participante");
        controlador = new ControladorJuego(j, this, p);
    }

    public void conectarSSE(HttpServletRequest request) throws IOException {

        request.setAttribute("org.apache.catalina.ASYNC_SUPPORTED", true);
        AsyncContext contexto = request.startAsync();
        this.request = (HttpServletRequest) contexto.getRequest();
        contexto.getResponse().setContentType("text/event-stream");
        contexto.getResponse().setCharacterEncoding("UTF-8");
        contexto.setTimeout(0);//SIN TIMEOUT
        out = contexto.getResponse().getWriter();

    }

    public void enviar(String evento, String dato) {
        out.write("event: " + evento + "\n");
        dato = dato.replace("\n", "");
        out.write("data: " + dato + "\n\n");
        if (out.checkError()) {//checkError llama a flush, si da false evio bien
            cerrar();
        } else {
            //TODO OK!
            //System.out.println("Enviado");
        }
    }

    private void cerrar() {

    }

    public void procesar(HttpServletRequest request, String accion) {
        switch (accion) {
            case "crearContacto":
                //crearContacto(request);
                break;

        }
    }

}