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
import java.util.ArrayList;

@WebServlet("/Login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nomeUtente = request.getParameter("nomeUtente");
        String password = request.getParameter("password");
        var filter = new UtenteDAO();
        ArrayList<Utente> utenti = filter.doRetriveAll();
        String address = "login.jsp";
        int id = -1;
        for (Utente utente : utenti) {
            if (utente.getNomeUtente().equals(nomeUtente)) {
                id = utente.getId();
            }
        }
        //controllo se è stata trovata una corrispondenza nel db
        if (id == -1) {
            request.setAttribute("login", "Nome utente inesistente.");
        }
        //se è stata trovata instanzio gli oggetti e controllo che la password sia corretta
        else {
            Utente utente = filter.doRetriveById(id);
            if (utente.getPassword().equals(password)) {
                Carrello carrello = new Carrello(id);
                utente.setVisitatore(false);
                HttpSession session = request.getSession();
                //controllo se il carrello da visitatore ha elementi in comune con il carrello da utente loggato, quelli non in comune li aggiungo al carrello utente
                Carrello carrelloVisitatore = (Carrello) session.getAttribute("carrello");
                ArrayList<Prodotto> prodottiCarrelloVisitatore = carrelloVisitatore.getCarrelloProdotti();
                for(Prodotto y:prodottiCarrelloVisitatore){
                    if(!carrello.isProdottoIn(y)){
                        carrello.addProdotto(y,utente);
                    }
                }
                session.setAttribute("beanUtente", utente);
                session.setAttribute("carrello", carrello);
                address = "home";
            } else {
                request.setAttribute("login", "Password non corretta.");
            }
        }
        if (address.equals("home")) {
            response.sendRedirect(address);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
