<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/1/2020
  Time: 6:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<c:choose>
    <c:when test="${beanUtente.amministratore}">
        <div id="spazio_registrazione" class="spazioregistrazione">
            <h1>
                Carica un prodotto
            </h1>
            <form action="UploadServlet" method="post" enctype="multipart/form-data" id="caricaProdotto">
                <div class="riga_input">
                    <div class="spazioinput">
                        <input type="text" name="titolo" id="titolo" onfocusout="validateTitolo()" placeholder="Titolo prodotto"><p id="erroreTitolo"></p>
                    </div>
                    <div class="spazioinput">
                        <input type="text" name="prezzo" id="prezzo" onfocusout="validatePrezzo()" placeholder="Prezzo"><p id="errorePrezzo"></p>
                    </div>
                </div>
                <div class="riga_input">
                    <div class="spazioinput">
                        <input type="text" name="tags" id="tagsDaInserire" onfocusout="validateTag()" placeholder="Tag separati da una virgola"><p id="erroreTags"></p>
                    </div>
                    <div class="spazioinput">
                        <input type="file" name="prodotto" accept="image/png, image/jpeg" id="prodotto" onchange="validateFile()" placeholder="Immagine jpeg/png"><p id="erroreInserimento"></p>
                    </div>
                </div>
                <div class="riga_input">
                    <textarea name="descrizione" id="descrizione" rows="3" cols="40" onfocusout="validateDescrizione()" placeholder="Una breve descrizione del prodotto."></textarea><p id="erroreDescrizione"></p>

                </div>
                <div class="riga_input">
                    <div class="spazioinput">
                        <input type="submit" value="Aggiungi prodotto" class="siteButtons2" name="submitProdotto" id="submitProdotto">
                        <p>
                            <c:if test="${errore != null}">
                                ${errore}
                            </c:if>
                        </p>
                    </div>
                </div>
            </form>
        </div>
    </c:when>
    <c:otherwise>
        <%
            String redirectURL = "home";
            response.sendRedirect(redirectURL);
        %>
    </c:otherwise>
</c:choose>
<%@ include file="/WEB-INF/result/footer.jsp" %>
</body>
<script src="formValidator.js"></script>
</html>
