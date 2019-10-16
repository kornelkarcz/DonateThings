<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Institution Details</title>
    <%@ include file="dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="institution-details-page">
    <div class="overlay">
        <div class="container p-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h1 class="display-4 pb-4">${institution.name}</h1>
                    <table class="table">
                        <tr>
                            <td>Street</td>
                            <td>${institution.address.street}</td>
                        </tr>
                        <tr>
                            <td>House number</td>
                            <td>${institution.address.houseNumber}</td>
                        </tr>
                        <tr>
                            <td>Flat number</td>
                            <td>${institution.address.flatNumber}</td>
                        </tr>
                        <tr>
                            <td>City</td>
                            <td>${institution.address.city}</td>
                        </tr>
                        <tr>
                            <td>Postal code</td>
                            <td>${institution.address.postalCode}</td>
                        </tr>
                    </table>
                    <br>
                    <a href="/admin/institution/edit/${institution.id}" class="btn btn-warning btn-block">Edit</a>
                    <a href="/admin" class="btn btn-secondary btn-block">Back</a>
                </div>
                <div class="col-md-6"></div>
            </div>
        </div>
    </div>
</section>

<%@ include file="scripts.jsp" %>
<%@ include file="footer.jsp" %>
</body>
</html>