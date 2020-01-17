<%--
  Created by IntelliJ IDEA.
  User: Breznar
  Date: 15/01/2020
  Time: 08:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="mainBody">
        <h1>
            Pozdravljen <%= request.getAttribute("name")%> <%= request.getAttribute("surname") %>!
        </h1>
        <h2>
            Tvojo uporabnisko ime je: <%= request.getAttribute("username") %>.
        </h2>
        <button><a href="login">Odjavi me!</a></button>
    </div>
</body>
</html>
