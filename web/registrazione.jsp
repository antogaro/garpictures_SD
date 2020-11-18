<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 10/29/2020
  Time: 1:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<div class="sito">
    <form action="Registrazione" id="registrazione" method="post">
           <table>
            <tr>
            <td>Nome:</td><td><input type="text" name="nome" id="nome" onfocusout="validateName()"></td><td id="erroreNome"></td>
            </tr>
               <tr>
            <td>Cognome:</td><td><input type="text" name="cognome" id="cognome" onfocusout="validateSurname()"></td><td id="erroreCognome"></td>
               </tr>
            <tr>
            <td>Nome utente:</td><td><input type="text" name="nomeUtente" id="nomeUtente" onfocusout="validateUserName()"></td><td id="erroreNomeUtente"></td>
            </tr>
               <tr>
                   <td>Password:</td><td><input type="password" name="password" id="password" onfocusout="validatePassword()"></td><td id="errorePassword"></td>
               </tr>
               <tr>
                   <td>email:</td><td><input type="text" id="email" name="email" onfocusout="validateMail()"></td><td id="erroreMail"></td>
               </tr>
               <tr>
                   <td>Indirizzo:</td>
               </tr>
               <tr>
                   <td>Provincia:</td><td><input type="text" id="provincia" onfocusout="validateProvincia()" name="provincia"></td><td id="erroreProvincia"></td>
               </tr>
               <tr>
                   <td>Citta:</td><td><input type="text" id="citta" onfocusout="validateCitta()" name="citta"></td><td id="erroreCitta"></td>
               </tr>
               <tr>
                   <td>via:</td><td><input type="text" id="via" onfocusout="validateVia()" name="via"></td><td id="erroreVia"></td>
               </tr>
               <tr>
                   <td>telefono:</td><td><input type="text" id="telefono" name="telefono"  onfocusout="validateNumero()"></td><td id="erroreNumero"></td>
               </tr>
               <tr>
                   <td></td><td><input type="submit" id="submitRegistrazione" value="Registrati"></td><td></td>
               </tr>
        </table>
    </form>
</div>
<c:if test="${errore != null}">
    <div class="sito">
        <p>${errore}</p>
    </div>
</c:if>
</body>
    <script src="formValidator.js"></script>
</html>
