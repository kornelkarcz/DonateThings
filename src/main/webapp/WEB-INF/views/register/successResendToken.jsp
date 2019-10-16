<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Token Sent</title>
    <%@ include file="../dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="../header.jsp" %>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <%@ include file="../loggedHeader.jsp" %>
</sec:authorize>

<div class="container">
    <h3 class="display-4">${user}, token has been successfully sent to this email: ${email}</h3>
</div>


<%@ include file="../footer.jsp" %>
<%@ include file="../scripts.jsp" %>
</body>
</html>