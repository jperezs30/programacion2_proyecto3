package com.proyecto3.models;

import java.util.ArrayList;
import java.util.List;

public class NoticiaModel {

    Integer id;
    String title;
    String abstract_;
    String byline;
    String photo;
    Integer cantidadComentarios;
    List<ComentarioModel> comentarios;

    public NoticiaModel(Integer id, String title, String abstract_, String byline, String photo){
        this.id = id;
        this.title = title;
        this.abstract_ = abstract_;
        this.byline = byline;
        this.photo = photo;
        this.comentarios = new ArrayList<>();
    }

    public NoticiaModel(Integer id, String title, String abstract_, String byline, String photo, Integer cantidadComentarios){
        this.id = id;
        this.title = title;
        this.abstract_ = abstract_;
        this.byline = byline;
        this.photo = photo;
        this.cantidadComentarios = cantidadComentarios;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAbstract_() {
        return abstract_;
    }

    public void setAbstract_(String abstract_) {
        this.abstract_ = abstract_;
    }

    public String getByline() {
        return byline;
    }

    public void setByline(String byline) {
        this.byline = byline;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public List<ComentarioModel> getComentarios() {
        return comentarios;
    }

    public void setComentarios(List<ComentarioModel> comentarios) {
        this.comentarios = comentarios;
    }

    public Integer getCantidadComentarios() {
        return cantidadComentarios;
    }

    public void setCantidadComentarios(Integer cantidadComentarios) {
        this.cantidadComentarios = cantidadComentarios;
    }
}
