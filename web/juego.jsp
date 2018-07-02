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
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script src="bootstrap/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.js" type="text/javascript"></script> 
    <link href="css/mesa.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">

        var vistaWeb = new EventSource("juego?accion=nuevo");

        vistaWeb.onerror = function (evento) {
            alert("Sin conexion con el servidor");
            vistaWeb.close();
            document.location = "/index.jsp";
        };
        vistaWeb.addEventListener("mostrarParticipantes", function (evento) {
            document.getElementById("mensajes").innerHTML = evento.data;

        }, false);
        vistaWeb.addEventListener("actualizarMesa", function (evento) {
            document.getElementById("saldo").innerHTML = evento.data;

        }, false);

        vistaWeb.addEventListener("actualizarListaParticipantes", function (evento) {
            document.getElementById("listaParticipantes").innerHTML = "Lista de participantes<br>"+evento.data;

        }, false);
        vistaWeb.addEventListener("actualizarPozo", function (evento) {
            document.getElementById("pozo").innerHTML = evento.data;

        }, false);

        vistaWeb.addEventListener("inicioNuevaMano", function (evento) {
            document.getElementById("opciones").innerHTML = evento.data;

        }, false);
        vistaWeb.addEventListener("listaPagan", function (evento) {
            document.getElementById("listaPagan").innerHTML = evento.data;

        }, false);
        vistaWeb.addEventListener("actualizarMano", function (evento) {
            document.getElementById("mano").innerHTML = evento.data;

        }, false);

        vistaWeb.addEventListener("actualizarTimer", function (evento) {
            document.getElementById("mensajes").innerHTML = evento.data;

        }, false);

        vistaWeb.addEventListener("nuevaApuesta", function (evento) {
            document.getElementById("mensajes").innerHTML = evento.data;

        }, false);

        vistaWeb.addEventListener("seguirJugando", function (evento) {

            var txt;
            var r = confirm("Seguir jugando?");
            if (r == true) {
                seguir();
            } else {
                dejar();
            }

        }, false);

        vistaWeb.addEventListener("mostrarGanador", function (evento) {
            document.getElementById("ganador").innerHTML = evento.data;
            showModalGanador();

        }, false);




        /* Funciones */
        function apostar() {
            var monto = $("#monto").val();

            $.get("juego?accion=apostar&monto=" + monto, function (data) {

            });

        }
        ;



        function pagar() {

            $.get("juego?accion=pagar", function (data) {

            });


        }
        ;
        function pasar() {

            $.get("juego?accion=pasar", function (data) {

            });


        }
        ;

        function seguir() {

            $.get("juego?accion=seguir", function (data) {

            });


        }
        ;

        function dejar() {

            $.get("juego?accion=dejar", function (data) {

            });


        }
        ;

        function salir() {

            var txt;
            var r = confirm("Seguro desea salir?");
            if (r == true) {
                $.get("juego?accion=salir", function (data) {

                });
            } else {

            }





        }
        ;

        function showModalGanador() {
            $('#exampleModal').modal();
        }


    </script>


    <body>


        <div class="mesa">
            
            
        
        
        <p id="mensajes"></p> 
        <div id="pozo"></div>
        
       
        <div id="listaParticipantes"></div>
         <div id="mano"></div>
         <div id="saldo"></div>
        <div id="montoApostar"><input type="number" id="monto" /></div>
        <div id="opciones">
            <input type="button"  value="Apostar" onclick="apostar()" >
            <input type="button"  value="Pagar" onclick="pagar()" />
            <input type="button"  value="Pasar" onclick="pasar()" />
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
