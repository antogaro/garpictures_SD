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
        String address;
        int id = -1;
        for(Utente utente: utenti){
            if(utente.getNomeUtente().equals(nomeUtente)) {
                id = utente.getId();
            }
        }
        //controllo se è stata trovata una corrispondenza nel db
        if(id==-1){
            address="login.jsp";
            request.setAttribute("login","Nome utente inesistente.");
        }
        //se è stata trovata instanzio gli oggetti e controllo che la password sia corretta
        else {
            Utente utente = filter.doRetriveById(id);
            Carrello carrello = new Carrello(id);
            utente.setVisitatore(false);
            if(utente.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("beanUtente", utente);
                session.setAttribute("carrello", carrello);
                address="IndexServlet";
            }
            else{
                address="login.jsp";
                request.setAttribute("login", "Password non corretta.");
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}
