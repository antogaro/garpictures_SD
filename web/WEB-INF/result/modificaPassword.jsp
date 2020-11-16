<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/7/2020
  Time: 2:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modifica Email</title>
    <link rel="stylesheet" href="./css/style.css", type="text/css">
    <script src="formValidatorModifica.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<%@ include file="/WEB-INF/result/header.jsp" %>
<body>
<div class="sito">
    <table>
        <form action="ModificaPassword" method="post" id="modificaPassword">
            <tr>
                <td>Inserisci la nuova password:</td><td><input type="password" name="nuovaPassword" id="nuovaPassword" onfocusout="validatePassword()"></td><td id="erroreNuovaPassword"></td>
            </tr>
            <tr>
                <td>Conferma la nuova password:</td><td><input type="password" name="nuovaPasswordConferma" id="nuovaPasswordConferma" onfocusout="validateConfermaPassword()"></td><td id="erroreNuovaPasswordConferma"></td>
            </tr>
            <tr>
                <td><input type="submit" value="cambia password" id="submitCambiaPassword"></td>
            </tr>
        </form>
        <c:if test="${errore != null}">
            <tr>
                <td>${errore}</td>
            </tr>
        </c:if>
    </table>
</div>
</body>
</html>