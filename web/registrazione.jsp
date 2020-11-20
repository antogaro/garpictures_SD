<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 10/29/2020
  Time: 1:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<div id="spazio_registrazione">
    <h1>
        Registrazione
    </h1>
    <form name="formRegistrazione" id="formRegistrazione" action="Registrazione" method="post">
        <div class="riga_input">
            <div class="spazioinput">
                <input type="text" name="nome" id="nome" placeholder="Nome" onfocusout="validateName()">
                <p id="erroreNome"></p>
            </div>
            <div class="spazioinput">
                <input type="text" name="cognome" id="cognome" placeholder="Cognome" onfocusout="validateSurname()">
                <p id="erroreCognome"></p>
            </div>
        </div>
        <div class="riga_input">
            <div class="spazioinput">
                <input type="text" name="nomeUtente" id="nomeUtente" placeholder="Nome utente"
                       onfocusout="validateUserName()" class="input">
                <p id="erroreNomeUtente"></p>
            </div>
            <div class="spazioinput">
                <input type="password" name="password" id="password" placeholder="Password"
                       onfocusout="validatePassword()" class="input">
                <p id="errorePassword"></p>
            </div>
        </div>
        <div class="riga_input">
            <div class="spazioinput">
                <input type="text" id="email" name="email" placeholder="Indirizzo Email" onfocusout="validateMail()" class="input">
                <p id="erroreMail"></p>
            </div>
            <div class="spazioinput">
                <input type="text" id="provincia" onfocusout="validateProvincia()" placeholder="Provincia"
                       name="provincia" class="input">
                <p id="erroreProvincia"></p>
            </div>
        </div>
        <div class="riga_input">
            <div class="spazioinput">
                <input type="text" id="citta" onfocusout="validateCitta()" placeholder="Citta'" name="citta" class="input">
                <p id="erroreCitta"></p>
            </div>
            <div class="spazioinput">
                <input type="text" id="via" onfocusout="validateVia()" placeholder="Via" name="via" class="input">
                <p id="erroreVia"></p>
            </div>
        </div>
        <div class="riga_input">
            <div class="spazioinput">
                <input type="text" id="telefono" name="telefono" placeholder="Telefono" onfocusout="validateNumero()" class="input">
                <p id="erroreNumero"></p>
            </div>
        </div>
        <div class="riga_input">
            <div class="spazioinput">
                <input type="submit" id="submitRegistrazione" value="Registrati" class="bottoneRegistrazione">
            </div>
        </div>
    </form>
</div>
<c:if test="${errore != null}">
    <div class="sito">
        <p>${errore}</p>
    </div>
</c:if>
<%@ include file="/WEB-INF/result/footer.jsp" %>
</body>
<script src="formValidator.js"></script>
</html>
