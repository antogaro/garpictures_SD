package controller;

import model.Tag;
import model.TagDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/RicercaPerTag")
public class RicercaPerTag extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Tag> tagsUtente = (ArrayList<Tag>) session.getAttribute("tagsUtente");
        var filter = new TagDAO();
        String tag = request.getParameter("tag");
        if(tag.startsWith("+")||tag.startsWith("-")){
            tag = tag.substring(1);
        }
        if(filter.doRetriveByID(tag) != null){
            Tag tagDaRimuovere = filter.doRetriveByID(tag);
            boolean flag=true;
            int i=0;
            //controlla se il tag è già nella lista, se non c'è lo aggiunge,in caso contrario lo rimuove
            for(Tag x: tagsUtente){
                if(x.getTag().equals(tagDaRimuovere.getTag())){
                    tagsUtente.remove(i);
                    flag=false;
                    break;
                }
                i++;
            }
            if(flag==true){
                tagsUtente.add(tagDaRimuovere);
            }
        }

        session.setAttribute("tagsUtente",tagsUtente);
        response.sendRedirect("home");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request,response);
    }
}
