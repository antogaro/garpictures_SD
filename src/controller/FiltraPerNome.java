package controller;

import com.google.gson.Gson;
import model.Prodotto;
import model.ProdottoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/FiltraPerNome")
public class FiltraPerNome extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        var filer = new ProdottoDAO();
        String iniziali = request.getParameter("field1");
        List<Prodotto> prodotti = filer.doRetriveAll();
        List<Prodotto> prodottiDaRestituire = new ArrayList<>();
        for(Prodotto x: prodotti){
            if(x.getNome().toUpperCase().startsWith(iniziali.toUpperCase())){
                prodottiDaRestituire.add(x);
            }
        }
        String json = new Gson().toJson(prodottiDaRestituire);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request,response);
    }
}
