package com.proyecto3;

import com.proyecto3.dao.Noticia;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "Noticia", value = "/noticia")
public class NoticiaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String proceso = request.getParameter("proceso");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if ("cargarNoticias".equals(proceso)) {
            try {
                Noticia noticia = new Noticia();
                noticia.cargar();
                request.setAttribute("mensajeCorrecto", "Noticias cargadas correctamente.");
            } catch (Exception e) {
                request.setAttribute("mensajeError", "Error leyendo servicio. " + e);
            }
            request.getRequestDispatcher("/carga-noticias.jsp").forward(request, response);
        }else if ("agregarComentario".equals(proceso)) {
            try {
                Noticia noticia = new Noticia();
                noticia.agregarComentario(Integer.parseInt(request.getParameter("noticia_id")), request.getParameter("nombre"), request.getParameter("comentario"));
                request.setAttribute("mensajeCorrecto", "Comentario agregado correctamente.");
            } catch (Exception e) {
                request.setAttribute("mensajeError", "Error agregando comentario. " + e);
            }
            request.getRequestDispatcher("/consulta-noticia.jsp?id=" + request.getParameter("noticia_id")).forward(request, response);
        }else {
            request.setAttribute("mensajeError", "Proceso desconocido.");
        }
    }
}
