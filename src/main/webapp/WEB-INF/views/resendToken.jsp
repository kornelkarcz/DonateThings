<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <%@ include file="dependencies.jsp" %>
    <title>Resend Token</title>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>
<div class="container">
    <h3>It seems that you have not activated your account!</h3>
    <hr>
    <h4>Click below to get another token!</h4>

    <form:form action="/resend-token"  method="post">
            <input class="btn btn-warning" name="submit" type="submit" value="Resend Token"/>
    </form:form>
    <br>
    <a class="btn btn-warning" href="${pageContext.request.contextPath}/">Back to homepage</a>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>