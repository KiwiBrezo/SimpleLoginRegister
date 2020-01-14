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
</head>
<body>
    <div>
        <form action="register" method="post" >
            <input type="text" placeholder="Name" class="inputFields" name="name">
            <input type="text" placeholder="Surname" class="inputFields" name="surname">
            <input type="email" placeholder="Email" class="inputFields" name="email">
            <input type="text" placeholder="Username" class="inputFields" name="username">
            <input type="password" placeholder="Password" class="inputFields" name="password">
            <input type="submit" value="Register">
        </form>
        <button><a href="login">Login</a></button>
    </div>
</body>
</html>
