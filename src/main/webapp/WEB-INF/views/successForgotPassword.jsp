<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Succ Forgot Pass</title>
    <link rel="stylesheet" href="css/style.css" />
</head>

<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>
<h1>Success</h1>

The reset password link was sent to this email:<p>${email}</p>

${user}

<br>
<a href="/">Back to homepage</a><br>

</body>
</html>