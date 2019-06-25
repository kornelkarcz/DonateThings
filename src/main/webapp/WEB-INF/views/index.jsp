<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Homepage</title>
</head>

<body>
<h1>Welcome again</h1>
<p>${helloMessage}</p>


<sec:authorize access="isAnonymous()">
    <a href="/login">Login</a><br>

</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <a href="/logout">Logout</a>
    <p>
    User: <sec:authentication property="principal.username"/>
    <br><br>
    Role(s): <sec:authentication property="principal.authorities"/>
    <br><br>
</sec:authorize>

    <%--<c:choose>--%>
        <%--<c:when test="${logged == true}">--%>
            <%--<p>Jest sesja</p>--%>
        <%--</c:when>--%>
        <%--<c:otherwise>--%>
            <%--<p>Nic tu nie ma</p>--%>
        <%--</c:otherwise>--%>
    <%--</c:choose>--%>

        ${firstName}

<br>
<a href="/register">Register Page</a><br>
<a href="/">Back to homepage</a><br>

</body>
</html>