<%--
  Created by IntelliJ IDEA.
  User: josep
  Date: 10/28/2022
  Time: 10:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Cargar noticias</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
  <link rel = "stylesheet" href = "https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="assets/css/main.css">
</head>
<body>
<main>
  <div class="container">
    <div class="row">
      <div class="card-panel">
        <span class="blue-text text-darken-2"><h1 class = "center-align">Carga de noticias</h1></span>
      </div>
    </div>
    <div class="row">
        <nav class="navbar-style">
          <div class="nav-wrapper">
            <div class="col s12">
              <a href="index.jsp" class="breadcrumb">Inicio</a>
              <a href="#!" class="breadcrumb">Carga</a>
            </div>
          </div>
        </nav>
    </div>

    <div class="row">
      <div class="col s12 m12 center-align">
        <form action="${pageContext.request.contextPath}/noticia" method="post">
          <button type="submit" name = "proceso" value="cargarNoticias"  class="waves-effect waves-light btn btn-large"><i class="material-icons left cloud_upload"></i>Procesar</button>
          <div style="color: #FF0000;">${mensajeError}</div>
          <div style="color: #001aff;">${mensajeCorrecto}</div>
        </form>
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
