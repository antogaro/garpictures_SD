<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Prodotto" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 10/30/2020
  Time: 5:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Garpictures</title>
    <link rel="stylesheet" href="./css/style.css", type="text/css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script>
        $(document).on("click", "#rimuovi", function() {
            var prodotto = $(this).val();
            $elemento = $(this);
            $.post("CarrelloAJAX", { idProdotto: prodotto, bottone: "rimuovi" },
                function(returnedData){
                    $elemento.parent().remove();
                    var totale = JSON.parse(returnedData);
                    $("#totale").text(totale.toFixed(2)+"€");
                    if(totale == 0){
                        $("#bottoniCarrello").empty();
                        $("#bottoniCarrello").text("Il carrello è vuoto.")
                    }
                });
        });
    </script>
</head>
<%@ include file="/WEB-INF/result/header.jsp" %>

<body>
<div class="sito">
    <%
      if(!carrello.isEmpty()){
    %>
<c:forEach items="${prodotti}" var="prodotto">
    <div class="sito" id="${prodotto.nome}">
        <img src="./img/${prodotto.source}" class="prodotti">
        ${prodotto.nome}
        <button type="button" class="pagProdotto" name="prodottoId" value="${prodotto.id}" id="rimuovi">Rimuovi dal carrello</button>
    </div>
</c:forEach>
    <div id="carrelloVuoto">
    </div>
    <div id="bottoniCarrello">
    <form action="SvuotaCarrello" method="post">
        <button type="submit" id="svuotaCarrello">Svuota Carrello</button>
    </form>
    <form action="SvuotaCarrello" method="post">
        <button type="submit" id="finalizzaAcquisto">Finalizza acquisto</button>
    </form>
        <span id="totale">${sessionScope.carrello.totale}</span>
    </div>
    <%}else{
    %>
    <div class="sito">Il tuo carrello è vuoto.</div>
    <%
        }
    %>

</div>
</body>
</html>
