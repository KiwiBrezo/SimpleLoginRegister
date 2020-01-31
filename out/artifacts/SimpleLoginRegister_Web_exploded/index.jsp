<%--
  Created by IntelliJ IDEA.
  User: Breznar
  Date: 14/01/2020
  Time: 07:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
    <style>
        <%@include file="syles/style.css"%>
    </style>
</head>
<body>
    <c:if test="${status != null && massage != null}">
        <c:choose>
            <c:when test="${status == 'succ'}">
                <p class="succMsg"> <%= session.getAttribute("massage") %> </p>
            </c:when>
            <c:when test="${status == 'err'}">
                <p class="errMsg"> <%= session.getAttribute("massage") %> </p>
            </c:when>
            <c:otherwise>
                <!-- just nofing -->
            </c:otherwise>
        </c:choose>

        <%
            session.removeAttribute("status");
            session.removeAttribute("massage");
        %>
    </c:if>

    <div class="inputLoginForm">
        <p class="formFont">Prijava v sistem</p>
        <form action="login" method="post" autocomplete="off" name="LoginForm">
            <input class="inputPlace" id="userName" type="text" placeholder="Username" class="inputFields" name="username">
            <br>
            <input class="inputPlace" id="passw" type="password" placeholder="Password" class="inputFields" name="password">
            <br>
            <input class="loginBtn" onclick="return validateLoginForm()" type="submit" value="Login">
        </form>
        <button><a href="register">Register</a></button>
    </div>

</body>
<script>
    <%@include file="JS/script.js"%>
</script>
</html>
