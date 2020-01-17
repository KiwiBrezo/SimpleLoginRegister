<%--
  Created by IntelliJ IDEA.
  User: Breznar
  Date: 14/01/2020
  Time: 08:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registracija</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="inputRegisterForm">
        <form action="register" method="post" >
            <p class="formFont">Prijava v sistem</p>
            <input class="inputPlace" type="text" placeholder="Name" name="name">
            <input class="inputPlace" type="text" placeholder="Surname" name="surname">
            <input class="inputPlace" type="email" placeholder="Email" name="email">
            <input class="inputPlace" type="text" placeholder="Username" name="username">
            <input class="inputPlace" type="password" placeholder="Password" name="password">
            <input class="registerBtn" type="submit" value="Register">
        </form>
        <button><a href="login">Login</a></button>
    </div>
</body>
</html>
