package controller;

import model.Utente;
import model.UtenteDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/ModificaPassword")
public class ModificaPassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String nuovaPassword = request.getParameter("nuovaPassword");
            String nuovaPasswordConferma = request.getParameter("nuovaPasswordConferma");
            String address = "WEB-INF/result/modificaPassword.jsp";
            HttpSession session = request.getSession();
            Utente utente = (Utente) session.getAttribute("beanUtente");
            System.out.println(utente.getId()+utente.getNome());
            UtenteDAO filter = new UtenteDAO();
            if(!nuovaPassword.equals(nuovaPasswordConferma)){
                request.setAttribute("errore", "le password devono essere uguali.");
            }else{
                Pattern pattern = Pattern.compile("^[A-Za-z0-9_.-]{5,20}$",Pattern.CASE_INSENSITIVE);
                Matcher matcher = pattern.matcher(nuovaPassword);
                if(!matcher.matches()){
                    request.setAttribute("errore","errore nel formato della password");
                    address = "WEB-INF/result/modificaPassword.jsp";
                }else{
                    utente.setPassword(nuovaPassword);
                    filter.doUpdate(utente);
                    address = "WEB-INF/result/modificaInformazioni.jsp";
                    request.setAttribute("modificata","Password modificata con successo.");
                }
            }
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
