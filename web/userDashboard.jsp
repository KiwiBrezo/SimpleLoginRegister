<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Breznar
  Date: 15/01/2020
  Time: 08:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String user_id = "/", username = "/", name = "/", surname = "/";
    Cookie cookies[] = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            switch (c.getName()) {
                case "userId":
                    user_id = c.getValue();
                    break;
                case "username":
                    username = c.getValue();
                    break;
                case "name":
                    name = c.getValue();
                    break;
                case "surname":
                    surname = c.getValue();
                    break;
                default:
                    break;
            }
        }
    }
%>
<html>
<head>
    <title>Dashboard</title>
    <style>
        <%@include file="syles/style.css"%>
    </style>
</head>
<body class="showWindow">
    <div class="mainBody">
        <h1>
            <div>
                Pozdravljen <%= name %> <%= surname %>!
            </div>
        </h1>

        <div class="addNewJobForm">
            <button onclick="logOut()">
                <a href="login">Odjavi me!</a>
            </button>
            <form action="addNew" method="post" autocomplete="off">
                <input class="inputPlace" type="text" placeholder="Naziv opravila" name="naziv">
                <br>
                <input class="inputPlace" type="date" name="datumZakljucka">
                <input class="inputPlace" type="time" name="casZakljucka">
                <br>
                <textarea class="inputPlaceBigText" placeholder="Opis opravila" name="opis"></textarea>
                <br>
                <input type="hidden" name="userId" value="<%= user_id %>">
                <input class="addBtn" type="submit" value="Dodaj opravilo">
            </form>
        </div>

        <div class="showJobs">
            <c:forEach items="${jobs}" var="job">
                <div class="jobDesc">
                    <p>${job}</p>
                </div>
            </c:forEach>
        </div>

    </div>
</body>
<script>
    function logOut() {
        <%--
        //session.invalidate();
        Cookie cokies[] = request.getCookies();

        if (cokies != null ) {
            for (Cookie c : cokies) {
                c.setValue("");
                c.setPath("/");
                c.setMaxAge(0);
                response.addCookie(c);
            }
        }
        --%>
        console.log("Odjava uspesna");
        }
</script>
</html>
