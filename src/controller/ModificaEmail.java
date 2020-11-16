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
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/ModificaEmail")
public class ModificaEmail extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nuovaEmail = request.getParameter("nuovaEmail");
        Pattern pattern = Pattern.compile("^(([^<>()\\[\\]\\\\.,;:\\s@\"]+(\\.[^<>()\\[\\]\\\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$",Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(nuovaEmail);
        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("beanUtente");
        System.out.println(utente.getId() + utente.getNome());
        String address = "WEB-INF/result/modificaEmail.jsp";
        if(!matcher.matches()){
            request.setAttribute("errore","errore nel formato dell'email.");
        }else{
            var filter = new UtenteDAO();
            boolean flag = false;
            ArrayList<Utente> utenti = filter.doRetriveAll();
            for(Utente x: utenti){
                if(nuovaEmail.equals(x.getEmail())) {
                    request.setAttribute("errore", "email già presente nel database.");
                    flag = true;
                }
            }
            if(flag == false) {
                utente.setEmail(nuovaEmail);
                filter.doUpdate(utente);
                address = "WEB-INF/result/modificaInformazioni.jsp";
                request.setAttribute("modificata","Indirizzo email modificato con successo.");
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doPost(request,response);
    }
}
