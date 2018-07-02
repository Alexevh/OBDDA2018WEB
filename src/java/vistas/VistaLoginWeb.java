/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vistas;

import Excepciones.PokerExcepciones;
import controlador.ControladorLogin;
import controlador.VistaLoginParticipante;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Fachada;
import modelo.Juego;
import modelo.Participante;

/**
 *
 * @author alex
 */
public class VistaLoginWeb implements VistaLoginParticipante{
    
    private HttpServletRequest request;
    private HttpServletResponse response;
    private ControladorLogin controlador;

    public VistaLoginWeb() {
        
        controlador = new ControladorLogin(this);
    }

    
    @Override
    public void errorLoginIncorrecto(String msg) {
        try {
            response.sendRedirect("index.jsp?mensaje=" + msg);
        } catch (IOException ex) { }
    }

    @Override
    public void ingresar(Participante p) throws PokerExcepciones {
        try {
            /* Guardamos el participantre en la sesion */
            request.getSession(true).setAttribute("participante", p);
            /* Guardamos el juego al que ingresa */
            Juego juego = Fachada.getInstancia().getSiguienteJuego();
            request.getSession(true).setAttribute("juego", juego);
            /*Agregamos al jugador*/
            Fachada.getInstancia().agregarJugadorSiguienteJuego(p);
            
            response.sendRedirect("juego.jsp");
        } catch (IOException ex) { }
    }
    
        public void procesar(HttpServletRequest request, HttpServletResponse response) throws PokerExcepciones {
        this.request=request;
        this.response=response;
        controlador.loginJugador(request.getParameter("usuario"),
                          request.getParameter("password"));

    }
}
