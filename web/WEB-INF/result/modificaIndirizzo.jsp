<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/7/2020
  Time: 4:31 PM
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
        <form action="CambiaIndirizzo" method="post" id="modificaIndirizzo">
            <tr>
                <td>Inserisci la nuova Provincia:</td><td><input type="text" name="nuovaProvincia" id="nuovaProvincia" onfocusout="validateNuovaProvincia()"></td><td id="erroreNuovaProvincia"></td>
            </tr>
            <tr>
                <td>Inserisci la nuova città:</td><td><input type="text" name="nuovaCitta" id="nuovaCitta" onfocusout="validateNuovaCitta()"></td><td id="erroreNuovaCitta"></td>
            </tr>
            <tr>
                <td>Inserisci la nuova via:</td><td><input type="text" name="nuovaVia" id="nuovaVia" onfocusout="validateNuovaVia()"></td><td id="erroreNuovaVia"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Cambia indirizzo" id="submitCambiaIndirizzo"></td>
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