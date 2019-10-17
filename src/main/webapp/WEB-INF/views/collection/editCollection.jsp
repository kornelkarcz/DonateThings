<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Edit Collection</title>
    <%@ include file="../dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="../header.jsp" %>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <%@ include file="../loggedHeader.jsp" %>
</sec:authorize>
<sec:authorize access="hasRole('ADMIN')">
    <%@ include file="../adminHeader.jsp" %>
</sec:authorize>

<section id="edit-collection-section">
    <div class="container">
        <div class="row-align-items">
            <div class="col-md-2"></div>
            <div class="col-md-7">
                <form:form action="/admin/collection/edit" method="post" modelAttribute="collection"
                           class="edit-collection-form">
                <h2 class="display-4">Edit Collection</h2>
                <form:hidden path="id"/>
                <form:hidden path="user.id"/>
                <div class="edit-collection-form-item">
                    <form:input path="contentDescription" type="text"/>
                    <span data-placeholder="Content Description"></span>
                    <form:errors path="contentDescription" cssClass="error" element="div"/>
                </div>
                <div class="edit-collection-form-item" style="margin-bottom: 25px !important;">
                    <form:input path="phoneNumber" type="text"/>
                    <span data-placeholder="Phone number"></span>
                    <form:errors path="phoneNumber" cssClass="error" element="div"/>
                </div>

                <form:select path="institution" cssClass="wide">
                    <%--<form:option value="0"/>--%>
                    <form:options cssClass="my-option" items="${institutions}" itemLabel="name" itemValue="id"/>
                </form:select>

                <div class="edit-collection-form-item" style="margin-top: 100px !important;">
                    <form:input path="streetName" type="text"/>
                    <span data-placeholder="Street name"></span>
                    <form:errors path="streetName" cssClass="error" element="div"/>
                </div>
                <div class="edit-collection-form-item">
                    <form:input path="houseNumber" type="number"/>
                    <span data-placeholder="House number"></span>
                    <form:errors path="houseNumber" cssClass="error" element="div"/>
                </div>
                <div class="edit-collection-form-item">
                    <form:input path="flatNumber" type="number"/>
                    <span data-placeholder="Flat number"></span>
                    <form:errors path="flatNumber" cssClass="error" element="div"/>
                </div>
                <div class="edit-collection-form-item">
                    <form:input path="city" type="text"/>
                    <span data-placeholder="City"></span>
                    <form:errors path="city" cssClass="error" element="div"/>
                </div>
                <div class="edit-collection-form-item">
                    <form:input path="postalCode" type="text"/>
                    <span data-placeholder="Postal code"></span>
                    <form:errors path="postalCode" cssClass="error" element="div"/>
                </div>
                <div class="edit-collection-form-item">
                    <form:input path="comment" type="text"/>
                    <span data-placeholder="Postal code"></span>
                    <form:errors path="comment" cssClass="error" element="div"/>
                </div>
                <button class="submit btn btn-warning btn-block mt-5" type="submit">Update Collection</button>
                <a href="/admin" class="submit btn btn-secondary btn-block">Back</a>
            </div>
            </form:form>
        </div>
        <div class="col-md-3"></div>
    </div>
    </div>
</section>

<%@ include file="../scripts.jsp" %>
<%@ include file="../footer.jsp" %>
</body>
</html>