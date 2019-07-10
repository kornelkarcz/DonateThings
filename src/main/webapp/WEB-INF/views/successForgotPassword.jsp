<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Succ Forgot Pass</title>
    <link rel="stylesheet" href="css/style.css" />
</head>

<body>
<h1>Success</h1>

The reset password link was sent to this email:<p>${email}</p>

${user}

<br>
<a href="/">Back to homepage</a><br>

</body>
</html>