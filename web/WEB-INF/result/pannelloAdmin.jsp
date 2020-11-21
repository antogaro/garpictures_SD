<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/1/2020
  Time: 1:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<c:choose>
    <c:when test="${beanUtente.amministratore}">
        <div id="spazio_registrazione" class="spazioregistrazione">
            <h1>
                Pannello admin
            </h1>

            <form action="ChiamaOperazioneAdmin">
                <p>Benvenuto, amministratore ${sessionScope.beanUtente.nome}.</p>
                <th>
                    <button type="submit" class="siteButtons" name="operazione" value="listaProdotti">Lista Prodotti</button>
                </th>
                <th>
                    <button type="submit" class="siteButtons" name="operazione" value="listaUtenti">Lista Utenti</button>
                </th>
                <th>
                    <button type="submit" class="siteButtons" name="operazione" value="aggiungiProdotto">Aggiungi un Prodotto
                    </button>
                </th>
            </form>

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
</html>
