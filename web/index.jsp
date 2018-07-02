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
    </head>
    <body>
        <h1>Login PokerGame</h1>
        <h1>
            <form method="get" action="loginPoker">
                Usuario: <input type="text" name="usuario"></input>
                <br>
                Password:<input type="password" name="password"></input>
                <br>
                <input type="submit" value="Login"> </input>
            </form>
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
