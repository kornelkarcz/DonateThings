<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>All Users</title>
    <%@ include file="../dependencies.jsp" %>
</head>

<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="../header.jsp" %>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <%@ include file="../loggedHeader.jsp" %>
</sec:authorize>
<sec:authorize access="hasRole('ADMIN')">
    <%@ include file="../adminHeader.jsp" %>
</sec:authorize>

<section id="all-user-section" class="p-5">
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-7 text-left">
                <h2 class="display-4 mb-4">All Institutions</h2>
                <table class="table table-hover">
                    <tr>
                        <th>Id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Enabled</th>
                    </tr>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>${user.email}</td>
                            <td>${user.enabled}</td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
            <div class="col-md-3"></div>
        </div>

    </div>
</section>

<%@ include file="../scripts.jsp" %>
<%@ include file="../footer.jsp" %>
</body>
</html>