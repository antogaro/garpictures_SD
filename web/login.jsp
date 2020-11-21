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
<div id="spazio_login">
    <div class="logeen">
        <p class="Entra" align="center">Entra</p>
        <form class="loginform" action="Login" method="post">
            <table>
                <tr>
                    <td>
                        <input class="ilogin" type="text" name="nomeUtente" id="nomeUtente" placeholder="Nome Utente">
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="spazioinput"><input class="ilogin" type="password" name="password" id="password"
                                                        placeholder="Password">
                            <p>
                                <c:if test="${login !=null}">
                            <p>${login}</p>
                            </c:if>
                            </p>
                        </div>

                    </td>
                </tr>
                <tr>
                    <td><input class="bottonelogin" type="submit" id="submitLogin" value="Login" align="center"></td>
                </tr>
                <tr>

                </tr>
            </table>
        </form>

    </div>
</div>
<%@ include file="/WEB-INF/result/footer.jsp" %>
</body>
</html>
