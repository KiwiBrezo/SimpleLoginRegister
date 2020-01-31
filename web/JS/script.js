function showDetails(comment, title, date, time) {
    let myWindow = window.open("", "MsgWindow", "width=400,height=200");
    myWindow.document.write("<h2>" + title + "</h2>");
    myWindow.document.write("<hr>");
    myWindow.document.write("<p> Do kdaj: " + date + ", do katere ure: " + time + "</p>");
    myWindow.document.write("<hr>");
    myWindow.document.write("<h3>" + comment + "</h3>");
}

function validateJobForm() {
    let naslov = document.forms["JobForm"].elements["naziv"].value;
    let datum = document.forms["JobForm"].elements["datumZakljucka"].value;
    let cas = document.forms["JobForm"].elements["casZakljucka"].value;

    let hasNaslov = true;
    let hasDatum = true;
    let hasCas = true;

    if (naslov == null || naslov == "") {
        document.getElementById("Naziv").style.borderBottomColor = "red";
        document.forms["JobForm"].elements["naziv"].placeholder = "NAZIV JE OBVEZNI PODATEK!";
        hasNaslov = false;
    } else {
        document.getElementById("Naziv").style.borderBottomColor = "white";
    }

    if (datum == null || datum == "") {
        document.getElementById("Datum").style.borderBottomColor = "red";
        hasDatum = false;
    } else {
        document.getElementById("Datum").style.borderBottomColor = "white";
    }

    if (cas == null || cas == "") {
        document.getElementById("Cas").style.borderBottomColor = "red";
        hasCas = false;
    } else {
        document.getElementById("Cas").style.borderBottomColor = "white";
    }

    if (hasNaslov && hasDatum && hasCas) return true;
    else return false;
}

function validateLoginForm() {
    let username = document.forms["LoginForm"].elements["username"].value;
    let passw = document.forms["LoginForm"].elements["password"].value;

    let hasUsername = true;
    let hasPassword = true;

    if (username == null || username == "") {
        document.getElementById("userName").style.borderBottomColor = "red";
        document.forms["LoginForm"].elements["username"].placeholder = "USERNAME JE OBVEZNI PODATEK!";
        hasUsername = false;
    }

    if (passw == null || passw == "") {
        document.getElementById("passw").style.borderBottomColor = "red";
        document.forms["LoginForm"].elements["passw"].placeholder = "PASSWORD JE OBVEZNI PODATEK!";
        hasPassword = false;
    }

    if (hasUsername && hasPassword) return true;
    else return false;
}

function validateRegisterForm() {
    let name = document.forms["RForm"].elements["name"].value;
    let surname = document.forms["RForm"].elements["surname"].value;
    let email = document.forms["RForm"].elements["email"].value;
    let username = document.forms["RForm"].elements["username"].value;
    let passw = document.forms["RForm"].elements["password"].value;

    let hasUsername = true;
    let hasName = true;
    let hasSurname = true;
    let hasEmail = true;
    let hasPassword = true;

    if (username == null || username == "") {
        document.getElementById("UserName").style.borderBottomColor = "red";
        document.forms["RForm"].elements["username"].placeholder = "USERNAME JE OBVEZNI PODATEK!";
        hasUsername = false;
    }

    if (passw == null || passw == "") {
        document.getElementById("Password").style.borderBottomColor = "red";
        document.forms["RForm"].elements["password"].placeholder = "PASSWORD JE OBVEZNI PODATEK!";
        hasPassword = false;
    }

    if (name == null || passw == "") {
        document.getElementById("Name").style.borderBottomColor = "red";
        document.forms["RForm"].elements["name"].placeholder = "NAME JE OBVEZNI PODATEK!";
        hasName = false;
    }

    if (surname == null || surname == "") {
        document.getElementById("SurName").style.borderBottomColor = "red";
        document.forms["RForm"].elements["surname"].placeholder = "SURNAME JE OBVEZNI PODATEK!";
        hasSurname = false;
    }

    if (email == null || email == "" || !email.includes("@")) {
        document.getElementById("Email").style.borderBottomColor = "red";
        document.forms["RForm"].elements["email"].placeholder = "EMAIL JE OBVEZNI PODATEK!";
        hasEmail = false;
    }

    if (hasUsername && hasPassword && hasEmail && hasName && hasSurname) return true;
    else return false;
}

function validateIfEmail() {
    let email = document.forms["RForm"].elements["email"].value;

    if (!email.includes("@")) {
        document.getElementById("Email").style.borderBottomColor = "red";
    } else {
        document.getElementById("Email").style.borderBottomColor = "white";
    }
}