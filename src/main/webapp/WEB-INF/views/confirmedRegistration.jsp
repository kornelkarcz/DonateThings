<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Registration Confirmed</title>
    <%@ include file="dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="registration-success" class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <h1 class="display-5 mb-5">Success</h1>
                <p>Your account has been created successfully!</p>
                <a href="/" class="btn btn-warning mt-4">Back to the homepage</a>
            </div>
            <div class="col-md-2"></div>
            <div class="align-self-center">
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>
<%@ include file="scripts.jsp" %>
</body>
</html>