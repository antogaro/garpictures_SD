package controller;

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

@WebServlet("/GestisciUtente")
public class GestisciUtente extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idUtente;
        var filter = new UtenteDAO();
        Utente utente;
        if(request.getParameter("revoca") != null){
            idUtente = Integer.parseInt(request.getParameter("revoca"));
            utente = filter.doRetriveById(idUtente);
            utente.setAmministratore(false);
            filter.doUpdate(utente);
        }
        else if(request.getParameter("promuovi") !=null){
            idUtente = Integer.parseInt(request.getParameter("promuovi"));
            utente = filter.doRetriveById(idUtente);
            utente.setAmministratore(true);
            filter.doUpdate(utente);
        }else{
            idUtente = Integer.parseInt(request.getParameter("bandisci"));
            filter.doDeleteByID(idUtente);
        }
        ArrayList<Utente> listaUtenti = filter.doRetriveAll();
        request.setAttribute("utenti",listaUtenti);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/result/listaUtenti.jsp");
        dispatcher.forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doGet(request,response);
    }
}
