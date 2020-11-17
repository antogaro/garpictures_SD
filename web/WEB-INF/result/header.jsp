<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 10/29/2020
  Time: 12:01 PM
  To change this template use File | Settings | File Templates.
--%>
<header>
    <jsp:useBean id="beanUtente" class="model.Utente" scope="session" />
    <jsp:useBean id="carrello" class="model.Carrello" scope="session" />
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script>
            $(document).on("click", "#tags", function() {
                $.post("AutocompleteAJAX", {  },
                    function(responseJson){
                       var tags = JSON.parse(responseJson);
                        $( "#tags" ).autocomplete({
                            source: tags
                        });
                    });
            });

            document.addEventListener("DOMContentLoaded", function() {
                $("#inviaTags").submit(function(e){
                   var contenuto = $("#tags").val();
                   if(!contenuto){
                       e.preventDefault();
                   }
                })
            });

    </script>
    <div id="header", class="sito">
        <script></script>
        <a href="index.jsp"><img src="./sitimg/garpiclogo.png" alt="Home" width="100px" height="100px"></a>
        <div class="ui-widget">
            <form action="RicercaPerTag" method="post" id="inviaTags">
            <label for="tags">Tags: </label>
            <input type="text" id="tags" name="tag">
            <button type="submit">C</button>
            </form>
        </div>


        <c:choose>
            <c:when test="${beanUtente.visitatore == true}">
                Benvenuto, utente, effettua il <a href="login.jsp">Login</a>, oppure
                <a href="registrazione.jsp">Registrati</a>.maybe also <a href="ChiamaCarrello">Carrello</a>
            </c:when>
            <c:when test="${beanUtente.visitatore == false}">
                Benvenuto <a href="ChiamaModificaInformazioni">${beanUtente.nomeUtente}.</a> Consulta il tuo <a href="ChiamaCarrello">carrello</a>,oppure effettua il <a href="LogoutController">Logout</a>.
            </c:when>
        </c:choose>
        <c:if test="${beanUtente.amministratore == true}">
            <a href="ChiamaPannelloAdmin">Pannello admin</a>
        </c:if>
    </div>

</header>

