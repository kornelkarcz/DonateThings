<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Logging out</title>
    <%@ include file="dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="logout-section" class="py-5">
    <article class="logout-article">
        <div class="container">
            <div class="jumbotron">
                <h1>Thank you for being with us!</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae consequuntur deserunt distinctio
                    libero possimus similique soluta sunt temporibus tenetur unde.</p>
                <p>See you again soon!</p>
                <p><span>You will be redirected to homepage in </span><span id="countdown"></span><span> seconds!</span></p>
            </div>
        </div>
    </article>
</section>

<%@ include file="scripts.jsp" %>
<%@ include file="footer.jsp" %>
<script>
    let seconds = 10;

    function countdown() {
        seconds = seconds - 1;

        if (seconds < 0) {
            window.location = 'http://localhost:8080/'
        } else {document.getElementById("countdown").innerHTML = seconds;
            window.setTimeout("countdown()",1000);
        }
    }
    countdown();
</script>
</body>
</html>