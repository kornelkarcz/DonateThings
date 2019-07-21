<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Register</title>
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
<h1>Please register biatch</h1>

<section class="login-page" style="text-align: center">
    <h2>Create an account</h2>
    <form:form method="post" modelAttribute="user" action="/register">
        <div class="form-group">
            <form:input path="firstName" type='text' name='firstName' placeholder='First Name'
                        style="max-width: 300px"/>
        </div>
        <div class="form-group">
            <form:input path="lastName" type='text' name='lastName' placeholder='Last Name'
                        style="max-width: 300px"/>
            <form:errors path="lastName"/>
        </div>
        <div class="form-group">
            <form:input path="email" type='text' name='email' placeholder='Email' style="max-width: 300px"/>
        </div>
        <div class="form-group">
            <form:input path="password" type='password' name='password' placeholder="Password"
                        style="max-width: 300px"/>
        </div>
        <div class="form-group">
            <form:input path="matchingPassword" type='password' name='matchingPassword' placeholder="Confirm Password"
                        style="max-width: 300px"/>
        </div>
        <div class="form-group form-group--buttons" style="display: inline-block">
            <button class="btn" type="submit">Sign up</button>
        </div>

    </form:form>
</section>
<br><br><br>

<%--<section class="login-page" style="text-align: center">--%>
<%--<h2>Create an account</h2>--%>
<%--<form:form method="post" modelAttribute="user" action="/register">--%>
<%--<div class="form-group">--%>
<%--<tr>--%>
<%--<td>First name:</td>--%>
<%--<td><form:input path="firstName" type='text' name='firstName' value='' style="max-width: 300px"/></td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td>Last name:</td>--%>
<%--<td><form:input path="lastName" type='text' name='lastName' value=''/></td>--%>
<%--<form:errors path="lastName"/>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td>Email:</td>--%>
<%--<td><form:input path="email" type='text' name='email' value=''/></td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td>Password:</td>--%>
<%--<td><form:input path="password" type='password' name='password'/></td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td>Confirm password:</td>--%>
<%--<td><form:input path="matchingPassword" type='password' name='matchingPassword'/></td>--%>
<%--</tr>--%>
<%--<td><input name="submit" type="submit" value="submit"/></td>--%>

<%--</div>--%>
<%--</form:form>--%>
<%--</section>--%>


<a href="/login">Login Page</a><br>
<a href="/">Back to homepage</a><br>
<%@ include file="scripts.jsp" %>
</body>
</html>