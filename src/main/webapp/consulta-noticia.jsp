<%--
  Created by IntelliJ IDEA.
  User: josep
  Date: 10/29/2022
  Time: 12:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.proyecto3.dao.Noticia" %>
<%@ page import="com.proyecto3.models.NoticiaModel" %>
<%@ page import="com.proyecto3.models.ComentarioModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Consultar noticia</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel = "stylesheet" href = "https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="assets/css/main.css">
</head>
<body>
<main>
    <div class="container">
        <div class="row">
            <div class="card-panel">
                <span class="blue-text text-darken-2"><h1 class = "center-align">Detalle noticia</h1></span>
            </div>
        </div>
        <div class="row">
            <nav class="navbar-style">
                <div class="nav-wrapper">
                    <div class="col s12">
                        <a href="index.jsp" class="breadcrumb">Inicio</a>
                        <a href="consultar-noticias.jsp" class="breadcrumb">Noticias</a>
                        <a href="#!" class="breadcrumb">Noticia</a>
                    </div>
                </div>
            </nav>
        </div>

        <div class="row">
            <div class="col s12 m12 left-align">
                <%
                    String noticiaId = request.getParameter("id");
                    Noticia noticia = new Noticia();
                    NoticiaModel noti = noticia.getNoticiaPorId(Integer.parseInt(noticiaId));
                %>
                <div class="row">
                    <div class="col s1 m1 left-align">
                        <strong>Id:</strong>
                    </div>
                    <div class="col s11 m11 left-align">
                        <%= noti.getId() %>
                    </div>
                </div>
                <div class="row">
                    <div class="col s1 m1 left-align">
                        <strong>Título:</strong>
                    </div>
                    <div class="col s11 m11 left-align">
                        <%= noti.getTitle() %>
                    </div>
                </div>
                <div class="row">
                    <div class="col s1 m1 left-align">
                        <strong>Escrito por:</strong>
                    </div>
                    <div class="col s11 m11 left-align">
                        <%= noti.getByline() %>
                    </div>
                </div>
                <div class="row">
                    <div class="col s1 m1 left-align">
                        <strong>Nota:</strong>
                    </div>
                    <div class="col s11 m11 left-align">
                        <%= noti.getAbstract_() %>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m12 left-align">
                        <img style ="max-width:100%;max-height:100%;" src = "<%= noti.getPhoto() %>" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col s12 m12 left-align">
                    <form class="col s12" action="${pageContext.request.contextPath}/noticia" method="post">
                        <div class="row">
                            <div class="input-field col s3">
                                <input id="noticia_id" name = "noticia_id" type="hidden" value="<%=request.getParameter("id")%>">
                                <input placeholder="Ingresar nombre" name = "nombre" id="nombre" type="text" class="validate">
                                <label for="nombre">Nombre</label>
                            </div>
                            <div class="input-field col s9">
                                <textarea  placeholder="Ingresar comentario" name = "comentario" id="comentario" class="validate materialize-textarea"></textarea>
                                <label for="comentario">Comentario</label>
                            </div>
                        </div>
                        <div class="row right-align">
                            <button type="submit" name = "proceso" value="agregarComentario"  class="waves-effect waves-light btn"><i class="material-icons left add_to_photos"></i>Agregar comentario</button>
                            <div style="color: #FF0000;">${mensajeError}</div>
                            <div style="color: #001aff;">${mensajeCorrecto}</div>
                        </div>
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
