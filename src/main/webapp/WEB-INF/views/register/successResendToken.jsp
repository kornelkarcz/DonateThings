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

<section id="resend-token-success-section" class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-5"></div>
            <div class="col-md-4 text-center">
                <p class="resend-token-message">Dear ${firstName}, token has been successfully sent to this email: ${email}</p>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</section>

<%@ include file="../scripts.jsp" %>
<%@ include file="../footer.jsp" %>
</body>
</html>