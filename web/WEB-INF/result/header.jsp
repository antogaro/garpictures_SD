<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 10/29/2020
  Time: 12:01 PM
  To change this template use File | Settings | File Templates.
--%>
<nav>
    <jsp:useBean id="beanUtente" class="model.Utente" scope="session" />
    <jsp:useBean id="carrello" class="model.Carrello" scope="session" />
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script>
    var tags = [];
    var tags2 = [];
    $(document).on("click", "#tags", function() {
        $.post("AutocompleteAJAX", {  },
            function(responseJson){
               tags = JSON.parse(responseJson);
                $( "#tags" ).autocomplete({
                    source: tags
                });
            });
    });
    document.addEventListener("DOMContentLoaded", function() {
        $("#inviaTags").submit(function(e){
            tags.forEach(function (item, index) {
                tags2.push(item.substring(1));
            });
           var contenuto = $("#tags").val();
           if(!contenuto || jQuery.inArray(contenuto, tags2) == -1){
               e.preventDefault();
           }
        })
    });

    </script>
        <ul>
            <li><a href="index.jsp"><img src="./sitimg/garpiclogo.png" alt="Home"></a></li>
            <li><div class="ui-widget">
                <form action="RicercaPerTag" method="post" id="inviaTags">
                <input type="text" id="tags" name="tag">
                    <button type="submit">C</button>
                </form>
            </div></li>
    <c:choose>
            <c:when test="${beanUtente.visitatore == true}">
                <li><a href="login.jsp">Login</a></li>
                <li><a href="registrazione.jsp">Registrati</a></li>
            </c:when>
            <c:when test="${beanUtente.visitatore == false}">
                <li> <a href="LogoutController">Logout</a></li>
                <li><a href="ChiamaModificaInformazioni">${beanUtente.nomeUtente}.</a> </li>
            </c:when>
        </c:choose>
            <li><a href="ChiamaCarrello">Carrello</a></li>
            <c:if test="${beanUtente.amministratore == true}">
            <li><a href="ChiamaPannelloAdmin">Pannello admin</a></li>
        </c:if>
        </ul>
</nav>

