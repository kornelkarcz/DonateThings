<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Collection Summary</title>
    <%@ include file="dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="collection-summary-section" class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-6 py-5">
                <h1 class="pb-4">Thank you for organizing collection!</h1>
                <table class="table">
                    <tr>
                        <td>Id</td>
                        <td>${lastCollection.id}</td>
                    </tr>
                    <tr>
                        <td>Content</td>
                        <td>${lastCollection.contentDescription}</td>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <td>${lastCollection.phoneNumber}</td>
                    </tr>
                    <tr>
                        <td>Institution</td>
                        <td>${lastCollection.institution.name}</td>
                    </tr>
                    <tr>
                        <td>Street</td>
                        <td>${lastCollection.streetName}</td>
                    </tr>
                    <tr>
                        <td>House number</td>
                        <td>${lastCollection.houseNumber}</td>
                    </tr>
                    <tr>
                        <td>Flat number</td>
                        <td>${lastCollection.flatNumber}</td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td>${lastCollection.city}</td>
                    </tr>
                    <tr>
                        <td>Postal Code</td>
                        <td>${lastCollection.postalCode}</td>
                    </tr>
                    <tr>
                        <td>Comment</td>
                        <td>${lastCollection.comment}</td>
                    </tr>
                </table>
                <a href="/profile/" class="btn btn-secondary btn-block">See All Collections</a>

            </div>
            <div class="col-md-6"></div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp"%>
</body>
</html>