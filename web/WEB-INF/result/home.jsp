<%@ page import="model.Prodotto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="model.Tag" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 10/27/2020
  Time: 4:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Garpictures</title>
    <link rel="stylesheet" href="./css/style.css", type="text/css">
</head>
<%@ include file="/WEB-INF/result/header.jsp" %>
<body>
<c:if test="${prodottoCaricato != null}">
    <script>
        alert("Prodotto aggiunto con successo.");
    </script>
</c:if>
<div class="sito">

    <c:if test="${not empty sessionScope.tagsUtente}">

    Stai filtrando in base ai seguenti tag:
    <form action="RicercaPerTag">
    <c:forEach items="${sessionScope.tagsUtente}" var="tagz">
        <button type="submit" class="tagButton" name="tag" value="${tagz.tag}">-${tagz.tag}</button>
    </c:forEach>
    </form>
        <form action="PulisciTag" method="post">
            <button type="submit" class="tagButton" name="rimuoviTutti" value="rimuoviTutti">x</button>
        </form>
        <br/>
        </c:if>
        
    <c:if test="${empty prodotti}">
        <span>Nessun risultato</span>
    </c:if>
    
    <c:if test="${not empty risultato}">
        ${risultato}
    </c:if>

    <form action="ChiamaProdotto" method="post">
     <c:forEach items="${prodotti}" var="prodotto">
         <button class="containerImmagini" type="submit" name="prodottoId" value="${prodotto.id}">
             <img src="./img/${prodotto.source}" alt="${prodotto.source}" class="prodotti">
         </button>
     </c:forEach>
    </form>
</div>
</body>
</html>

