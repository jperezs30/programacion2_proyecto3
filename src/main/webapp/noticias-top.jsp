<%--
  Created by IntelliJ IDEA.
  User: josep
  Date: 10/29/2022
  Time: 2:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.proyecto3.dao.Noticia" %>
<%@ page import="com.proyecto3.models.NoticiaModel" %>
<%@ page import="com.proyecto3.models.ComentarioModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Noticias top</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel = "stylesheet" href = "https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="assets/css/main.css">
</head>
<body>
<main>
    <div class="container">
        <div class="row">
            <div class="card-panel">
                <%
                    Noticia noticia1 = new Noticia();
                    Integer cantidadNoticias = noticia1.getTotalNoticias();
                %>
                <span class="blue-text text-darken-2"><h1 class = "center-align">Noticias principales ( <%= cantidadNoticias %> )</h1></span>
            </div>
        </div>
        <div class="row">
            <nav class="navbar-style">
                <div class="nav-wrapper">
                    <div class="col s12">
                        <a href="index.jsp" class="breadcrumb">Inicio</a>
                        <a href="#!" class="breadcrumb">Principales</a>
                    </div>
                </div>
            </nav>
        </div>

        <div class="row">
            <div class="col s12 m12 center-align">
                <table class="striped">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Título</th>
                        <th>Por</th>
                        <th>Comentarios</th>
                        <th></th>
                    </tr>
                    </thead>

                    <tbody>
                    <%
                        Noticia noticia = new Noticia();
                        List<NoticiaModel> noticias = noticia.getTopNoticias();
                        for( NoticiaModel noti : noticias ){
                    %>
                    <tr>
                        <td><%= noti.getId() %></td>
                        <td><%= noti.getTitle() %></td>
                        <td><%= noti.getByline() %></td>
                        <td><%= noti.getCantidadComentarios() %></td>
                        <td>
                            <img style = "height: 100px; width: 100px;" src="<%= noti.getPhoto() %>" alt="" class="circle">
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</main>

<div class="container">
    <footer class="page-footer">
        <div class="container">
            <div class="row">
                <div class="col l6 s12">
                    <h5 class="white-text">Información</h5>
                    <p class="grey-text text-lighten-4">José Fernando Pérez Sipaque.  7690-18-24917</p>
                </div>
                <div class="col l4 offset-l2 s12">

                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <div class="container">
                © 2022 Programación 2
            </div>
        </div>
    </footer>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</body>
</html>
