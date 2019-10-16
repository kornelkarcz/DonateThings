<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Edit Donation</title>
    <%@ include file="dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="edit-donation-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-2"></div>
            <div class="col-md-7">
                <form:form action="/admin/donation/edit" method="post" modelAttribute="donation"
                           class="edit-donation-form">
                <h2 class="display-4">Edit Donation</h2>
                <form:hidden path="id"/>
                <form:hidden path="user.id"/>
                <div class="edit-donation-form-item">
                    <form:input path="numberOfBags" type="text"/>
                    <span data-placeholder="Number of Bags"></span>
                    <form:errors path="numberOfBags" cssClass="error" element="div"/>
                </div>
                <div class="edit-donation-form-item">
                    <form:input path="contentDescription" type="text"/>
                    <span data-placeholder="Content Description"></span>
                    <form:errors path="contentDescription" cssClass="error" element="div"/>
                </div>
                <div class="edit-donation-form-item">
                    <form:input path="phoneNumber" type="text"/>
                    <span data-placeholder="Phone number"></span>
                    <form:errors path="phoneNumber" cssClass="error" element="div"/>
                </div>
                <div class="edit-donation-form-item">
                    <form:select path="institution">
                        <form:option value="0"/>
                        <form:options items="${institutions}" itemLabel="name" itemValue="id"/>
                    </form:select>
                </div>
                <div class="edit-donation-form-item">
                    <form:input path="streetName" type="text"/>
                    <span data-placeholder="Street name"></span>
                    <form:errors path="streetName" cssClass="error" element="div"/>
                </div>
                <div class="edit-donation-form-item">
                    <form:input path="houseNumber" type="number"/>
                    <span data-placeholder="House number"></span>
                    <form:errors path="houseNumber" cssClass="error" element="div"/>
                </div>
                <div class="edit-donation-form-item">
                    <form:input path="flatNumber" type="number"/>
                    <span data-placeholder="Flat number"></span>
                    <form:errors path="flatNumber" cssClass="error" element="div"/>
                </div>
                <div class="edit-donation-form-item">
                    <form:input path="city" type="text"/>
                    <span data-placeholder="City"></span>
                    <form:errors path="city" cssClass="error" element="div"/>
                </div>
                <div class="edit-donation-form-item">
                    <form:input path="postalCode" type="text"/>
                    <span data-placeholder="Postal code"></span>
                    <form:errors path="postalCode" cssClass="error" element="div"/>
                </div>
                <div class="edit-donation-form-item">
                    <form:input path="comment" type="text"/>
                    <span data-placeholder="Postal code"></span>
                    <form:errors path="comment" cssClass="error" element="div"/>
                </div>
                <button class="submit btn btn-warning btn-block mt-5" type="submit">Update Donation</button>
                <a href="/admin" class="submit btn btn-secondary btn-block">Back</a>
            </div>
            </form:form>
        </div>
        <div class="col-md-3"></div>
    </div>

</section>

<%@ include file="footer.jsp" %>
<%@ include file="scripts.jsp" %>

<script type="text/javascript">
    $(document).ready(function () {
        $(".edit-donation-form-item input").addClass("focus");
    });

    $(".edit-donation-form-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".edit-donation-form-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });

</script>
</body>
</html>