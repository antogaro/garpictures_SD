<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 10/30/2020
  Time: 5:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<div class="sito">
    <%
        if (!carrello.isEmpty()) {
    %>
    <c:forEach items="${carrello.carrelloProdotti}" var="prodotto">
        <div class="sito"  id="carrelloContainer">
            <img src="./img/${prodotto.source}" class="prodotti">
            <button type="button" class="siteButtons" name="prodottoId" value="${prodotto.id}" id="rimuovi"><img src="./sitimg/X.png">
            </button>
        </div>
    </c:forEach>
    <div id="carrelloVuoto">
    </div>
    <div id="bottoniCarrello">
        <form action="SvuotaCarrello" method="post">
            <button class="siteButtons" type="submit" id="svuotaCarrello">Svuota Carrello</button>
        </form>
        <form action="ChiamaFinalizzaAcquisto" method="get">
            <button type="submit" class="siteButtons2" id="finalizzaAcquisto" name="fromCarrello" value="true">Finalizza
                acquisto
            </button>
        </form>
        <span id="totale">Totale: ${sessionScope.carrello.totale} euro. </span>
    </div>
    <%
    } else {
    %>
    <div>Non hai alcun prodotto nel carrello.</div>
    <%
        }
    %>
</div>
<%@ include file="/WEB-INF/result/footer.jsp" %>
</body>
<script>
    $(document).on("click", "#rimuovi", function () {
        var prodotto = $(this).val();
        $elemento = $(this);
        $.post("CarrelloAJAX", {idProdotto: prodotto, bottone: "rimuovi"},
            function (returnedData) {
                $elemento.parent().remove();
                var totale = JSON.parse(returnedData);
                $("#totale").text(totale.toFixed(2) + "€");
                if (totale == 0) {
                    $("#bottoniCarrello").empty();
                    $("#bottoniCarrello").text("Non hai alcun prodotto nel carrello.")
                }
            });
    });
</script>
</html>
