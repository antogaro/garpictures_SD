<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/1/2020
  Time: 1:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<div class="sito">
    <table style="width:100%">
        <tr>
            <th>Nome</th>
            <th>Cognome</th>
            <th>Nome Utente</th>
            <th>Amministratore</th>
        </tr>
        <c:forEach items="${utenti}" var="utente">
            <tr>
                <c:if test="${sessionScope.beanUtente.nome != utente.nome}">
                <th>${utente.nome}</th>
                <th>${utente.cognome}</th>
                <th>${utente.nomeUtente}</th>
                <th>${utente.amministratore}</th>
                <form action="GestisciUtente" method="post">
                    <th><c:choose>
                        <c:when test="${utente.amministratore == true}"><button class="siteButtons3" type="submit" name="revoca" value="${utente.id}">Revoca privilegi</button></c:when>
                        <c:otherwise><button type="submit" class="siteButtons2" name="promuovi" value="${utente.id}">Promuovi ad admin</button> </c:otherwise>
                    </c:choose> </th>
                    <th><button type="submit"  class="siteButtons" name="bandisci" value="${utente.id}">Bandisci dal sito</button> </th>
                </c:if>
                </form>
            </tr>
        </c:forEach>
    </table>
</div>
<%@ include file="/WEB-INF/result/footer.jsp" %>
</body>
</html>
