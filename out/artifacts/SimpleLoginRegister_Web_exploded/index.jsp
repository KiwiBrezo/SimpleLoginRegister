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
    <title>Prijava</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="inputForm">
        <p class="formFont">Prijava v sistem</p>
        <form action="login" method="post">
            <input class="inputPlace" type="text" placeholder="Username" class="inputFields" name="username">
            <br>
            <input class="inputPlace" type="password" placeholder="Password" class="inputFields" name="password">
            <br>
            <input class="loginBtn" type="submit" value="Login">
        </form>
        <button><a href="register">Register</a></button>
    </div>
</body>
</html>
