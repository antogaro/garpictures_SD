<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/7/2020
  Time: 2:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<div class="sito" id="homecontainer">
    <table>
        <form action="ModificaEmail" method="post" id="modificaEmail">
            <div class="riga_input">
                <div class="spazioinput">
                    Inserisci il nuovo indirizzo email:</td><td><input type="text" name="nuovaEmail" id="nuovaEmail" onfocusout="validateMail()"></td>
            <td><input type="submit" class="siteButtons3" value="cambia email" id="submitEmail" name="submitEmail"></td>
                </div>
            </div>
        </form>
        <tr>
            <td id="erroreMail"></td>
        </tr>
        <c:if test="${errore != null}">
            <tr>
                <td>${errore}</td>
            </tr>
        </c:if>
    </table>
</div>
<%@ include file="/WEB-INF/result/footer.jsp" %>
</body>
<script src="formValidatorModifica.js"></script>
</html>
