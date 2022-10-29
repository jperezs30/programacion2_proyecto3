package com.proyecto3.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.proyecto3.models.ComentarioModel;
import com.proyecto3.models.NoticiaModel;
import com.proyecto3.utils.BaseDeDatos;
import org.json.JSONArray;
import org.json.JSONObject;


public class Noticia {

    public String cargar() throws Exception{
        URL url = new URL("http://api.nytimes.com/svc/topstories/v2/world.json?api-key=Phe8g73ZVbdmuU0zUk6oVWyIZHUyyD5U");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Accept", "application/json");
        if (conn.getResponseCode() != 200) {
            throw new Exception("Error en servicio. " + conn.getResponseCode());
        }
        InputStreamReader in = new InputStreamReader(conn.getInputStream());
        BufferedReader br = new BufferedReader(in);
        String output;
        String noticias = "";
        while ((output = br.readLine()) != null) {
            byte[] outputB = output.getBytes();
            noticias += new String(outputB, StandardCharsets.UTF_8);
        }
        conn.disconnect();

        Connection con = BaseDeDatos.inicializar();
        JSONObject resultado = new JSONObject(noticias);
        JSONArray results = resultado.getJSONArray("results");
        for (int i = 0;  i < results.length(); i ++) {
            JSONObject noti = results.getJSONObject(i);
            JSONArray multi = noti.getJSONArray("multimedia");
            JSONObject foto = multi.getJSONObject(0);

            PreparedStatement st = con.prepareStatement("insert into noticia(title, abstract, byline, photo) " +
                    "values('" + noti.get("title").toString() + "','" +
                    noti.get("abstract").toString() + "','" +
                    noti.get("byline").toString() + "','" +
                    foto.get("url").toString() + "');");
            st.executeUpdate();
            st.close();
        }
        con.close();

        return  "OK";
    }

    public String agregarComentario(Integer noticiaId, String nombre, String comentario) throws Exception {
        Connection con = BaseDeDatos.inicializar();
        PreparedStatement st = con.prepareStatement("insert into comentario(autor, comentario, noticia_id) " +
                "values('" + nombre + "','" +
                comentario +"'," +
                noticiaId + ");");
        st.executeUpdate();
        st.close();
        con.close();

        return  "OK";
    }

    public List<NoticiaModel> getAllNoticias() throws Exception {

        List<NoticiaModel> noticias = new ArrayList<>();
        try {
            Connection con = BaseDeDatos.inicializar();
            Statement statement =  con.createStatement();
            String sql = "select * from noticia";
            ResultSet rs = statement.executeQuery(sql);

            while( rs.next() ){
                NoticiaModel noticia = new NoticiaModel(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("abstract"),
                        rs.getString("byline"),
                        rs.getString("photo")
                );

                //Obtener comentarios
                Statement statement1 =  con.createStatement();
                String sql1 = "select * from comentario where noticia_id = " + noticia.getId();
                ResultSet rs1 = statement1.executeQuery(sql1);
                while(rs1.next()){
                    noticia.getComentarios().add(new ComentarioModel(rs1.getInt("id"), rs1.getString("autor"), rs1.getString("comentario")));
                }
                noticias.add(noticia);
            }

        } catch (SQLException throwables) {
            System.out.println( "getAllDB: " + throwables.getMessage() );
            throwables.printStackTrace();
        }

        return noticias;

    }

    public List<NoticiaModel> getTopNoticias() throws Exception {

        List<NoticiaModel> noticias = new ArrayList<>();
        try {
            Connection con = BaseDeDatos.inicializar();
            Statement statement =  con.createStatement();
            String sql = "select t.* from (select n.id, n.title, n.abstract, n.byline, n.photo, (select count(1) from comentario c where c.noticia_id = n.id) as comentarios from noticia n) t order by comentarios desc limit 3";
            ResultSet rs = statement.executeQuery(sql);

            while( rs.next() ){
                NoticiaModel noticia = new NoticiaModel(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("abstract"),
                        rs.getString("byline"),
                        rs.getString("photo"),
                        rs.getInt("comentarios")
                );
                noticias.add(noticia);
            }

        } catch (SQLException throwables) {
            System.out.println( "getAllDB: " + throwables.getMessage() );
            throwables.printStackTrace();
        }

        return noticias;

    }

    public NoticiaModel getNoticiaPorId(Integer id) throws Exception {
       NoticiaModel noticia = null;
        try {
            Connection con = BaseDeDatos.inicializar();
            Statement statement =  con.createStatement();
            String sql = "select * from noticia where id = " + id;
            ResultSet rs = statement.executeQuery(sql);
            rs.next() ;
                noticia = new NoticiaModel(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("abstract"),
                        rs.getString("byline"),
                        rs.getString("photo")
                );
        } catch (SQLException throwables) {
            System.out.println( "getById: " + throwables.getMessage() );
            throwables.printStackTrace();
        }
        System.out.println("test");
        return noticia;

    }

    public Integer getTotalNoticias() throws Exception {
        Integer total = 0;
        try {
            Connection con = BaseDeDatos.inicializar();
            Statement statement =  con.createStatement();
            String sql = "select count(1) as total from noticia";
            ResultSet rs = statement.executeQuery(sql);
            rs.next() ;
            total = rs.getInt("total");
        } catch (SQLException throwables) {
            System.out.println( "getById: " + throwables.getMessage() );
            throwables.printStackTrace();
        }

        return total;
    }

}
