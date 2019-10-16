<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>User Details</title>
    <%@ include file="dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="user-details-page">
<div class="overlay">
    <div class="container p-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h1 class="display-4">${user.lastName}</h1>
                <h2 class="display-5">${user.firstName}</h2>
                <table class="table">
                    <tr>
                        <td>ID</td>
                        <td>${user.id}</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>${user.email}</td>
                    </tr>
                    <tr>
                        <td>Active</td>
                        <td>${user.enabled}</td>
                    </tr>
                </table>
                <br>
                <a href="/admin/user/edit/${user.id}" class="btn btn-warning btn-block">Edit</a>
                <a href="/admin" class="btn btn-secondary btn-block">Back</a>
            </div>
            <div class="col-md-6"></div>
        </div>
    </div>
</div>
</section>

<%@ include file="footer.jsp" %>
<%@ include file="scripts.jsp" %>
</body>
</html>