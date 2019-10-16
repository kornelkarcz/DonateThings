<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Change Password</title>
    <%@ include file="dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="change-password-form-section" class="py-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-3"></div>
            <div class="col-md-6 text-center">
                <h2>Change Your Password</h2>

                <form:form action="/change-password" modelAttribute="changePasswordDto" method="post"
                           cssClass="change-password-form">
                    <div class="change-password-form-item">
                        <form:input path="oldPassword" type="password" name="oldPassword"/>
                        <span data-placeholder="Old password"></span>
                        <form:errors path="oldPassword" cssClass="error" element="div"/>
                    </div>
                    <div class="change-password-form-item">
                        <form:input path="newPassword" type="password" name="newPassword"/>
                        <span data-placeholder="New password"></span>
                        <form:errors path="newPassword" cssClass="error" element="div"/>
                    </div>
                    <div class="change-password-form-item">
                        <form:input path="matchingPassword" type="password" name="matchingPassword"/>
                        <span data-placeholder="Re-enter new password"></span>
                        <form:errors path="matchingPassword" cssClass="error" element="div"/>
                    </div>
                    <button type="submit" class="btn btn-warning btn-block">Change password</button>
                    <button type="reset" class="btn btn-secondary btn-block">Reset</button>
                </form:form>

            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</section>
<div class="container">

    <c:if test="${not empty param.error}">
        <div class="text-center bg-danger">${errors}</div>
        <h3>Error</h3>
    </c:if>


</div>

<%@ include file="scripts.jsp" %>
<%@ include file="footer.jsp" %>
</body>
</html>