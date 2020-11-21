<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/7/2020
  Time: 1:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<div id="spazio_registrazione" class="spazioregistrazione">
    <h1>
        ${beanUtente.nomeUtente}
    </h1>
    <form action="ChiamaModificaInformazioni" method="post">
        <tr>
            <th>Nome:</th>
            <td>${beanUtente.nome} ${beanUtente.cognome}</td>
            <br/>
        </tr>
        <tr>
            <th>Nome Utente:</th>
            <td>${beanUtente.nomeUtente}</td>
            <br/>
        </tr>
        <tr>
            <th>Email:</th>
            <td>${beanUtente.email}</td>
            <br/>
        </tr>
        <tr>
            <th>Indirizzo:</th>
            <td>${beanUtente.provincia}, ${beanUtente.citta}, ${beanUtente.indirizzo}</td>
            <br/>
        </tr>
        <tr>
            <td>
                <button name="modificaIndirizzo" class="siteButtons3" value="modificaIndirizzo">Modifica indirizzo
                </button>
            </td>
            <td>
                <button name="modificaPassword" class="siteButtons3" value="modificaPassword"> Modifica Password
                </button>
            </td>
            <td>
                <button name="modificaEmail" class="siteButtons3" value="modificaEmail"> Modifica Email</button>
            </td>
        </tr>
        <c:if test="${modificata != null}">
            <td></td>
            <td>${modificata}</td>
        </c:if>
    </form>
</div>

<%@ include file="/WEB-INF/result/footer.jsp" %>
</body>
</html>
