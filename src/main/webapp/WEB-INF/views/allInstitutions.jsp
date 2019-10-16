<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>All Institution</title>
    <%@ include file="dependencies.jsp" %>
</head>

<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="all-institutions-section" class="p-5">
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-7">

                <h2 class="display-4">All Institutions</h2>
                <table class="table table-hover">
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Street</th>
                        <th>House No.</th>
                        <th>Flat No.</th>
                        <th>City</th>
                        <th>Postal Code</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach items="${institutions}" var="institution">
                        <tr>
                            <td>${institution.id}</td>
                            <td>${institution.name}</td>
                            <td>${institution.address.street}</td>
                            <td>${institution.address.houseNumber}</td>
                            <td>${institution.address.flatNumber}</td>
                            <td>${institution.address.city}</td>
                            <td>${institution.address.postalCode}</td>
                            <td class="d-flex align-items-center">
                                <button class="button-edit btn btn-warning mr-1">Edit</button>
                                <button class="button-delete btn btn-danger">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="row mt-5 justify-content-center">
                    <a href="/admin/" class="btn btn-warning mr-5 w-25">Back</a>
                    <a href="/admin/addInstitution" class="btn btn-warning w-25">Add Institution</a>

                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</section>

<%@ include file="scripts.jsp" %>
<%@ include file="footer.jsp" %>
</body>
</html>