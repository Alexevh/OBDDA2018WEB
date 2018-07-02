<%-- 
    Document   : index
    Created on : Jul 2, 2018, 10:17:47 AM
    Author     : alex
--%>
<%
    String mensaje = request.getParameter("mensaje");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juego de Poker</title>
        <script src="bootstrap/js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/formularios.css" rel="stylesheet" type="text/css"/>
        <link href="css/mesa.css" rel="stylesheet" type="text/css"/>
       
    </head>
    
    <body>
    
        
        <h1>
            
            <center>
                <h1>Login PokerGame</h1>
            <form name="form" action="loginPoker" method="get" style="width: 50%; border: solid 1px;">
                Usuario: <input type="text" name="usuario"></input>
                <br>
                Password:<input type="password" name="password"></input>
                <br>
                <input type="submit" value="Login" class="button"> </input>
            </form>
                </center>
        </h1>
        <h1>
        <%
            if(mensaje!=null){
                out.println("Error:" + mensaje);
            }
        %>
        </h1>
        
    
 
    </body>
</html>
