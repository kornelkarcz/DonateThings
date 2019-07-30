<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <%@ include file="dependencies.jsp" %>
    <title>Resent Token</title>
</head>
<body>
<div class="container">
    <h3>It seems that you have not activated your account!</h3>
    <hr>
    <h4>Click below to get another token!</h4>

    <form:form action="/resend-token"  method="post">
        <table>
            <%--<tr>--%>
                <%--<td>Email:</td><%--
                <%--<td><form:input path="email" type='text' name='email' value=''/></td>--%>
            <%--</tr>--%>

            <td><input class="btn btn-warning" name="submit" type="submit" value="Resend Token"/></td>
        </table>
    </form:form>
    <br>
    <a class="btn btn-warning" href="${pageContext.request.contextPath}/">Back to homepage</a>
</div>
</body>
</html>

<%--modelAttribute="emailDto"--%>