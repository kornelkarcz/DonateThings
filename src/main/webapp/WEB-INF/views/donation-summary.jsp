<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Donation Summary</title>
    <%@ include file="dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="donation-summary-section" class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-6 py-5">
                <h1 class="pb-4">Thank you for your donation!</h1>
                <table class="table">
                    <tr>
                        <td>Id</td>
                        <td>${lastDonation.id}</td>
                    </tr>
                    <tr>
                        <td>Number of Bags</td>
                        <td>${lastDonation.numberOfBags}</td>
                    </tr>
                    <tr>
                        <td>Content</td>
                        <td>${lastDonation.contentDescription}</td>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <td>${lastDonation.phoneNumber}</td>
                    </tr>
                    <tr>
                        <td>Institution</td>
                        <td>${lastDonation.institution.name}</td>
                    </tr>
                    <tr>
                        <td>Street</td>
                        <td>${lastDonation.streetName}</td>
                    </tr>
                    <tr>
                        <td>House number</td>
                        <td>${lastDonation.houseNumber}</td>
                    </tr>
                    <tr>
                        <td>Flat number</td>
                        <td>${lastDonation.flatNumber}</td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td>${lastDonation.city}</td>
                    </tr>
                    <tr>
                        <td>Postal Code</td>
                        <td>${lastDonation.postalCode}</td>
                    </tr>
                    <tr>
                        <td>Comment</td>
                        <td>${lastDonation.comment}</td>
                    </tr>
                </table>
                <a href="/profile/" class="btn btn-secondary btn-block">See All Donations</a>

            </div>
            <div class="col-md-6"></div>
        </div>
    </div>
</section>

<%@ include file="scripts.jsp" %>
<%@ include file="footer.jsp" %>
</body>
</html>