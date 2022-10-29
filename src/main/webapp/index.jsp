<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="assets/css/main.css">
</head>
<body>
<main>
    <div class="container">
        <div class="row">
            <div class="card-panel">
                <span class="blue-text text-darken-2"><h1 class = "center-align">Gestor de noticias</h1></span>
            </div>
        </div>
     <div class="row">

                <div class="col s12 m4">
                    <div class="card">
                        <div class="card-image">
                            <img src="assets/images/upload.png" style = "height: 177px;">
                            <span class="card-title">Carga de noticias</span>
                            <a class="btn-floating halfway-fab waves-effect waves-light red" href ="carga-noticias.jsp"><i class="material-icons">Ir</i></a>
                        </div>
                        <div class="card-content">
                            <p>Cargar las noticias al sistema</p>
                        </div>
                    </div>
                </div>



                <div class="col s12 m4">
                    <div class="card">
                        <div class="card-image">
                            <img src="assets/images/news.jpg" style = "height: 177px;">
                            <span class="card-title">Consultar noticias</span>
                            <a class="btn-floating halfway-fab waves-effect waves-light red" href = "consultar-noticias.jsp"><i class="material-icons">Ir</i></a>
                        </div>
                        <div class="card-content">
                            <p>Leer todas las noticias.</p>
                        </div>
                    </div>
                </div>


                <div class="col s12 m4">
                    <div class="card">
                        <div class="card-image">
                            <img src="assets/images/top-news.jpg" style = "height: 177px;">
                            <span class="card-title">Noticias principales</span>
                            <a class="btn-floating halfway-fab waves-effect waves-light red" href="noticias-top.jsp"><i class="material-icons">Ir</i></a>
                        </div>
                        <div class="card-content">
                            <p>Mostrar noticias principales.</p>
                        </div>
                    </div>
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