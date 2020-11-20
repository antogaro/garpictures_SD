package controller;

import model.Prodotto;
import model.ProdottoDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ChiamaFinalizzaAcquisto")
public class ChiamaFinalizzaAcquisto extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("fromCarrello") != null) {
            request.setAttribute("fromCarrello",true);
        }else{
            int prodottoId = Integer.parseInt(request.getParameter("acquista"));
            var filter = new ProdottoDAO();
            Prodotto prodotto = filter.doRetriveByID(prodottoId);
            request.setAttribute("prodotto",prodotto);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/result/finalizzaAcquisto.jsp");
        dispatcher.forward(request,response);
    }
}
