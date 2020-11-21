<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/20/2020
  Time: 12:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/result/header.jsp" %>
<div id="homecontainer">
    <c:choose>
        <c:when test="${fromCarrello == null}">
            <div class="spazio_prodotto">
                <img src="./img/${prodotto.source}" width="150px" height="auto">
                <div class="spazio_infoProdotto">
                    <p>${prodotto.nome}</p>
                    <p>${prodotto.descrizione}</p>
                </div>
                <p><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
                                     value="${prodotto.prezzo}"/>&euro;</p>
                <c:set var="total" scope="request" value="${prodotto.prezzo}"/>
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach items="${sessionScope.carrello.carrelloProdotti}" var="prodotto">
                <div class="spazio_prodotto">
                    <img src="./img/${prodotto.source}" width="150px" height="auto">
                    <div class="spazio_infoProdotto">
                        <p>${prodotto.nome}</p>
                        <p>${prodotto.descrizione}</p>
                    </div>
                    <p><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
                                         value="${prodotto.prezzo}"/>&euro;</p>
                    <c:set var="total" scope="request" value="${total + prodotto.prezzo}"/>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
    <div id="spazio_finalizza">
        <p>Totale: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
                                     value="${total}"/>&euro;</p>
        <div id="spazio_info_pagamento">
            <input type="text" placeholder="Numero carta">
            <input type="text" placeholder="CVV">
        </div>
        <button id="finalizzaAcquisto">Completa acquisto</button>
    </div>
</div>
</div>
<%@ include file="/WEB-INF/result/footer.jsp" %>
</body>
</html>
