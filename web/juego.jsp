<%-- 
    Document   : juego
    Created on : Jul 2, 2018, 11:31:20 AM
    Author     : alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    
       <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">

            var vistaWeb = new EventSource("juego?accion=nuevo");
            
            vistaWeb.onerror = function(evento) {
               alert("Sin conexion con el servidor");
                vistaWeb.close();
                document.location="/index.jsp";
            };
            vistaWeb.addEventListener("mostrarParticipantes", function (evento){
                document.getElementById("mensajes").innerHTML=evento.data;
                
            },false);
            vistaWeb.addEventListener("actualizarMesa", function (evento){
                document.getElementById("saldo").innerHTML=evento.data;
                
            },false);
            
            vistaWeb.addEventListener("actualizarListaParticipantes", function (evento){
                document.getElementById("listaParticipantes").innerHTML=evento.data;
                
            },false);
            vistaWeb.addEventListener("actualizarPozo", function (evento){
                document.getElementById("pozo").innerHTML=evento.data;
                
            },false);
            
             vistaWeb.addEventListener("inicioNuevaMano", function (evento){
                document.getElementById("opciones").innerHTML=evento.data;
                
            },false);
             vistaWeb.addEventListener("listaPagan", function (evento){
                document.getElementById("listaPagan").innerHTML=evento.data;
                
            },false);
            
            
            
            /* Funciones */
             function apostar() {
          
                 $.get("juego?accion=apostar", function (data) {
                     document.location="/juego/";
                });
                
                                
            };
              function pagar() {
          
                 $.get("juego?accion=pagar", function (data) {
                     document.location="/juego/";
                });
                
                                
            };
              function pasar() {
          
                 $.get("juego?accion=pasar", function (data) {
                     document.location="/juego/";
                });
                
                                
            };
                                            
           
    </script>
    
    
    <body>
        <p id="mensajes"></p> 
        <div id="saldo"></div>
        <div id="listaParticipantes"></div>
        <div id="pozo"></div>
        <div id="opciones">
            <input type="button" id="apostar" value="Apostar" onclick="apostar()" disabled="true"/>
            <input type="button" id="pagar" value="Pagar" onclick="pagar()" disabled="true"/>
            <input type="button" id="pasar" value="Pasar" onclick="pasar()" disabled="true"/>
        </div>
        <div id="listaPagan"></div>
    </body>
</html>
