<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/1/2020
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista Prodotti</title>
    <link rel="stylesheet" href="./css/style.css", type="text/css">
</head>
<%@ include file="/WEB-INF/result/header.jsp" %>
<body>
<%
    request.setAttribute("isListaProdotti",1);
%>
<div class="sito">
    <form action="CancellaProdotto" method="post">
    <c:forEach items="${prodotti}" var="prodotto">
        <div>
                ${prodotto.nome}
            <img src="./img/${prodotto.source}" class="prodotti">
        </div>
        <button type="submit" name="prodotto" value="${prodotto.id}">Elimina prodotto</button>
    </c:forEach>
    </form>
</div>
</body>
</html>
