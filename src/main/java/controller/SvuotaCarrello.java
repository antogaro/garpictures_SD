package controller;

import model.Carrello;
import model.Utente;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/SvuotaCarrello")
public class SvuotaCarrello extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("beanUtente");
        Carrello carrello = (Carrello) session.getAttribute("carrello");
        if(utente.isVisitatore()){
            carrello.clearCarrello();
        }
        else
            carrello.clearCarrello(utente);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/result/CarrelloView.jsp");
        dispatcher.forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doPost(request,response);
    }
}
