<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Profile Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous"/>
    <link rel="stylesheet" href="../../css/dataTables.bootstrap4.min.css">
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
                            <table class="table admin-tables">
                                <thead>
                                <tr>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">Name</th>
                                    <th class="text-center">Surname</th>
                                    <th></th>
                                    <th class="text-center">Actions</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${users}" var="user">
                                <tr>
                                    <td class="align-middle text-center">${user.id}</td>
                                    <td class="align-middle text-center">${user.firstName}</td>
                                    <td class="align-middle text-center">${user.lastName}</td>
                                    <td class="align-middle text-center">
                                        <button class="user-button-details btn btn-warning">Details</button>
                                    </td>
                                    <td class="align-middle text-center">
                                        <a href="" class="btn btn-primary">Edit</a>
                                    </td>
                                    <td>
                                        <a href="">Delete</a>
                                    </td>
                                </tr>
                                </tbody>
                                </c:forEach>
                            </table>
                        </div>
                        <div id="ele-2" class="admin-element">
                            <table class="table admin-tables">
                                <thead>
                                <tr>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">Name</th>
                                    <th class="text-center">City</th>
                                    <th class="text-center"></th>
                                    <th class="text-center">Actions</th>
                                    <th class="text-center"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${institutions}" var="institution">
                                <tr>
                                    <td class="align-middle text-center">${institution.id}</td>
                                    <td class="align-middle text-center">${institution.name}</td>
                                    <td class="align-middle text-center">${institution.address.city}</td>
                                    <td>
                                        <button class="donation-button-details btn">Details</button>
                                    </td>
                                    <td>
                                        <button class="donation-button-edit btn">Edit</button>
                                    </td>
                                    <td>
                                        <button class="donation-button-delete btn">Delete</button>
                                    </td>
                                </tr>
                                </tbody>
                                </c:forEach>
                            </table>
                            <a href="/admin/addInstitution" class="btn btn-warning btn-block">Add Institution</a>
                        </div>
                        <div id="ele-3" class="admin-element">
                            <table class="table admin-tables">
                                <thead>
                                <tr>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">Content Description</th>
                                    <th class="text-center">User Last Name</th>
                                    <th class="text-center"></th>
                                    <th class="text-center">Actions</th>
                                    <th class="text-center"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${donations}" var="donation">
                                    <tr>
                                        <td class="align-middle text-center">${donation.id}</td>
                                        <td class="align-middle text-center">${donation.contentDescription}</td>
                                        <td class="align-middle text-center">${donation.user.lastName}</td>
                                        <td>
                                            <button class="donation-button-details btn">Details
                                            </button>
                                        </td>
                                        <td>
                                            <button class="donation-button-edit btn">Edit</button>
                                        </td>
                                        <td>
                                            <button class="donation-button-delete btn">Delete
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div id="ele-4" class="admin-element">
                            <table class="table admin-tables">
                                <thead>
                                <tr>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">Content Description</th>
                                    <th class="text-center">User Last Name</th>
                                    <th></th>
                                    <th class="actions text-center">Actions</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${collections}" var="collection">
                                    <tr>
                                        <td class="align-middle text-center">${collection.id}</td>
                                        <td class="align-middle text-center">${collection.contentDescription}</td>
                                        <td class="align-middle text-center">${collection.user.lastName}</td>
                                        <td>

                                            <button class="collection-button-details btn">
                                                Details
                                            </button>
                                        <td>
                                            <button class="collection-button-edit btn">
                                                Edit
                                            </button>
                                        </td>
                                        <td>
                                        <button class="collection-button-delete btn">
                                            Delete
                                        </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="scripts.jsp" %>
<%@ include file="footer.jsp" %>

<script type="text/javascript" src="../../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../js/dataTables.bootstrap4.min.js"></script>
<script src="../../js/editInstitution.js" type="text/javascript"></script>
<script src="../../js/collection.js" type="text/javascript"></script>
<script src="../../js/donation.js" type="text/javascript"></script>

<script>
    $(document).ready(function () {
        $(".admin-tables").DataTable({
            "ordering": true,
            "searching": true,
            "columnDefs": [
                {
                    "targets": 3,
                    "sorting": false
                },
                {
                    "targets": 4,
                    "sorting": false
                },
                {
                    "targets": 5,
                    "sorting": false
                }
            ]
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

    function redirect() {
        console.log("Please redirect");
        window.location = "https://www.google.pl/";
    }
</script>
</body>
</html>