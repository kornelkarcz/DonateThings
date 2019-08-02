<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Profile Page</title>
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
            <h4>Profile Page</h4>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="nav flex-column nav-pills" id="pills-tab" role="tablist" aria-orientation="vertical">
                    <a class="nav-link mb-2" id="pills-user-details-tab" data-toggle="pill" href="#user-details" role="tab"
                       aria-controls="user-details" aria-selected="true">My
                        Details</a>
                    <a class="nav-link mb-2" id="pills-user-donations-tab" data-toggle="pill" href="#user-donations" role="tab"
                     aria-controls="user-donations" aria-selected="false">My Donations</a>
                    <a class="nav-link" id="pills-user-collection-tab" data-toggle="pill" href="#user-collections" role="tab"
                     aria-controls="user-collections" aria-selected="false">My Collections</a>
                </div>
            </div>
            <div class="col-md-10 text-center my-auto">
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade my-auto" id="user-details" role="tabpanel" aria-labelledby="pills-user-details-tab">
                        <table class="table mx-auto w-50">
                            <tr>
                                <td>First Name</td>
                                <td>Kornel</td>
                            </tr>
                            <tr>
                                <td>Last Name</td>
                                <td>Karcz</td>
                            </tr>
                            <tr>
                                <td>Last Name</td>
                                <td>Karcz</td>
                            </tr><tr>
                                <td>Last Name</td>
                                <td>Karcz</td>
                            </tr><tr>
                                <td>Last Name</td>
                                <td>Karcz</td>
                            </tr><tr>
                                <td>Last Name</td>
                                <td>Karcz</td>
                            </tr><tr>
                                <td>Last Name</td>
                                <td>Karcz</td>
                            </tr><tr>
                                <td>Last Name</td>
                                <td>Karcz</td>
                            </tr><tr>
                                <td>Last Name</td>
                                <td>Karcz</td>
                            </tr><tr>
                                <td>Last Name</td>
                                <td>Karcz</td>
                            </tr><tr>
                                <td>Last Name</td>
                                <td>Karcz</td>
                            </tr><tr>
                                <td>Last Name</td>
                                <td>Karcz</td>
                            </tr><tr>
                                <td>Last Name</td>
                                <td>Karcz</td>
                            </tr>
                        </table>
                    </div>
                    <div class="tab-pane fade" id="user-donations" role="tabpanel" aria-labelledby="pills-user-donations-tab">
                        <p>Tutaj beda donations uzytkownika</p>
                    </div>
                    <div class="tab-pane fade" id="user-collections" role="tabpanel" aria-labelledby="pills-user-donations-tab">
                        <p>Tutaj beda collections uzytkownika</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<a href="${pageContext.request.contextPath}/change-password">Change password</a>
<%@ include file="scripts.jsp" %>
<%@ include file="footer.jsp" %>
</body>
</html>