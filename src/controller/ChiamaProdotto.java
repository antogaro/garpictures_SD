package controller;

import model.Prodotto;
import model.ProdottoDAO;
import model.Tag;
import model.TagDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ChiamaProdotto")
public class ChiamaProdotto extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


            int id = Integer.parseInt(request.getParameter("prodottoId"));
            var service = new ProdottoDAO();
            Prodotto prodotto = service.doRetriveByID(id);
            var filter = new TagDAO();
            ArrayList<Tag> tags = filter.doRetriveByProdotto(prodotto);
            request.setAttribute("tags",tags);
            request.setAttribute("prodotto", prodotto);
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/result/prodotto.jsp");
            dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doPost(request,response);
    }
}
