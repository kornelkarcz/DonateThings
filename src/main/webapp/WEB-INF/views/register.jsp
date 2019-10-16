<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Register</title>
    <%@ include file="dependencies.jsp" %>
</head>

<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="register-page" class="text-center p-4">
    <div class="container">
        <div class="row align-items-center my-5">
            <div class="col-md-5"></div>
            <div class="col-md-6">
                <h2 class="display-4">Create an account</h2>
                <form:form method="post" modelAttribute="user" action="/register" class="form-register">
                <div class="row justify-content-center mt-5">
                    <div class="col-md-8">
                        <div class="form-register-item">
                            <form:input path="firstName" type='text' name='firstName'/>
                            <span data-placeholder="First Name"></span>
                            <form:errors path="firstName" cssClass="error" element="div"/>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="form-register-item">
                            <form:input path="lastName" type='text' name='lastName'/>
                            <span data-placeholder="Last Name"></span>
                            <form:errors path="lastName" cssClass="error" element="div"/>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="form-register-item">
                            <form:input path="email" type='text' name='email'/>
                            <span data-placeholder="Email"></span>
                            <form:errors path="email" cssClass="error" element="div"/>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="form-register-item">
                            <form:input path="password" type='password' name='password'/>
                            <span data-placeholder="Password"></span>
                            <form:errors path="password" cssClass="error" element="div"/>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="form-register-item">
                            <form:input path="matchingPassword" type='password'
                                        name='matchingPassword'/>
                            <span data-placeholder="Confrim Password"></span>
                            <form:errors path="matchingPassword" cssClass="error" element="div"/>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div>
                            <button class="submit btn btn-warning btn-block" type="submit">Sign up</button>
                        </div>
                    </div>
                    </form:form>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>
</section>
<%@ include file="scripts.jsp" %>
<%@ include file="footer.jsp" %>
</body>
</html>