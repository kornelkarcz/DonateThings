<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Admin Panel</title>
    <%@ include file="dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>


<section id="admin-page" class="p-5 my-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4"></div>
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-12">
                        <div class="admin-options-container">
                            <ul class="admin-options">
                                <li id="admin-option-1" onclick="showDiv('1'); paintYellow('1')">
                                    <div><span>Users</span></div>
                                </li>
                                <li id="admin-option-2" onclick="showDiv('2'); paintYellow('2')">
                                    <div><span>Institutions</span></div>
                                </li>
                                <li id="admin-option-3" onclick="showDiv('3'); paintYellow('3')">
                                    <div><span>Donations</span></div>
                                </li>
                                <li id="admin-option-4" onclick="showDiv('4'); paintYellow('4')">
                                    <div><span>Collections</span></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row p-5">
                    <div class="col-md-12">
                        <div id="ele-1" class="admin-element">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Surname</th>
                                    <th>Actions</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${users}" var="user">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.firstName}</td>
                                    <td>${user.lastName}</td>
                                    <td>
                                        <button class="user-button-details btn btn-warning">Details</button>
                                    </td>
                                    <td>
                                        <a href="" class="btn btn-primary">Edit</a>
                                    </td>
                                </tr>
                                </tbody>
                                </c:forEach>
                            </table>
                        </div>
                        <div id="ele-2" class="admin-element">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th></th>
                                    <th>Actions</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${institutions}" var="institution">
                                <tr>
                                    <td>${institution.id}</td>
                                    <td>${institution.name}</td>
                                    <td>
                                        <button class="button-details btn btn-outline-primary">Details</button>
                                    </td>
                                    <td>
                                        <button class="button-edit btn btn-outline-warning">Edit</button>
                                    </td>
                                    <td>
                                        <button class="button-delete btn btn-outline-danger">Delete</button>
                                    </td>
                                </tr>
                                </tbody>
                                </c:forEach>
                            </table>
                            <a href="/admin/addInstitution" class="btn btn-warning btn-block">Add Institution</a>
                        </div>
                        <div id="ele-3" class="admin-element">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Content Description</th>
                                    <th>User Last Name</th>
                                    <th></th>
                                    <th>Actions</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${donations}" var="donation">
                                <tr>
                                    <td>${donation.id}</td>
                                    <td>${donation.contentDescription}</td>
                                    <td>${donation.user.lastName}</td>
                                    <td>
                                        <button class="donation-button-details btn btn-outline-primary">Details</button>
                                    </td>
                                    <td>
                                        <button class="donation-button-edit btn btn-outline-warning">Edit</button>
                                    </td>
                                    <td>
                                        <button class="donation-button-delete btn btn-outline-danger">Delete</button>
                                    </td>
                                </tr>
                                </tbody>
                                </c:forEach>
                            </table>
                        </div>
                        <div id="ele-4" class="admin-element">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Content Description</th>
                                    <th>User Last Name</th>
                                    <th></th>
                                    <th>Actions</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${collections}" var="collection">
                                <tr>
                                    <td>${collection.id}</td>
                                    <td>${collection.contentDescription}</td>
                                    <td>${collection.user.lastName}</td>
                                    <td>
                                        <button class="collection-button-details btn btn-outline-primary">Details</button>
                                    </td>
                                    <td>
                                        <button class="collection-button-edit btn btn-outline-warning">Edit</button>
                                    </td>
                                    <td>
                                        <button class="collection-button-delete btn btn-outline-danger">Delete</button>
                                    </td>
                                </tr>
                                </tbody>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>
<script src="../../js/editInstitution.js" type="text/javascript"></script>
<script src="../../js/userButtons.js" type="text/javascript"></script>
<script src="../../js/collection.js" type="text/javascript"></script>
<script src="../../js/donation.js" type="text/javascript"></script>
<script src="../../js/test.js" type="text/javascript"></script>
<script type="text/javascript" src="../../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".table").DataTable({
            "ordering": true
        });
    });
</script>
<script>
    function showDiv(data) {
        $("#ele-" + data).addClass('make-visible');
        hideElement(4, data);
    }

    function hideElement(total, active) {
        for (let i = 1; i <= total; i++) {
            if (i != active) {
                $("#ele-" + i).removeClass('make-visible');
            }
        }
    }

    function paintYellow(data) {
        $("#admin-option-" + data).addClass('paint-yellow');
        unpaintYellow(4, data);
    }

    function unpaintYellow(total, active) {
        for (let i = 1; i <= total; i++) {
            if (i != active) {
                $("#admin-option-" + i).removeClass('paint-yellow');
            }
        }
    }
</script>
</body>
</html>