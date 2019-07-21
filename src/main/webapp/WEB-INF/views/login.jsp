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
                    <li class="nav-item active px-2">
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


<h1>Please login badass</h1>


<form name='f' action="/perform_login" method='POST'>

    <table>
        <tr>
            <td>Email:</td>
            <td><input type='text' name='email' value=''/></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type='password'name='password'/></td>
        </tr>
        <tr>
            <td><input name="submit" type="submit" value="submit"/></td>
        </tr>
    </table>
    <a href="/forgot-password">Forgot your password?</a>
</form>

<a href="/register">Register Page</a><br>
<a href="/forgot-password">Back to homepage</a><br>

<%@ include file="scripts.jsp" %>
</body>
</html>