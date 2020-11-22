<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 11/1/2020
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<c:choose>
    <c:when test="${beanUtente.amministratore}">
        <div class="listaWrapper">
            <div class="sito">
                <input type="text" placeholder="Filtra per nome..." id="filtraProdotto" name="nome" class="searchNome">
                <form action="CancellaProdotto" method="get" id="cancellaProdotto" class="cancellaProdotto">
                    <c:forEach items="${prodotti}" var="prodotto">
                        <div id="divProdotto">
                            <div style="background-image: url('./img/${prodotto.source}')" class="immagine"></div>
                            <p>${prodotto.nome}</p>
                            <button type="submit" class="siteButtons" name="prodotto" value="${prodotto.id}">Elimina
                                prodotto
                            </button>
                        </div>
                    </c:forEach>
                </form>
            </div>
        </div>
        <%@ include file="/WEB-INF/result/footer.jsp" %>
    </c:when>
    <c:when test="${beanUtente.amministratore == false}">
        <%
            String redirectURL = "home";
            response.sendRedirect(redirectURL);
        %>
    </c:when>
</c:choose>
</body>
<script>
    $(document).on("keyup", "#filtraProdotto", function () {
        $(".cancellaProdotto").empty();
        $nomeProdotto = $("#filtraProdotto").val();
        $.post("FiltraPerNome", {field1: $nomeProdotto}, function (responseJson) {
            $.each(responseJson, function (index, prodotto) {
                $(".cancellaProdotto").append("<div id=\"divProdotto\">\n" +
                    "                            <div style=\"background-image: url('./img/"+prodotto.source+"')\" class=\"immagine\"></div>\n" +
                    "                            <p>"+ prodotto.nome +"</p>\n" +
                    "                            <button type=\"submit\" class=\"siteButtons\" name=\"prodotto\" value=\""+  prodotto.id+"\">Elimina\n" +
                    "                                prodotto\n" +
                    "                            </button></div>")
            });
        });
    });
</script>
</html>
