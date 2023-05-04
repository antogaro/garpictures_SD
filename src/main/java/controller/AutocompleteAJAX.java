package controller;

import com.google.gson.Gson;
import model.Tag;
import model.TagDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/AutocompleteAJAX")
public class AutocompleteAJAX extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Tag> tagsUtente = (ArrayList<Tag>) session.getAttribute("tagsUtente");
        TagDAO filter = new TagDAO();
        ArrayList<Tag> tuttiTag = filter.doRetriveAll();
        ArrayList<String> tagsDaRestituire = new ArrayList<>();
        int flag = 0;
        for(Tag x: tuttiTag){
            flag=0;
            for(Tag y:tagsUtente){
                if (x.getTag().equals(y.getTag())){
                    tagsDaRestituire.add("-"+y.getTag());
                    flag = 1;
                }
            }
            if(flag == 1){
                continue;
            }else{
                tagsDaRestituire.add("+"+x.getTag());
            }
        }
        String json = new Gson().toJson(tagsDaRestituire);
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}
