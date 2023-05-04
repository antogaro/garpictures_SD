package controller;

import com.google.gson.Gson;
import model.Carrello;
import model.Prodotto;
import model.ProdottoDAO;
import model.Utente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/CarrelloAJAX")
public class CarrelloAJAX extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int idProdotto = Integer.parseInt(request.getParameter("idProdotto"));
            String operazione = request.getParameter("bottone");
            HttpSession session = request.getSession();
            ProdottoDAO filter = new ProdottoDAO();
            Utente utente = (Utente) session.getAttribute("beanUtente");
            Prodotto prodotto = filter.doRetriveByID(idProdotto);
            Carrello carrello = (Carrello) session.getAttribute("carrello");;
            if(operazione.equals("aggiungi")){
                if(!utente.isVisitatore())
                    carrello.addProdotto(prodotto,utente);
                else
                    carrello.addProdotto(prodotto);
            }else if(operazione.equals("rimuovi")){
                if(!utente.isVisitatore())
                    carrello.deleteProdotto(utente,prodotto);
                else
                    carrello.deleteProdotto(prodotto);
            }
            float totale = carrello.getTotale();
            String json = new Gson().toJson(totale);
            response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
