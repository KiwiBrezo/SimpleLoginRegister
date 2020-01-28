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
    <link rel="stylesheet" href="syles/style.css">
</head>
<body class="showWindow">
    <div class="mainBody">
        <h1>
            <div>
                Pozdravljen <%= session.getAttribute("name")%> <%= session.getAttribute("surname") %>!
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
                <input type="hidden" name="userId" value="<%= session.getAttribute("userId") %>">
                <input type="hidden" name="userId" value="<%= session.getAttribute("name") %>">
                <input type="hidden" name="userId" value="<%= session.getAttribute("surname") %>">
                <input class="addBtn" type="submit" value="Dodaj opravilo">
            </form>
        </div>

        <div class="showJobs">
            <div class="jobDesc">

            </div>

            <div class="jobDesc">

            </div>
            <div class="jobDesc">

            </div>
            <div class="jobDesc">

            </div>
            <div class="jobDesc">

            </div>
            <div class="jobDesc">

            </div>
            <div class="jobDesc">

            </div>
            <div class="jobDesc">

            </div>
            <div class="jobDesc">

            </div>
            <div class="jobDesc">

            </div>
            <div class="jobDesc">

            </div>
            <div class="jobDesc">

            </div>
            <div class="jobDesc">

            </div>
        </div>

    </div>
</body>
<script>
    function logOut() {
        <% session.invalidate(); %>
        console.log("Odjava uspesna");
    }
</script>
</html>
