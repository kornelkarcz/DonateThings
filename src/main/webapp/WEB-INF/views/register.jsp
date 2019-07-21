<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Register</title>
    <%@ include file="dependencies.jsp" %>

</head>

<body>
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

</body>
</html>