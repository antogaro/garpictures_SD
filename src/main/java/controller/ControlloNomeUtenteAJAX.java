package controller;

import com.google.gson.Gson;
import model.Utente;
import model.UtenteDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ControlloNomeUtenteAJAX")
public class ControlloNomeUtenteAJAX extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nomeUtente = request.getParameter("field1");
        String found = "vero";
        UtenteDAO filter = new UtenteDAO();
        ArrayList<Utente> listaUtenti = filter.doRetriveAll();
        for(Utente x:listaUtenti){
            if(x.getNomeUtente().equalsIgnoreCase(nomeUtente)){
                found ="vero";
                break;
            }
            found = "falso";
        }
        String json = new Gson().toJson(found);
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
