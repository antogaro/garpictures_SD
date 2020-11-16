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
    <p>Benvenuto, amministratore ${sessionScope.beanUtente.nome}</p>.

    <table>
        <tr>
            <form action="ChiamaOperazioneAdmin">
            <th><button type="submit" name="operazione" value="listaProdotti">Lista Prodotti</button> </th>
                <th><button type="submit" name="operazione" value="listaUtenti">Lista Utenti</button> </th>
                <th><button type="submit" name="operazione" value="aggiungiProdotto">Aggiungi un Prodotto</button> </th>
            </form>
        </tr>
    </table>
</div>
</body>
</html>
