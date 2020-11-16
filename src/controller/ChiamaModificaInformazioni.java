package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ChiamaModificaInformazioni")
public class ChiamaModificaInformazioni extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String address = "WEB-INF/result/modificaInformazioni.jsp";
        if(request.getParameter("modificaEmail")!=null){
            address = "WEB-INF/result/modificaEmail.jsp";
        } else if(request.getParameter("modificaPassword")!=null){
            address = "WEB-INF/result/modificaPassword.jsp";
        } else if(request.getParameter("modificaIndirizzo")!= null){
            address = "WEB-INF/result/modificaIndirizzo.jsp";
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doPost(request,response);
    }
}
