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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/CompletaPagamento")
public class CompletaPagamento extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codiceCarta = request.getParameter("carta");
        String CVV = request.getParameter("CVV");
        String email = request.getParameter("email");
        String fromCarrello = request.getParameter("fromCarrello");
        Pattern pattern = Pattern.compile("^(([^<>()\\[\\]\\\\.,;:\\s@\"]+(\\.[^<>()\\[\\]\\\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$", Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(email);
        if (!matcher.matches()) {
            System.out.println("erroremail");
            request.setAttribute("errore", "C'è stato un errore nel formato dell'email.");
        }
        pattern = Pattern.compile("^[0-9]{3}$");
        matcher = pattern.matcher(CVV);
        if(!matcher.matches()){
            System.out.println("errorcvv");
            request.setAttribute("errore","C'è stato un errore nel formato del CVV.");
        }
        pattern = Pattern.compile("^\\d{4}([ \\-]?)((\\d{6}\\1?\\d{5})|(\\d{4}\\1?\\d{4}\\1?\\d{4}))$");
        matcher = pattern.matcher(codiceCarta);
        if(!matcher.matches()){
            System.out.println("errorecarta");
            request.setAttribute("errore","C'è stato un errore nel formato della carta.");
        }

        if(request.getAttribute("errore")==null){
            request.setAttribute("acquisto",true);
            if(fromCarrello != null){
                HttpSession session = request.getSession();
                Carrello carrello = (Carrello) session.getAttribute("carrello");
                Utente utente = (Utente) session.getAttribute("beanUtente");
                if(utente.isVisitatore()){
                    carrello.clearCarrello();
                }else{
                    carrello.clearCarrello(utente);
                }
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("home");
        dispatcher.forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
