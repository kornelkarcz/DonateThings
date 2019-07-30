<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Change Password</title>
    <%@ include file="dependencies.jsp" %>
</head>

<body>
<div class="container">
    <h2>Changing password</h2>
    <h2>Please pass your new pass</h2>

    <c:if test="${not empty param.error}">
        <div class="text-center bg-danger">${errors}</div>
        <h3>Error</h3>
    </c:if>

    <form:form action="/change-password" modelAttribute="changePasswordDto" method="post">
        <form:input path="oldPassword" type="password" name="oldPassword" placeholder="Old password"/>
        <form:errors path="oldPassword" cssClass="error" element="div"/>
        <form:input path="newPassword" type="password" name="newPassword" placeholder="New password"/>
        <form:errors path="newPassword" cssClass="error" element="div"/>
        <form:input path="matchingPassword" type="password" name="matchingPassword" placeholder="New password"/>
        <form:errors path="matchingPassword" cssClass="error" element="div"/>
        <button type="submit" class="btn btn-warning">Change password</button>
        <button type="reset" class="btn btn-warning">Reset</button>
    </form:form>

    <a href="/register">Register Page</a><br>
    <a href="/forgot-password">Back to homepage</a><br>
</div>
</body>
</html>