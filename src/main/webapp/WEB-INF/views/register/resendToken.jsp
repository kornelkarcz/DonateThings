<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Resend Token</title>
    <%@ include file="../dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="../header.jsp" %>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <%@ include file="../loggedHeader.jsp" %>
</sec:authorize>


<section id="resend-token-section" class="py-5">
    <div class="container">
        <div class="row pt-5">
            <div class="col-md-5"></div>
            <div class="col-md-4 text-center">
                <h3>It seems that you have not activated your account!</h3>
                <hr>
                <h4 class="mb-3">Click below to get another token!</h4>

                <form:form action="/resend-token" method="post">
                    <input class="btn btn-warning btn-block" name="submit" type="submit" value="Resend Token"/>
                </form:form>
                <a class="btn btn-secondary btn-block" href="${pageContext.request.contextPath}/">Back to homepage</a>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</section>

<%@ include file="../scripts.jsp" %>
<%@ include file="../footer.jsp" %>
</body>
</html>
