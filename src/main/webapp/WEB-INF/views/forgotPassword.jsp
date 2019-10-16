<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Forgot Password</title>
    <%@ include file="dependencies.jsp" %>
</head>
<body>
<%@ include file="header.jsp" %>

<section id="forgot-password-section" class="p-4">
    <div class="container text-center">
        <h2 class="display-4">Please Provide Your Email</h2>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 text-center">
                <form:form class="form-forgot-password" action="/forgot-password" modelAttribute="emailDto"
                           method="post">
                    <div class="form-forgot-password-item">
                        <form:input path="email" type='text' name='email'/>
                        <span data-placeholder="Email"></span>
                    </div>
                    <input class="btn btn-block btn-secondary" name="submit" type="submit" value="Send"/>
                </form:form>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>

</section>

<%@ include file="scripts.jsp" %>
<%@ include file="footer.jsp" %>
</body>
</html>