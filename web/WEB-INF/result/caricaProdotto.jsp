<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/1/2020
  Time: 6:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<div id="spazio_registrazione" class="spazioregistrazione">
    <h1>
        Carica un prodotto
    </h1>
    <form action="UploadServlet" method="post" enctype="multipart/form-data" id="caricaProdotto">
        <div class="riga_input">
            <div class="spazioinput">
                <input type="text" name="titolo" id="titolo" onfocusout="validateTitolo()" placeholder="Titolo prodotto"><td id="erroreTitolo"></td>
            </div>
            <div class="spazioinput">
                <input type="text" name="prezzo" id="prezzo" onfocusout="validatePrezzo()" placeholder="Prezzo"><td id="errorePrezzo"></td>
            </div>
        </div>
        <div class="riga_input">
            <div class="spazioinput">
                <input type="text" name="tags" id="tagsDaInserire" onfocusout="validateTag()" placeholder="Tag separati da una virgola"><td id="erroreTags"></td>
            </div>
            <div class="spazioinput">
                <input type="file" name="prodotto" accept="image/png, image/jpeg" id="prodotto" onchange="validateFile()" placeholder="Immagine jpeg/png"><td id="erroreInserimento"></td>
            </div>
        </div>
        <div class="riga_input">
                <textarea name="descrizione" id="descrizione" rows="3" cols="40" onfocusout="validateDescrizione()" placeholder="Una breve descrizione del prodotto."></textarea><td id="erroreDescrizione"></td>

        </div>
        <div class="riga_input">
            <div class="spazioinput">
                <input type="submit" value="Aggiungi prodotto" class="siteButtons2" name="submitProdotto" id="submitProdotto"></td>
            </div>
        </div>
        </table>
    </form>
</div>
<%@ include file="/WEB-INF/result/footer.jsp" %>
</body>
<script src="formValidator.js"></script>
</html>
