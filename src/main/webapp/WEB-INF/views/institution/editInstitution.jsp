<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Edit Institution</title>
    <%@ include file="../dependencies.jsp" %>
</head>

<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="../header.jsp" %>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <%@ include file="../loggedHeader.jsp" %>
</sec:authorize>

<section id="adding-institution-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-2"></div>
            <div class="col-md-7">
                <form:form action="/admin/institution/edit" method="post" modelAttribute="institution"
                           class="add-institution-form">
                <h2 class="display-4">Edit Institution</h2>
                <form:hidden path="id"/>
                <div class="add-institution-form-item">
                    <form:input path="name" type="text"/>
                    <span data-placeholder="Institution name"></span>
                    <form:errors path="name" cssClass="error" element="div"/>
                </div>
                <div class="add-institution-form-item">
                    <form:input path="address.street" type="text"/>
                    <span data-placeholder="Street name"></span>
                    <form:errors path="address.street" cssClass="error" element="div"/>
                </div>
                <div class="add-institution-form-item">
                    <form:input path="address.houseNumber" type="number"/>
                    <span data-placeholder="House number"></span>
                    <form:errors path="address.houseNumber" cssClass="error" element="div"/>
                </div>
                <div class="add-institution-form-item">
                    <form:input path="address.flatNumber" type="number"/>
                    <span data-placeholder="Flat number"></span>
                    <form:errors path="address.flatNumber" cssClass="error" element="div"/>
                </div>
                <div class="add-institution-form-item">
                    <form:input path="address.city" type="text"/>
                    <span data-placeholder="City"></span>
                    <form:errors path="address.city" cssClass="error" element="div"/>
                </div>
                <div class="add-institution-form-item">
                    <form:input path="address.postalCode" type="text"/>
                    <span data-placeholder="Postal code"></span>
                    <form:errors path="address.postalCode" cssClass="error" element="div"/>
                </div>
                <button class="submit btn btn-warning btn-block mt-5" type="submit">Update Institution</button>
                <a href="/admin" class="submit btn btn-secondary btn-block">Back</a>
            </div>
            </form:form>
        </div>
        <div class="col-md-3"></div>
    </div>
</section>

<%@ include file="../scripts.jsp" %>
<%@ include file="../footer.jsp" %>
</body>
</html>