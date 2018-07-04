/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



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
            document.getElementById("opciones").innerHTML = "";
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
        
         vistaWeb.addEventListener("fuiExpulsado", function (evento) {
            alert("Lamentablemente su saldo no es suficiente para continuar en el juego");
            document.location = "/OBDDA2018WEB/index.jsp";

        }, false);
        
        vistaWeb.addEventListener("salirJuego", function (evento) {
            alert("El juego termino, gracias por dejar tu dinero con nosotros");
            document.location = "/OBDDA2018WEB/index.jsp";

        }, false);




        /* Funciones */
        function apostar() {
            var monto = $("#monto").val();

            $.get("juego?accion=apostar&monto=" + monto, function (data) {

            });
            
            desHabilitarOpcionesalPostar();

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
        
        function desHabilitarOpcionesalPostar() {
            wait(2000);
            document.getElementById("opciones").innerHTML = "<input type='button'  value='Apostar' onclick='apostar()'  disabled/>"
               + "<input type='button'  value='Pagar' onclick='pagar()'  disabled/>"
               + "<input type='button'  value='Pasar' onclick='pasar()' disabled />";
        }


   