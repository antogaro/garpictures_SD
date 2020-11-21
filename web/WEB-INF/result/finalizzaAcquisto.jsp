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
        <form action="CompletaPagamento" method="post" name ="completaPagamento" id="completaPagamento">
            <div id="spazio_info_pagamento">
                <c:if test="${beanUtente.visitatore == true}">
                    <div class="campoInput">
                        <input type="text" placeholder="email" id="email" name="email" onfocusout="validateMailAcquisto()">
                        <p id="erroreMail"></p>
                    </div>
                </c:if>
                <c:if test="${beanUtente.visitatore == false}">
                    <div class="campoInput">
                        <input type="text" id="emailUtente" name="email" value="${beanUtente.email}" readonly>
                    </div>
                </c:if>
                <div class="campoInput">
                    <input type="text" placeholder="Numero carta" id="carta" name="carta" onfocusout="validateCarta()">
                    <p id="erroreCarta"></p>
                </div>
                <div class="campoInput">
                    <input type="text" placeholder="CVV" id="CVV" name="CVV" onfocusout="validateCVV()">
                    <p id="erroreCVV"></p>
                </div>
            </div>
            <button type="submit" class="siteButtons2">Completa acquisto</button>
        </form>
    </div>
</div>
</div>
<%@ include file="/WEB-INF/result/footer.jsp" %>
</body>
<script src="formValidator.js"></script>
</html>
