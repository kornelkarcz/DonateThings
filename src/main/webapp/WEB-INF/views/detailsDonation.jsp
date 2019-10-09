<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Donation Details</title>
    <%@ include file="dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="donation-details-page">
    <div class="overlay">
        <div class="container p-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h1 class="display-4">${donation.id}</h1>
                    <h2 class="display-5">${donation.contentDescription}</h2>
                    <table class="table">
                        <tr>
                            <td>ID</td>
                            <td>${donation.id}</td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>${donation.phoneNumber}</td>
                        </tr>
                        <tr>
                            <td>Active</td>
                            <td>${donation.id}</td>
                        </tr>
                    </table>
                    <br>
                    <a href="/admin/donation/edit/${donation.id}" class="btn btn-warning btn-block">Edit</a>
                    <a href="/admin" class="btn btn-secondary btn-block">Back</a>
                </div>
                <div class="col-md-6"></div>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>