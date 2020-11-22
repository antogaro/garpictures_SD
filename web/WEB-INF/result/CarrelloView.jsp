<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 10/30/2020
  Time: 5:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<div class="sito">
    <div class="carrelloWrapper">
    <%
        if (!carrello.isEmpty()) {
    %>
        <div class="prodottiWrapper">
    <c:forEach items="${carrello.carrelloProdotti}" var="prodotto">
        <div class="sito" id="carrelloContainer">
            <img src="./img/${prodotto.source}" id="prodottoCarrello">
            <div id="spazioRimuoviCarrello">
                <button type="button" class="siteButtons" name="prodottoId" value="${prodotto.id}" id="rimuovi"><img
                        src="./sitimg/X.png" width="15px" height="15px">
                </button>
                <p><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
                                     value="${prodotto.prezzo}"/>&euro;</p>
            </div>
        </div>
    </c:forEach>
        </div>
    <div id="carrelloVuoto">
    </div>
    <div id="bottoniCarrello">
        <p id="totale"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
                                         value="${sessionScope.carrello.totale}"/>&euro;</p>
        <form action="SvuotaCarrello" method="post">
            <button class="siteButtons" type="submit" id="svuotaCarrello">Svuota Carrello</button>
        </form>
        <form action="ChiamaFinalizzaAcquisto" method="get">
            <button type="submit" class="siteButtons2" id="finalizzaAcquisto" name="fromCarrello" value="true">Finalizza
                acquisto
            </button>
        </form>
    </div>
    <%
    } else {
    %>
    <div>Non hai alcun prodotto nel carrello.</div>
    <%
        }
    %>
</div>
</div>
<%@ include file="/WEB-INF/result/footer.jsp" %>
</body>
<script>
    $(document).on("click", "#rimuovi", function () {
        var prodotto = $(this).val();
        $elemento = $(this);
        $.post("CarrelloAJAX", {idProdotto: prodotto, bottone: "rimuovi"},
            function (returnedData) {
                $elemento.parent().parent().remove();
                var totale = JSON.parse(returnedData);
                $("#totale").html(totale.toFixed(2) + "&euro;");
                if (totale == 0) {
                    $("#bottoniCarrello").empty();
                    $("#bottoniCarrello").text("Non hai alcun prodotto nel carrello.")
                }
            });
    });
</script>
</html>
