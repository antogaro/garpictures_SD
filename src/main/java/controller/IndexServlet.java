package controller;

import model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "IndexServlet", urlPatterns = {"/home"})
public class IndexServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Tag> tagsUtente = new ArrayList<>();
        if(session.getAttribute("tagsUtente")!=null) {
            tagsUtente = (ArrayList<Tag>) session.getAttribute("tagsUtente");
        }
        ProdottoDAO service = new ProdottoDAO();
        ArrayList<Prodotto> prodotti = new ArrayList<>();
        ArrayList<Prodotto> supporto;
        prodotti = service.doRetriveAll();
        if(!(tagsUtente.isEmpty())) {
            for(Tag x:tagsUtente){
                supporto=service.doRetriveByTag(x);
                prodotti = KeepDuplicates.KeepDuplicates(supporto,prodotti);
            }
        }
        Collections.shuffle(prodotti);
         session.setAttribute("tagsUtente",tagsUtente);
         request.setAttribute("prodotti", prodotti);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/result/home.jsp");
        dispatcher.forward(request,response);
    }
}
