<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Forgot Password</title>
    <link rel="stylesheet" href="css/style.css" />
</head>

<body>
<h1>Please pass your email</h1>


<form:form name="r" action="/forgot-password" modelAttribute="emailDto" method="post">
    <table>
        <tr>
            <td>Email:</td>
            <td><form:input path="email" type='text' name='email' value=''/></td>
        </tr>

        <td><input name="submit" type="submit" value="submit"/></td>
    </table>
</form:form>

<a href="/register">Register Page</a><br>
<a href="/forgot-password">Back to homepage</a><br>

</body>
</html>