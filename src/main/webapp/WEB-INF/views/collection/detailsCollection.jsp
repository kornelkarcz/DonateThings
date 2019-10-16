<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title></title>
    <%@ include file="../dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="../header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="../loggedHeader.jsp" %>
</sec:authorize>

<section id="collection-details-page">
    <div class="overlay">
        <div class="container p-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h1 class="display-4">${collection.id}</h1>
                    <h2 class="display-5">${collection.contentDescription}</h2>
                    <table class="table">
                        <tr>
                            <td>ID</td>
                            <td>${collection.id}</td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>${collection.phoneNumber}</td>
                        </tr>
                        <tr>
                            <td>Active</td>
                            <td>${collection.id}</td>
                        </tr>
                    </table>
                    <br>
                    <a href="/admin/collection/edit/${collection.id}" class="btn btn-warning btn-block">Edit</a>
                    <a href="/admin" class="btn btn-secondary btn-block">Back</a>
                </div>
                <div class="col-md-6"></div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../scripts.jsp" %>
<%@ include file="../footer.jsp" %>
</body>
</html>