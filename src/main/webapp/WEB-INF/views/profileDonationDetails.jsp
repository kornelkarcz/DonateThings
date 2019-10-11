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

<section id="profile-donation-details-page">
    <div class="overlay">
        <div class="container p-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h1 class="display-4 mb-5">#${donation.id}</h1>
                    <table class="table">
                        <tr>
                            <td>Content Description</td>
                            <td>${donation.contentDescription}</td>
                        </tr>
                        <tr>
                            <td>Number of Bags</td>
                            <td>${donation.numberOfBags}</td>
                        </tr>
                        <tr>
                            <td>Phone number</td>
                            <td>${donation.phoneNumber}</td>
                        </tr>
                        <tr>
                            <td>Institution</td>
                            <td>${donation.institution.name}</td>
                        </tr>
                        <tr>
                            <td>Street Name</td>
                            <td>${donation.streetName}</td>
                        </tr><tr>
                            <td>House Number</td>
                            <td>${donation.houseNumber}</td>
                        </tr><tr>
                            <td>Flat Number</td>
                            <td>${donation.flatNumber}</td>
                        </tr>
                        <tr>
                            <td>City</td>
                            <td>${donation.city}</td>
                        </tr>
                        <tr>
                            <td>Postal Code</td>
                            <td>${donation.postalCode}</td>
                        </tr>
                        <tr>
                            <td>Comment</td>
                            <td>${donation.comment}</td>
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