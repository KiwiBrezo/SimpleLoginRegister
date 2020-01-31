<%--
  Created by IntelliJ IDEA.
  User: Breznar
  Date: 14/01/2020
  Time: 08:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Registracija</title>
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

    <div class="inputRegisterForm">
        <form action="register" method="post" autocomplete="off" name="RForm">
            <p class="formFont">Prijava v sistem</p>
            <input class="inputPlace" id="Name" type="text" placeholder="Name" name="name">
            <input class="inputPlace" id="SurName" type="text" placeholder="Surname" name="surname">
            <input class="inputPlace" id="Email" type="email" placeholder="Email" name="email" onkeyup="validateIfEmail()">
            <input class="inputPlace" id="UserName" type="text" placeholder="Username" name="username">
            <input class="inputPlace" id="Password" type="password" placeholder="Password" name="password">
            <br>
            <input class="registerBtn" onclick="return validateRegisterForm()" type="submit" value="Register">
        </form>
        <button><a href="login">Login</a></button>
    </div>
</body>
<script>
    <%@include file="JS/script.js"%>
</script>
</html>
