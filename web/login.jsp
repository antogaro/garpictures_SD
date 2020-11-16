<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 10/28/2020
  Time: 9:02 PM
  Comment: Mannaggia
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="./css/style.css", type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body id="login">
    <div class="logeen">
        <p class="Entra" align="center">Entra</p>
<form class="loginform" action="Login" method="post">
    <table>
        <tr>
        <td><input class="ilogin" type="text" name="nomeUtente" id="nomeUtente" placeholder="Nome Utente" ></td>
        </tr>
        <tr>
        <td><input class="ilogin" type="password" name="password" id="password" placeholder="Password" ></td>
        </tr>
        <tr>
        <td><input class="bottonelogin" type="submit" id="submitLogin" value="Login" align="center"></td>
        </tr>
        <tr>

        </tr>
    </table>
</form>
<c:if test="${login !=null}">
    <p>${login}</p>
</c:if>
    </div>
</body>
</html>
