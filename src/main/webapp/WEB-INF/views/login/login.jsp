<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Login</title>
    <%@ include file="../dependencies.jsp" %>
</head>

<body>
<sec:authorize access="isAnonymous()">
    <%@include file="../header.jsp" %>
</sec:authorize>

<section id="login-section" class="p-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <form action="/perform_login" method='POST' class="form-login">
                    <h2 class="display-4">Please login</h2>
                    <c:if test="${not empty param.error}">
                        <span style="text-align: center; color: #ff4444">Incorrect email or password</span>
                    </c:if>
                    <div class="form-login-item">
                        <input type='text' name='email' value=''/>
                        <span data-placeholder="Login"></span>
                    </div>

                    <div class="form-login-item">
                        <input type='password' name='password'/>
                        <span data-placeholder="Password"></span>

                    </div>
                    <button class="submit btn btn-warning btn-block mb-1" type="submit">Login</button>
                    <a href="/forgot-password" class="btn btn-outline-secondary btn-block">Forgot password?</a>

                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</section>

<%@ include file="../scripts.jsp" %>
<%@ include file="../footer.jsp"%>
</body>
</html>