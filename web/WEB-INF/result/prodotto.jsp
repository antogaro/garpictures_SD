<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 10/28/2020
  Time: 3:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<div class="sito">
    <div class="sito" id="divProdotto">
    <img src="./img/${prodotto.source}" class="prodotti">
        <div>
            ${prodotto.nome} <br/>
            ${prodotto.prezzo} &euro; <br/>
                <div id="bottoniCarrello">

            <button class="pagProdotto" value="Acquista" id="acquista" value="acquista1">Acquista</button> <br/>
                    <%
                        Prodotto prodotto = (Prodotto) request.getAttribute("prodotto");
                        if(!carrello.isProdottoIn(prodotto)){
                    %>
            <button type="button" class="pagProdotto" id="aggiungi" value="aggiungi" name="prodottoId">Aggiungi al carrello</button> <br/>
            <%
                }else{
            %>
                  <button type="button"class="pagProdotto" id="rimuovi" value="rimuovi" name="prodottoId">Rimuovi dal carrello</button> <br/>
                </div>
                <%
                }
            %>
                <span class="popuptext" id="popup"> </span></br>
                <!-- Tutto il blocco di codice sottostante è per alternare i + e - sui bottoni dei tag -->
                <form action="RicercaPerTag" method="post">
                    <c:forEach items="${tags}" var="tag">
                        <c:set var="flag" value="1"/>
                        <c:choose>
                            <c:when test="${not empty sessionScope.tagsUtente}">
                                <c:forEach items="${sessionScope.tagsUtente}" var="tagsUtente">
                                    <c:choose>
                                        <c:when test="${tagsUtente.tag == tag.tag}">
                                            <button type="submit" class="tagButton" name="tag" value="${tag.tag}">-${tag.tag}</button>
                                            <c:set var="flag" value="2"/>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${flag == 1}">
                        <button type="submit" class="tagButton" name="tag" value="${tag.tag}">+${tag.tag}</button>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </form>
        </div>
    </div>
</div>
</body>
<script>
    $(document).on("click", "#aggiungi", function() {
        var bottone = $(this).val();
        $.post("CarrelloAJAX", {idProdotto: ${prodotto.id}, bottone: bottone },
            function(returnedData){
                $("#aggiungi").attr("value","rimuovi");
                $("#aggiungi").html("Rimuovi dal carrello");
                $("#aggiungi").attr("id","rimuovi");
                $("#popup").show();
                $("#popup").text("Elemento aggiunto al carrello!");
                $("#popup").fadeOut(2500)
            });
    });
    $(document).on("click", "#rimuovi", function() {
        var bottone = $(this).val();
        $.post("CarrelloAJAX", {idProdotto: ${prodotto.id}, bottone: bottone },
            function(returnedData){
                $("#rimuovi").attr("value","aggiungi");
                $("#rimuovi").html("Aggiungi al carrello");
                $("#rimuovi").attr("id","aggiungi");
                $("#popup").show();
                $("#popup").text("Elemento rimosso dal carrello!");
                $("#popup").fadeOut(2500)
            });
    });

</script>
</html>
