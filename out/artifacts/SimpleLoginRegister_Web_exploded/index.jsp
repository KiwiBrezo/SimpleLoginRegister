<%--
  Created by IntelliJ IDEA.
  User: Breznar
  Date: 14/01/2020
  Time: 07:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Prijava</title>
</head>
<body>
    <div class="inputForm">
        <form action="login" method="post">
            <input type="text" placeholder="Username" class="inputFields" name="username">
            <input type="password" placeholder="Password" class="inputFields" name="password">
            <input type="submit" value="Login">
        </form>
        <button><a href="register">Register</a></button>
    </div>
</body>
</html>
