<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Enter New Password</title>
    <link rel="stylesheet" href="css/style.css" />
</head>

<body>
<h1>Please pass your new pass</h1>

<form name="r" action="/reset-password" modelAttribute="passwordForgotDto" method="post">
    <table>
        <tr>
            <td>Password</td>
            <td><input type="password" name="newPassword" value=""/></td>
        </tr>
        <tr>
            <td>Matching Password</td>
            <td><input type="password" name="matchingPassword" value=""/></td>
        </tr>
        <tr>
            <td><input type="reset" value="Clear"/></td>
            <td><input type="submit" value="Reset Password"/></td>
        </tr>
    </table>
</form>

<a href="/register">Register Page</a><br>
<a href="/forgot-password">Back to homepage</a><br>

</body>
</html>