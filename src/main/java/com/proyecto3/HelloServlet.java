package com.proyecto3;

import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("HTML 4.0 Transitional//EN\">" +
                "<html><head><title>Prueba</title></head>" +
                "<body bgcolor=\"#FDF5E6\">\n" +
                "<h1 align=\"center\">Pruebas</h1>");
        out.println("</body></html>");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Llegue al servlet");
    }

    public void destroy() {
    }
}