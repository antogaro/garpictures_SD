<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Antonio
  Date: 10/28/2020
  Time: 9:02 PM
  Comment: Mannaggia
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/result/header.jsp" %>
<c:choose>
    <c:when test="${beanUtente.visitatore}">
        <div id="spazio_login">
            <div class="logeen">
                <p class="Entra" align="center">Entra</p>
                <form class="loginform" action="Login" method="post" id="loginForm">
                    <div class="spazioinput">
                            <input class="ilogin" type="text" name="nomeUtente" id="nomeUtente" placeholder="Nome Utente" onfocusout="validateLogin()">
                    </div>
                    <div class="spazioinput">
                        <input class="ilogin" type="password" name="password" id="password"
                                                    placeholder="Password"  onfocusout="validatePassword()">
                        <p id="erroreLogin"> <c:if test="${login !=null}">
                            ${login}
                        </c:if></p>
                    </div>
                    <input class="bottonelogin" type="submit" id="submitLogin" value="Login" align="center">

                </form>

            </div>
        </div>
    </c:when>
    <c:otherwise>
        <%
            String redirectURL = "home";
            response.sendRedirect(redirectURL);
        %>
    </c:otherwise>
</c:choose>
<%@ include file="/web/WEB-INF/result/footer.jsp" %>
</body>
<script src="formValidator.js"></script>
</html>
