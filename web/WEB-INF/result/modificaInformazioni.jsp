<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/7/2020
  Time: 1:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modifica informazioni</title>
    <link rel="stylesheet" href="./css/style.css", type="text/css">
    <script src="notifies.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<%@ include file="/WEB-INF/result/header.jsp" %>
<body>
<div class="sito">
    <table>
        <form action="ChiamaModificaInformazioni" method="post">
        <tr>
            <th>Nome</th><td>${beanUtente.nome} ${beanUtente.cognome}</td><td><button name="modificaIndirizzo" value="modificaIndirizzo">Modifica indirizzo</button></td>
        </tr>
        <tr>
          <th>Nome Utente</th><td>${beanUtente.nomeUtente}</td><td><button name="modificaPassword" value="modificaPassword"> Modifica Password </button></td>
        </tr>
        <tr>
            <th>Email</th><td>${beanUtente.email}</td><td><button name="modificaEmail" value="modificaEmail"> Modifica Email</button></td>
        </tr>
        <tr>
            <th>Indirizzo</th><td>${beanUtente.provincia},${beanUtente.citta},${beanUtente.indirizzo}</td>
        </tr>
            <c:if test="${modificata != null}">
                <td></td><td>${modificata}</td>
            </c:if>
        </form>
    </table>

</div>
</body>
</html>
