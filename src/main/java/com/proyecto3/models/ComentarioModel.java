package com.proyecto3.models;

public class ComentarioModel {

    Integer id;
    String autor;
    String comentario;

    public ComentarioModel(Integer id, String autor, String comentario) {
        this.id = id;
        this.autor = autor;
        this.comentario = comentario;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
}
