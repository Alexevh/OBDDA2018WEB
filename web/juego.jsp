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
        <title>Juego de poker</title>
    </head>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script src="bootstrap/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.js" type="text/javascript"></script> 
    <link href="css/mesa.css" rel="stylesheet" type="text/css"/>
    <script src="js/funciones.js" type="text/javascript"></script>


    <body>


        <div class="mesa">




            <p id="mensajes"></p> 
            <div id="pozo"></div>


            <div id="listaParticipantes"></div>
            <div id="mano">
                <img  class='carta' src='imagenes/cartas/Invertida.gif'/>
                <img  class='carta' src='imagenes/cartas/Invertida.gif'/>
                <img  class='carta' src='imagenes/cartas/Invertida.gif'/>
                <img  class='carta' src='imagenes/cartas/Invertida.gif'/>
                <img  class='carta' src='imagenes/cartas/Invertida.gif'/>
            </div>
            <div id="saldo"></div>
            <div id="montoApostar"><input type="number" id="monto" /></div>
            <div id="opciones">
                <input type="button"  value="Apostar" onclick="apostar()" disabled />
                <input type="button"  value="Pagar" onclick="pagar()" disabled/>
                <input type="button"  value="Pasar" onclick="pasar()" disabled />
            </div>
            <div id="listaPagan"></div>

            <div id="modalGanador"></div>
            <input class='btnSalir' type="button"  value="Salir del juego" onclick="salir()" />
        </div>







        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ganador</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div id="ganador" class="modal-body">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
