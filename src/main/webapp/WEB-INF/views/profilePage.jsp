<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <%--UNLOGGED HEADER--%>
    <nav class="navbar navbar-expand-md fixed-top navbar-light py-4"
         id="main-nav">
        <div class="container">
            <a href="/" class="navbar-brand">
                <img src="../../images/logo.png" width="75" height="75" alt=""/>
                <h3 class="d-inline align-middle">Donate Things</h3>
            </a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav">
                    <li class="nav-item px-2">
                        <a href="" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item px-2">
                        <a href="" class="nav-link">How Does It Work?</a>
                    </li>
                    <li class="nav-item px-2">
                        <a href="" class="nav-link">Fundations</a>
                    </li>
                    <li class="nav-item px-2">
                        <a href="" class="nav-link">About Us</a>
                    </li>
                    <li class="nav-item px-2">
                        <a href="" class="nav-link">Contact</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item px-2">
                        <a href="/login" class="nav-link">Log In</a>
                    </li>
                    <li class="nav-item active px-2">
                        <a href="/register" class="nav-link">Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%--LOGGED HEADER--%>
    <nav class="navbar navbar-expand-md fixed-top navbar-light py-4"
         id="main-nav">
        <div class="container">
            <a href="/" class="navbar-brand">
                <img src="../../images/logo.png" width="75" height="75" alt=""/>
                <h3 class="d-inline align-middle">Donate Things</h3>
            </a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav">
                    <li class="nav-item px-2">
                        <a href="" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item px-2">
                        <a href="" class="nav-link">How Does It Work?</a>
                    </li>
                    <li class="nav-item px-2">
                        <a href="" class="nav-link">Fundations</a>
                    </li>
                    <li class="nav-item px-2">
                        <a href="" class="nav-link">About Us</a>
                    </li>
                    <li class="nav-item px-2">
                        <a href="" class="nav-link">Contact</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item px-2">
                        <a href="/profile/" class="nav-link">Hello, ${firstName}!</a>
                    </li>
                    <li class="nav-item px-2">
                        <a href="/logout" class="nav-link">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</sec:authorize>

<section id="profile-page" class="p-5 my-5">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4"></div>
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-12">
                        <div class="profile-options-container">
                            <ul class="profile-options">
                                <li id="option-item-1" onclick="showDiv('1'); paintYellow('1')">
                                    <div><span>Details</span></div>
                                </li>
                                <li id="option-item-2" onclick="showDiv('2'); paintYellow('2')">
                                    <div><span>Donations</span></div>
                                </li>
                                <li id="option-item-3" onclick="showDiv('3'); paintYellow('3')">
                                    <div><span>Collections</span></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row p-5">
                    <div class="col-md-12">
                        <div id="ele-1" class="profile-element">
                            <table class="table">
                                <tr>
                                    <td>Name</td>
                                    <td>${userDetails.firstName}</td>
                                </tr>
                                <tr>
                                    <td>Last name</td>
                                    <td>${userDetails.lastName}</td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td>${userDetails.email}</td>
                                </tr>
                            </table>
                            <div class="pt-3">
                                <a class="btn btn-warning btn-block" href="/profile/edit-personal-details">Edit Your
                                    Personal
                                    Details</a>
                                <br>
                                <a class="btn btn-secondary btn-block"
                                   href="${pageContext.request.contextPath}/change-password">Change Password</a>
                            </div>
                        </div>
                        <div id="ele-2" class="profile-element">
                            <table class="table" id="table">
                                <thead>
                                <tr>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">Number of Bags</th>
                                    <th class="text-center">Content</th>
                                    <th class="text-center">Institution</th>
                                    <th class="text-center">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${donations}" var="donation">
                                    <tr>
                                        <td class="align-middle text-center">${donation.id}</td>
                                        <td class="align-middle text-center">${donation.numberOfBags}</td>
                                        <td class="align-middle text-center">${donation.contentDescription}</td>
                                        <td class="align-middle text-center">${donation.institution.name}</td>
                                        <td>
                                            <button class="donation-button-details btn btn-primary">Details
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div id="ele-3" class="profile-element">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th class="text-center">Id</th>
                                    <th class="text-center">Content</th>
                                    <th class="text-center">Institution</th>
                                    <th class="text-center">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${collections}" var="collection">
                                    <tr>
                                        <td class="align-middle text-center">${collection.id}</td>
                                        <td class="align-middle text-center">${collection.contentDescription}</td>
                                        <td class="align-middle text-center">${collection.institution.name}</td>
                                        <td>
                                            <button class="collection-button-details btn btn-outline-primary">Details
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
<script type="text/javascript" src="../../js/profileDonation.js"></script>
<script type="text/javascript" src="../../js/profileCollection.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#table").DataTable({
            "ordering": true
        });
    });
</script>
<script>
    function showDiv(data) {
        $("#ele-" + data).addClass('make-visible');
        hideElement(3, data);
    }

    function hideElement(total, active) {
        for (let i = 1; i <= total; i++) {
            if (i != active) {
                $("#ele-" + i).removeClass('make-visible');
            }
        }
    }

    function paintYellow(data) {
        $("#option-item-" + data).addClass('paint-yellow');
        unpaintYellow(3, data);
    }

    function unpaintYellow(total, active) {
        for (let i = 1; i <= total; i++) {
            if (i != active) {
                $("#option-item-" + i).removeClass('paint-yellow');
            }
        }
    }
</script>

</body>
</html>