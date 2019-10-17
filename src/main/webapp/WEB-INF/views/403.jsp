<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Error</title>
    <%@ include file="dependencies.jsp"%>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>
<sec:authorize access="hasRole('ADMIN')">
    <%@ include file="adminHeader.jsp" %>
</sec:authorize>
<h1>Error</h1>

<p>${message}</p>

<a href="/">Back to homepage</a><br>

<%@ include file="footer.jsp" %>
</body>
</html>