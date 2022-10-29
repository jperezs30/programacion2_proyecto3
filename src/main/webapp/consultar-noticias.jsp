<%--
  Created by IntelliJ IDEA.
  User: josep
  Date: 10/28/2022
  Time: 10:51 PM
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
  <title>Consultar noticias</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
  <link rel = "stylesheet" href = "https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="assets/css/main.css">
</head>
<body>
<main>
  <div class="container">
    <div class="row">
      <div class="card-panel">
        <span class="blue-text text-darken-2"><h1 class = "center-align">Consultar noticias</h1></span>
      </div>
    </div>
    <div class="row">
      <nav class="navbar-style">
        <div class="nav-wrapper">
          <div class="col s12">
            <a href="index.jsp" class="breadcrumb">Inicio</a>
            <a href="#!" class="breadcrumb">Noticias</a>
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
            </tr>
          </thead>

          <tbody>
            <%
              Noticia noticia = new Noticia();
              List<NoticiaModel> noticias = noticia.getAllNoticias();
              for( NoticiaModel noti : noticias ){
            %>
            <tr>
              <td><%= noti.getId() %></td>
              <td><a href ="consulta-noticia.jsp?id=<%= noti.getId() %>"><%= noti.getTitle() %></a></td>
              <td><%= noti.getByline() %></td>
              <td>
                <table class="striped">
                  <thead>
                  <tr>
                    <th>Nombre</th>
                    <th>Comentario</th>
                  </tr>
                  </thead>
                  <tbody>
                    <%
                      List<ComentarioModel> comentarios = noti.getComentarios();
                      for( ComentarioModel comentario : comentarios ){
                    %>
                    <tr>
                      <td><%= comentario.getAutor() %></td>
                      <td><%= comentario.getComentario() %></td>
                    </tr>
                    <%
                      }
                    %>
                  </tbody>
                </table>
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
