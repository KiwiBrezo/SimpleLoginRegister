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
    <title>Users Dashboard</title>
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
            <button>
                <a href="logout">Odjavi me!</a>
            </button>
            <form action="addNew" method="post" autocomplete="off" name="JobForm">
                <input class="inputPlace" id="Naziv" type="text" placeholder="Naziv opravila" name="naziv">
                <br>
                <input class="inputPlace" id="Datum" type="date" name="datumZakljucka">
                <input class="inputPlace" id="Cas" type="time" name="casZakljucka">
                <br>
                <textarea class="inputPlaceBigText" placeholder="Opis opravila" name="opis"></textarea>
                <br>
                <input type="hidden" name="userId" value="<%= user_id %>">
                <input class="addBtn" onclick="return validateJobForm()" type="submit" value="Dodaj opravilo">
            </form>
        </div>

        <div class="showJobs">
            <h3>Neopravljene:</h3>
            <c:forEach items="${jobs}" var="job">
                <c:if test="${job.getJobDone() == false}">
                    <div class="jobDesc">
                        <span>${job.getTitle()}</span><br>
                        <span>${job.getShortComment()}</span><br>
                        <span>Do kdaj: ${job.getDate()}, do katere ure: ${job.getTime()}</span><br>
                        <button class="detailsBtn" onclick="showDetails('${job.getComment()}', '${job.getTitle()}', '${job.getDate()}', '${job.getTime()}')">Podrobnosti opravila</button>
                        <button class="completeBtn"><a href="finishJob?id=${job.getJobID()}">Končaj opravilo</a></button>
                        <button class="removeBtn"><a href="removeJob?id=${job.getJobID()}">Odstrani opravilo</a></button>
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <div class="showJobsDone">
            <h3>Opravljene:</h3>
            <c:forEach items="${jobs}" var="job">
                <c:if test="${job.getJobDone() == true}">
                    <div class="jobDesc">
                        <span>${job.getTitle()}</span><br>
                        <span>${job.getShortComment()}</span><br>
                        <span>Do kdaj: ${job.getDate()}, do katere ure: ${job.getTime()}</span><br>
                        <button class="detailsBtn" onclick="showDetails('${job.getComment()}', '${job.getTitle()}', '${job.getDate()}', '${job.getTime()}')">Podrobnosti opravila</button>
                        <button class="notCompleteBtn"><a href="notFinishJob?id=${job.getJobID()}">Označi kot neopravljeno</a></button>
                        <button class="removeBtn"><a href="removeJob?id=${job.getJobID()}">Odstrani opravilo</a></button>
                    </div>
                </c:if>
            </c:forEach>
        </div>

    </div>
</body>
<script>
    <%@include file="JS/script.js"%>
</script>
</html>
