<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/1/2020
  Time: 6:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<div class="sito">
    <form action="UploadServlet" method="post" enctype="multipart/form-data" id="caricaProdotto">
        <table>
            <tr>
            <td> Titolo prodotto:</td><td><input type="text" name="titolo" id="titolo" onfocusout="validateTitolo()"></td><td id="erroreTitolo"></td>
            </tr>
            <tr>
                <td>Descrizione prodotto:</td><td> <textarea name="descrizione" id="descrizione" rows="3" cols="40" onfocusout="validateDescrizione()">Una breve descrizione del prodotto.</textarea><td><td id="erroreDescrizione"></td>
            </tr>
            <tr>
                <td> Inserisci il prezzo:</td> <td><input type="text" name="prezzo" id="prezzo" onfocusout="validatePrezzo()"></td><td id="errorePrezzo"></td>
            </tr>
            <tr>
                <td>Inserisci tag separati da una virgola:</td> <td><input type="text" name="tags" id="tagsDaInserire" onfocusout="validateTag()"></td><td id="erroreTags"></td>
            </tr>
            <tr>
                <td>Carica file(PNG/JPEG):</td><td><input type="file" name="prodotto" accept="image/png, image/jpeg" id="prodotto" onchange="validateFile()"></td><td id="erroreInserimento"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Aggiungi prodotto" name="submitProdotto" id="submitProdotto"></td>
            </tr>
        </table>

    </form>
</div>
<%@ include file="/WEB-INF/result/footer.jsp" %>
</body>
<script src="formValidator.js"></script>
</html>
