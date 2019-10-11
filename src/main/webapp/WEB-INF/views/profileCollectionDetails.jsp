<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Collection Details</title>
    <%@ include file="dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="profile-collection-details-page">
    <div class="overlay">
        <div class="container p-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h1 class="display-4 mb-4">#${collection.id}</h1>
                    <table class="table">
                        <tr>
                            <td>Content Description</td>
                            <td>${collection.contentDescription}</td>
                        </tr>
                        <tr>
                            <td>Phone Number</td>
                            <td>${collection.phoneNumber}</td>
                        </tr>
                        <tr>
                            <td>Institution</td>
                            <td>${collection.institution.name}</td>
                        </tr>
                        <tr>
                            <td>Street Name</td>
                            <td>${collection.streetName}</td>
                        </tr>
                        <tr>
                            <td>House Number</td>
                            <td>${collection.houseNumber}</td>
                        </tr>
                        <tr>
                            <td>Flat Number</td>
                            <td>${collection.flatNumber}</td>
                        </tr>
                        <tr>
                            <td>City</td>
                            <td>${collection.city}</td>
                        </tr>
                        <tr>
                            <td>Postal Code</td>
                            <td>${collection.postalCode}</td>
                        </tr>
                        <tr>
                            <td>Comment</td>
                            <td>${collection.comment}</td>
                        </tr>
                    </table>
                    <br>
                    <a href="/profile/" class="btn btn-secondary btn-block">Back</a>
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