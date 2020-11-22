package controller;

import model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Array;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/UploadServlet")
@MultipartConfig(
        location="C:/Users/Antonio/Downloads/Garpictures/web/img"
        )
public class UploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String directory = request.getServletContext().getRealPath("/" +"/img/");
        Part filePart = request.getPart("prodotto");
        String tags = request.getParameter("tags");
        String descrizione = request.getParameter("descrizione");
        String prezzo = request.getParameter("prezzo");
        String titolo = request.getParameter("titolo");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String source = fileName;
        File uploads = new File(directory);
        File file = new File(uploads, fileName);
        String address="WEB-INF/result/caricaProdotto.jsp";;
        Prodotto prodotto = new Prodotto();
        Pattern pattern = Pattern.compile("^[a-zA-Z0-9_\\s]{2,40}$", Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(titolo);
        System.out.println(matcher.matches());
        if (!matcher.matches()) {
            request.setAttribute("errore", "errore nel formato del titolo.");
        } else {
            prodotto.setNome(titolo);
        }
        pattern = Pattern.compile("^[ A-Za-z0-9_@./#&+-_\\s]{2,}$");
        matcher = pattern.matcher(descrizione);
        System.out.println(matcher.matches());
        if (!matcher.matches()) {
            request.setAttribute("errore", "errore nel formato della descrizione");
        } else {
            prodotto.setDescrizione(descrizione);
        }
        pattern = Pattern.compile("(\\d+\\.\\d{1,2})");
        matcher = pattern.matcher(prezzo);
        System.out.println(matcher.matches());
        if (!matcher.matches()) {
            request.setAttribute("errore", "errore nel formato del prezzo");
        } else {
            prodotto.setPrezzo(Float.parseFloat(prezzo));
        }
        pattern = Pattern.compile("^[a-zA-Z0-9,]{2,}$");
        matcher = pattern.matcher(tags);
        System.out.println(matcher.matches());
        if (!matcher.matches()) {
            request.setAttribute("errore", "errore nel formato dei tag");
        }

        if (prodotto.getNome() != null && prodotto.getPrezzo() != 0 && prodotto.getDescrizione() != null) {
        prodotto.setSource(source);
        var filter = new ProdottoDAO();
        filter.doSave(prodotto);
        prodotto = filter.doRetriveLatest();
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath());
        }
        String[] listaTagString = tags.split(",");
        //Converto l'array in lista
        List<String> listaTag = Arrays.asList(listaTagString);
        ArrayList<String> listaTagArray = new ArrayList<String>();
        //Controllo che non ci siano tag duplicati
        listaTagArray = RemoveDuplicates.RemoveDuplicates(listaTag);
        //Aggiungo i tag ad un arraylist e se non ci sono nel database lì aggiungo anche lì
        ArrayList<Tag> tagFinali = RemoveDuplicates.tagFy(listaTagArray);
        var filter2 = new TagDAO();
        //aggiungo le relazioni con il prodotto
        for (Tag x : tagFinali) {
            filter2.doRelation(x, prodotto);
        }
        address = "home";
        request.setAttribute("finalizza", "Prodotto caricato con successo.");
        };

        if(address.equals("home")){
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request,response);
        }else{
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request,response);
    }
}
