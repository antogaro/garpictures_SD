<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/7/2020
  Time: 2:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<div class="sito">
    <table>
        <form action="ModificaEmail" method="post" id="modificaEmail">
        <tr>
        <td>Inserisci il nuovo indirizzo email:</td><td><input type="text" name="nuovaEmail" id="nuovaEmail" onfocusout="validateMail()"></td>
            <td><input type="submit" value="cambia email" id="submitEmail" name="submitEmail"></td>
        </tr>
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
</body>
</html>
