<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Register</title>
</head>

<body>
<h1>Please register biatch</h1>

<form method="post" modelAttribute="user" action="/register">
    <table>
        <tr>
            <td>First name:</td>
            <td><input type='text' name='firstName' value=''/></td>
        </tr>
        <tr>
            <td>Last name:</td>
            <td><input type='text' name='lastName' value=''/></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type='text' name='email' value=''/></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type='password' name='password'/></td>
        </tr>
        <tr>
            <td>Confirm password:</td>
            <td><input type='password' name='matchingPassword'/></td>
        </tr>
        <td><input name="submit" type="submit" value="submit"/></td>
    </table>
</form>


<a href="/login">Login Page</a><br>
<a href="/">Back to homepage</a><br>

</body>
</html>