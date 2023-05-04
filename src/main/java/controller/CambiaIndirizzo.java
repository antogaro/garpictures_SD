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

@WebServlet("/CambiaIndirizzo")
public class CambiaIndirizzo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String provincia = request.getParameter("nuovaProvincia");
        String citta = request.getParameter("nuovaCitta");
        String via = request.getParameter("nuovaVia");
        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("beanUtente");
        String address = "WEB-INF/result/modificaIndirizzo.jsp";
        Pattern pattern = Pattern.compile("^[A-Za-z]{2,30}((\\s[A-z]{2,30})?){1,4}(\\s\\d{1,4})?$");
        Matcher matcher = pattern.matcher(via);
        System.out.println(matcher.matches());
        int counter=0;
        if(!matcher.matches()){
            request.setAttribute("errore","errore nel formato della via");
            address = "WEB-INF/result/modificaIndirizzo.jsp";
        }else{
            utente.setIndirizzo(via);
            counter++;
        }
        pattern = Pattern.compile("^[A-Z]{2}?$");
        matcher = pattern.matcher(provincia);
        if(!matcher.matches()){
            request.setAttribute("errore","errore nel formato della provincia");
            address = "WEB-INF/result/modificaIndirizzo.jsp";
        }else{
            utente.setProvincia(provincia);
            counter++;
        }
        pattern = Pattern.compile("^[a-zA-Z]+(?:[\\s-][a-zA-Z]+)*$");
        matcher = pattern.matcher(citta);
        if(!matcher.matches()){
            request.setAttribute("errore","errore nel formato della città");
            address = "WEB-INF/result/modificaIndirizzo.jsp";
        }else{
            utente.setCitta(citta);
            counter++;
        }
        if(counter==3){
            UtenteDAO filter = new UtenteDAO();
            filter.doUpdate(utente);
            address = "WEB-INF/result/modificaInformazioni.jsp";
            request.setAttribute("modificata","L'indirizzo è stato modificato correttamente.");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}
