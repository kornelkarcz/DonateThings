<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Register</title>
</head>

<body>
<h1>Please register biatch</h1>

<form:form method="post" modelAttribute="user">
    <table>
        <tr>
            <td>First name:</td>
            <td><form:input type='text' path="firstName" name='firstName' value=''/></td>
        </tr>
        <tr>
            <td>Last name:</td>
            <td><form:input type='text' path="lastName" name='lastName' value=''/></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><form:input type='text' path="email" name='email' value=''/></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><form:input type='password' path="password" name='password'/></td>
        </tr>
        <td><input name="submit" type="submit" value="submit"/></td>
    </table>
</form:form>


<a href="/login">Login Page</a><br>
<a href="/">Back to homepage</a><br>

</body>
</html>