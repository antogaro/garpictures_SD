<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/7/2020
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<c:choose>
    <c:when test="${beanUtente.visitatore == false}">
        <div id="spazio_registrazione" class="spazioregistrazione">
            <h1>
                Modifica indirizzo
            </h1>
            <form action="CambiaIndirizzo" method="post" id="modificaIndirizzo">
                <div class="riga_input">
                    <div class="spazioinput">
                        <input type="text" name="nuovaProvincia" id="nuovaProvincia" onfocusout="validateNuovaProvincia()"
                               placeholder="Nuova provincia">
                        <td id="erroreNuovaProvincia"></td>
                    </div>
                    <div class="spazioinput">
                        <input type="text" name="nuovaCitta" id="nuovaCitta" onfocusout="validateNuovaCitta()"
                               placeholder="Nuova città">
                        <td id="erroreNuovaCitta"></td>
                    </div>
                </div>
                <div class="riga_input">
                    <div class="spazioinput">
                        <input type="text" name="nuovaVia" id="nuovaVia" onfocusout="validateNuovaVia()"
                               placeholder="Nuova via">
                        <td id="erroreNuovaVia"></td>
                    </div>
                </div>
                <div class="riga_input">
                    <input type="submit" class="siteButtons2" value="Cambia indirizzo" id="submitCambiaIndirizzo">
                </div>
            </form>
            <c:if test="${errore != null}">
                <tr>
                    <td>${errore}</td>
                </tr>
            </c:if>
        </div>
        <%@ include file="/WEB-INF/result/footer.jsp" %>
    </c:when>
    <c:otherwise>
        <%
            String redirectURL = "home";
            response.sendRedirect(redirectURL);
        %>
    </c:otherwise>
</c:choose>
</body>
<script src="formValidatorModifica.js"></script>
</html>