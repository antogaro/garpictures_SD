<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/1/2020
  Time: 1:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pannello Admin</title>
    <link rel="stylesheet" href="./css/style.css", type="text/css">

</head>
<%@ include file="/WEB-INF/result/header.jsp" %>
<body>
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
                        <c:when test="${utente.amministratore == true}"><button type="submit" name="revoca" value="${utente.id}">Revoca privilegi</button></c:when>
                        <c:otherwise><button type="submit" name="promuovi" value="${utente.id}">Promuovi ad admin</button> </c:otherwise>
                    </c:choose> </th>
                    <th><button type="submit" name="bandisci" value="${utente.id}">Bandisci dal sito</button> </th>
                </c:if>
                </form>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>