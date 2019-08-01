<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Login</title>
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
                    <li class="nav-item active px-2">
                        <a href="/login" class="nav-link">Log In</a>
                    </li>
                    <li class="nav-item px-2">
                        <a href="/register" class="nav-link">Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</sec:authorize>

<section id="login-section" class="p-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <form action="/perform_login" method='POST' class="form-login">
                    <h2 class="display-4">Please login</h2>

                    <div class="form-login-item">
                        <input type='text' name='email' value=''/>
                        <span data-placeholder="Login"></span>
                    </div>

                    <div class="form-login-item">
                        <input type='password' name='password'/>
                        <span data-placeholder="Password"></span>

                    </div>
                    <button class="submit btn btn-warning btn-block mb-1" type="submit">Login</button>
                    <a href="/forgot-password" class="btn btn-outline-secondary btn-block">Forgot password?</a>

                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp"%>
<%@ include file="scripts.jsp" %>

<script type="text/javascript">
    $(".form-login-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".form-login-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });

</script>



</body>
</html>