<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Login</title>
</head>

<body>
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

</form>

<a href="/register">Register Page</a><br>
<a href="/">Back to homepage</a><br>

</body>
</html>