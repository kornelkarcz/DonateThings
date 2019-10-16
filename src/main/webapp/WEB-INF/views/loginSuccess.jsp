<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Login</title>
    <%@ include file="dependencies.jsp" %>
</head>

<body>
<sec:authorize access="isAuthenticated()">
    <%@include file="loggedHeader.jsp" %>
</sec:authorize>
<h1>Success</h1>

<p>${logSuccessMessage}</p>

<a href="/">Back to homepage</a><br>
<%@ include file="scripts.jsp" %>
<%@ include file="footer.jsp" %>
</body>
</html>