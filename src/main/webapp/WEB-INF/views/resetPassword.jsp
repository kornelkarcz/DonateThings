<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Enter New Password</title>
    <%@ include file="dependencies.jsp" %>
</head>

<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="reset-password-form-section">
    <div class="container">
        <div class="row align-items-center mb-5">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <form action="/reset-password" modelAttribute="passwordForgotDto" method="post"
                      class="reset-password-form">
                    <h2 class="display-4">Please enter new password</h2>

                    <div class="reset-password-form-item">
                        <input type="password" name="newPassword" value=""/>
                        <span data-placeholder="New Password"></span>
                    </div>

                    <div class="reset-password-form-item">
                        <input type="password" name="matchingPassword" value=""/>
                        <span data-placeholder="Repeat New Password"></span>
                    </div>

                    <button class="submit btn btn-warning btn-block mb-1" type="submit">Reset Password</button>
                    <button class="submit btn btn-secondary btn-block mb-1" type="reset">Clear</button>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</section>

<%@ include file="scripts.jsp" %>
<%@ include file="footer.jsp" %>
</body>
</html>