package controller;

import model.Prodotto;
import model.ProdottoDAO;
import model.Utente;
import model.UtenteDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ChiamaOperazioneAdmin")
public class ChiamaOperazioneAdmin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             String operazione = request.getParameter("operazione");
             String address;
             ArrayList<Prodotto> prodotti;
             ArrayList<Utente> utenti;
             if(operazione.equals("listaUtenti")){
                 UtenteDAO filter = new UtenteDAO();
                 utenti = filter.doRetriveAll();
                 request.setAttribute("utenti",utenti);
                 address = "WEB-INF/result/listaUtenti.jsp";
             }else if(operazione.equals("listaProdotti")){
                 ProdottoDAO filter = new ProdottoDAO();
                 prodotti = filter.doRetriveAll();
                 request.setAttribute("prodotti",prodotti);
                 address = "WEB-INF/result/listaProdotti.jsp";
             }else{
                 address = "WEB-INF/result/caricaProdotto.jsp";
             }
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
             dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
