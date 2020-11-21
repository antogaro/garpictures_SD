<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/1/2020
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<c:choose>
    <c:when test="${beanUtente.amministratore}">
        <div class="sito">
            <form action="CancellaProdotto" method="post">
                <c:forEach items="${prodotti}" var="prodotto">
                    <div class="sito" id="divProdotto">
                        <img src="./img/${prodotto.source}" class="prodotti">
                        <div id="prodottettag">
                                ${prodotto.nome} <br/>
                            <button type="submit" class="siteButtons" name="prodotto" value="${prodotto.id}">Elimina prodotto</button>
                        </div>
                    </div>
                </c:forEach>
            </form>
        </div>
        <%@ include file="/WEB-INF/result/footer.jsp" %>
    </c:when>
    <c:when test="${beanUtente.amministratore == false}">
        <%
            String redirectURL = "home";
            response.sendRedirect(redirectURL);
        %>
    </c:when>
</c:choose>
</body>
</html>
