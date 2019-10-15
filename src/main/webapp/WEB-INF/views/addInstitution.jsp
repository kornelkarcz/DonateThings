<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Add Institution</title>
    <%@ include file="dependencies.jsp" %>
</head>

<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="adding-institution-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-2"></div>
            <div class="col-md-7">
                <form:form action="/admin/addInstitution" method="post" modelAttribute="institution"
                           id="add-institution-form" cssClass="addInstitutionForm">
                <h2 class="display-4">Add Institution</h2>
                <form:hidden path="id"/>
                <div class="add-institution-form-item">
                    <form:input path="name" type="text" id="institution-name"/>
                    <span data-placeholder="Institution name"></span>
                    <form:errors path="name" cssClass="error" element="div"/>
                </div>
                <div class="add-institution-form-item">
                    <form:input path="address.street" name="addressStreet" type="text"/>
                    <span data-placeholder="Street name"></span>
                    <form:errors path="address.street" cssClass="error" element="div"/>
                </div>
                <div class="add-institution-form-item">
                    <form:input path="address.houseNumber" type="text"/>
                    <span data-placeholder="House number"></span>
                    <form:errors path="address.houseNumber" cssClass="error" element="div"/>
                </div>
                <div class="add-institution-form-item">
                    <form:input path="address.flatNumber" type="text"/>
                    <span data-placeholder="Flat number"></span>
                    <form:errors path="address.flatNumber" cssClass="error" element="div"/>
                </div>
                <div class="add-institution-form-item">
                    <form:input path="address.city" type="text"/>
                    <span data-placeholder="City"></span>
                    <form:errors path="address.city" cssClass="error" element="div"/>
                </div>
                <div class="add-institution-form-item">
                    <form:input path="address.postalCode" type="text" id="institutionPostalCode"/>
                    <span data-placeholder="Postal code"></span>
                    <form:errors path="address.postalCode" cssClass="error" element="div"/>
                </div>
                <button class="submit btn btn-warning btn-block mt-5" type="submit">Add Institution</button>
            </div>
            </form:form>
        </div>
        <div class="col-md-3"></div>
    </div>
</section>

<%@ include file="footer.jsp" %>
<%@ include file="scripts.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js" type="text/javascript"></script>
<script src="../../js/validation.js" type="text/javascript"></script>

<script type="text/javascript">
    $(".add-institution-form-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".add-institution-form-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });

</script>


</body>
</html>